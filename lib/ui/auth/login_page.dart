import 'package:atrueque/providers/auth/controllers/login_controller_provider.dart';
import 'package:atrueque/providers/auth/states/login_states.dart';
import 'package:atrueque/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginControllerProvider);
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
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            padding: const EdgeInsets.all(0),
            child: SvgPicture.asset(
              'assets/images/sign-up-form.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'INICIA EN ',
                              style: TextStyle(fontSize: 26, color: blackColor),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'TRUEQUE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "REUTILIZA + DESPERDICIA -",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Correo/Usuario',
                        fillColor: primaryColor,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu correo/usuario';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: !showPassword,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu contraseña';
                        }
                        // Puedes agregar más validaciones según tus necesidades
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.go('/password-recovery');
                        },
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          elevation: const MaterialStatePropertyAll(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        child: Text(
                          loginController is LoginStateLoading
                              ? 'INICIANDO SESIÓN...'
                              : 'INICIAR SESIÓN',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (loginController is! LoginStateLoading &&
                              _formKey.currentState?.validate() == true) {
                            ref.read(loginControllerProvider.notifier).login(
                                  emailController.text,
                                  passwordController.text,
                                );
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('¿No tiene cuenta?',
                            style: TextStyle(fontSize: 16)),
                        TextButton(
                          child: const Text(
                            'Crear Cuenta',
                            style: TextStyle(
                              fontSize: 16,
                              color: secondaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
