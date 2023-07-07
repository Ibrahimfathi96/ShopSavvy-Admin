class OrdersMd {
  OrdersMd({
    this.ordersId,
    this.ordersUserId,
    this.ordersLocation,
    this.ordersType,
    this.ordersPriceDelivery,
    this.ordersPrice,
    this.ordersTotalPrice,
    this.ordersCoupon,
    this.ordersRating,
    this.ordersRatingNote,
    this.ordersDatetime,
    this.ordersPaymentMethod,
    this.ordersStatus,
    this.locationId,
    this.locationUserId,
    this.locationName,
    this.locationCity,
    this.locationStreet,
    this.locationLat,
    this.locationLong,});

  OrdersMd.fromJson(dynamic json) {
    ordersId = json['orders_id'];
    ordersUserId = json['orders_user_id'];
    ordersLocation = json['orders_location'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersRatingNote = json['orders_rating_note'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
    locationId = json['location_id'];
    locationUserId = json['location_user_id'];
    locationName = json['location_name'];
    locationCity = json['location_city'];
    locationStreet = json['location_street'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
  }
  num? ordersId;
  num? ordersUserId;
  num? ordersLocation;
  num? ordersType;
  num? ordersPriceDelivery;
  num? ordersPrice;
  num? ordersTotalPrice;
  num? ordersCoupon;
  num? ordersRating;
  String? ordersRatingNote;
  String? ordersDatetime;
  num? ordersPaymentMethod;
  num? ordersStatus;
  num? locationId;
  num? locationUserId;
  String? locationName;
  String? locationCity;
  String? locationStreet;
  dynamic locationLat;
  dynamic locationLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orders_id'] = ordersId;
    map['orders_user_id'] = ordersUserId;
    map['orders_location'] = ordersLocation;
    map['orders_type'] = ordersType;
    map['orders_price_delivery'] = ordersPriceDelivery;
    map['orders_price'] = ordersPrice;
    map['orders_total_price'] = ordersTotalPrice;
    map['orders_coupon'] = ordersCoupon;
    map['orders_rating'] = ordersRating;
    map['orders_rating_note'] = ordersRatingNote;
    map['orders_datetime'] = ordersDatetime;
    map['orders_payment_method'] = ordersPaymentMethod;
    map['orders_status'] = ordersStatus;
    map['location_id'] = locationId;
    map['location_user_id'] = locationUserId;
    map['location_name'] = locationName;
    map['location_city'] = locationCity;
    map['location_street'] = locationStreet;
    map['location_lat'] = locationLat;
    map['location_long'] = locationLong;
    return map;
  }

}