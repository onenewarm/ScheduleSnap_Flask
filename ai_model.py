from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>잘가요 내 소중한 사람~</p>"

if __name__ == "__main__": 
    app.run(host='0.0.0.0', port='5000', debug=True)