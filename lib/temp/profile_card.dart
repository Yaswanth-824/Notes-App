import 'package:flutter/material.dart';

void main() {
  runApp(const Profilecard());
}

class Profilecard extends StatelessWidget {
  const Profilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.white, body: _App()),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF2C2C2C),
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
              "Yaswant Chakravarthi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Software Developer",
              style: TextStyle(color: Color(0xFF80CBC4), fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C2C2C),
                  ),
                  child: Text("Flutter", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C2C2C),
                  ),
                  child: Text("Flutter", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C2C2C),
                  ),
                  child: Text("Flutter", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFF2C2C2C)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _statItem(value: "12", label: "project"),
                _statItem(value: "1.5k", label: "stars"),
                _statItem(value: "380", label: "following"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _statItem({required String value, required String label}) {
  return Column(
    children: [
      Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      Text(label),
    ],
  );
}
