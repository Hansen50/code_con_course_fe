import 'package:code_con_course_fe/data/code_con_repository.dart';
import 'package:code_con_course_fe/domain/duitku_entities/get_payment_method_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/tresult.dart';

part 'payment_methods_provider.g.dart';

@Riverpod(keepAlive: true)
Future<TResult<List<PaymentMethod>>> paymentMethods(PaymentMethodsRef ref) =>
    CodeConRepository()
        .getPaymentMethods(params: GetPaymentMethodParams(amount: 75000));
