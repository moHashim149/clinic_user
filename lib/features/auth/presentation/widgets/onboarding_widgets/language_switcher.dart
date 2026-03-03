part of 'widgets_imports.dart';


class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  String _selectedLanguage = 'العربية';

  final List<String> _languages = <String>[
    'العربية',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      initialValue: _selectedLanguage,
      onSelected: (String value) {
        setState(() => _selectedLanguage = value);
        // TODO: Hook up actual locale change when localization is implemented.
      },
      offset: const Offset(0, 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      itemBuilder: (BuildContext context) {
        return _languages
            .map(
              (String lang) => PopupMenuItem<String>(
                value: lang,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.language,
                      size: 15,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      lang,
                      style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'cairo'),
                    ),
                  ],
                ),
              ),
            )
            .toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade300,width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.language,
              size: 15,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              _selectedLanguage,
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'cairo'),
            ),
          ],
        ),
      ),
    );
  }
}
