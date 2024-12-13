import 'package:flutter/material.dart';

void main() {
  runApp(FormExampleApp());
}

class FormExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FormExampleScreen(),
    );
  }
}

class FormExampleScreen extends StatefulWidget {
  @override
  _FormExampleScreenState createState() => _FormExampleScreenState();
}

class _FormExampleScreenState extends State<FormExampleScreen> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  bool isAcceptedTerms = false;
  String? gender;
  String selectedOption = 'Favorite Food';
  bool isSwitchOn = false;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String result = '''
      Name: $name
      Accepted Terms: $isAcceptedTerms
      Gender: $gender
      Selected Option: $selectedOption
      Switch On: $isSwitchOn
      ''';
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Form Submitted'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isAcceptedTerms,
                    onChanged: (value) {
                      setState(() {
                        isAcceptedTerms = value ?? false;
                      });
                    },
                  ),
                  Text('Im a sane person'),
                ],
              ),
              SizedBox(height: 16),
              Text('Gender:', style: TextStyle(fontSize: 16)),
              ListTile(
                title: Text('Male'),
                leading: Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Female'),
                leading: Radio<String>(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedOption,
                items: [
                  'Favorite Food',
                  'Noodle',
                  'Burger',
                  'Only 2 option man ;)'
                ]
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Select an Option',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Good', style: TextStyle(fontSize: 16)),
                  Switch(
                    value: isSwitchOn,
                    onChanged: (value) {
                      setState(() {
                        isSwitchOn = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
