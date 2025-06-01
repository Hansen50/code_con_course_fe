import 'dart:math';

import 'package:code_con_course_fe/data/code_con_repository.dart';
import 'package:code_con_course_fe/domain/duitku_entities/create_reservation_params.dart';
import 'package:code_con_course_fe/domain/entities/payment_method.dart';
import 'package:code_con_course_fe/domain/entities/reservation.dart';
import 'package:code_con_course_fe/domain/entities/tresult.dart';
import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/extensions/build_context_extension.dart';
import 'package:code_con_course_fe/presentation/providers/payment_methods_provider.dart';
import 'package:code_con_course_fe/presentation/providers/router_provider.dart';
import 'package:code_con_course_fe/presentation/widgets/code_con_app_bar.dart';
import 'package:code_con_course_fe/presentation/widgets/error_dialog.dart';
import 'package:code_con_course_fe/presentation/widgets/registration_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  PaymentMethod? selectedPaymentMethod;
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
                        'Please fill in the form below to register '
                        'for the event',
                        style: TextStyle(fontSize: 16),
                      ),
                      sizedBoxHeight40,
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email',
                          helperText: 'Your email is used for your unique '
                              'identifier. The same email address cannont be used '
                              'to register multiple times.',
                          helperMaxLines: 2,
                          helperStyle: TextStyle(fontSize: 11),
                          labelText: 'Email',
                        ),
                      ),
                      sizedBoxHeight20,
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your full name',
                          labelText: 'Full Name',
                        ),
                      ),
                      sizedBoxHeight20,
                      ref.watch(paymentMethodsProvider).when(
                            data: (data) => data.isSuccess
                                ? DropdownButton(
                                    items: data.asSuccess.data
                                        .map(
                                          (e) => DropdownMenuItem(
                                              value: e,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    color: Colors.white,
                                                    child: e.image
                                                            .toUpperCase()
                                                            .contains('.SVG')
                                                        ? SvgPicture.network(
                                                            e.image)
                                                        : Image.network(
                                                            e.image),
                                                  ),
                                                  Text(e.name),
                                                ],
                                              )),
                                        )
                                        .toList(),
                                    hint: const Text('Select payment method'),
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPaymentMethod = value;
                                      });
                                    },
                                    value: selectedPaymentMethod,
                                  )
                                : Text(data.asFailure.message),
                            error: (error, stackTrace) =>
                                Text(error.toString()),
                            loading: () => blueProgressIndicator,
                          ),
                      sizedBoxHeight40,
                      isLoading
                          ? pinkProgressIndicator
                          : ElevatedButton(
                              onPressed: () {
                                if (selectedPaymentMethod != null &&
                                    emailController.text.trim().isNotEmpty &&
                                    nameController.text.trim().isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  final params = CreateReservationParams(
                                      paymentMethod:
                                          selectedPaymentMethod!.code,
                                      orderId:
                                          'RSV${DateTime.now().millisecondsSinceEpoch}',
                                      customerName: nameController.text,
                                      customerEmail: emailController.text,
                                      returnUrl:
                                          'https://code-con-website.web.app/return',
                                      totalPayment: 750000);

                                  CodeConRepository()
                                      .createReservation(params: params)
                                      .then(
                                    (value) {
                                      switch (value) {
                                        case Success<Reservation>(:final data):
                                          if (context.mounted) {
                                            context.show(
                                                RegistrationStatusDialog(
                                                    reservation: data));
                                          }
                                          launchUrl(Uri.parse(data.paymentUrl),
                                              mode: LaunchMode
                                                  .externalApplication);
                                        case Failure<Reservation>(
                                            :final message
                                          ):
                                          {
                                            if (message ==
                                                'Email already registered') {
                                              if (context.mounted) {
                                                context.show(const ErrorDialog(
                                                    message:
                                                        'Email already registered'));
                                              }
                                            } else {
                                              CodeConRepository()
                                                  .checkReservation(
                                                      emailController.text)
                                                  .then(
                                                (value) {
                                                  switch (value) {
                                                    case Success<Reservation>(
                                                        :final data
                                                      ):
                                                      {
                                                        if (context.mounted) {
                                                          context.show(
                                                              RegistrationStatusDialog(
                                                                  reservation:
                                                                      data));
                                                        }

                                                        launchUrl(
                                                            Uri.parse(data
                                                                .paymentUrl),
                                                            mode: LaunchMode
                                                                .externalApplication);
                                                      }
                                                    case Failure<Reservation>():
                                                      {
                                                        if (context.mounted) {
                                                          context.show(
                                                              ErrorDialog(
                                                                  message:
                                                                      message));
                                                        }
                                                      }
                                                  }
                                                },
                                              );
                                            }
                                          }
                                      }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                  );
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(secondaryColor)),
                              child: const Text(
                                'Make Payment',
                                style: TextStyle(color: Colors.white),
                              )),
                      sizedBoxHeight60,
                      const Text('Have registered before?'),
                      const Text(
                          'Only want to check your registration status?'),
                      Wrap(
                        children: [
                          const Text('Please click '),
                          InkWell(
                            onTap: () {
                              ref.watch(routerProvider).goNamed('check');
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
