import 'package:flutter/material.dart';
import 'package:project_62a/widgets/input_field.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConverterPageState();
}

class _ConverterPageState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String name = "";
  String? errorText;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter Page"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 192, 208, 215),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hint: "Enter your name..",
                      label: "Name",
                      errorText: errorText,
                      icon: Icons.person,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty";
                        } else if (!RegExp(r'^[a-zA-Z .]+$').hasMatch(value)) {
                          return "Invalid name format";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    InputField(
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: "Enter your password..",
                      label: "Password",
                      errorText: errorText,
                      icon: Icons.lock,
                      validator: (value) {},
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            name = nameController.text;
                          }
                        });
                      },
                      child: Text("Submit"),
                    ),
                    SizedBox(height: 20),
                    Text("Name is: $name"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
