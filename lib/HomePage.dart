import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'DialogBox.dart';

class HomePage extends StatefulWidget {

  static String id = 'welcome_screen';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
class _HomePageState extends State<HomePage>
{
  DialogBox dialogBox = new DialogBox();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag:'logo',
                child: Container(
                  child: Image.asset('images/rainbow.png'),
                  height: 200.0,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                },
                decoration: kMessageTextFieldDecoration.copyWith(hintText: 'Enter Your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                },
                decoration: kMessageTextFieldDecoration.copyWith(hintText: 'Enter Your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.pink,
                onPressed: () async {
//                  print(email);
//                  print(password);
                  setState(() {
                    showSpinner=true;
                  });

                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    dialogBox. information(context,"Congratulations! ","your account has been created successfully");
                    setState(() {
                      showSpinner=false;
                    });
                  }
                  catch(e)
                  {
                    dialogBox. information(context,"Error = ",e.toString());
                    print(e);
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
