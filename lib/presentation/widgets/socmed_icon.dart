import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Socmeds {
  facebook('svgs/facebook.svg'),
  instagram('svgs/instagram.svg'),
  x('svgs/x.svg'),
  threads('svgs/threads.svg'),
  telegram('svgs/telegram.svg');

  final String path;

  const Socmeds(this.path);
}

class SocmedIcon extends StatelessWidget {
  final Socmeds platform;
  final double size;
  final VoidCallback? onTap;

  const SocmedIcon(
      {super.key, required this.platform, this.size = 25, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: SvgPicture.asset(
          platform.path,
          height: size,
          width: size,
        ),
      ),
    );
  }
}
