from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello_guvi_geek():
    return render_template('index.html', message="Hello GUVI GEEK")

if __name__ == '__main__':
    app.run(debug=True)
