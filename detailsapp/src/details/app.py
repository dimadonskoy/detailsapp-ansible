from flask import Flask
from flask import render_template
from src.details import app
from .libs import libs


app = Flask(__name__)

@app.route('/')
def index():
    print(libs.hello('index.html'))
    return render_template('index.html')





