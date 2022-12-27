from flask import Flask, render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
import json
import os
import math
from flask_mail import Mail


local_server =True
with open('config.json','r')as c:
    params = json.load(c)["params"]


app = Flask(__name__)
app.secret_key = 'SECRET KEY'
app.config['UPLOAD_FOLDER'] = params['upload_location']

app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_password'] 
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)

class Contacts(db.Model):
    # sno,name,email,phone,message,date
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(80), nullable=False)
    phone = db.Column(db.String(20), nullable=False)
    message = db.Column(db.String(220),nullable=False)
    date = db.Column(db.String(50), nullable=True)


class Posts(db.Model):
    # sno,name,email,phone,message,date
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(20), nullable=False)
    tagline = db.Column(db.String(50), nullable=False)
    img_file = db.Column(db.String(25), nullable=False)
    date = db.Column(db.String(50), nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page =1
    page = int(page)
    # page slicing 
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if(page==1):
        prev="#"
        next = "/?page="+str(page+1)
    elif(page==last):
        prev = "/?page="+str(page-1)
        next="#"
    else:
        next = "/?page="+str(page+1)
        prev = "/?page="+str(page-1)
    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)


@app.route("/about")
def about():
    return render_template('about.html',params=params)

@app.route("/login",methods = ['GET','POST'])
def login():
    if('user' in session and session['user']==params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)
    if(request.method=='POST'):
        userName = request.form.get('userName')
        userPassword = request.form.get('userPassword')
        if(userName==params['admin_user'] and userPassword==params['admin_password']):
            # set the session variable 
            session['user']=userName
            posts = Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)
    return render_template('login.html',params=params)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)

@app.route("/uploader",methods=['GET','POST'])
def uploader():
    if('user' in session and session['user']==params['admin_user']):
        if request.method=='POST':
            f=request.files['fileUploader']
            f.save(os.path.join(app.config['UPLOAD_FOLDER']),secure_filename(f.filename))
            return "Uploaded Successfully"

@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if('user' in session and session['user']==params['admin_user']):
        if request.method=='POST':
            box_title = request.form.get('title')
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno =='0':
                post= Posts(title=box_title,slug=slug,content=content,tagline=tagline,img_file=img_file,date=date)
                db.session.add(post)
                db.session.commit()
                return redirect('/login')
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title= box_title
                post.slug =slug
                post.tagline=tagline
                post.content=content
                post.img_file=img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('edit.html',params=params, post=post)


@app.route("/Logout")
def Logout():
    session.pop('user')
    return redirect('/login')

@app.route("/delete/<string:sno>")
def delete(sno):
    if('user' in session and session['user']==params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/login')

@app.route("/contact",methods=['GET','POST'])
def contact():
    if(request.method=='POST'):
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        msg=request.form.get('message')
        entry = Contacts(name=name,email=email,phone=phone,message=msg,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            'New message from '+ name,  
            sender = email,
            recipients=[params['gmail_user']],
            body= msg + "\n"+ phone
        )
    return render_template('contact.html',params=params)



app.run(debug=True)

