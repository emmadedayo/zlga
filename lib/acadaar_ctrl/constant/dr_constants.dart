import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:intl/intl.dart';

class DrConst {
  DrConst._();

  static const PAYSTACK_PUBLIC_KEY =
      "pk_test_f1d24247bbff1b2fddb9246b4b3b58021ee94b7d";
  static const APP_NAME = "Editorial Plan";
  static const LOGIN_ERROR = "Login Failed";
  static const LOGIN_SUCCESS = "Login Successful";
  static const ERROR_TITLE = "Error Message";
  static const SUCCESS_TITLE = "Success Message";
  static const INFO_TITLE = "Information Message";
  static const WARNING_TITLE = "Warning Message";
  static const ERROR_MESSAGE =
      "A connection to the server could not be established,zlga will continue trying to connect to the server \n\n Check your network connection,If the problem persists contact an administrator";

  static const String THEME__IS_DARK_THEME = 'THEME__IS_DARK_THEME';

  static const String LANGUAGE__LANGUAGE_CODE_KEY =
      'LANGUAGE__LANGUAGE_CODE_KEY';
  static const String LANGUAGE__COUNTRY_CODE_KEY = 'LANGUAGE__COUNTRY_CODE_KEY';
  static const String LANGUAGE__LANGUAGE_NAME_KEY =
      'LANGUAGE__LANGUAGE_NAME_KEY';

  static const String APP_INFO__END_DATE_KEY = 'END_DATE';
  static const String APP_INFO__START_DATE_KEY = 'START_DATE';
  static const String APPINFO_PREF_VERSION_NO = 'APPINFO_PREF_VERSION_NO';
  static const String APPINFO_PREF_FORCE_UPDATE = 'APPINFO_PREF_FORCE_UPDATE';
  static const String APPINFO_FORCE_UPDATE_MSG = 'APPINFO_FORCE_UPDATE_MSG';
  static const String APPINFO_FORCE_UPDATE_TITLE = 'APPINFO_FORCE_UPDATE_TITLE';

  static const String FILTERING__DESC = 'desc'; // Don't Change
  static const String FILTERING__ASC = 'asc'; // Don't Change
  static const String FILTERING__ADDED_DATE = 'added_date'; // Don't Change
  static const String FILTERING__TRENDING = 'touch_count'; // Don't Change
  static const String ITEM_TYPE = 'item'; // Don't Change
  static const String PAID_AD_PROGRESS = 'Progress'; // Don't Change
  static const int PROPULAR_ITEM_COUNT = 6;
  static const String ONE = '1';
  static const String FILTERING_FEATURE = 'featured_date';

  static const String PLATFORM = 'android';

  static const String RATING_ONE = '1';
  static const String RATING_TWO = '2';
  static const String RATING_THREE = '3';
  static const String RATING_FOUR = '4';
  static const String RATING_FIVE = '5';

  static const String IS_PROMOTION = '1';
  static const String IS_FEATURED = '1';
  static const String ZERO = '0';
  static const String THREE = '3';

  static const String FILTERING_PRICE = 'unit_price';

  static const String ADD_NEW_ITEM = 'ADD_NEW_ITEM';
  static const String EDIT_ITEM = 'EDIT_ITEM';


  static const String VALUE_HOLDER__USER_ID = 'ID';
  static const String VALUE_HOLDER__USER_FIRSTNAME = 'USER_FIRSTNAME';
  static const String VALUE_HOLDER__USER_LASTNAME = 'USER_LASTNAME';
  static const String VALUE_HOLDER__USER_EMAIL = 'USER_EMAIL';
  static const String VALUE_HOLDER__USER_PHONE = 'USER_PHONE';
  static const String VALUE_HOLDER__USER_IMAGE = 'USER_IMAGE';
  static const String VALUE_HOLDER__USER_NOTIFICATION = 'USER_NOTIFICATION';
  static const String VALUE_HOLDER__USER_LOCATION = 'USER_LOCATION';
  static const String VALUE_HOLDER__USER_POST_AS_A = 'USER_POST_AS_A';
  static const String VALUE_HOLDER__USER_FCM_TOKEN = 'USER_FCM_TOKEN';
  static const String VALUE_HOLDER__USER_SESSION = 'USER_SESSION';



  static const String VALUE_HOLDER__APP_NAME = 'APP_NAME';



  static final NumberFormat psFormat = NumberFormat(DrConfig.priceFormat);
  static const String priceTwoDecimalFormatString = '#,##0.00';
  static final NumberFormat priceTwoDecimalFormat = NumberFormat(priceTwoDecimalFormatString);

  static const String PAYMENT_PAYPAL_METHOD = 'paypal';
  static const String PAYMENT_STRIPE_METHOD = 'stripe';
  static const String PAYMENT_RAZOR_METHOD = 'razor';

  ///
  /// Hero Tags
  ///
  static const String HERO_TAG__IMAGE = '_image';
  static const String HERO_TAG__TITLE = '_title';
  static const String HERO_TAG__ORIGINAL_PRICE = '_original_price';
  static const String HERO_TAG__UNIT_PRICE = '_unit_price';

  ///
  /// Payment On/Off
  ///
  static const String PAYPAL_ENABLE = '1';
  static const String STRIPE_ENABLE = '1';
  static const String RAZOR_ENABLE = '1';

  ///
  /// Error Codes
  ///
  static const String ERROR_CODE_10001 = '10001'; // Totally No Record
  static const String ERROR_CODE_10002 =
      '10002'; // No More Record at pagination
}
