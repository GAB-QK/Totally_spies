from flask import Flask, render_template
from datetime import datetime, timedelta

app = Flask(__name__)


deliveries = [
    {'date': (datetime.now() - timedelta(days=i)).strftime('%Y-%m-%d'), 'destination': f'City {i}', 'status': 'Delivered'}
    for i in range(10)
]


@app.route('/')
def show_deliveries():
    return render_template('deliveries.html', deliveries=deliveries)

if __name__ == '__main__':
    app.run(port=5000)
    app.run(debug=True)
