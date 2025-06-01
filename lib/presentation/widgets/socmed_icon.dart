import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Socmeds {
  facebook('assets/svgs/facebook.svg'),
  instagram('assets/svgs/instagram.svg'),
  x('assets/svgs/x.svg'),
  threads('assets/svgs/threads.svg'),
  telegram('assets/svgs/telegram.svg');

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
