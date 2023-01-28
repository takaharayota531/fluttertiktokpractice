import 'package:flutter/material.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:tiktokpractice/controllers/auth_controller.dart';
import 'package:tiktokpractice/views/screens/auth/login_screen.dart';
import 'package:tiktokpractice/views/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
              REGISTER,
              style: TextStyle(
                fontSize: FONT_SIZE_MINI,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 25),
            const SizedBox(height: 15),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(NETWORK_IMAGE),
                  backgroundColor: BACKGROUND_COLOR,
                ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        AUTH_CONTROLLER.pickImage();
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ))
              ],
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: _usernameController,
                labelText: USERNAME,
                icon: Icons.person,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: _emailController,
                labelText: EMAIL,
                icon: Icons.email,
              ),
            ),
            const SizedBox(height: 15),
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
                  AUTH_CONTROLLER.registerUser(
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      image: AUTH_CONTROLLER.ProfilePhoto);
                },
                child: const Center(
                  child: Text(
                    REGISTER,
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
                  ALREADY_HAVE_AN_ACCOUNT,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print(NAVIGATING_USER);
                  },
                  child: Text(
                    LOGIN,
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
