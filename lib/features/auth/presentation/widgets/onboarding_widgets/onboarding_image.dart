part of 'widgets_imports.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const OnboardingImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/Vector.png',
          fit: BoxFit.contain,
        ),
        Transform.scale(
          scale: 0.85,
          alignment: Alignment.center,
          child: Image.asset(
            imagePath,
            width: width ?? 206,
            height: height ?? 356,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
