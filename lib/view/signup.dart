
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manthra/controller/firbaseAuth.dart';
import 'package:manthra/model/userModel.dart';
import 'package:manthra/view/homaPage.dart';
import 'package:manthra/view/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController conformPassCont = TextEditingController();
  var uuid = Uuid();
  bool isWorking = true;

  @override
  void dispose() {
  
    super.dispose();
    emailCont.dispose();
    passwordCont.dispose();
    userNameCont.dispose();
    conformPassCont.dispose();
    // _formKey.currentState!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    

    void _onSubmit() async {
      bool isvalid = _formKey.currentState!.validate();

      if (!isvalid) {
        return;
      }
    if (!mounted) return;
      setState(() {
        isWorking = false;
      });

      await AuthService()
          .signUp(email: emailCont.text, password: passwordCont.text)
          .then(
        (value) {
    
          return Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePageView()));
        },
      );

      isWorking = true;
       if (!mounted) return;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CRM GO'),
        backgroundColor: appPrimaryColor,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  24.height,
                  AppTextField(
                    controller: userNameCont,
                    textFieldType: TextFieldType.NAME,
                    decoration: textInputStyle(
                        context: context, label: 'Enter Your Name'),
                    isPassword: true,
                  ),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailCont,
                    decoration: textInputStyle(
                        context: context, label: 'Enter Your Email'),
                    isPassword: true,
                  ),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    controller: passwordCont,
                    decoration: textInputStyle(
                        context: context, label: 'Enter Your Password'),
                    isPassword: true,
                  ),
                  16.height,
                  AppTextField(
                    controller: conformPassCont,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: textInputStyle(
                        context: context, label: 'Confirm Password'),
                    isPassword: true,
                    validator: (value) {
                      if (value != passwordCont.text) {
                        return 'Password not match';
                      }
                    },
                  ),
                  16.height,
                  AppBigButton(
                      name: 'Signup',
                      onPressed: isWorking
                          ? () {
                              _onSubmit();
                            }
                          : () {
                              print('called Here');
                            }),
                  Align(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text('Login?', style: TextStyle(color: Colors.blue)),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
