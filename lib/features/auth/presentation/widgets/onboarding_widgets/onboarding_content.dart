part of 'widgets_imports.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black,fontFamily: 'cairo'),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 362,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black,fontFamily: 'cairo'),
          ),
        ),
      ],
    );
  }
}
