import 'package:json_annotation/json_annotation.dart';

part 'create_reservation_params.g.dart';

@JsonSerializable()
class CreateReservationParams {
  CreateReservationParams({
    required this.paymentMethod,
    required this.orderId,
    required this.customerName,
    required this.customerEmail,
    required this.returnUrl,
    required this.totalPayment,
    this.orderDescription = '',
    this.expiryPeriod = 15,
  });

  factory CreateReservationParams.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationParamsFromJson(json);

  final String paymentMethod;
  final String orderId;
  final String orderDescription;
  final String customerName;
  final String customerEmail;
  final String returnUrl;
  final int expiryPeriod;
  final int totalPayment;

  Map<String, dynamic> toJson() => _$CreateReservationParamsToJson(this);
}
