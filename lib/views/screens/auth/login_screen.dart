import 'package:flutter/material.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:tiktokpractice/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TITLE,
              style: TextStyle(
                fontSize: FONT_SIZE_TITLE,
                color: BUTTON_COLOR,
                fontWeight: FontWeight.w900, //fontの太さを決める
              ),
            ),
            const Text(
              LOGIN,
              style: TextStyle(
                fontSize: FONT_SIZE_MINI,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: _emailController,
                labelText: EMAIL,
                icon: Icons.email,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: _passwordController,
                labelText: PASSWORD,
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                  color: BUTTON_COLOR,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  )),
              child: InkWell(
                onTap: () {
                  AUTH_CONTROLLER.loginUser(
                      _emailController.text, _passwordController.text);
                },
                child: const Center(
                  child: Text(
                    LOGIN,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ASK_HAVE_AN_ACCOUNT,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print(NAVIGATING_USER);
                  },
                  child: Text(
                    REGISTER,
                    style: TextStyle(
                      fontSize: 20,
                      color: BUTTON_COLOR,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
