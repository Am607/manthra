import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:manthra/view/homaPage.dart';
import 'package:manthra/view/signup.dart';
import 'package:manthra/view/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/firbaseAuth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String selected = "Supper Admin";
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    print('building');

    signup(){
            if (_formKey.currentState!.validate()) {
                      AuthService()
                          .signIn(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) async {
                        if (value == 'Signin success') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageView()));
                        }
                      });
                    }
    }

    // print(selected);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                45.height,
                Text(
                  'M',
                  style: TextStyle(fontSize: 200, fontWeight: FontWeight.bold),
                ),
                20.height,
                AppTextField(
                  controller: _emailController,
                  textFieldType: TextFieldType.EMAIL,
                  decoration: textInputStyle(context: context, label: 'Email'),
                ),
                12.height,
                AppTextField(
                  controller: _passwordController,
                  textFieldType: TextFieldType.PASSWORD,
                  decoration:
                      textInputStyle(context: context, label: 'Password'),
                  isPassword: true,
                ),
                Align(
                  child: InkWell(
                    onTap: () {},
                    child: Text('Forget Password?',
                        style: TextStyle(color: Colors.blue)),
                  ),
                  alignment: Alignment.centerRight,
                ),
                12.height,
                AppBigButton(
                  name: 'Login',
                  onPressed: () {
                    signup();
                  },
                ),
                Align(
                  child: InkWell(
                    onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ));
                    },
                    child:
                        Text('Signup?', style: TextStyle(color: Colors.blue)),
                  ),
                  alignment: Alignment.centerRight,
                ),
                12.height,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     item('Supper Admin'),
                //     item('Company Login'),
                //     item('User Login'),
                //   ],
                // )
              ],
            ),
          )),
    ));
  }

  item(
    String name,
  ) {
    return InkWell(
      onTap: () {
        selected = '$name';
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected == name ? appPrimaryColor : Colors.grey[500],
        ),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(
                color: selected == name ? Colors.white : Colors.black,
                fontSize: 13),
          ),
        ),
      ),
    );
  }
}
