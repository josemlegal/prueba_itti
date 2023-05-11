import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prueba_itti/presentation/controllers/login_view_controller.dart';

// ignore: must_be_immutable
class LoginView extends HookConsumerWidget {
  static const name = 'login-view';

  TextEditingController controller = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(loginViewControllerProvider);
    final keyForm = GlobalKey<FormState>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: FadeIn(
        duration: const Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  width: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo-itti.png'),
                    ),
                  ),
                ),
                _UsernameInput(loginController: loginController),
                _PasswordInput(loginController: loginController),
                const SizedBox(
                  height: 30,
                ),
                _SubmitButton(colors: colors, keyForm: keyForm)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    required this.loginController,
  });

  final LoginViewController loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\d'))],
      validator: loginController.textInputEmptyValidator,
      decoration: const InputDecoration(
        labelText: 'Username',
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    required this.loginController,
  });

  final LoginViewController loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
      ],
      validator: loginController.textInputEmptyValidator,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.colors,
    required this.keyForm,
  });

  final ColorScheme colors;
  final GlobalKey<FormState> keyForm;

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: SizedBox(
        width: double.infinity,
        child: FloatingActionButton.extended(
          backgroundColor: colors.primary,
          label: Text('Login',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.white70, fontWeight: FontWeight.w900)),
          onPressed: () {
            if (keyForm.currentState!.validate()) {
              context.pushReplacement(
                '/',
              );
            }
          },
        ),
      ),
    );
  }
}
