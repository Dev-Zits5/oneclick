class UserModel {
  final String id;
  final String name;          // الاسم
  final String username;      // إسم المستخدم
  final String email;         // البريد الإلكتروني
  final String branch;        // الفرع التابع له
  final bool isManager;       // مسئول
  final bool canLogin;        // مسموح له بالدخول

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.branch,
    required this.isManager,
    required this.canLogin,
  });
}