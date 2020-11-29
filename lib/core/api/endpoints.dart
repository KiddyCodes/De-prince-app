class Endpoints {
  //-------------STUDENT SIDE
  //auth endpoints
  static final String studentLogin = 'authenticate';
  static final String studentSignup = 'addstudent';
  static final String getresult = 'getStudResult';
  static final String getNotifications = 'getStudResult';

  //-------------STAFF SIDE
  //auth endpoints
  static final String staffLogin = 'authenticateStaff';
  static final String staffSignup = 'addstaff';
  static final String uploadnotes = 'uploadnotes';
  static final String uploadAss = 'uploadAssignment';
  static final String postNotification = 'postNotification';

  //-------------ADMIN SIDE
  static final String getstudnum = 'getStudNum';
  static final String getstaffnum = 'getStaffNum';
  static final String postresult = 'uploadresult';
  static final String authAdmin = 'admin/auth';
}
