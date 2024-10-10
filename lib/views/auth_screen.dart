import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/universal_widgets/custom_elevate_btn.dart';
import '../provider/auth_provider.dart';
import '../provider/theme_provider.dart';
import '../universal_widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.getThemeData.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.getThemeData.scaffoldBackgroundColor,
        title: Text(
          "E SHOP",
          style: theme.themeData.textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Column(
                  children: [
                    if (!authProvider.isLogin)
                      CustomTextField(
                        controller: _nameController,
                        labelText: 'Name',
                      ),
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                    ),
                  ],
                ),
                const Spacer(),
                const Spacer(),
                Column(
                  children: [
                    authProvider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomElevateBtn(
                            text: authProvider.isLogin ? 'Login' : 'Sign Up',
                            onPressed: () {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();
                              final name = _nameController.text.trim();

                              if (authProvider.isLogin) {
                                authProvider.signIn(email, password);
                              } else {
                                authProvider.signUp(name, email, password);
                              }
                            },
                          ),
                    TextButton(
                      onPressed: () {
                        if (authProvider.isLogin) {
                          authProvider
                              .changeToSignUp(); // Switch to Sign-Up mode
                        } else {
                          authProvider.changeToLogin(); // Switch to Login mode
                        }
                      },
                      child: Text(
                        authProvider.isLogin
                            ? "New here? Sign up"
                            : "Already have an account? Login",
                        style: theme.themeData.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
