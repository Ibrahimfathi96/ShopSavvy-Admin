import 'dart:convert';

ItemsMd itemsMdFromJson(String str) => ItemsMd.fromJson(json.decode(str));
String itemsMdToJson(ItemsMd data) => json.encode(data.toJson());
class ItemsMd {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  num? itemsPriceAfterDiscount;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategories;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;
  ItemsMd({
      this.itemsId, 
      this.itemsName, 
      this.itemsNameAr, 
      this.itemsDesc, 
      this.itemsDescAr, 
      this.itemsImage, 
      this.itemsCount, 
      this.itemsActive, 
      this.itemsPrice, 
      this.itemsPriceAfterDiscount,
      this.itemsDiscount,
      this.itemsDate, 
      this.itemsCategories, 
      this.categoriesId, 
      this.categoriesName, 
      this.categoriesNameAr, 
      this.categoriesImage, 
      this.favorite,
      this.categoriesDatetime,});

  ItemsMd.fromJson(dynamic json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsPriceAfterDiscount = json['itemspricediscount'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    favorite = json['favorite'];
    categoriesDatetime = json['categories_datetime'];
  }

ItemsMd copyWith({  int? itemsId,
  String? itemsName,
  String? itemsNameAr,
  String? itemsDesc,
  String? itemsDescAr,
  String? itemsImage,
  int? itemsCount,
  int? itemsActive,
  int? itemsPrice,
  num? itemsPriceAfterDiscount,
  int? itemsDiscount,
  String? itemsDate,
  int? itemsCategories,
  int? categoriesId,
  String? categoriesName,
  String? categoriesNameAr,
  String? categoriesImage,
  String? categoriesDatetime,
  int? favorite,
}) => ItemsMd(  itemsId: itemsId ?? this.itemsId,
  itemsName: itemsName ?? this.itemsName,
  itemsNameAr: itemsNameAr ?? this.itemsNameAr,
  itemsDesc: itemsDesc ?? this.itemsDesc,
  itemsDescAr: itemsDescAr ?? this.itemsDescAr,
  itemsImage: itemsImage ?? this.itemsImage,
  itemsCount: itemsCount ?? this.itemsCount,
  itemsActive: itemsActive ?? this.itemsActive,
  itemsPrice: itemsPrice ?? this.itemsPrice,
  itemsPriceAfterDiscount: itemsPriceAfterDiscount ?? this.itemsPriceAfterDiscount,
  itemsDiscount: itemsDiscount ?? this.itemsDiscount,
  itemsDate: itemsDate ?? this.itemsDate,
  itemsCategories: itemsCategories ?? this.itemsCategories,
  categoriesId: categoriesId ?? this.categoriesId,
  categoriesName: categoriesName ?? this.categoriesName,
  categoriesNameAr: categoriesNameAr ?? this.categoriesNameAr,
  categoriesImage: categoriesImage ?? this.categoriesImage,
  categoriesDatetime: categoriesDatetime ?? this.categoriesDatetime,
  favorite: favorite ?? this.favorite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['items_id'] = itemsId;
    map['items_name'] = itemsName;
    map['items_name_ar'] = itemsNameAr;
    map['items_desc'] = itemsDesc;
    map['items_desc_ar'] = itemsDescAr;
    map['items_image'] = itemsImage;
    map['items_count'] = itemsCount;
    map['items_active'] = itemsActive;
    map['favorite'] = favorite;
    map['items_price'] = itemsPrice;
    map['itemspricediscount'] = itemsPriceAfterDiscount;
    map['items_discount'] = itemsDiscount;
    map['items_date'] = itemsDate;
    map['items_categories'] = itemsCategories;
    map['categories_id'] = categoriesId;
    map['categories_name'] = categoriesName;
    map['categories_name_ar'] = categoriesNameAr;
    map['categories_image'] = categoriesImage;
    map['categories_datetime'] = categoriesDatetime;
    return map;
  }

}