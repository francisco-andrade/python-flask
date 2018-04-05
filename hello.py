from flask import Flask, abort, request, jsonify, make_response

app = Flask(__name__)

@app.route("/")
def root():
    msg = "Im here"
    print("Returning: " + msg)
    return make_response(jsonify(message=msg))


@app.route("/hello")
def hello():
    msg = "Hello world!"
    print("Returning: " + msg)
    return make_response(jsonify(message=msg))


@app.route("/myip")
def hellov1():
    msg = "127.0.0.1"
    print("Returning: " + msg)
    return make_response(msg + "\n")


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
