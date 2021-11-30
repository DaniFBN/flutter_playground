import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_training/app/modules/login/login_store.dart';

import 'package:flutter_triple/flutter_triple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController.fromValue(
    const TextEditingValue(text: 'dev@dev.com'),
  );
  final _passwordController = TextEditingController.fromValue(
    const TextEditingValue(text: '12345678'),
  );

  final Map<String, String> _formData = {};

  String? _emailValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        !value.contains('@') ||
        !value.contains('.')) {
      return 'Email inválido';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Senha inválida';
    }
    return null;
  }

  Future<void> _saveForm() async {
    final formIsValid = _formKey.currentState!.validate();
    if (!formIsValid) return;

    _formKey.currentState!.save();

    await store.loginWithEmail(
      _formData['email'] as String,
      _formData['password'] as String,
    );

    unawaited(Modular.to.pushReplacementNamed('/home/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: _emailValidator,
                  onSaved: (value) => _formData['email'] = value as String,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: _passwordValidator,
                  onSaved: (value) => _formData['password'] = value as String,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Senha'),
                ),
                ScopedBuilder(
                  store: store,
                  onLoading: (_) => const CircularProgressIndicator(),
                  onState: (_, __) {
                    return ElevatedButton(
                      onPressed: _saveForm,
                      child: const Text('Entrar'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
