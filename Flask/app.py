from flask import Flask
### WSGI application
app = Flask(__name__)

    
@app.route('/')
def welcome():
    return "welcome to my youtube channel. Please please subscribe my youtube channel"

@app.route('/members')
def members():
    return "Welcome to my youtube channel memebers"
if __name__=='__main__':
    app.run(debug = True)

