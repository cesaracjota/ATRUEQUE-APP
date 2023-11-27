import 'package:atrueque/providers/auth/controllers/register_controller_provider.dart';
import 'package:atrueque/providers/auth/states/register_states.dart';
import 'package:atrueque/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool showPassword = false;
  bool showPasswordConfirm = false;
  bool isUsernameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isPasswordConfirmedValid = false;
  bool checkboxValue = false;

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final registerController = ref.watch(registerControllerProvider);
    return Scaffold(
      backgroundColor: terciaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'CREA SU CUENTA ',
                              style: TextStyle(
                                fontSize: 26,
                                color: blackColor,
                                fontWeight: FontWeight.normal,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: secondaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'TRUEQUE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Crea tu cuenta fácil y rápido, para empezar a realizar trueques.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        fillColor: primaryColor,
                        labelText: 'Nombre de Usuario',
                        errorText: isUsernameValid
                            ? null
                            : 'Este campo no puede estar vacio',
                      ),
                      onChanged: (value) {
                        setState(() {
                          isUsernameValid = value.isNotEmpty;
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        errorText: isEmailValid
                            ? null
                            : 'Ingrese un correo electrónico válido',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          isEmailValid =
                              value.isNotEmpty && value.contains('@');
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: !showPassword,
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                showPassword = !showPassword;
                              },
                            );
                          },
                        ),
                        labelText: 'Contraseña',
                        errorText: isPasswordValid
                            ? null
                            : 'La contraseña debe tener al menos 6 caracteres',
                      ),
                      onChanged: (value) {
                        setState(() {
                          isPasswordValid = value.length >= 6;
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: !showPasswordConfirm,
                      controller: passwordConfirmController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPasswordConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              showPasswordConfirm = !showPasswordConfirm;
                            });
                          },
                        ),
                        labelText: 'Confirmar Contraseña',
                        errorText: isPasswordConfirmedValid ||
                                passwordConfirmController.text.isEmpty
                            ? null
                            : 'Las contraseñas no coinciden',
                      ),
                      onChanged: (value) {
                        setState(() {
                          isPasswordConfirmedValid =
                              value == passwordController.text;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    CheckboxListTile(
                      title: Container(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'He leído y acepto los ',
                              style: const TextStyle(
                                fontSize: 14,
                                color: blackColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Terminos y Política de Privacidad de Atrueque',
                                  style: const TextStyle(
                                    color: secondaryColor,
                                    fontSize: 14,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/terms');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      value: checkboxValue,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (bool? newValue) {
                        setState(() {
                          checkboxValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 16),
            width: double.infinity,
            height: 75,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(isUsernameValid &&
                        isEmailValid &&
                        isPasswordValid &&
                        isPasswordConfirmedValid &&
                        checkboxValue
                    ? primaryColor
                    : Theme.of(context).disabledColor),
                elevation: const MaterialStatePropertyAll(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              onPressed: isUsernameValid &&
                      isEmailValid &&
                      isPasswordValid &&
                      isPasswordConfirmedValid &&
                      checkboxValue
                  ? () {
                      if (registerController is! RegisterStateLoading &&
                          _formKey.currentState?.validate() == true) {
                        ref.read(registerControllerProvider.notifier).register(
                              emailController.text,
                              passwordController.text,
                              usernameController.text,
                            );
                      }
                    }
                  : null,
              child: Text(
                registerController is RegisterStateLoading
                    ? 'REGISTRANDO USUARIO...'
                    : 'REGISTRARSE',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ), // Deshabilita el botón si las condiciones no son satisfechas
            ),
          ),
        ],
      ),
    );
  }
}
