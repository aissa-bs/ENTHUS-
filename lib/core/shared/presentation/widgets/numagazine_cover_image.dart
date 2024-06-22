import 'package:fitness/core/shared/domain/entities/magazine3.dart';
import 'package:flutter/material.dart';


class NuMagazineCoverImage extends StatelessWidget {
  const NuMagazineCoverImage({
    required this.magazine,
    super.key,
    this.height,
  });

  final Magazine3 magazine;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: .75,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(magazine.assetImage),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 40,
                offset: Offset(-20, 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
