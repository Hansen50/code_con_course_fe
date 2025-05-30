import 'dart:math';

import 'package:code_con_course_fe/domain/entities/payment_method.dart';
import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/extensions/build_context_extension.dart';
import 'package:code_con_course_fe/presentation/providers/payment_methods_provider.dart';
import 'package:code_con_course_fe/presentation/widgets/code_con_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                        'Pleaase fill in the form below to register '
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
                              'identifier. The same email address cannot be used '
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
                            error: (error, StackTrace) =>
                                Text(error.toString()),
                            loading: () => blueProgressIndicator,
                          ),
                      sizedBoxHeight40,
                      isLoading
                          ? pinkProgressIndicator
                          : ElevatedButton(
                              onPressed: () {},
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
                            onTap: () {},
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
