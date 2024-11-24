import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streamt/view/movie/mainpage.dart'; // Ensure this import is correct and points to the right file
import 'package:fluttertoast/fluttertoast.dart';
import 'package:streamt/view/movie/screens.dart/home.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      User? user = await _auth.signUpWithEmailAndPassword(email, password); // Updated to correct method name

      setState(() {
        _isLoading = false; // Hide loading indicator
      });

      if (user != null) {
        // Navigate to Main Page after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()), // Ensure MainPage class is correctly imported
        );
      } else {
        // Show error message
        _showErrorDialog(context, 'Registration Failed', 'Please try again.');
      }
    } else {
      _showErrorDialog(context, 'Input Error', 'All fields are required.');
    }
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/netfliximage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.centerLeft,
            colors: [
              Colors.black12,
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "S",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "TREAMIT",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Welcome!',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email Id',
                            prefixIcon: const Icon(Icons.email),
                            hintStyle: const TextStyle(color: Colors.white),
                            border: const OutlineInputBorder(),
                            focusColor: Colors.red,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            hintStyle: const TextStyle(color: Colors.white),
                            border: const OutlineInputBorder(),
                            focusColor: Colors.red,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        if (_isLoading) // Show loading indicator
                          const CircularProgressIndicator()
                        else
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: _register,
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "CREATE",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuthService() {
    // Set the default language code for Firebase authentication (Optional)
    _auth.setLanguageCode('en'); // Set this to the locale you want (e.g., 'en', 'fr', 'es')
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _showToast("Register successful!",);
      return credential.user;
    } catch (e) {
      print("Error signing up: $e");
      _showToast("Error signing up: $e");
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
        
      );
      
      _showToast("Login successful!");
      return credential.user;
    } catch (e) {
      print('Error logging in: $e');
      _showToast("Error logging in: $e");
      return null;
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}
