class UriConstant{
  static const String baseUrl = 'https://client.clearstarttax.com';



  static const String testimonialURL = 'https://clearstarttax.com/wp-json/post/v2/taxnews';
  static const String testimonialDescriptionURL = 'https://clearstarttax.com/wp-json/post/v2/taxnews/';
  static const String testimonialRelatedPsostURL = 'https://clearstarttax.com/wp-json/post/v2/taxnews/?post_not_in_id=7087&category_id=46';
  static const String faqURL = '$baseUrl/api/get-faqs';
  static const String loginURL = '$baseUrl/api/auth/login';
  static const String signUpURL = '$baseUrl/api/auth/register';
  static const String dashboardURL = '$baseUrl/api/dashboard';
  static const String logOutURL = '$baseUrl/api/auth/logout';
  static const String getPaymentURL = '$baseUrl/api/payment';
  static const String creditCardURL = '$baseUrl/api/card-payment-store';
  static const String bankTransferURL = '$baseUrl/api/ach-payment-store';
  static const String getInTouchURL = '$baseUrl/api/get-in-touch';
  static const String getUserURL = '$baseUrl/api/get-user';
  static const String getSlotURL = '$baseUrl/api/get-available-slots';

  //Client API Url
  static const String uploadDocumentURL ="https://clearstart.irslogics.com/publicapi/2020-02-22/documents/casedocument";
  static const String getSettlementOfficerURL ="https://clearstart.irslogics.com/publicapi/Appointment/GetSetOfficerEmail";
  static const String bookAppoinmentURL ="https://clearstart.irslogics.com/publicapi/Appointment/BookAppointment?apikey=f08f2b3c48ad4134b4ef62abd4aa721d";
}