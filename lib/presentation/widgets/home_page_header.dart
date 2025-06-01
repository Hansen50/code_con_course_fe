import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/extensions/build_context_extension.dart';
import 'package:code_con_course_fe/presentation/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageHeader extends ConsumerWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 340,
          color: primaryColor,
        ),
        Center(
          child: Wrap(
            children: headerElements(context, ref),
          ),
        )
      ],
    );
  }

  List<Widget> headerElements(BuildContext context, WidgetRef ref) {
    double elementWidth = context.windowsSize == WindowsSizes.compact
        ? context.contentWidth
        : context.contentWidth / 2;
    return [
      SizedBox(
          width: elementWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventDate(),
                ...tagLine(),
                // Text('Tag line', style: TextStyle(color: Colors.white)),
                sizedBoxHeight20,
                eventLocation(width: elementWidth),
                eventPrice(),
                sizedBoxHeight30,
                registerButton(ref),
                sizedBoxHeight40
              ],
            ),
          )),
      headerPicture(
        width: elementWidth,
      ),
    ];
  }

  Widget registerButton(WidgetRef ref) => ElevatedButton(
      onPressed: () {
        ref.watch(routerProvider).goNamed('register');
      },
      style:
          ButtonStyle(backgroundColor: WidgetStatePropertyAll(secondaryColor)),
      child: const Text('Register Now', style: TextStyle(color: Colors.white)));

  Widget eventPrice() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(MdiIcons.ticketConfirmation, color: Colors.white, size: 18),
          sizedBoxWidth5,
          const Text('IDR 750.000', style: TextStyle(color: Colors.white)),
        ],
      );

  Widget eventLocation({required double width}) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(MdiIcons.mapMarkerRadius, color: Colors.white, size: 18),
          sizedBoxWidth5, //jarak
          SizedBox(
            width: width - 65,
            child: const Text('International Bali Resort, Bali Indonesia',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      );

  List<Widget> tagLine() => [
        const Text('The Ultimate',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30)),
        const Text('Event for Developers',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30)),
      ];

  Widget eventDate() => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.white,
            size: 18,
          ),
          sizedBoxWidth5,
          Text(
            'August 8 - 9, 2004',
            style: TextStyle(color: Colors.white),
          )
        ],
      );

  Widget headerPicture({required double width}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        height: 390,
        child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/pngs/header_bg.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10))),
      );
}
