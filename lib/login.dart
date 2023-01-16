import 'package:flutter/material.dart';
import 'package:firedart/firedart.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String? _email = "";
  String? _password = "";
  String _error = "";
  bool LoadingData = false;

  // TextEditingController emailcontrol
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  login() async {
    try {
      setState(() {
        LoadingData = true;
      });

      await FirebaseAuth.instance.signIn(_email!, _password!);
      var user = await FirebaseAuth.instance.getUser();
      if (user.email!.isNotEmpty) {
          print("pass");
        Navigator.pushNamed(context, 'home');
      }
      else{
        setState(() {
          _error = "Could not login";
          print("error");
        });
      }
    } catch (e) {
      setState(() {
        _error = "$e";
        LoadingData = false;
      });
    }
  }

  final CollectionReference users = Firestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    Future<void> _save() async {
      _formkey.currentState!.save();
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome to \nnavIST',
                style: TextStyle(
                    color: Colors.white, fontSize: 43, fontFamily: 'Mike'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _error.isNotEmpty? Center(child: Text(_error,style: TextStyle(color: Colors.red),),):Container(),
                    SizedBox(height: 20,),
                  
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Email is required';
                                }
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                }
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              style: const TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        _save();
                                        await login();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ElevatedButton(onPressed: () async{
                                //   await users.add({'Email' :'mohammadkumail195@gmail.com', 'Password': '12345'}).then((value) => print('User Added'));
                                //
                                // },
                                //   child:
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                ),

                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.account_box,
                                    size: 17,
                                  ),
                                  label: Text('Guest Mode'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
