from flask import Flask,request,jsonify,make_response


app = Flask(__name__)


@app.route('/findroom')
def find_room():
    request_data = request.args
    queue = []
    enter = request_data['room_no']
    for i in enter:
        queue.append(i)

    if queue[0] != '4' and queue[0] != '5':
        show = f"Room is in Block {queue[0]} and Floor number is {queue[1]}"

    else:
        show = "Block 4 and 5 not included"

    response = jsonify({'result' : show})
    return make_response(response)


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')