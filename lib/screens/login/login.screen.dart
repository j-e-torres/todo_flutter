import 'package:flutter/material.dart';
import 'package:todo_flutter/common/widgets/button/button.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      // For example, you can perform login logic here
      String username = _usernameController.text;
      String password = _passwordController.text;
      // Perform login with username and password
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
                CustomButton(
                  marginTop: 50,
                  label: 'Login',
                  onPressed: () => {print('logged in')},
                ),
              ],
            ))
      ]),
    );
  }
}
