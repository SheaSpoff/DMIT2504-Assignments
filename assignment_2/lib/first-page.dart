import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool switchEnabled = false;
  bool leftButtonEnabled = false;
  bool rightButtonEnabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            //TODO: Replace this Text Widget
            // and build the label and switch here
            // as children of the row.
              Text('Enable Buttons'),
              Switch(
                value: switchEnabled,
                onChanged: (value) {
                  setState(() {
                    switchEnabled = value;
                    leftButtonEnabled = value;
                    rightButtonEnabled = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here 
              // as children of the row.
              // For each button use a 
              // "Visibility Widget" and its child 
              // will be an "ElevatedButton"
              // Button 1
              Visibility(
                visible: leftButtonEnabled,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          timesClicked++;
                          msg1 = 'Clicked $timesClicked';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(msg1.isNotEmpty ? msg1 : 'Click Me'),
                    ),
                  ),
                ),
              ),
              // Button 2
              Visibility(
                visible: rightButtonEnabled,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          timesClicked = 0;
                          msg1 = 'Click Me';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                    //TODO: Build the text form field
                    // here as the first
                    // child of the column.
                    // Include as the second child
                    // of the column
                    // a submit button that will show a
                    // snackbar with the "firstName"
                   // if validation is satisfied.
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.hourglass_empty),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: textEditingController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 1 ||
                                value.length > 20) {
                              return 'Please enter a name between 1 and 20 characters';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            firstName = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            helperText: 'min 1, max 20',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.favorite, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text('Hey There, Your Name is $firstName', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        print(firstName);
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        primary: Colors.white,
                                      ),
                                      child: Text('Click Me'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
