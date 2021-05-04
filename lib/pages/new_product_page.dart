import 'dart:io';

import 'package:eomerence_app/db/db_helper.dart';
import 'package:eomerence_app/model/product_model.dart';
import 'package:eomerence_app/pages/product_list_page.dart';
import 'package:eomerence_app/utils/product_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewProductPage extends StatefulWidget {
  static final String routeName = "/new_product";
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  ProductModel productModel = ProductModel();
  DateTime _selectedDate;
  String _category;
  final _formKey = GlobalKey<FormState>();
  String _imageLocalPath;
  ImageSource _imageSource  = ImageSource.gallery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Product Add"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Product name*",

              ),
              validator: (value){
                if(value.isEmpty){
                  return "Product name must not be empty";
                }
                return null;
              },
              onSaved: (value){
                productModel.name = value;
              },

            ),
            SizedBox(height: 10,),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Product decoration",

              ),
              onSaved: (value){
                productModel.description = value;
              },

            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Product price*",

              ),
              validator: (value){
                if(value.isEmpty){
                  return "Product price must not be empty";
                }
                if(num.parse(value) < 0){
                  return "Product price should be greater then 0";
                }
                return null;
              },
              onSaved: (value){
                productModel.price = num.parse(value);
              },

            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                Chip(label: Text("Select Purchase Date"),elevation: 6,),
                SizedBox(width: 10,),
                Text(_selectedDate == null ? "" : _showFormattedDate()),
                IconButton(icon: Icon(Icons.calendar_today),
                    onPressed: _showDatePicker),

              ],),
            ),
            SizedBox(height: 10,),
            DropdownButton(
              value: _category,
              isExpanded: false,
              hint: Text("Select a category"),
              onChanged: (value){
                setState(() {
                  _category = value;
                });
                productModel.category = value;
              },
              items: categoryList.map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),

              )).toList(),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.grey,width: 1)
                  ),
                  child: _imageLocalPath == null
                      ? Image.asset("images/image.png",fit: BoxFit.cover,)
                      : Image.file(File(_imageLocalPath)),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      _imageSource = ImageSource.camera;
                      _captureOrSelectImage();
                    }, child: Text("Take Photo")),
                    ElevatedButton(onPressed: (){
                      _imageSource = ImageSource.gallery;
                      _captureOrSelectImage();
                    }, child: Text("Select"))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveProduct,
        child: Icon(Icons.save),
      ),
    );
  }

  void _showDatePicker() async{
    _selectedDate = await showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime.now());

    setState(() {
      _selectedDate = _selectedDate;
    });

    _showFormattedDate();

    productModel.purchaseFormattedDate = _showFormattedDate();
    productModel.purchaseTimeStamp = _selectedDate.millisecondsSinceEpoch;
  }

  String _showFormattedDate() => DateFormat("dd MMM, yyyy hh:mm").format(_selectedDate);



  void _saveProduct() {
    if(_selectedDate == null){
      _showAlertDialog('Select a purchase date');
      return;
    }
    if(_imageLocalPath == null){
      _showAlertDialog('Capture Or Select Image');
      return;
    }
    if(_category == null){
      _showAlertDialog('Select a category');
      return;
    }
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      print(productModel);
      DBHelper.insertProduct(productModel).then((value) => {
        Navigator.pop(context),
      });


    }
  }

  Future<void> _showAlertDialog(String s) {
    return showDialog(
        barrierDismissible: false,
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text(s),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
          }, child: Text("OK")),
            ],
          );
    });
  }

   _captureOrSelectImage() async{
    final picked = await ImagePicker().getImage(source: _imageSource);
    setState(() {
      _imageLocalPath  = picked.path;
    });
    print(picked.path);
    productModel.localImage = _imageLocalPath;
  }
}
