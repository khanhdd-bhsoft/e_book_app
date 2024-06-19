import 'package:equatable/equatable.dart';

class VolumeModel extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final LayerInfo? layerInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;

  VolumeModel(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.layerInfo});
  factory VolumeModel.fromJson(Map<String, dynamic> json) => VolumeModel(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: json["volumeInfo"] != null
            ? VolumeInfo.fromJson(json["volumeInfo"])
            : null,
        saleInfo: json["saleInfo"] != null
            ? SaleInfo.fromJson(json["saleInfo"])
            : null,
        accessInfo: json["accessInfo"] != null
            ? AccessInfo.fromJson(json["accessInfo"])
            : null,
        layerInfo: json["layerInfo"] != null
            ? LayerInfo.fromJson(json["layerInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toJson(),
        "saleInfo": saleInfo?.toJson(),
        "accessInfo": accessInfo?.toJson(),
        "layerInfo": layerInfo?.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [kind, id, etag, accessInfo, saleInfo, volumeInfo, selfLink];
}

class AccessInfo extends Equatable {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Epub? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: json["epub"] != null ? Epub.fromJson(json["epub"]) : null,
        pdf: json["pdf"] != null ? Epub.fromJson(json["pdf"]) : null,
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub?.toJson(),
        "pdf": pdf?.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
  @override
  // TODO: implement props
  List<Object?> get props => [
        country,
        viewability,
        embeddable,
        publicDomain,
        textToSpeechPermission,
        epub,
        pdf,
        webReaderLink,
        accessViewStatus,
        quoteSharingAllowed
      ];
}

class Epub extends Equatable {
  final bool? isAvailable;
  final String? downloadLink;

  Epub({
    this.isAvailable,
    this.downloadLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable:
            json.containsKey('isAvailable') ? json['isAvailable'] : false,
        downloadLink:
            json.containsKey('downloadLink') ? json['downloadLink'] : null,
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "downloadLink": downloadLink,
      };
  @override
  // TODO: implement props
  List<Object?> get props => [isAvailable, downloadLink];
}

class LayerInfo extends Equatable {
  List<Layer>? layers;

  LayerInfo({
    required this.layers,
  });

  factory LayerInfo.fromJson(Map<String, dynamic> json) => LayerInfo(
        layers: json["layers"] != null
            ? List<Layer>.from(json["layers"].map((x) => Layer.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "layers": layers != null
            ? List<dynamic>.from(layers!.map((x) => x.toJson()))
            : null,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [layers];
}

class Layer extends Equatable {
  String layerId;
  String volumeAnnotationsVersion;

  Layer({
    required this.layerId,
    required this.volumeAnnotationsVersion,
  });

  factory Layer.fromJson(Map<String, dynamic> json) => Layer(
        layerId: json["layerId"],
        volumeAnnotationsVersion: json["volumeAnnotationsVersion"],
      );

  Map<String, dynamic> toJson() => {
        "layerId": layerId,
        "volumeAnnotationsVersion": volumeAnnotationsVersion,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [volumeAnnotationsVersion, layerId];
}

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? buyLink;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.buyLink,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        buyLink: json["buyLink"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
        "buyLink": buyLink,
      };
  @override
  // TODO: implement props
  List<Object?> get props => [country, saleability, isEbook, buyLink];
}

class VolumeInfo extends Equatable {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  ReadingModes? readingModes;
  int? pageCount;
  Dimensions? dimensions;
  int? printedPageCount;
  String? printType;
  int? averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  List<String>? categories;

  VolumeInfo(
      {this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.readingModes,
      this.pageCount,
      this.printedPageCount,
      this.printType,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.averageRating,
      this.description,
      this.dimensions,
      this.ratingsCount,
      this.categories});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
      title: json["title"],
      authors: json["authors"] != null
          ? List<String>.from(json["authors"].map((x) => x))
          : null,
      publisher: json["publisher"],
      description: json["description"],
      publishedDate: json["publishedDate"],
      readingModes: json["readingModes"] != null
          ? ReadingModes.fromJson(json["readingModes"])
          : null,
      pageCount: json["pageCount"],
      printedPageCount: json["printedPageCount"],
      printType: json["printType"],
      maturityRating: json["maturityRating"],
      allowAnonLogging: json["allowAnonLogging"],
      contentVersion: json["contentVersion"],
      panelizationSummary: json["panelizationSummary"] != null
          ? PanelizationSummary.fromJson(json["panelizationSummary"])
          : null,
      imageLinks: json["imageLinks"] != null
          ? ImageLinks.fromJson(json["imageLinks"])
          : null,
      language: json["language"],
      previewLink: json["previewLink"],
      infoLink: json["infoLink"],
      canonicalVolumeLink: json["canonicalVolumeLink"],
      averageRating: json["averageRating"],
      ratingsCount: json["ratingsCount"],
      dimensions: json["dimensions"] != null
          ? Dimensions.fromJson(json["dimensions"])
          : null,
      categories: json["categories"] != null
          ? (json["categories"] as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : null);

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors":
            authors != null ? List<dynamic>.from(authors!.map((x) => x)) : null,
        "publisher": publisher,
        "publishedDate": publishedDate,
        "readingModes": readingModes?.toJson(),
        "pageCount": pageCount,
        "printedPageCount": printedPageCount,
        "printType": printType,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "imageLinks": imageLinks?.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "description": description,
        "dimensions": dimensions?.toJson(),
        "categories": categories != null
            ? List<dynamic>.from(categories!.map((x) => x))
            : null
      };
  @override
  // TODO: implement props
  List<Object?> get props => [
        canonicalVolumeLink,
        infoLink,
        previewLink,
        language,
        imageLinks,
        panelizationSummary,
        contentVersion,
        allowAnonLogging,
        maturityRating,
        printType,
        printedPageCount,
        readingModes,
        pageCount,
        publishedDate,
        publisher,
        authors,
        title
      ];
}

class Dimensions extends Equatable {
  final String? height;

  Dimensions({
    this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [height];
}

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;
  final String? small;
  final String? medium;
  final String? large;
  final String? extraLarge;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
        extraLarge: json["extraLarge"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
        "small": small,
        "medium": medium,
        "large": large,
        "extraLarge": extraLarge,
      };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [smallThumbnail, thumbnail, small, medium, large, extraLarge];
}

class PanelizationSummary extends Equatable {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}

class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
  @override
  // TODO: implement props
  List<Object?> get props => [text, image];
}
