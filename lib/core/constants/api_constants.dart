class ApiConstants {
  /// Google Maps
  static const String baseUrlGoogleMaps =
      'https://maps.googleapis.com/maps/api';
  static const String placeAutoComplete = '/place/autocomplete/json';
  static const String placeDetails = '/place/details/json';

  /// Api Server
  static const baseUrl = 'https://darkslateblue-mule-674682.hostingersite.com/api/v1/';
  static const login = 'auth/login';
  static const sendCode = 'auth/check-phone';
  static const createAccount = 'auth/register';
  static const cities = 'shared/cities';

  static const notifications = 'auth/notifications';
  static const logout = 'auth/logout';
  static const deleteAcc = 'auth/delete-account';
  static const terms = 'static/terms';
  static const privacy = 'static/privacy';
  static const home = 'user/home';
  static const favStores = 'user/favorites';
  static const profile = 'auth/profile';
  static const orders = 'user/orders';
  static String storeDetails(int storeId) => 'user/stores/$storeId';
  static String productDetails(int productId) => 'user/products/$productId';
  static String sectionProductsDetails(int storeId,int sectionId) => 'user/stores/$storeId/sections/$sectionId/products';
  static String toggleFav(int storeId) => 'user/favorites/$storeId/toggle';
  static String availableSize(int productId) => 'user/products/$productId/available-sizes';
  static String orderDetails(int orderId) => 'user/orders/$orderId';
  static  const String cart = 'user/cart';
  static  const String updateCart = 'user/cart/update';
  static  const String deleteCart = 'user/cart/clear';
  static  const String updateProfile = 'auth/update-profile';
  static  const String wallet = 'wallet/history';
  static  const String deposit = 'wallet/deposit';
  static  const String paymentMethods = 'shared/payment-methods';
  static  const String addresses = 'user/locations';
  static  const String checkCoupon = 'user/coupons/check';
  static  const String createOrder = 'user/orders/create';
  static  const String settings = 'static/media';
  static  const String sendMessage = 'messages/send';
  static  String deleteItemFromCart(int itemId) => 'user/cart/items/$itemId';
  static  String updateAddress(int addressId) => 'user/locations/$addressId';
  static  String deleteAddress(int addressId) => 'user/locations/$addressId';
  static  String conversations(int chatId) => 'messages/chat/$chatId';
  static  String reOrder(int orderId) => 'user/orders/$orderId/reorder';

  // api pusher
  static const pusherAuth = 'broadcasting/auth';

}
