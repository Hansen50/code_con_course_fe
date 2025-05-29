import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/extensions/build_context_extension.dart';
import 'package:code_con_course_fe/presentation/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CodeConAppBar extends ConsumerWidget {
  const CodeConAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: primaryColor,
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: context.contentWidth - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('Code Con'),
                  InkWell(
                    onTap: () {
                      ref.watch(routerProvider).goNamed('home');
                    },
                    child: SizedBox(
                      height: 25,
                      width: 65,
                      child: SvgPicture.asset(
                        'svgs/codecon.svg',
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          ref.watch(routerProvider).goNamed('register');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBoxWidth20,
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Contact',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
