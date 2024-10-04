import 'package:flutter/material.dart';
class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
final _formkey =GlobalKey<FormState>();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key:  _formkey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
            labelText: "Enter your name",border: OutlineInputBorder()),
          validator: (value){
            if (value == null || value.isEmpty){
              return "Please enter some text";
            }
            return null;
          }),
          SizedBox(height: 25,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Enter your email ",border: OutlineInputBorder()
            ),keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || !RegExp(r'\s+@\s+\.\s+').hasMatch(value) ){
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(onPressed: (){
              if (_formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Data')),
                );
              }
            }, child: Text('Submit')),
          )
        ],
      ),
      ),
      ),
    );
  }
}