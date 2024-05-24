from flask import Blueprint, jsonify, request
from .models import db, Factory, Stock

api = Blueprint('api', __name__)

@api.route('/stocks/<int:factory_id>', methods=['GET'])
def get_factory_stocks(factory_id):
    factory = Factory.query.get_or_404(factory_id)
    stocks = Stock.query.filter_by(factory_id=factory_id).all()
    stock_list = [{'robot_id': stock.robot_id, 'quantity': stock.quantity, 'last_update': stock.last_update} for stock in stocks]
    
    return jsonify({'factory': factory.name, 'stocks': stock_list})

@api.route('/stocks', methods=['GET'])
def get_all_stocks():
    factories = Factory.query.all()
    all_stocks = []
    
    for factory in factories:
        stocks = Stock.query.filter_by(factory_id=factory.id_factories).all()
        stock_list = [{'robot_id': stock.robot_id, 'quantity': stock.quantity, 'last_update': stock.last_update} for stock in stocks]
        all_stocks.append({'factory': factory.name, 'stocks': stock_list})
    
    return jsonify({'factories': all_stocks})

def init_app(app):
    app.register_blueprint(api, url_prefix='/api')
