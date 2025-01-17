import 'package:contact_book/add_to_list.dart';
import 'package:flutter/material.dart';
import 'package:contact_book/people.dart';
import 'package:contact_book/contactdetailpage.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isDarkTheme = false;

  List<People> peoples = [
     People(name: 'Yogesh Jha', no: "125184357", email: "yogesh@example.com", address: "123 Main St, City, Country", photo: "https://via.placeholder.com/150/0000FF/808080?Text=John+Doe"),
    People(name: 'Vevek Chaudhary', no: "56113791323", email: "vivek@example.com", address: "123 Main St, City, Country", photo: "https://via.placeholder.com/150/0000FF/808080?Text=John+Doe"),
    People(name: 'John Doe', no: "1234567890", email: "johndoe1@example.com", address: "123 Main St, City, Country", photo: "https://via.placeholder.com/150/0000FF/808080?Text=John+Doe"),
    People(name: 'Jane Smith', no: "0987654321", email: "janesmith2@example.com", address: "456 Oak St, City, Country", photo: "https://via.placeholder.com/150/FF0000/FFFFFF?Text=Jane+Smith"),
    People(name: 'Alice Brown', no: "1122334455", email: "alicebrown3@example.com", address: "789 Pine St, City, Country", photo: "https://via.placeholder.com/150/00FF00/FFFFFF?Text=Alice+Brown"),
    People(name: 'Bob White', no: "6677889900", email: "bobwhite4@example.com", address: "101 Maple St, City, Country", photo: "https://via.placeholder.com/150/FFFF00/000000?Text=Bob+White"),
    People(name: 'Charlie Green', no: "2233445566", email: "charliegreen5@example.com", address: "202 Birch St, City, Country", photo: "https://via.placeholder.com/150/00FFFF/000000?Text=Charlie+Green"),
    People(name: 'David Black', no: "5566778899", email: "davidblack6@example.com", address: "303 Cedar St, City, Country", photo: "https://via.placeholder.com/150/000000/FFFFFF?Text=David+Black"),
  
  ];

  List<People> filteredPeoples = [];

  @override
  void initState() {
    super.initState();
    filteredPeoples = peoples; // Initially show all contacts
  }

  void addContact(People people) {
    setState(() {
      peoples.add(people);
      filteredPeoples = peoples; // Update filtered list
    });
  }

  // void deleteContact(int index) {
  //   setState(() {
  //     peoples.removeAt(index);
  //     filteredPeoples = peoples; // Update filtered list
  //   });
  // }

   void deleteContact(People person) {
    setState(() {
      peoples.remove(person);
        filteredPeoples = List.from(peoples);// Remove the person from the list
    });
     // Go back to the previous page after deletion
  }

  void filterPeople(String query) {
    setState(() {
      filteredPeoples = peoples.where((person) {
        return person.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), 
      darkTheme: ThemeData.dark(), 
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light, 
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Contacts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: _isDarkTheme ? Colors.white : Colors.black, 
            ),
          ),
          actions: [
            Switch(
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                });
              },
              activeColor: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              iconSize: 30,
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(17, 0, 17, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: TextField(
                        onChanged: (query) {
                          filterPeople(query); // Call filter when search query changes
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                          fillColor: const Color.fromARGB(38, 158, 158, 158),
                          filled: true,
                          hintText: "Search",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(68, 158, 158, 158), width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:filteredPeoples.isEmpty
                        ? Center(child: Text("No contacts available."))
                        : ListView.builder(
                        itemCount: filteredPeoples.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => 
                           Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => details(
                                          people: filteredPeoples[index],
                                          onDelete: deleteContact,
                                        ),
                                      ),
                                    ),
                            child: Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: _isDarkTheme
                                              ? const Color.fromARGB(153, 22, 63, 82)
                                              : const Color.fromARGB(153, 64, 195, 255),
                                          radius: 28,
                                          child: Text(
                                            '${filteredPeoples[index].name.substring(0, 1)}',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: _isDarkTheme ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 17),
                                        Text(
                                          '${filteredPeoples[index].name}',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: _isDarkTheme ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
           
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addContactPage(onContactAdded: addContact),
            ),
          );
          },
        ),
      ),
    );
  }
}
