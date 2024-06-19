import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'retail_price.g.dart';

@JsonSerializable()
class RetailPrice extends Equatable {
  final int? amount;
  final String? currencyCode;

  const RetailPrice({this.amount, this.currencyCode});

  factory RetailPrice.fromJson(Map<String, dynamic> json) {
    return _$RetailPriceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RetailPriceToJson(this);

  RetailPrice copyWith({
    int? amount,
    String? currencyCode,
  }) {
    return RetailPrice(
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  @override
  List<Object?> get props => [amount, currencyCode];
}
