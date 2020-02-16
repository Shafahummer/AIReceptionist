import os

import pymysql as pymysql
from flask import *
from werkzeug.utils import secure_filename

app = Flask(__name__)
con = pymysql.Connect(host='localhost', port=3306, user='root', password='tiger', db='ai_receptnst')
cmd = con.cursor()
app.secret_key = "abc"
path = r"./static/reports"


@app.route('/')
def main():
    return render_template('login.html')


@app.route('/login', methods=['get', 'post'])
def login():
    username = request.form['username']
    password = request.form['pass']
    # username=admin
    # password=manager
    cmd.execute("select * from login where username='" + username + "'and password='" + password + "'")
    s = cmd.fetchone()
    if s is None:
        return '''<script>alert("invalid");window.location="/"</script>'''
    elif s[3] == "admin":
        return '''<script>alert("Login success");window.location="/managerhome"</script>'''
    elif s[3] == "staff":
        session['lid'] = s[0]
        return '''<script>alert("Login success");window.location="/staffhome"</script>'''
    else:
        return '''<script>alert("invalid");window.location="/"</script>'''


@app.route("/managerhome", methods=['get', 'post'])
def managerhome():
    return render_template('Managerhome.html')


@app.route("/staffreg")
def staffreg():
    return render_template('staffreg.html')


@app.route("/manage")
def manage():
    cmd.execute("select * from staff")
    s = cmd.fetchall()
    return render_template('manage.html', val=s)


@app.route("/assignwork")
def assignwork():
    cmd.execute("select lid,name from staff")
    s = cmd.fetchall()
    return render_template('assignwork.html', val=s)


@app.route('/enquiry', methods=['get', 'post'])
def enquiry():
    cmd.execute("SELECT message.date,message.message,question.answer,users.email FROM  message JOIN question ON "
                "message.rid=question.id JOIN users ON users.id=message.uid")
    s = cmd.fetchall()
    return render_template("enquiry.html", val=s)


@app.route("/report")
def report():
    cmd.execute("SELECT staff.name,`assign_work`.work,report.report FROM staff JOIN assign_work ON "
                "staff.lid=assign_work.staff_id JOIN report ON report.work_id=assign_work.staff_id")
    s = cmd.fetchall()
    return render_template('report.html', val=s)


@app.route("/addStaff", methods=['get', 'post'])
def addStaff():
    name = request.form['name']
    gender = request.form['gender']
    age = request.form['age']
    qualification = request.form.getlist('checkbox')
    quali = ','.join(qualification)
    place = request.form['place']
    post = request.form['post']
    district = request.form['district']
    pin = request.form['pin']
    contact = request.form['contact']
    email = request.form['email']
    username = request.form['username']
    password = request.form['password']

    cmd.execute("insert into login values (null,'"+username+"','"+password+"','staff')")
    id = con.insert_id()
    cmd.execute("insert into staff values(null,'"+str(id)+"','"+name+"','"+gender+"','"+age+"','"+quali+"','"+place+"','"+post+"','"+district+"','"+pin+"','"+contact+"','"+email+"')")
    con.commit()

    return '''<script>alert("Inserted successfully");window.location="/managerhome"</script>'''


@app.route("/staffhome", methods=['get', 'post'])
def staffhome():
    return render_template("staff_home.html")


@app.route("/view_work")
def view_work():
    id = session['lid']
    cmd.execute("select work,date,finish_date from assign_work where staff_id='"+str(id)+"'")
    s = cmd.fetchall()
    return render_template('view_work.html', val=s)


@app.route("/add_report", methods=['get', 'post'])
def add_report():
    return render_template("add_report.html")


@app.route("/submit_report", methods=['get', 'post'])
def submit_report():
    title = request.form["reporttitle"]
    id = session['lid']
    report = request.files["file"]
    rprt = secure_filename(report.filename)
    report.save(os.path.join(path, rprt))
    cmd.execute("insert into report values(null,'"+title+"','"+rprt+"','"+str(id)+"')")
    con.commit()
    return '''<script>alert("Inserted successfully");window.location="/staffhome"</script>'''


@app.route("/view_report")
def view_report():
    cmd.execute("select title,report from report")
    s = cmd.fetchall()
    return render_template('view_report.html', val=s)


@app.route("/update_report")
def update_report():
    idd = session['lid']
    cmd.execute("select title,report from report where work_id='"+str(idd)+"'")
    s = cmd.fetchone()
    return render_template('update_report.html', val=s)


@app.route("/staffdelete")
def staffdelete():
    idd = request.args.get('id')
    cmd.execute("delete from staff where lid='"+idd+"'")
    cmd.execute("delete from login where id='"+idd+"'")
    con.commit()
    return '''<script>alert("Removed successfully");window.location="/manage"</script>'''


@app.route("/editstaff")
def editstaff():
    id = request.args.get('id')
    session['id'] = id
    cmd.execute("select * from staff where id='"+id+"'")
    rs = cmd.fetchone()
    return render_template("editstaff.html", val=rs)


@app.route('/updatestaff', methods=['get', 'post'])
def updatestaff():
    idd = session['id']

    name = request.form['name']
    gender = request.form['gender']
    age = request.form['age']
    qualification = request.form.getlist('checkbox')
    quali = ','.join(qualification)
    place = request.form['place']
    post = request.form['post']
    district = request.form['district']
    pin = request.form['pin']
    contact = request.form['contact']
    email = request.form['email']

    cmd.execute("update staff set name='"+name+"',gender='"+gender+"',age='"+age+"',qualification='"+quali+"',place='"+place+"',post='"+post+"',district='"+district+"',pin='"+pin+"',contact='"+contact+"',email='"+email+"' where id='"+idd+"'")
    con.commit()
    return '''<script>alert("Updated successfully");window.location="/manage"</script>'''


@app.route("/assignTask", methods=['get', 'post'])
def assignTask():
    date = request.form["date"]
    id = request.form['select']
    img = request.files['file']

    fn = secure_filename(img.filename)
    img.save("static/work/"+fn)

    cmd.execute("insert into assign_work values(null,'"+id+"','"+fn+"',curdate(),'"+date+"')")
    con.commit()
    return '''<script>alert("Work assigned successfully");window.location="/managerhome"</script>'''


@app.route("/change_report")
def change_report():
    return render_template("change_report.html")


@app.route("/edit_report", methods=['get', 'post'])
def edit_report():
    id = session['lid']
    report = request.files["file"]
    rprt = secure_filename(report.filename)
    report.save(os.path.join(path, rprt))
    cmd.execute("update report set report='"+rprt+"' where work_id='"+str(id)+"'")
    con.commit()
    return '''<script>alert("Report updated successfully");window.location="/update_report"</script>'''


@app.route("/update_title", methods=['get', 'post'])
def update_title():
    id = session['lid']
    title = request.form["title"]
    cmd.execute("update report set title='"+title+"' where work_id='"+str(id)+"'")
    con.commit()
    return '''<script>alert("Title updated successfully");window.location="/update_report"</script>'''


if __name__ == '__main__':
    app.run(debug=True)
