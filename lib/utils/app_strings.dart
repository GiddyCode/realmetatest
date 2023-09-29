class AppStrings {
  // static const resetPasswordText =
  //     'Your password recovery mail has been sent to email address, please go to your mail and confirm and recover your password';
  // static const String appName = "Schoolgate";
  // static const String CACHE_INTEREST = "CACHE_INTEREST";
  static const String CACHE_AUTH_RESPONSE = "CACHE_AUTH_RESPONSE";
  static const String CACHE_TOKEN = "CACHE_TOKEN";


  // Validation defaults
  static const emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const phonePattern = r'^[0][1-9]\d{9}$';
  static const otpPattern = r'^[1-9]\d{5}$';
  static const urlDetectorPattern =
      r'^((http|ftp|https):\/\/)?([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])?';

  //custom text styles
  static const String bodyText = "bodyText";
  static const String bodyTextSmall = "bodyTextSmall";
  static const String headerText = "headerText";
  static const String buttonText = "buttonText";
  static const String largerText = "largerText";
  static const String largestText = "largestText";
  static const String productSans = "ProductSans";

  //Strings used in the app...
  static const List<String> WeekNumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '20',
  ];
  static const List<String> displayPriority = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '20',
  ];
  static const List<String> contentType = ["Video", "Audio", "Document"];
  static const List<String> videoContentAllowedExtensions = ['mov', 'mp4'];
  static const List<String> audioContentAllowedExtensions = ['mp3'];
  static const List<String> documentsContentAllowedExtensions = [
    'jpg',
    'pdf',
    'doc',
    'docs'
  ];
  static const List<String> allContentAllowedExtensions = [
    'jpg',
    'pdf',
    'doc',
    'docs',
    'mp3',
    'mov',
    'mp4'
  ];

  //mocked Json array
  static const List<Map<String?, dynamic>> title = [
    {
      "title": "Python",
    },
    {
      "title": "Information",
    },
    {
      "title": "Java",
    },
    {
      "title": "Fashion",
    },
    {
      "title": "Excel",
    },
    {
      "title": "Robotics",
    },
    {
      "title": "Photography",
    },
    {
      "title": "Cuisines",
    },
    {
      "title": "Sql",
    },
    {
      "title": "Cooking",
    },
  ];

  // Api requests
  static const String listOfSchools = "schools/list";
  static const String studentLogin = "auth/loginWithPin";
  static const String loadResultParams = "student/loadResultParams";
  static const String loadResult = "student/checkResult";
  static const String loadAssignment = "student/listAssignments";
  static const String listAssignment = "student/listAssignments";

  static const String getNewsLetter = "publications/newsLettersList";
  static const String getNews = "publications/getAllNewsPublications";
  static const String getElearning = "elearning/getElearning";
  static const String getArticles = "publications/loadArticles";


  static var baseSchoolImage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Round_Landmark_School_Icon_-_Transparent.svg/1024px-Round_Landmark_School_Icon_-_Transparent.svg.png";
}
