// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReservationParams _$CreateReservationParamsFromJson(
        Map<String, dynamic> json) =>
    CreateReservationParams(
      paymentMethod: json['paymentMethod'] as String,
      orderId: json['orderId'] as String,
      customerName: json['customerName'] as String,
      customerEmail: json['customerEmail'] as String,
      returnUrl: json['returnUrl'] as String,
      totalPayment: (json['totalPayment'] as num).toInt(),
      orderDescription: json['orderDescription'] as String? ?? '',
      expiryPeriod: (json['expiryPeriod'] as num?)?.toInt() ?? 15,
    );

Map<String, dynamic> _$CreateReservationParamsToJson(
        CreateReservationParams instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'orderId': instance.orderId,
      'orderDescription': instance.orderDescription,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'returnUrl': instance.returnUrl,
      'expiryPeriod': instance.expiryPeriod,
      'totalPayment': instance.totalPayment,
    };
