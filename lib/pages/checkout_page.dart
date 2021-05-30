import 'package:eomerence_app/db/db_helper.dart';
import 'package:eomerence_app/model/customer_model.dart';
import 'package:eomerence_app/pages/order_conferm_page.dart';
import 'package:eomerence_app/utils/product_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutPage extends StatefulWidget {
  static final String routeName = "/checkout";
  const CheckoutPage({Key key}) : super(key: key);



  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  var searchPhoneController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  CustomerModel customerModel = CustomerModel();
  var paymentMethodGroupValue = PaymentMethod.cod;

  @override
  void dispose() {
    searchPhoneController.dispose();
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(

          padding: const EdgeInsets.all(8.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Who is Buying?',style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),
            Card(
              color: Colors.greenAccent,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchPhoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Enter mobile number'
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Builder(builder: (context) => ElevatedButton(
                      child: Text('Find'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: _searchCustomerUsingPhone,
                    )),

                    SizedBox(width: 10,),
                  ],
                ),
              ),

            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                filled: true,
                fillColor: Colors.green.shade400,
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Price should not be empty';
                }
                return null;
              },
              onSaved: (value){
                customerModel.phone = value;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Customer name',
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                filled: true,
                fillColor: Colors.green.shade400,
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Customer name should not be empty';
                }
                return null;
              },
              onSaved: (value){
                customerModel.name = value;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email (optional)',
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                filled: true,
                fillColor: Colors.green.shade400,
                border: OutlineInputBorder(),
              ),
              onSaved: (value){
                customerModel.email = value;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Street Address',
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                filled: true,
                fillColor: Colors.green.shade400,
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Address should not be empty';
                }
                return null;
              },
              onSaved: (value){
                customerModel.address = value;
              },
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 5,
              color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Select Payment Method'),
                    ListTile(
                      title: Text(PaymentMethod.card),
                      leading: Radio(
                        groupValue: paymentMethodGroupValue,
                        value: PaymentMethod.card,
                        onChanged: (value){
                          setState(() {
                            paymentMethodGroupValue = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(PaymentMethod.cod),
                      leading: Radio(
                        groupValue: paymentMethodGroupValue,
                        value: PaymentMethod.cod,
                        onChanged: (value){
                          setState(() {
                            paymentMethodGroupValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: _placeOrder, child: Text('Place Order')),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }

  void _searchCustomerUsingPhone() async {
    final phone = searchPhoneController.text;
    if(phone.isEmpty || phone == null) return;
    final snapshot = await DBHelper.findCustomerWithPhone(phone);
    if(snapshot.docs.isEmpty){
      print('No customer found');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No customer found'),
        )
      );
    }else{
      print('Customer found');
      customerModel = CustomerModel.fromMap(snapshot.docs.first.data());
      setState(() {
        phoneController.text = customerModel.phone;
        nameController.text = customerModel.name;
        emailController.text = customerModel.email;
        addressController.text = customerModel.address;
      });
    }
  }

  void _placeOrder() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      final customerId = await DBHelper.insertNewCustomer(customerModel);
      customerModel.id  = customerId;
      Navigator.pushNamed(context, OrderConfirmPage.routeName,arguments: [customerModel,paymentMethodGroupValue]);
    }
  }
}
