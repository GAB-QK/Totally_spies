from flask import Flask, render_template

app = Flask(__name__)


employees = [
    {'name': 'Alice', 'factory': 'Factory A', 'position': 'Engineer'},
    {'name': 'Bob', 'factory': 'Factory B', 'position': 'Technician'},
    {'name': 'Charlie', 'factory': 'Factory A', 'position': 'Manager'},
    {'name': 'David', 'factory': 'Factory C', 'position': 'Operator'},
    {'name': 'Eve', 'factory': 'Factory B', 'position': 'Engineer'},
]



@app.route('/')
def show_employees():
    return render_template('employees.html', employees=employees)

if __name__ == '__main__':
    app.run(port=5001)

