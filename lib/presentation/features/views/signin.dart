import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realmetatest/presentation/features/views/signup.dart';
import 'package:realmetatest/utils/utils.dart';

import '../../../core/provider/providers.dart';

class MetaUserSignIn extends ConsumerStatefulWidget {
  const MetaUserSignIn({super.key});

  @override
  ConsumerState createState() => _MetaUserSignInState();
}

class _MetaUserSignInState extends ConsumerState<MetaUserSignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle signup
  void _handleSignup() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _passwordController.text;


  }

  Future<void> login(String username, String password) async {
    final database = ref.read(databaseProvider);
    // final loggedInUser = ref.read(loggedInUserProvider);
    final user = await database.getUser(username);
    if (user != null && user['password'] == password) {

    } else {
      // Handle login failure
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = ref.read(databaseProvider);
    var appSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Login", style: TextStyle(
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
                      Center(child: Text('Login'),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: (){
                context.push(MetaUserSignUp());
              },
              child: Text("Dont have an account? SignIn", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),),
            ),
          ],
        ),
      ),
    );
  }
}
