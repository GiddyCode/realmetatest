import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MetaUserSignUp extends ConsumerStatefulWidget {
  const MetaUserSignUp({super.key});

  @override
  ConsumerState createState() => _MetaUserSignUpState();
}

class _MetaUserSignUpState extends ConsumerState<MetaUserSignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle signup
  void _handleSignup() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Sign Up", style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold

              ),),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child:
              TextField(
                controller: _fullname,
                decoration: InputDecoration(
                  labelText: 'FullName',
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 16.0),Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child:
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextField(
                controller: _confirmPass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleSignup,
              child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: Text('Sign Up'),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
