void main() {
  var customerManager = new CustomerManager();
  var customer = Customer("Oguz","Yener");
  customerManager.add(customer);
}
class CustomerManager{
  void add(Customer customer){

    print("Eklendi : "+customer._name);
  }

  void update(){
    print("Güncellendi");
  }
  void delete(){
    print("Silindi");
  }
}

class Customer {
  String _name;
  String _surname;
  // constructor
  Customer(this._name, this._surname) {
    this._name = _name;
    this._surname = _surname;
  }

  }

