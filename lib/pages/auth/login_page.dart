import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 223,
              width: double.infinity,
              child: Image.asset('assets/images/loginPage.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  _LoginField(),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      'Or, login with ...',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Link(
                        image: 'assets/icons/google.svg',
                        scale: 29,
                      ),
                      Link(
                        image: 'assets/icons/facebook.svg',
                        scale: 20,
                      ),
                      Link(
                        image: 'assets/icons/apple.svg',
                        scale: 35,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                      child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to WannaShop? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Register',
                          style:
                              TextStyle(color: Color.fromRGBO(255, 185, 5, 1)),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _LoginField extends StatefulWidget {
  const _LoginField({Key? key}) : super(key: key);

  @override
  __LoginFieldState createState() => __LoginFieldState();
}

class __LoginFieldState extends State<_LoginField> {
  String _username = '';
  String _password = '';

  void _changeEmail(String username) {
    _username = username;
  }

  void _changePassword(String password) {
    _password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: TextField(
            onChanged: _changeEmail,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: SvgPicture.asset('assets/icons/email.svg'),
              hintText: 'Email ID',
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: TextField(
            onChanged: _changePassword,
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: SvgPicture.asset('assets/icons/password.svg'),
              hintText: 'Password',
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //ApiClient().getToken(username: _username, password: _password);
            //Token().writeToken();
            //Token().readToken();
          },
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(255, 185, 5, 1)),
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              )),
        )
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final String label;
  final String username;
  final String password;
  const LoginButton(
      {Key? key,
      required this.label,
      required this.username,
      required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //ApiClient().getToken();
        print(username);
        print(password);
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(255, 185, 5, 1)),
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}

class Link extends StatelessWidget {
  final double scale;
  final String image;
  const Link({Key? key, required this.scale, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: 80,
        height: 40,
        child: Container(
          color: Colors.transparent,
          width: 25,
          height: 25,
          child: SvgPicture.asset(
            image,
          ),
        ));
  }
}
