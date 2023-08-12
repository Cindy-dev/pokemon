import 'package:flutter/material.dart';
import 'package:pokemon/authentication/presentation/utils/email_validator_helper.dart';
import 'package:pokemon/utils/app_extension.dart';
import 'package:pokemon/utils/pokemon_button.dart';
import 'package:pokemon/utils/pokemon_routes.dart';
import 'package:pokemon/utils/pokemon_snackbar.dart';
import 'package:pokemon/utils/pokemon_textfield.dart';
import 'package:pokemon/utils/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool showSuffix = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: context.deviceHeight() / 10),
                child: Image.asset("assets/images/pokemon.png"),
              ),
              const Text(
                "Login",
                style: AppTextStyles.displayLarge,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    PokemonTextField(
                      isEmail: true,
                      suffixIcon: showSuffix
                          ? Icon(
                              Icons.check,
                              color: context.themeData.cardColor,
                            )
                          : const Text(""),
                      fieldColor: context.themeData.cardColor,
                      controller: _emailController,
                      hintText: "input your email",
                      labelText: "Email",
                      validate: (val) {
                        return emailValidator(val);
                      },
                      onChanged: (val) {
                        final regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (regex.hasMatch(val!)) {
                          setState(
                            () {
                              showSuffix = true;
                            },
                          );
                        } else {
                          setState(
                            () {
                              showSuffix = false;
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PokemonTextField(
                        fieldColor: context.themeData.cardColor,
                        controller: _passwordController,
                        hintText: "input your password",
                        labelText: "Password"),
                  ],
                ),
              ),
              PokemonButton(
                buttonTap: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  if (_emailController.text.contains("@") &&
                      _passwordController.text.length > 3) {
                    Navigator.pushReplacementNamed(
                        context, PokemonRoutes.pokemonHomeScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      pokemonSnackBar(
                          error:
                              "Email should contain @ and Password should be more than 3 alphabet",
                          context: context),
                    );
                  }
                },
                buttonText: "Login",
                buttonColor: context.colors.yellow,
              ),
              SizedBox(
                height: context.deviceHeight() / 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
