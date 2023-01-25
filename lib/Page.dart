import 'package:flutter/material.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtName = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xFF008069),
              title: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              leading: Icon(Icons.arrow_back)),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: txtPhone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return "please enter the valid number:";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length >= 10) {
                        return "plese enter the valid name:";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          timerSnackbar(
                              context: context,
                              contentText: "${txtPhone.text}${txtName.text}",
                              afterTimeExecute: () => print("done"),
                              second: 10);
                        }
                      },
                      child: Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
