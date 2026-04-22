from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return "Hello Ashwani"


if __name__ == "__main__":
    # Running on port 8080
    app.run(host='0.0.0.0', port=8080)