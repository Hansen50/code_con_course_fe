import 'package:code_con_course_fe/domain/entities/speaker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'speaker_provider.g.dart';

@riverpod
List<Speaker> speaker(SpeakerRef ref) => [
      Speaker(
          name: 'Koen Van Looveren',
          title: 'Senior Developer',
          affiliation: 'Google',
          photoUrl: 'assets/pngs/koen_van_looveren.png'),
      Speaker(
          name: 'Mary Cruz',
          title: 'Software Engineer',
          affiliation: 'Facebook',
          photoUrl: 'assets/pngs/mary_cruz.png'),
      Speaker(
          name: 'Lawrence Smith',
          title: 'Tech Lead',
          affiliation: 'Amazon',
          photoUrl: 'assets/pngs/lawrence_smith.png'),
      Speaker(
          name: 'Jessamine Mumtaz',
          title: 'CTO',
          affiliation: 'Microsoft',
          photoUrl: 'assets/pngs/jessamine_mumtaz.png'),
      Speaker(
          name: 'Amir Khan',
          title: 'Software Developer',
          affiliation: 'Apple',
          photoUrl: 'assets/pngs/amir_khan.png'),
      Speaker(
          name: 'Lynn Chang',
          title: 'Software Engineer',
          affiliation: 'Netflix',
          photoUrl: 'assets/pngs/lynn_chang.png'),
    ];
