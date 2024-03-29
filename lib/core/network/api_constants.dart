class ApiConstants {
  static const String baseUrl = 'https://back-ph2h.onrender.com';
  //static const String apiKey = "c3435cfe40aeb079689227d82bf921d3";

  static const String getAllJobsPath = "$baseUrl/jobs/";
  static const String deleteJobPath = "$baseUrl/jobs/";
  static const String getOneJobPath = "$baseUrl/jobs/";
  static const String searchJobsPath = "$baseUrl/jobs/?search=";
  static const String finishJobPath = "$baseUrl/jobs/update_status/";


  static const String getProfile = "$baseUrl/user/profile/";
  static const String postJobRating = "$baseUrl/rate/job/";
  static const String postUserRating = "$baseUrl/rate/user/";

  static const String applyOfferPath = "$baseUrl/offer/apply/";
  static const String acceptOfferPath = "$baseUrl/offer/accept/";

  static const String getUserByID = "$baseUrl/user/";

  static const String signUpPath = "$baseUrl/signUp/";
  static const String loginPath = "$baseUrl/login/";

  static const String baseImageUrl =
      '"https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/';

  ///path=Test-Logo.svg/783px-Test-Logo.svg.png
  static String imageUrl(String path) => '$baseImageUrl$path';
}
