from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route('/sayHello', methods=['GET'])
def hello():
    return jsonify({"message": "Hello User"}),200


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)