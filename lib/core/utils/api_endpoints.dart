class ApiEndpoint {
  static final String baseUrl = 'https://deyarak-app.onrender.com/';
  static _AuthEndPoints authEndPoint = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'api/v1/users/signup';
  final String loginEmail = 'api/v1/users/login';
  final String addToWishlist = 'api/v1/users/add-to-wishlist/';
  final String contactus = 'api/v1/users/contactus';
  final String updateUserInfo = 'api/v1/users/updateMe';


}

