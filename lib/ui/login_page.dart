import 'package:flutter/material.dart';
import 'package:testing_flutter/util/auth/validator.dart';

class LoginScreen extends StatelessWidget {
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        elevation: 1,
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                onChanged: (text) => _email = text,
              ),
              TextField(
                onChanged: (text) => _password = text,
              ),
              FlatButton(
                onPressed: () {
                  bool errorFound = false;
                  if (!AuthValidator().isEmailValid(_email??"") ||
                      !AuthValidator().isPasswordValid(_password??""))
                    errorFound = true;

                  if (errorFound)
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Invalid Cradential"),
                      ),
                    );
                  else
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("valid"),
                      ),
                    );
                },
                child: Text('login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
