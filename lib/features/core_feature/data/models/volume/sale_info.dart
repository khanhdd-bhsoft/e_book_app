import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'list_price.dart';
import 'offer.dart';
import 'retail_price.dart';

part 'sale_info.g.dart';

@JsonSerializable()
class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return _$SaleInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
    ListPrice? listPrice,
    RetailPrice? retailPrice,
    String? buyLink,
    List<Offer>? offers,
  }) {
    return SaleInfo(
      country: country ?? this.country,
      saleability: saleability ?? this.saleability,
      isEbook: isEbook ?? this.isEbook,
      listPrice: listPrice ?? this.listPrice,
      retailPrice: retailPrice ?? this.retailPrice,
      buyLink: buyLink ?? this.buyLink,
      offers: offers ?? this.offers,
    );
  }

  @override
  List<Object?> get props {
    return [
      country,
      saleability,
      isEbook,
      listPrice,
      retailPrice,
      buyLink,
      offers,
    ];
  }
}
