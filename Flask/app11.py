## building url dynamically
## variable rules and url building

from flask import Flask,redirect,url_for

app = Flask(__name__)

@app.route('/')
def welcome():
    return "welcome to my youtube channel"

@app.route('/success/<int:score>')
def success(score):
    return "the person has passed and marks is "+  str(score)

@app.route('/fail/<int:score>')
def fail(score):
    return "the person has failed and marks is "+  str(score)


##result checker
@app.route('/results/<int:marks>')
def myresults(marks):
    result = ""
    if marks < 50:
        result = 'fail'
    else:
        result = 'success'
    return redirect(url_for(result,score=marks))



if __name__=='__main__':
    app.run(debug  = True)