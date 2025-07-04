class UserModel{
  int id;
  String name;
  String? email;
  String? emailVerifiedAt;
  int isAdmin;
  String createdAt;
  String updatedAt;
  int isPhoneVerifiedAt;
  String? phone;


  UserModel({
    required this.id,
    required this.name,
    this.email,
    this.emailVerifiedAt,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.isPhoneVerifiedAt,
    this.phone,

  });

  factory UserModel.fromJson(Map<String, dynamic>json){
     return UserModel(
         id: json['id'],
         name:json ['f_name'],
         email:json ['email'],
         emailVerifiedAt: json['email_verified_at'],
         isAdmin: json['is_admin'],
         createdAt: json ['created_at'],
         updatedAt: json['updated_at'],
         isPhoneVerifiedAt: json['is_phone_verified'],
         phone:json ['phone'],
     );
  }
}