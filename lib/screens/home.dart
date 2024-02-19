import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {

    Future <void> getStudents()async {
      final url='https://b30d-105-167-121-35.ngrok-free.app/api/students';
      final uri=Uri.parse(url);
      final response= await http.get(uri);
      print(response.body);
    };

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'All Enrolled Students',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 30
            ),
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>{
          Navigator.of(context).pushNamed('/add')
        },
        label: Text(
          'Add Student',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5.0,
                              blurRadius: 7,
                              offset: Offset(0,3)
                          ),
                        ]
                    ),
                    child: Center(
                      child: Text(
                        "Daily",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    getStudents()
                  },
                ),
                SizedBox(width: 60,),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.0,
                            blurRadius: 7,
                            offset: Offset(0,3)
                        ),
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Weekly",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 60,),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.0,
                            blurRadius: 7,
                            offset: Offset(0,3)
                        ),
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Monthly",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
