// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code
// rgba(16,162,126,255)

import 'package:chatgptclone/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 64),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: width * 0.6,
              child: Image(image: AssetImage('assets/ChatGPT.png')),
            ),
          ),
          Container(
            height: height * 0.3,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: Size(width * 0.9, height * 0.07)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_mobiledata, size: 55),
                      Text(
                        'Sign up with Google',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp1()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: Size(width * 0.9, height * 0.07)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, size: 35),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign up with Email',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.black, width: 3)),
                      fixedSize: Size(width * 0.9, height * 0.07)),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  TextEditingController mailID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                      'assets/1681038325chatgpt-logo-transparent.png'),
                  width: width * 0.1,
                ),
              ),
              SizedBox(height: height * 0.1),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.6,
                      child: Text(
                        'Create your\naccount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 2),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Note that phone verification maybe\nrequired for signup. Your number will only\nbe used to verify your identity for security\npurposes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.04,
                          height: 1.2,
                          letterSpacing: 0.8),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: width * 0.8,
                        height: height * 0.09,
                        child: TextField(
                          controller: mailID,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email address",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 16, 162, 126),
                                fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 162, 126),
                                    width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 162, 126),
                                    width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 162, 126),
                                    width: 2)),
                          ),
                        )),
                    SizedBox(height: height * 0.009),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.8, height * 0.075),
                            backgroundColor: Color.fromARGB(255, 16, 162, 126),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          String mail = mailID.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      SignUp2(mailId: mail))));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        )),
                    SizedBox(height: 15),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      TextSpan(
                          text: "log in",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 16, 162, 126)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Login1())));
                            })
                    ])),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Terms of use",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
                TextSpan(
                    text: "  |  ",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                TextSpan(
                    text: "Privacy policy",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SignUp2 extends StatefulWidget {
  String mailId;
  SignUp2({super.key, required this.mailId});
  // const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  @override
  Widget build(BuildContext context) {
    String mailID = widget.mailId;
    bool passwordVisible = true;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                      'assets/1681038325chatgpt-logo-transparent.png'),
                  width: width * 0.1,
                ),
              ),
              SizedBox(height: height * 0.1),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.6,
                      child: Text(
                        'Create your\naccount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 2),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Note that phone verification maybe\nrequired for signup. Your number will only\nbe used to verify your identity for security\npurposes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.04,
                          height: 1.2,
                          letterSpacing: 0.8),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: width * 0.8,
                      height: height * 0.065,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 1.5),
                            bottom: BorderSide(color: Colors.black, width: 1.5),
                            left: BorderSide(color: Colors.black, width: 1.5),
                            right: BorderSide(color: Colors.black, width: 1.5),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mailID,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => SignUp1())));
                              },
                              child: Text("Edit",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      fontSize: 19)))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: width * 0.8,
                        height: height * 0.09,
                        child: TextField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 16, 162, 126),
                                  fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      width: 2)),
                              suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    passwordVisible = false;
                                  })),
                        )),
                    SizedBox(height: height * 0.009),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.8, height * 0.075),
                            backgroundColor: Color.fromARGB(255, 16, 162, 126),
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        )),
                    SizedBox(height: 15),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: Colors.black)),
                      TextSpan(
                          text: "log in",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: Color.fromARGB(255, 16, 162, 126)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Login1())));
                            })
                    ])),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Terms of use",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
                TextSpan(
                    text: "  |  ",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                TextSpan(
                    text: "Privacy policy",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  TextEditingController mailID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                      'assets/1681038325chatgpt-logo-transparent.png'),
                  width: width * 0.1,
                ),
              ),
              SizedBox(height: height * 0.2),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.6,
                      child: Text(
                        'Welcome back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: width * 0.8,
                        height: height * 0.09,
                        child: TextField(
                          controller: mailID,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email address",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 16, 162, 126),
                                fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 162, 126),
                                    width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 162, 126),
                                    width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 162, 126),
                                    width: 2)),
                          ),
                        )),
                    SizedBox(height: height * 0.009),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.8, height * 0.075),
                            backgroundColor: Color.fromARGB(255, 16, 162, 126),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          String mail = mailID.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Login2(mailId: mail))));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        )),
                    SizedBox(height: 15),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              letterSpacing: 1)),
                      TextSpan(
                          text: " Sign up",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 16, 162, 126),
                              letterSpacing: 1),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => SignUp1())));
                            })
                    ])),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Terms of use",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
                TextSpan(
                    text: "  |  ",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                TextSpan(
                    text: "Privacy policy",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

class Login2 extends StatefulWidget {
  final String mailId;
  const Login2({super.key, required this.mailId});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    String mailID = widget.mailId;
    bool passwordVisible = true;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                      'assets/1681038325chatgpt-logo-transparent.png'),
                  width: width * 0.1,
                ),
              ),
              SizedBox(height: height * 0.1),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.6,
                      child: Text(
                        'Enter your\npassword',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 2),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width * 0.8,
                      height: height * 0.09,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 1.5),
                            bottom: BorderSide(color: Colors.black, width: 1.5),
                            left: BorderSide(color: Colors.black, width: 1.5),
                            right: BorderSide(color: Colors.black, width: 1.5),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mailID,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Login1())));
                              },
                              child: Text("Edit",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      fontSize: 19)))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: width * 0.8,
                        height: height * 0.09,
                        child: TextField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 16, 162, 126),
                                  fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 162, 126),
                                      width: 2)),
                              suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    passwordVisible = false;
                                  })),
                        )),
                    SizedBox(height: height * 0.009),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.8, height * 0.075),
                            backgroundColor: Color.fromARGB(255, 16, 162, 126),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomePage())));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        )),
                    SizedBox(height: 15),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: Colors.black)),
                      TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: Color.fromARGB(255, 16, 162, 126)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => SignUp1())));
                            })
                    ])),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Terms of use",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
                TextSpan(
                    text: "  |  ",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                TextSpan(
                    text: "Privacy policy",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 16, 162, 126))),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
