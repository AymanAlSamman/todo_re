import 'package:flutter/material.dart';
import 'package:todo/core/widget/custom_text_field.dart';
import 'package:todo/features/register/register_view.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'Login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffDFECDB),
        image: DecorationImage(
            image: AssetImage(
              'assets/images/login.png',
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: mediaQuery.height * 0.2),
                Text(
                  'Welcome Back!',
                  style:
                      theme.textTheme.titleLarge?.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  'E-mail',
                  style: theme.textTheme.bodySmall,
                ),

                //********** MAIL ***************
                CustomTextField(
                  hint: "Enter your e-mail address",
                  hintColor: Colors.grey.shade400,
                  suffixWidget: const Icon(Icons.email_rounded),
                ),
                const SizedBox(
                  height: 15,
                ),

                //********* PASSWORD ************
                Text(
                  'Password',
                  style: theme.textTheme.bodySmall,
                ),
                CustomTextField(
                  isPassword: true,
                  maxLines: 1,
                  hint: "Enter your password",
                  hintColor: Colors.grey.shade400,
                ),

                //********* Forget Password ************
                const SizedBox(height: 10),
                TextButton(
                    style: TextButton.styleFrom(
                        alignment: const Alignment(-1, 30)),
                    onPressed: () {},
                    child: Text(
                      'Forget password?',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.normal),
                    )),

                //********* LogIn ************
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          'Login',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        const Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      'OR',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.routeName);
                      },
                      child: Text(
                        'Create Account',
                        style: theme.textTheme.bodyMedium,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
