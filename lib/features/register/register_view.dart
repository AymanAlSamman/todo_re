import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/features/login/login_view.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/settings_provider.dart';

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
    var lang = AppLocalizations.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: vm.isDark() ? const Color(0xff060E1E) : const Color(0xffDFECDB),
        image: const DecorationImage(
            image: AssetImage(
              'assets/images/login.png',
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            lang!.create,
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
                    lang.full,
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: fullNameController,
                    hint: lang.enterF,
                    hintColor: Colors.grey,
                    suffixWidget: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return lang.nameError;
                      }
                      return null;
                    },
                  ),

                  // ********** E-mail ***********
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    lang.email,
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hint: lang.enterM,
                    hintColor: Colors.grey,
                    suffixWidget: const Icon(
                      Icons.email_rounded,
                      color: Colors.grey,
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return lang.mailError;
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
                    lang.password,
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: lang.enterP,
                    hintColor: Colors.grey,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return lang.passwordError;
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
                    lang.confirm,
                    style: theme.textTheme.bodySmall,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: lang.enterP,
                    hintColor: Colors.grey,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return lang.enterP;
                      }
                      if (value != passwordController.text) {
                        return lang.confirmError;
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
                        FirebaseUtils()
                            .createUserAccount(
                                emailController.text, passwordController.text)
                            .then((value) {
                          if (value) {
                            EasyLoading.dismiss();
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginView.routeName, (route) => false);
                          }
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            lang.create,
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
