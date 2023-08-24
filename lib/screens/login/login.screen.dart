import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/common/interfaces/auth/auth.interface.dart';
import 'package:todo_flutter/common/widgets/button/button.widget.dart';

import '../../common/providers/user/facades/user.facade.dart';
import '../../common/providers/user/services/user-api.service.dart';
import '../../common/widgets/form-field/form-field.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late UserFacade _userFacade;

  // @override
  // void initState() {
  //   super.initState();
  //   _userFacade = UserFacade(UserApiService());
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userFacade = Provider.of<UserFacade>(context);
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      AuthLoginPayload payload = AuthLoginPayload(
        username: username,
        password: password,
      );

      await _userFacade.login(payload);

      if (context.mounted) {
        navigateOrShowToast(context, _userFacade.loginState);
      } else {
        return;
      }
    }
  }

// TODO: make global toast functionality
  void navigateOrShowToast(BuildContext context, LoginState loginState) {
    if (loginState == LoginState.success) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (loginState == LoginState.error) {
      Fluttertoast.showToast(
        msg: 'Something went wrong, double check your username/password',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Text(
          'Welcome back!',
          style: TextStyle(fontSize: 30),
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomFormField(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  validatorRequiredMsg: 'Username is required',
                ),
                const CustomFormField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  validatorRequiredMsg: 'Password is required',
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Column(children: [
                    if (_userFacade.loginState != LoginState.loading)
                      CustomButton(
                        marginTop: 50,
                        label: 'Login',
                        onPressed: _submitForm,
                      ),
                    if (_userFacade.loginState == LoginState.loading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child:
                            CircularProgressIndicator(color: Colors.deepOrange),
                      ),
                  ]),
                )
              ],
            ))
      ]),
    );
  }
}
