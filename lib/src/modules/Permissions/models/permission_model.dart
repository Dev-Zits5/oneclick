class PermissionModel {
  final String username;      // إسم المستخدم
  final String groupName;     // إسم المجموعة
  final String permissionCode; // كود الإذن
  final String permissionName; // اسم الإذن
  final bool isAllowed;       // مسموح به

  PermissionModel({
    required this.username,
    required this.groupName,
    required this.permissionCode,
    required this.permissionName,
    required this.isAllowed,
  });
}