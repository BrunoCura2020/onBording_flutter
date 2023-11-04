import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 300),
                const SizedBox(height: 15.0),
                _formIniciarSesion(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _formIniciarSesion() {
  // creates a group
  final form = fb.group({
    'email': ['', Validators.required, Validators.email],
    'password': Validators.required,
  });

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: ReactiveForm(
      formGroup: form, 
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'email',
             validationMessages: {
              ValidationMessage.required: (error) => 'El correo es obligatorio.',
              ValidationMessage.email: (error) => 'El correo es invalido.',
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Correo electrónico',
              labelText: 'Correo electrónico'
            ),
          ),

          const SizedBox( height: 30),

          ReactiveTextField(
            formControlName: 'password',
             validationMessages: {
              ValidationMessage.required: (error) => 'La contraseña es obligatorio.',
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Contraseña',
              labelText: 'Contraseña'
            ),
            obscureText: true,
          ),

          const SizedBox( height: 25),

          ReactiveFormConsumer(
            builder: (context, form, child) {
            return OutlinedButton(
              onPressed: form.invalid ? null : () {
                context.push('/');
              },
              child: const Text('Iniciar sesión'),
            );
          },
          )
        ],
      )
    ),
  );
}