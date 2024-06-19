// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retail_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetailPrice _$RetailPriceFromJson(Map<String, dynamic> json) => RetailPrice(
      amount: (json['amount'] as num?)?.toInt(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$RetailPriceToJson(RetailPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };
