import 'package:flutter/material.dart';
import 'package:todo/core/widget/custom_text_field.dart';
import 'package:todo/features/register/register_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'Login';
  var formKey = GlobalKey<FormState>();
  var mailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context);
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            lang!.login,
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.2),
                  Text(
                    lang.welcome,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    lang.email,
                    style: theme.textTheme.bodySmall,
                  ),

                  //********** MAIL ***************
                  CustomTextField(
                    controller: mailController,
                    hint: lang.enterM,
                    hintColor: Colors.grey.shade400,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return lang.mailError;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //********* PASSWORD ************
                  Text(
                    lang.password,
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return lang.passwordError;
                      }
                      return null;
                    },
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: lang.enterP,
                    hintColor: Colors.grey.shade400,
                  ),

                  //********* Forget Password ************
                  const SizedBox(height: 10),
                  TextButton(
                      style: TextButton.styleFrom(
                          alignment: const Alignment(-1, 30)),
                      onPressed: () {},
                      child: Text(
                        lang.forget,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.normal),
                      )),

                  //********* LogIn ************
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            lang.login,
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
                        lang.or,
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
                          lang.create,
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
      ),
    );
  }
}
