from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('index.html', template_folder='web-apps/templates/')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

