import 'package:flutter/material.dart';
import 'package:login_boc/src/blocs/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          SizedBox(height: 20,),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'your@email.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
            ),
          );
        }
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          // obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          shape: StadiumBorder(),
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.lightBlue,
        );
      }
    );
  }

}
