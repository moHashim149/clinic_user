
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class LoginNumFieldWidget extends StatefulWidget {
  const LoginNumFieldWidget({super.key});

  @override
  State<LoginNumFieldWidget> createState() => _LoginNumFieldWidgetState();
}

class _LoginNumFieldWidgetState extends State<LoginNumFieldWidget> {
  Country? _selectedCountry;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: const ['SA'],
      onSelect: (country) {
        setState(() {
          _selectedCountry = country;
        });
      },
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(16),
        inputDecoration: const InputDecoration(
          labelText: 'ابحث عن الدولة',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String dialCode =
        _selectedCountry != null ? '+${_selectedCountry!.phoneCode}' : '+966';
    final String flagEmoji = _selectedCountry?.flagEmoji ?? '🇸🇦';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "رقم الجوال",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Cairo",
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xFFFAFFFE),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              const SizedBox(width: 8),
              InkWell(
                onTap: _openCountryPicker,
                borderRadius: BorderRadius.circular(14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Text(
                        flagEmoji,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        dialCode,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              VerticalDivider(
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 12,
                endIndent: 12,
              ),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    hintText: "05 *** ****",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}