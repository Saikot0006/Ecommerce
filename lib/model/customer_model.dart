final String CUSTOMER_ID = 'customerId';
final String CUSTOMER_NAME = 'customerName';
final String CUSTOMER_EMAIL = 'customerEmail';
final String CUSTOMER_PHONE = 'customerPhone';
final String CUSTOMER_ADDRESS = 'customerAddress';

class CustomerModel{
  String id;
  String name;
  String address;
  String email;
  String phone;

  CustomerModel({this.id, this.name, this.address, this.email, this.phone});

  CustomerModel.fromMap(Map<String,dynamic> map){
    id = map[CUSTOMER_ID];
    name = map[CUSTOMER_NAME];
    email = map[CUSTOMER_EMAIL];
    phone = map[CUSTOMER_PHONE];
    address = map[CUSTOMER_ADDRESS];
  }

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      CUSTOMER_ID : id,
      CUSTOMER_NAME : name,
      CUSTOMER_EMAIL : email,
      CUSTOMER_PHONE : phone,
      CUSTOMER_ADDRESS : address
    };
    return map;
  }


  @override
  String toString() {
    return 'CustomerModel{id: $id, name: $name, address: $address, email: $email, phone: $phone}';
  }

}