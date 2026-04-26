import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool isLoading = false;

  void send() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      await Future.delayed(const Duration(seconds: 2));

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Link dikirim ke $email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lupa Password")),
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
                      const Icon(Icons.lock_reset,
                          size: 70, color: Colors.green),

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

                      const SizedBox(height: 20),

                      isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: send,
                                child:
                                    const Text("Kirim Link Reset"),
                              ),
                            ),

                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Kembali ke Login"),
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
