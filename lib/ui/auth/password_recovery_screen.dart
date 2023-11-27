import 'package:atrueque/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryScreen extends ConsumerStatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PasswordRecoveryScreen> createState() =>
      _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState
    extends ConsumerState<PasswordRecoveryScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        surfaceTintColor: primaryColor,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(0),
            child: SvgPicture.asset(
              'assets/images/password_recovery.svg', // Reemplaza con tu imagen
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Restablecer tu contraseña',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electrónico',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(0),
                    child: ElevatedButton(
                      child: const Text('Restablecer Contraseña',
                          style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        // Lógica para enviar correo de recuperación
                      },
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(0),
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       context.go('/');
                  //     },
                  //     child: const Text(
                  //       'Volver a Iniciar Sesión',
                  //       strutStyle: StrutStyle.disabled,
                  //       style: TextStyle(
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
