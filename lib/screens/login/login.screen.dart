import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/common/interfaces/auth/auth.interface.dart';
import 'package:todo_flutter/common/widgets/button/button.widget.dart';

import '../../common/providers/user/facades/user.facade.dart';
import '../../common/providers/user/services/user-api.service.dart';

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

      // if (_userFacade.loadingState != LoadingState.success) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const Placeholder()),
      //   );
      // } else if (_userFacade.loadingState == LoadingState.success) {
      //   Fluttertoast.showToast(
      //     msg: 'Something went wrong, double check your username/password',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //   );
      // }
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.orange,
                      ),
                      hintText: 'Enter username',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange), // Unfocused color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.orange,
                    ),
                    hintText: 'Enter password',
                    hintStyle: TextStyle(color: Colors.black26),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orange), // Unfocused color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Column(children: [
                    if (_userFacade.loadingState != LoadingState.loading)
                      CustomButton(
                        marginTop: 50,
                        label: 'Login',
                        onPressed: _submitForm,
                      ),
                    if (_userFacade.loadingState == LoadingState.loading)
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
