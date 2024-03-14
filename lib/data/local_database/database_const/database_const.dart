class DatabaseConst {
  static const databaseName = "user.db";
  static const  tableName = "userData";
  static const version = 1;
  static const columnPrimaryKey = "primary_key";
  static const columnId = "id";
  static const columnName = "name";



  static const columnEmail = "email";
  static const columnPassword = "password";

  static const columnCaseID = "case_id";

  static const columnEmailVerifyAt = "email_verified_at";
  static const columnUserRole = "user_role";
  static const columnStatus = "status";
  static const columnStatusId = "status_id";
  static const columnUserId = "user_id";

  static const columnIp = "ip";
  static const columnDeviceType = "device_type";
  static const columnCreatedAt = "created_at";
  static const columnUpdatedAt = "updated_at";
  static const columnToken = "token";
  static const columnMyCollection = "my_collection";


  static const columnAppUpdateOnOff = "app_update_on_off";
  static const columnNotificationOnOff = "notification_on_off";
  static const columnMode="mode";




  static const fqNotification="fqNotification";
  static const toNotification="toNotification";
  static const appoinmentNotification="appoinmentNotification";


  static const idType = "INTEGER PRIMARY KEY AUTOINCREMENT"; //AUTOINCREMENT OPTIONAL
  static const textType = "TEXT";

  static const tableNameUserLogin = "userLogin";

  static var columIsLogIn='is_login';


}
class User {
  final int id;
  final String name;
  final String email;
  final String caseId;
  final String status;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.caseId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      caseId: json['case_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
