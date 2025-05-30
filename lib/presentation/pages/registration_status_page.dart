import 'dart:math';

import 'package:code_con_course_fe/data/code_con_repository.dart';
import 'package:code_con_course_fe/domain/entities/reservation.dart';
import 'package:code_con_course_fe/domain/entities/tresult.dart';
import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/extensions/build_context_extension.dart';
import 'package:code_con_course_fe/presentation/providers/router_provider.dart';
import 'package:code_con_course_fe/presentation/widgets/code_con_app_bar.dart';
import 'package:code_con_course_fe/presentation/widgets/error_dialog.dart';
import 'package:code_con_course_fe/presentation/widgets/registration_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationStatusPage extends ConsumerStatefulWidget {
  const RegistrationStatusPage({super.key});

  @override
  ConsumerState<RegistrationStatusPage> createState() =>
      _RegistrationStatusPageState();
}

class _RegistrationStatusPageState
    extends ConsumerState<RegistrationStatusPage> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

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
            children: [
              Center(
                child: SizedBox(
                  width: min(context.contentWidth - 40, 700),
                  child: Column(
                    children: [
                      sizedBoxHeight60,
                      const Text(
                        'Please enter your email to check your registration status',
                        style: TextStyle(fontSize: 16),
                      ),
                      sizedBoxHeight40,
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email',
                          helperStyle: TextStyle(fontSize: 11),
                          labelText: 'Email',
                        ),
                      ),
                      sizedBoxHeight40,
                      isLoading
                          ? pinkProgressIndicator
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });

                                CodeConRepository()
                                    .checkReservation(emailController.text)
                                    .then(
                                  (value) {
                                    switch (value) {
                                      case Success<Reservation>(:final data):
                                        if (context.mounted) {
                                          context.show(RegistrationStatusDialog(
                                              reservation: data));
                                        }
                                      case Failure<Reservation>(:final message):
                                        if (context.mounted) {
                                          context.show(
                                              ErrorDialog(message: message));
                                        }
                                    }

                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                );
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(secondaryColor)),
                              child: const Text(
                                'Check Registration Status',
                                style: TextStyle(color: Colors.white),
                              )),
                      sizedBoxHeight60,
                      const Text("Haven't registered yet?"),
                      Wrap(
                        children: [
                          const Text('Please register '),
                          InkWell(
                            onTap: () {
                              ref.watch(routerProvider).goNamed('register');
                            },
                            mouseCursor: WidgetStateMouseCursor.clickable,
                            child: const Text(
                              'Here',
                              style: TextStyle(color: secondaryColor),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight60,
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
