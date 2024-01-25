import 'package:chat_task/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  final _formkey = GlobalKey<FormState>();

  TextEditingController usermailcontroller = TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Письмо для сброса пароля отправлено",
        style: TextStyle(fontSize: 18.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Для этого электронного письма не найден ни один пользователь.",
          style: TextStyle(fontSize: 18.0),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Восстановление пароля",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                )),
                Center(
                    child: Text(
                  "Введите свою почту",
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 20.0),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Почта",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: usermailcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Пожалуйста, введите адрес электронной почты';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                      color: Colors.cyan,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = usermailcontroller.text;
                                  });
                                  resetPassword();
                                }
                              },
                              child: Center(
                                child: SizedBox(
                                  width: 130,
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Отправить электронное письмо",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "У вас нет учетной записи?",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        " Войти!",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
