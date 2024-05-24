from flask import Flask, render_template


app = Flask(__name__)


usines = {
    'Usine A': 50,
    'Usine B': 30,
    'Usine C': 20
}

@app.route('/')
def index():
 
    return render_template('stock.html', usines=usines)


if __name__ == '__main__':
    app.run(port=5002)
