class Api {
  static String server = const String.fromEnvironment("APP_URL");
  // auth
  static String login = "${server}auth/login";
  static String register = "${server}auth/register";
  // user address
  static String userAddress = "${server}user-address";
  // Product
  static String product = "${server}product";
  // Cart
  static String cart = "${server}cart";
  // Order
  static String order = "${server}order";
  // Order Status
  static String orderStatus = "${server}order/status";
}
