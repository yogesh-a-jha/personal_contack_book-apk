import 'package:contact_book/people.dart';
import 'package:flutter/material.dart';

// void main (){
//   runApp(MaterialApp(
//     home: details(),
//   ));
// }
class details extends StatefulWidget {
  final People people;

  final Function(People) onDelete;

  details({required this.people, required this.onDelete});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("details"),
        actions: [
          IconButton(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("cant't be edited!")));}, icon: Icon(Icons.edit),iconSize: 30,),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),iconSize: 30,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          
          children: [
          Container(
            alignment: Alignment.topRight,
            child: ElevatedButton(onPressed: (){
               widget.onDelete(widget.people);
               Navigator.of(context).popUntil((route) => route.isFirst); // Call onDelete when pressed
            }, child: 
            Container(
              width: 60,
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  Icon(Icons.delete),
                  Text("delete")
                ],
            
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              iconColor: Colors.red
            ),
                  
            ),
          ),
          SizedBox(height: 10,),
            Container(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Text(
                        '${widget.people.name.substring(0, 1)}',
                        style: TextStyle(
                          fontSize: 65,
                          
                        ),
                      ),
                      
                    ),
                    SizedBox(height: 10,),
                    Text('${widget.people.name}',style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 2,),
                    Text('Mobile - ${widget.people.no}',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300
                    ),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.call,size: 30,), 
                            style: ElevatedButton.styleFrom(
                              iconColor: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                            ),),
                            SizedBox(width: 15,),
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.message,size: 30,), 
                            style: ElevatedButton.styleFrom(
                              iconColor: Colors.blue,
                              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                            ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
           
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Email - ${widget.people.email}',style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.w300
                    ),),
                    SizedBox(height: 10,),
                  Text('Address - ${widget.people.address}',style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.w300
                    ),)
                ],
              ),
            ),
            SizedBox(height: 18,),
            Divider(),
            
            Container(
              alignment: Alignment.topLeft,
              child: Text("Logs",style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300
                    ),),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text("No history"),
                   
                  ],
                ),
              ),
            )

        
          ],
        ),
      ),
    );
  }
}



// class details extends StatelessWidget {
//   const details({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text("details"),
//         actions: [
//           IconButton(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("cant't be edited!")));}, icon: Icon(Icons.edit),iconSize: 30,),
//           IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),iconSize: 30,)
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
//         child: Column(
          
//           children: [
//           Container(
//             alignment: Alignment.topRight,
//             child: ElevatedButton(onPressed: (){}, child: 
//             Container(
//               width: 60,
//               padding: EdgeInsets.all(0),
//               child: Row(
//                 children: [
//                   Icon(Icons.delete),
//                   Text("delete")
//                 ],
            
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.red,
//               iconColor: Colors.red
//             ),
                  
//             ),
//           ),
//           SizedBox(height: 10,),
//             Container(
//               child: Center(
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 70,
                      
//                     ),
//                     SizedBox(height: 10,),
//                     Text("name",style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.w600
//                     ),),
//                     SizedBox(height: 2,),
//                     Text("Mobile - number",style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w300
//                     ),),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(onPressed: (){}, child: Icon(Icons.call,size: 30,), 
//                             style: ElevatedButton.styleFrom(
//                               iconColor: Colors.green,
//                               padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
//                             ),),
//                             SizedBox(width: 15,),
//                         ElevatedButton(onPressed: (){}, child: Icon(Icons.message,size: 30,), 
//                             style: ElevatedButton.styleFrom(
//                               iconColor: Colors.blue,
//                               padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
//                             ),)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
           
//             Container(
//               alignment: Alignment.topLeft,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
                  
//                   Text("Email",style: TextStyle(
//                       fontSize: 22,
//                       // fontWeight: FontWeight.w300
//                     ),),
//                     SizedBox(height: 10,),
//                   Text("Address",style: TextStyle(
//                       fontSize: 22,
//                       // fontWeight: FontWeight.w300
//                     ),)
//                 ],
//               ),
//             ),
//             Divider(),
//             Container(
//               alignment: Alignment.topLeft,
//               child: Text("Logs",style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w300
//                     ),),
//             ),
//             SizedBox(height: 20,),
//             Expanded(
//               child: Container(
//                 child: Column(
//                   children: [
//                     Text("No history"),
                   
//                   ],
//                 ),
//               ),
//             )

        
//           ],
//         ),
//       ),
//     );
//   }
// }