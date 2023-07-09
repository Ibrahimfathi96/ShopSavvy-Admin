class CategoriesMD {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDateTime;

  CategoriesMD(this.categoriesId, this.categoriesName, this.categoriesNameAr,
      this.categoriesImage, this.categoriesDateTime);

  CategoriesMD.fromJson(Map<String, dynamic> json) {
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesNameAr = json["categories_name_ar"];
    categoriesImage = json["categories_image"];
    categoriesDateTime = json["categories_datetime"];
  }

  Map<String, dynamic> toJson() {
    return {
      "categories_id": categoriesId,
      "categories_name": categoriesName,
      "categories_name_ar": categoriesNameAr,
      "categories_image": categoriesImage,
      "categories_datetime": categoriesDateTime,
    };
  }
}
