import math
import re
from collections import Counter

import pymysql as pymysql
from flask import *
from werkzeug.utils import secure_filename

app = Flask(__name__)
con = pymysql.Connect(host='localhost', port=3306, user='root', password='tiger', db='ai_receptnst')
cmd = con.cursor()
WORD = re.compile(r'\w+')


@app.route('/message', methods=['post', 'get'])
def message():
    msg = request.form["message"]

    print("msg", msg)
    uid = request.form["uid"]

    def text_to_vector(text):
        words = WORD.findall(text)
        return Counter(words)

    def get_cosine(vec1, vec2):
        intersection = set(vec1.keys()) & set(vec2.keys())
        numerator = sum([vec1[x] * vec2[x] for x in intersection])
        sum1 = sum([vec1[x] ** 2 for x in vec1.keys()])
        sum2 = sum([vec2[x] ** 2 for x in vec2.keys()])
        denominator = math.sqrt(sum1) * math.sqrt(sum2)

        if not denominator:
            return 0.0
        else:
            return float(numerator) / denominator

    vector1 = text_to_vector(msg)
    cmd.execute("select question from question")
    s = cmd.fetchall()
    print("s--", s)
    res = []
    for d in s:
        vector2 = text_to_vector(str(d))
        cosine = get_cosine(vector1, vector2)
        # print("cosine",cosine)

        res.append(cosine)

    print("res---", res)

    ss = -1
    cnt = 0
    i = 0
    for s in res:
        if s > 0.3:
            if ss <= float(s):
                cnt = i
                ss = s
        i = i + 1

    print("ss", ss)
    print("cnt", cnt)
    id = 0
    global aa
    if ss != -1:

        cmd.execute("select * from question where id='" + str(cnt + 1) + "'")
        aa = cmd.fetchone()
        id = aa[0]

        # print(aa)
        msg = msg.replace("'", " ")
        cmd.execute("insert into message values(null,'" + msg + "',curdate(),'" + uid + "','" + str(aa[0]) + "')")
        con.commit()
        ret = aa[2]
        if aa[2] == 'staff':
            cmd.execute(
                "SELECT * FROM `staff` WHERE `lid` NOT IN (SELECT `staff_id` FROM `assign_staff` WHERE DATE(DATE)=CURDATE()) "
                "LIMIT 1")
            ss = cmd.fetchall()
            if len(ss) == 0:
                cmd.execute(
                    "SELECT staff_id,COUNT(*) AS cnt FROM assign_staff WHERE DATE(DATE)=CURDATE() GROUP BY staff_id ORDER BY "
                    "cnt LIMIT 1")
                s = cmd.fetchone()
                cmd.execute("SELECT * FROM `staff` WHERE `lid` =" + str(s[0]))
                ss = cmd.fetchall()
            sid = ss[0][1]
            sname = ss[0][2]
            ret = "Please visit staff "+sname+" for details"
            cmd.execute("insert into assign_staff values(null,'" + str(uid) + "','" + str(sid) + "',now())")
            con.commit()

        return jsonify({'task': ret})
    else:
        return jsonify({'task': "Sorry i can't get you!!"})


@app.route('/check_availability', methods=['get', 'post'])
def check_availability():
    cmd.execute(
        "SELECT * FROM `staff` WHERE `lid` NOT IN (SELECT `staff_id` FROM `assign_staff` WHERE DATE(DATE)=CURDATE()) "
        "LIMIT 1")
    ss = cmd.fetchall()
    if len(ss) == 0:
        cmd.execute(
            "SELECT staff_id,COUNT(*) AS cnt FROM assign_staff WHERE DATE(DATE)=CURDATE() GROUP BY staff_id ORDER BY "
            "cnt LIMIT 1")
        s = cmd.fetchone()
        cmd.execute("SELECT * FROM `staff` WHERE `lid` =" + str(s[0]))

        row_headers = [x[0] for x in cmd.description]
        s = cmd.fetchall()
        json_data = []
        for result in s:
            json_data.append(dict(zip(row_headers, result)))
        con.commit()
        print(json_data)
        return jsonify(json_data)
    else:
        cmd.execute(
            "SELECT * FROM `staff` WHERE `lid` NOT IN (SELECT `staff_id` FROM `assign_staff` WHERE DATE("
            "DATE)=CURDATE()) LIMIT 1")

        row_headers = [x[0] for x in cmd.description]
        s = cmd.fetchall()
        json_data = []
        for result in s:
            json_data.append(dict(zip(row_headers, result)))
        con.commit()
        print(json_data)
        return jsonify(json_data)


@app.route('/assign_staff', methods=['post'])
def assign_staff():
    uid = request.form("uid")
    sid = request.form("sid")
    cmd.execute("insert into assign_staff values(null,'" + uid + "','" + sid + "',now())")
    con.commit()
    return jsonify({'task': 'ok'})


@app.route('/reg', methods=['post', 'get'])
def reg():
    print("ok")
    name = request.form["name"]
    print(name)
    email = request.form["email"]

    img = request.form["img"]
    # import time
    # fn = time.strftime("%Y%m%d_%H%M%S") + ".jpg"
    #
    # img.save("static/faces/" + fn)
    cmd.execute("insert into users values(null,'" + name + "','" + email + "','"+img+"')")
    id = con.insert_id()
    con.commit()
    return jsonify({'result': str(id)})


@app.route('/addimg', methods=['post', 'get'])
def addimg():
    img = request.files['files']
    import time
    fn = time.strftime("%Y%m%d_%H%M%S") + ".jpg"
    img.save("static/check/" + fn)
    from receptionist.face_recognitions import recognise
    result = recognise(fn)
    print(result)
    return jsonify({'result': result})


if __name__ == '__main__':
    app.run(host='192.168.43.61', port=5000)
