import pymysql

from receptionist.encode_faces import enf
from receptionist.recognize_face import rec_face_image


def recognise(fname):
    con = pymysql.Connect(host='localhost', port=3306, user='root', password='tiger', db='ai_receptnst')
    cmd = con.cursor()
    cmd.execute("select * from users")
    s = cmd.fetchall()
    enf("static/check/" + fname)
    print(s)
    for i in s:
        ret = rec_face_image("static/check/" + i[3])
        print("========>", len(ret))
        if len(ret) > 0:
            return i[1]+"#"+str(i[0])
    return "na#"+fname


# r = recognise("Cristiano_Ronaldo_2018.jpg")

# print(r, "===>result")


