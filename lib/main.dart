import 'package:contact_book/add_to_list.dart';
import 'package:contact_book/display_list.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Home(),
      "/addContact" : (context) =>addContactPage(onContactAdded: (People ) {  },)
      
    },
    debugShowCheckedModeBanner: false,
  ));
 
  
}
