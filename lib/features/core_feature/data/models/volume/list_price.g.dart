// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPrice _$ListPriceFromJson(Map<String, dynamic> json) => ListPrice(
      amount: (json['amount'] as num?)?.toInt(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$ListPriceToJson(ListPrice instance) => <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };
