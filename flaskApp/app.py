import os
from flask import Flask
from flask_talisman import Talisman

app = Flask(__name__)
Talisman(app, force_https=False)

@app.route("/")
def main():
    return "Welcome!"

@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
