import 'package:code_con_course_fe/domain/entities/speaker.dart';
import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/widgets/agenda_section.dart';
import 'package:code_con_course_fe/presentation/widgets/brief_description_section.dart';
import 'package:code_con_course_fe/presentation/widgets/code_con_app_bar.dart';
import 'package:code_con_course_fe/presentation/widgets/home_page_header.dart';
import 'package:code_con_course_fe/presentation/widgets/speaker_section.dart';
import 'package:code_con_course_fe/presentation/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: CodeConAppBar()),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          ListView(
            children: const [
              const HomePageHeader(),
              //Text('HomePageHeader'),
              sizedBoxHeight60,
              const BriefDescriptionSection(),
              //Text('SpeakerSection'),
              // SpeakerWidget(
              //     speaker: Speaker(
              //         name: 'Jessamine Mumtaz',
              //         title: 'CTO',
              //         affiliation: 'Microsoft',
              //         photoUrl: 'pngs/jessamine_mumtaz.png')),
              SpeakerSection(),
              //const Text('AgendaSection'),
              AgendaSection(),
              sizedBoxHeight60,
              const Text('LinkSection'),
              const Text('FooterSection'),
            ],
          )
        ],
      )),
    );
  }
}
