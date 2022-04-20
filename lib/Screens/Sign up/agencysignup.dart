import 'package:flutter/material.dart';
import 'package:xy2/PassConf.dart';

class AgSignUp extends StatefulWidget {
  const AgSignUp({Key? key}) : super(key: key);

  @override
  State<AgSignUp> createState() => _AgSignUpState();
}

class _AgSignUpState extends State<AgSignUp> {
  Padding formf(String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Sign Up'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFFe9b7ce),
              Color(0xFFffb88e),
              Color(0xFFabc9e9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Create your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    formf('Company Name'),
                    formf('Email'),
                    formf('Phone'),
                    formf('Registration Number'),
                    PassWord(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign up'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[300],
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
