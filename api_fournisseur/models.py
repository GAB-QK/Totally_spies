from .app import db

class Factory(db.Model):
    __tablename__ = 'factories'
    id_factories = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)

class Employee(db.Model):
    __tablename__ = 'employees'
    id_employees = db.Column(db.Integer, primary_key=True)
    lastname = db.Column(db.String(50))
    firstname = db.Column(db.String(50))
    age = db.Column(db.Integer)
    start_date = db.Column(db.Date)
    end_date = db.Column(db.Date)
    is_present = db.Column(db.Boolean)
    factory_id = db.Column(db.Integer, db.ForeignKey('factories.id_factories'))

class Supplier(db.Model):
    __tablename__ = 'suppliers'
    id_suppliers = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))

class Delivery(db.Model):
    __tablename__ = 'deliveries'
    id_deliveries = db.Column(db.Integer, primary_key=True)
    supplier_id = db.Column(db.Integer, db.ForeignKey('suppliers.id_suppliers'))
    factory_id = db.Column(db.Integer, db.ForeignKey('factories.id_factories'))
    delivery_date = db.Column(db.Date)
    quantity = db.Column(db.Integer)
    received_by = db.Column(db.Integer, db.ForeignKey('employees.id_employees'))

class Robot(db.Model):
    __tablename__ = 'robots'
    id_robots = db.Column(db.Integer, primary_key=True)
    factory_id = db.Column(db.Integer, db.ForeignKey('factories.id_factories'))
    modelName = db.Column(db.String(50))
    production_date = db.Column(db.Date)
    quantity = db.Column(db.Integer)
    parts_used = db.Column(db.Integer)

class AuditRobot(db.Model):
    __tablename__ = 'audit_robot'
    audit_robot_id = db.Column(db.Integer)
    audit_date = db.Column(db.Date)

class Stock(db.Model):
    __tablename__ = 'stock'
    id_stock = db.Column(db.Integer, primary_key=True, autoincrement=True)
    factory_id = db.Column(db.Integer, db.ForeignKey('factories.id_factories'))
    robot_id = db.Column(db.Integer, db.ForeignKey('robots.id_robots'))
    quantity = db.Column(db.Integer)
    last_update = db.Column(db.TIMESTAMP, default=db.func.current_timestamp())
