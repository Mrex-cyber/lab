import 'package:flutter/material.dart';

class HeroPhoto extends StatelessWidget {
  const HeroPhoto({
    super.key,
    required this.assetPath,
    required this.maxWidth,
    required this.maxHeight,
    this.aspectRatio = 316 / 408,
    this.borderRadius = 24,
    this.fit = BoxFit.cover,
  });

  final String assetPath;
  final double maxWidth;
  final double maxHeight;
  final double aspectRatio;
  final double borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            assetPath,
            fit: fit,
            width: double.infinity,
            height: double.infinity,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}
