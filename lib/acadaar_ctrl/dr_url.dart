import 'package:zlga/acadaar_ctrl/config/dr_config.dart';

class DrUrl {
  DrUrl._();

  ///
  /// APIs Url for non auth
  ///
  static const String load_state = '${DrConfig.dr_app_url_non_auth}get-state';


  static const String loading_app_check = '${DrConfig.dr_app_url_non_auth}appSettings.json';
  static const String post_register_url = '${DrConfig.dr_app_url_non_auth}register';
  static const String post_login_url = '${DrConfig.dr_app_url_non_auth}login';
  static const String post_verify_account = '${DrConfig.dr_app_url_non_auth}validate-account';
  static const String post_forgot_account = '${DrConfig.dr_app_url_non_auth}forget-account';
  static const String post_update_password = '${DrConfig.dr_app_url_non_auth}update-password-nonauth';
  static const String post_regenerate_code = '${DrConfig.dr_app_url_non_auth}regenerate-code';

  /// APIs Url for auth user
  static const String user_profile = '${DrConfig.dr_app_url_auth}user';
  static const String user_update_picture = '${DrConfig.dr_app_url_auth}update-profile-image';
  static const String user_update_profile = '${DrConfig.dr_app_url_auth}update-profile';
  static const String user_update_kmCharges = '${DrConfig.dr_app_url_auth}update_km_charges';
  static const String user_update_package = '${DrConfig.dr_app_url_auth}make_subscription';
  static const String user_update_vehicle_details = '${DrConfig.dr_app_url_auth}vehicle_details';
  static const String user_update_password = '${DrConfig.dr_app_url_auth}update_password';
  static const String user_update_settings = '${DrConfig.dr_app_url_auth}update_password';

  /// APIs next of kin
  static const String emergency = '${DrConfig.dr_app_url_auth}fetch_next_of_kin';
  static const String post_emergency = '${DrConfig.dr_app_url_auth}insert_next_of_kin';
  static const String update_emergency = '${DrConfig.dr_app_url_auth}update_next_of_kin';
  static const String delete_emergency = '${DrConfig.dr_app_url_auth}delete_next_of_kin';
  /// APIs transaction
  static const String myTransaction = '${DrConfig.dr_app_url_auth}my_transaction';
  static const String myTransactionS = '${DrConfig.dr_app_url_auth}my_transactions';
  static const String generateTransaction = '${DrConfig.dr_app_url_auth}downloadTransaction';

  /// APIs private taxi
  /// nearby display
  static const String nearByDisplay = '${DrConfig.dr_app_url_auth}search_for_taxi';
  static const String insertPassengerDetails = '${DrConfig.dr_app_url_auth}insert_passenger_details';
  static const String getRideDetails = '${DrConfig.dr_app_url_auth}taxi_ride_details';
  static const String postRideStatus = '${DrConfig.dr_app_url_auth}driverStatus';
  static const String postCancelRide = '${DrConfig.dr_app_url_auth}cancel_ride';
  static const String postDriverStartRide = '${DrConfig.dr_app_url_auth}driver_start_ride';
  static const String postRateRide = '${DrConfig.dr_app_url_auth}rate_ride';
  static const String postTaxiPayment = '${DrConfig.dr_app_url_auth}make_payment';

  ///post taxi streaming
  static const String taxi_availability = '${DrConfig.dr_app_url_auth}stream_driver_location';


  ///favourite
  static const String myFavourite = '${DrConfig.dr_app_url_auth}my_favourite';
  static const String postFavourite = '${DrConfig.dr_app_url_auth}insert_favourite';
  static const String deleteFavourite = '${DrConfig.dr_app_url_auth}delete_favourite';

  ///package
  static const String get_package = '${DrConfig.dr_app_url_auth}all_packages';


  /// document verification
  static const String get_vehicle_image_preview = '${DrConfig.dr_app_url_auth}vehicle-image-preview';
  static const String post_vehicle_image_package = '${DrConfig.dr_app_url_auth}car_verification';
  static const String updateVehicleOthers = '${DrConfig.dr_app_url_auth}update_car_verification';

  /// APIs user followers
  static const String getUserFollowers = '${DrConfig.dr_app_url_auth}my_followers';
  static const String postUserFollowers = '${DrConfig.dr_app_url_auth}insert_followers';
  static const String deleteUserFollowers = '${DrConfig.dr_app_url_auth}delete';


  //cancelation
  static const String cancellation_get = '${DrConfig.dr_app_url_auth}cancellation_get';

  /// APIs ride private history
  static const String myTaxiHistory = '${DrConfig.dr_app_url_auth}get-history';
  static const String myCarSharingHistory = '${DrConfig.dr_app_url_auth}my_transactions';
  static const String searchTaxiHistory = '${DrConfig.dr_app_url_auth}downloadTransaction';

}
