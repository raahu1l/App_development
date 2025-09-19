import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const RegistrationFormUI(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class RegistrationFormUI extends StatefulWidget {
  const RegistrationFormUI({super.key});

  @override
  State<RegistrationFormUI> createState() => RegistrationFormUIState();
}

class RegistrationFormUIState extends State<RegistrationFormUI> {
  String? selectedCountry;
  String gender = 'Male';
  String accountType = 'Personal';
  bool acceptTerms = false;

  final List<String> countries = [
    'India',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'Singapore',
    'France',
    'Japan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2d375a), Color(0xFF736d87)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 0),
              Container(
                height: 53,
                color: const Color(0xFF1d3353),
                alignment: Alignment.center,
                child: const Text(
                  'Registration Form',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(height: 24),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                ),
                value: selectedCountry,
                items: countries
                    .map(
                      (country) => DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      ),
                    )
                    .toList(),
                onChanged: (val) => setState(() => selectedCountry = val),
              ),
              const SizedBox(height: 16),
              buildInputField('First Name'),
              const SizedBox(height: 16),
              buildInputField('Last Name'),
              const SizedBox(height: 16),
              buildInputField('Email'),
              const SizedBox(height: 16),
              buildInputField('Password', isPassword: true),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRadioOption(
                    'Male',
                    gender,
                    (val) => setState(() => gender = val),
                  ),
                  buildRadioOption(
                    'Female',
                    gender,
                    (val) => setState(() => gender = val),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRadioOption(
                    'Personal',
                    accountType,
                    (val) => setState(() => accountType = val),
                  ),
                  buildRadioOption(
                    'Company',
                    accountType,
                    (val) => setState(() => accountType = val),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Checkbox(
                    value: acceptTerms,
                    onChanged: (val) =>
                        setState(() => acceptTerms = val ?? false),
                  ),
                  const Text('I agree to the '),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'terms and conditions',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: acceptTerms ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF27a768),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
      ),
    );
  }

  Widget buildRadioOption(
    String label,
    String groupValue,
    Function(String) onChanged,
  ) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: groupValue,
          onChanged: (val) => onChanged(val ?? ''),
          activeColor: const Color(0xFF233afd),
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
