class AppLink {
  //emulatorServer
  // static const String server = "http://10.0.2.2/shop_savvy";
  //phoneServer
  static const String server = "http://192.168.1.6/shop_savvy/admin";

  // static const String server = "http://192.168.1.1/shop_savvy";
  static const String test = "$server/test.php";

  //AUTH PHP
  static const String signup = "$server/auth/sign_up.php";
  static const String signIn = "$server/auth/sign_in.php";
  static const String resend = "$server/auth/resend.php";
  static const String signupVerifyCode = "$server/auth/verify_code.php";

  //ForgetPassword PHP
  static const String checkEmail = "$server/forget_password/check_email.php";
  static const String checkPhone =
      "$server/forget_password/check_phone_number.php";
  static const String resetPassword =
      "$server/forget_password/reset_password.php";
  static const String fpVerifyCode = "$server/forget_password/verify_code.php";

  //Orders & Checkout PHP
  static const String orders = "$server/orders";
  static const String approvedOrders = "$orders/approve.php";
  static const String acceptedOrders = "$orders/accepted.php";
  static const String archivedOrders = "$orders/archive.php";
  static const String pendingOrders = "$orders/pending.php";
  static const String detailsOrders = "$orders/details.php";
  static const String doneOrders = "$orders/done.php";

  //Categories
  static const String categories = "$server/categories";
  static const String addCategories = "$categories/add.php";
  static const String editCategories = "$categories/edit.php";
  static const String viewCategories = "$categories/view.php";
  static const String deleteCategories = "$categories/delete.php";
  //Items
  static const String items = "$server/items";
  static const String addItems = "$items/add.php";
  static const String editItems = "$items/edit.php";
  static const String viewItems = "$items/view.php";
  static const String deleteItems = "$items/delete.php";

  //Image Links
  static const String imagesLink = "http://192.168.1.6/shop_savvy/uploads";
  static const String imagesCategories = "$imagesLink/categories";
  static const String imagesItems = "$imagesLink/items";
}
