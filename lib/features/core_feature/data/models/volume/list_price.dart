import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_price.g.dart';

@JsonSerializable()
class ListPrice extends Equatable {
  final int? amount;
  final String? currencyCode;

  const ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) {
    return _$ListPriceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListPriceToJson(this);

  ListPrice copyWith({
    int? amount,
    String? currencyCode,
  }) {
    return ListPrice(
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  @override
  List<Object?> get props => [amount, currencyCode];
}
