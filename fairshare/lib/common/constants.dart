class Constants {
  static const rad = 10.0;
  static const int timeout = 2000; // in milliseconds
  static const String timeoutError = "Please try again";
  static const String mayaHost = "https://maya.parkspot.in";
  static const String tokenKey = "PSAuthKey";
  static const String platformFlavour = "Flavour";
  static const String rs = "\u{20B9}"; // rupee unicode
  static const String minAppVersion = "min-app-version";
  static const String suggestedMinAppVersion = "suggested-min-app-version";
  static const String appConfig = "app-config";

  static const String highlightColor = '#FFDD57';
  static const String redColor = '#ff143250';
  static const String loginType = 'LoginType';
  static const String defaultProfileImage =
      'https://parkspot.blob.core.windows.net/assets/profile-icon.png';
}

///[FirebaseDataConstants] contains data which will get populated from network call
class FirebaseDataConstants {
  static String tncLink =
      'https://www.parkspot.in/terms-and-conditions'; // This value will get updated from firebase
  static String helplineNo =
      '+91-74882 39471'; // This value will get updated from firebase
}
