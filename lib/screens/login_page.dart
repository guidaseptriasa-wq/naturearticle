import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool isLoading = false;
  bool isPasswordVisible = false;

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      await Future.delayed(const Duration(seconds: 2));

      if (email == "admin@test.com" && password == "Admin123") {
        Navigator.pushReplacementNamed(
          context,
          '/dashboard',
          arguments: email,
        );
      } else {
        setState(() => isLoading = false);

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email atau Password salah"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(20),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 80,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image, size: 80),
                      ),
                      const SizedBox(height: 10),

                      const Text(
                        "Nature Article App",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) => email = val,
                        validator: (val) {
                          if (val!.isEmpty) return "Email kosong";
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(val)) {
                            return "Email tidak valid";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible =
                                    !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !isPasswordVisible,
                        onChanged: (val) => password = val,
                        validator: (val) {
                          if (val!.isEmpty) return "Password kosong";
                          if (val.length < 8) return "Min 8 karakter";
                          if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)')
                              .hasMatch(val)) {
                            return "Harus huruf & angka";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: login,
                                child: const Text("Login"),
                              ),
                            ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot');
                        },
                        child: const Text("Lupa Password?"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
