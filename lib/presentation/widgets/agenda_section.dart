import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/extensions/build_context_extension.dart';
import 'package:code_con_course_fe/presentation/providers/agenda_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgendaSection extends ConsumerWidget {
  const AgendaSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double textWidth = context.windowsSize == WindowsSizes.compact
        ? context.contentWidth - 40
        : context.contentWidth / 2 - 40;

    MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet(
      h2: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      h3: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      em: const TextStyle(
          color: secondaryColor,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal),
      p: TextStyle(color: Colors.green[800]),
    );
    return Column(
      children: [
        const Center(
          child: Text(
            'Our Agenda',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        sizedBoxHeight20,
        Center(
          child: SizedBox(
            width: context.contentWidth - 40, //jarak kiri kanan
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                SizedBox(
                  width: textWidth,
                  child: MarkdownBody(
                    data: ref.watch(agendaProvider()),
                    styleSheet: markdownStyleSheet,
                  ),
                ),
                SizedBox(
                  width: textWidth,
                  child: MarkdownBody(
                    data: ref.watch(agendaProvider(day: 2)),
                    styleSheet: markdownStyleSheet,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
