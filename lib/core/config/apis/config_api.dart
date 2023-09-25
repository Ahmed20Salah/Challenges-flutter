class API {
  static const baseUrl = 'http://146.190.159.169:8050/api';
  static const baseImageUrl = 'http://146.190.159.169:8050/storage/';

  static const register = '/register';
  static const login = '/login';
  static const verifyOtp = '/resetOtp';
  static const UpdateFcm = '/resetOtp';
  static const verifyOtpAndResetPassword = '/verifyOtpAndResetPassword';
  static const addContacts = '/addContacts';
  static const getContact = '/ViewContact';
  static const myTeams = '/myTeams';
  static const viewTeam = '/viewTeam';
  static const getCategories = '/getCategories';
  static const getUser = '/getUser';
  static const createTeam = '/createTeam';
  static const challengeData = '/challengeData';
  static const newContact = '/newContact';
  static const allHealthyPlaces = '/allHealthyPlaces';
  static const allTeams = '/allTeams';
  static const searchUser = '/users';
  static const AllUsers = '/AllUsers';
  static const createChallengeTeam = '/createChallengeTeam';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
