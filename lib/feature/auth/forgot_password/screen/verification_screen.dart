import 'package:flutter/material.dart';
import 'package:ai_lingo/core/routing/app_routes.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const Text(
                ' Verification Code ',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Please enter the 4-digit code sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Color(0xFF304A73)),
              ),
              const SizedBox(height: 8.0),
              const Text(
                " example@email.com ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Color(0xFF304A73),
                    fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: TextField(
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index + 1]);
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index - 1]);
                        }
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),

              ),
              const SizedBox(height:24.0),
              Text(
                'Didn\'t receive the code?',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Color(0xFF304A73),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '(00:45)',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Color.fromARGB(255, 223, 48, 156),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.newPasswordScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100.0,
                      vertical: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
