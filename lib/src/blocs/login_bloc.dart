import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_boc/src/validators/login_validator.dart';

class LoginBloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('Enviando datos: $validEmail - $validPassword');
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}

// Single Global Instance
final bloc = LoginBloc();
