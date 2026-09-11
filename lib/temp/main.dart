import 'package:flutter/material.dart';

void main() {
  runApp(LoginUI());
}

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController email = TextEditingController();
  bool _checkBox = false;
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF3D3D3D),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: BoxBorder.all(
                color: Color(0xFF2D2D2D),
                style: BorderStyle.solid,
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Log in to Dashboard",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                const SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _checkBox,
                      onChanged: (value) => {
                        setState(() {
                          _checkBox = value!;
                        }),
                      },
                    ),
                    Text("Remember me", style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF26A69A),
                    minimumSize: Size(double.infinity, 48),
                  ),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
