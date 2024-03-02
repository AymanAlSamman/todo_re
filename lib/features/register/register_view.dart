import 'package:flutter/material.dart';
import 'package:todo/core/widget/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = 'Register';
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  RegisterView({super.key});

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
            'Create Account',
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.2),

                  // ********** First Name ***********
                  Text(
                    'First name',
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: fullNameController,
                    hint: 'Enter your name',
                    hintColor: Colors.grey,
                    suffixWidget: const Icon(Icons.person),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'You must enter your name';
                      }
                      return null;
                    },
                  ),

                  // ********** E-mail ***********
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'E-mail',
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Enter your e-mail address',
                    hintColor: Colors.grey,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'You must enter your e-mail address';
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return 'Invalid E-mail';
                      }
                      return null;
                    },
                  ),

                  // ********** Password ***********
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Password',
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: 'Enter your password',
                    hintColor: Colors.grey,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'You must enter password';
                      }
                      var rexEx = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (!rexEx.hasMatch(value)) {
                        return 'The password must contain: \n* Minimum 1 Upper case\n* Minimum 1 lowercase\n* Minimum 1 Numeric Number\n* Minimum 1 Special Character\n* Minimum 8 letters';
                      }
                      return null;
                    },
                  ),

                  // ********** Confirm Password ***********
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Confirm password',
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: 'Enter your password',
                    hintColor: Colors.grey,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'You must enter password';
                      }
                      if (value != passwordController.text) {
                        return 'Password not matched!';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Validate');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            'Create Account',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}