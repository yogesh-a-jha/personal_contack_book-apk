import 'package:contact_book/people.dart';
import 'package:flutter/material.dart';

// void main(){
//   runApp(MaterialApp(
//     home: addContact(),
//   ));
// }

class addContactPage extends StatefulWidget {
   final Function(People) onContactAdded;

  addContactPage({required this.onContactAdded});

  @override
  State<addContactPage> createState() => _addContactState();
}

class _addContactState extends State<addContactPage> {
   final _nameController = TextEditingController();
  final _noController =TextEditingController();
  final _emailController =TextEditingController();
  final _addressController =TextEditingController();
  final _photoController =TextEditingController();

  // Function to add a student to the list
  void addContacts() {
    final name = _nameController.text;
    final no = _noController.text;
    final email = _emailController.text;
    final address = _addressController.text;
    final photo = _photoController.text;

    if (name.isNotEmpty && no.isNotEmpty) {
      final people = People(name: name, no: no,email: email,address: address,photo: photo);
      widget.onContactAdded(people);  // Pass the student back to the list screen
      Navigator.pop(context);  // Go back to the list screen
    } else {
      // Show a validation error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and roll number')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add contact"),
      ),
       body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          
          children: [
        
          SizedBox(height: 15,),
            Container(
              child: Center(
                child: Column(
                  children: [
                     SizedBox(height: 25,),
                    CircleAvatar(
                      radius: 70,
                      child: Icon(Icons.camera,size: 50,),
                      
                    ),
                    SizedBox(height: 20,),
                    TextField(
                     controller: _nameController,
                               decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                                          fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
                                            filled: true, 
                                            hintText: "Name",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)   
                                        ),
                                ),
                             ),
                    SizedBox(height: 12,),
                     TextField(
                     controller: _noController,
                               decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                                          fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
                                            filled: true, 
                                            hintText: "Mobile",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)   
                                        ),
                                ),
                             ),
                    SizedBox(height: 12,),
                     TextField(
                     controller: _emailController,
                               decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                                          fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
                                            filled: true, 
                                            hintText: "Email",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)   
                                        ),
                                ),
                             ),
                             SizedBox(height: 12,),
                     TextField(
                     controller: _addressController,
                               decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                                          fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
                                            filled: true, 
                                            hintText: "Address",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                                          borderRadius: BorderRadius.circular(50)   
                                        ),
                                ),
                             ),
                         SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Icon(Icons.close,size: 50,), 
                            style: ElevatedButton.styleFrom(
                              iconColor: Colors.red,
                              
                              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                            ),),
                            SizedBox(width: 20,),
                        ElevatedButton(onPressed: addContacts, child: Icon(Icons.check,size: 50,), 
                            style: ElevatedButton.styleFrom(
                              iconColor: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                            ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class addcontact extends StatelessWidget {
//   const addcontact({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add contact"),
//       ),
//        body: Padding(
//         padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
//         child: Column(
          
//           children: [
        
//           SizedBox(height: 15,),
//             Container(
//               child: Center(
//                 child: Column(
//                   children: [
//                      SizedBox(height: 25,),
//                     CircleAvatar(
//                       radius: 70,
//                       child: Icon(Icons.camera,size: 50,),
                      
//                     ),
//                     SizedBox(height: 20,),
//                     TextField(
                    
//                                decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
//                                           fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
//                                             filled: true, 
//                                             hintText: "Name",
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)   
//                                         ),
//                                 ),
//                              ),
//                     SizedBox(height: 12,),
//                      TextField(
                    
//                                decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
//                                           fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
//                                             filled: true, 
//                                             hintText: "Mobile",
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)   
//                                         ),
//                                 ),
//                              ),
//                     SizedBox(height: 12,),
//                      TextField(
                    
//                                decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
//                                           fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
//                                             filled: true, 
//                                             hintText: "Email",
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)   
//                                         ),
//                                 ),
//                              ),
//                              SizedBox(height: 12,),
//                      TextField(
                    
//                                decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
//                                           fillColor: const Color.fromARGB(38, 158, 158, 158), // Background color
//                                             filled: true, 
//                                             hintText: "Address",
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: const Color.fromARGB(68, 158, 158, 158), width: 1),
//                                           borderRadius: BorderRadius.circular(50)   
//                                         ),
//                                 ),
//                              ),
//                          SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(onPressed: (){}, child: Icon(Icons.close,size: 50,), 
//                             style: ElevatedButton.styleFrom(
//                               iconColor: Colors.red,
                              
//                               padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
//                             ),),
//                             SizedBox(width: 20,),
//                         ElevatedButton(onPressed: (){}, child: Icon(Icons.check,size: 50,), 
//                             style: ElevatedButton.styleFrom(
//                               iconColor: Colors.green,
//                               padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
//                             ),)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }