class OrdersDetailsMd {
  OrdersDetailsMd({
      this.itemPrice,
      this.itemCount,
      this.cartId, 
      this.cartUserId, 
      this.cartItemsId, 
      this.cartOrders, 
      this.itemsId, 
      this.itemsName, 
      this.itemsNameAr, 
      this.itemsDesc, 
      this.itemsDescAr, 
      this.itemsImage, 
      this.itemsCount, 
      this.itemsActive, 
      this.itemsPrice, 
      this.itemsDiscount, 
      this.itemsDate, 
      this.itemsCategories,});

  OrdersDetailsMd.fromJson(dynamic json) {
    itemPrice = json['ITEMSPRICE'];
    itemCount = json['ITEMSCOUNT'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemsId = json['cart_items_id'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
  }
  num? itemPrice;
  num? itemCount;
  num? cartId;
  num? cartUserId;
  num? cartItemsId;
  num? cartOrders;
  num? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  num? itemsCount;
  num? itemsActive;
  num? itemsPrice;
  num? itemsDiscount;
  String? itemsDate;
  num? itemsCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ITEMSPRICE'] = itemPrice;
    map['ITEMSCOUNT'] = itemCount;
    map['cart_id'] = cartId;
    map['cart_user_id'] = cartUserId;
    map['cart_items_id'] = cartItemsId;
    map['cart_orders'] = cartOrders;
    map['items_id'] = itemsId;
    map['items_name'] = itemsName;
    map['items_name_ar'] = itemsNameAr;
    map['items_desc'] = itemsDesc;
    map['items_desc_ar'] = itemsDescAr;
    map['items_image'] = itemsImage;
    map['items_count'] = itemsCount;
    map['items_active'] = itemsActive;
    map['items_price'] = itemsPrice;
    map['items_discount'] = itemsDiscount;
    map['items_date'] = itemsDate;
    map['items_categories'] = itemsCategories;
    return map;
  }

}