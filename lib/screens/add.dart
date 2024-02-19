import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    TextEditingController regnoController=TextEditingController();
    TextEditingController courseController=TextEditingController();


    Future <void> submitStudent() async{
      //   get data from form
      final name=nameController.text;
      final phone=phoneController.text;
      final regno=regnoController.text;
      final course=courseController.text;
      final body={
        "name":name,
        "phone":phone,
        "reg_no":regno,
        "course":course
      };
      //   submit data to the server
      print(body);
      final url='https://b30d-105-167-121-35.ngrok-free.app/api/add';
      final uri=Uri.parse(url);
      final response= await http.post(uri,
          body: jsonEncode(body),
          headers: {
            "Content-Type":"application/json"
          }
      );
      if(response.statusCode== 200){
        print(response.body);
      }
      else{
        print(response.body);
      }

      //   show success or fail message
    }



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.blue,size: 30,),
          onPressed: ()=>{
            Navigator.of(context).pop()
          },
        ),
        title: Center(
          child: Text(
            'Add Student',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter name",
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
                ),
                )
              ),
            SizedBox(height: 20,),
            TextField(
              controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Enter phone",
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                )
            ),
            SizedBox(height: 20,),
            TextField(
              controller: regnoController,
                decoration: InputDecoration(
                  labelText: "Enter Reg_no",
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                )
            ),
            SizedBox(height: 20,),
            TextField(
              controller: courseController,
                decoration: InputDecoration(
                  labelText: "Enter course",
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>{
                  submitStudent(),
                  Navigator.of(context).pushNamed('/home')
                },
                child: Text(
                  "Submit data",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
              ),
            )
          ],
        ),
      ),
    );

  }




}


