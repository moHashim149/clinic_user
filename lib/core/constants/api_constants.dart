class ApiConstants {
  /// Google Maps
  static const String baseUrlGoogleMaps =
      'https://maps.googleapis.com/maps/api';
  static const String placeAutoComplete = '/place/autocomplete/json';
  static const String placeDetails = '/place/details/json';

  /// Api Server
  static const baseUrl = 'https://orangered-butterfly-462285.hostingersite.com/api/v1/';
  static const login = 'auth/login';
  static const sendCode = 'auth/resend-code';
  static const verifyCode = 'auth/verify-code';
  static const createUserAccount = 'auth/client/register';
  static const cities = 'general/cities';
  static const updateProfile = 'auth/update-profile';
  static const notifications = 'auth/notifications';
  static const logout = 'auth/logout';
  static const deleteAcc = 'auth/delete-account';
  static const toggleNotify = 'auth/notifications/toggle-notify';
  static const contactUs = 'contacts';
  static const questions = 'general/faqs';
  static const terms = 'general/privacy';
  static const aboutUs = 'general/about-us';
  static const profile = 'auth/profile';
  static const home = 'client/home';
  static const categories = 'general/categories';
  static const allStores = 'client/see-more';
  static const search = 'client/search-providers';
  static const markAsRead = 'auth/notifications/mark-as-read';
  static const filterAds = 'client/advertisements/filter';
  static const offers = 'client/advertisements/feed';
  static const bookmarks = 'client/advertisements/saved';
  static const deleteNotifications = 'auth/notifications';
  static const mapStores = 'client/map';
  static const createStoreAccount = 'auth/provider/register';
  static const storeAds = 'provider/advertisements';
  static const storeProfile = 'provider/my-profile';
  static const providerReviews = 'provider/reviews';
  static const providerPackages = 'provider/packages';
  static const payments = 'provider/payment-methods';
  static const providerProfile = 'provider/profile-details';
  static const editProviderProfile = 'auth/provider/profile-update-request';
  static const reports = 'general/report-reasons';
  static String storeDetails(int storeId) => 'providers/$storeId/profile';
  static String storeReviews(int storeId) => 'providers/$storeId/reviews';
  static String likes(int offerId) => 'advertisements/$offerId/likes';
  static String like(int offerId) => 'advertisements/$offerId/like';
  static String toggleSave(int offerId) => 'client/advertisements/$offerId/toggle-saved';
  static String comments(int offerId) => 'advertisements/$offerId/comments';
  static String deleteComment(int offerId,int commentId) => 'advertisements/$offerId/comments/$commentId';
  static String updateOffer(int offerId) => 'provider/advertisements/$offerId/update';
  static String deleteOffer(int offerId) => 'provider/advertisements/$offerId';
  static String offerForEdit(int offerId) => 'provider/advertisements/$offerId/edit';
  static String subscribePackage(int packageId) => 'provider/packages/$packageId/subscribe';
  static String sendReport(int offerId,int commentId) => 'advertisements/$offerId/comments/$commentId/report';

}
