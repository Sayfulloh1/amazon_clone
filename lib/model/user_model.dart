import 'dart:convert';

class UserModel{
  String? name;
  String? mobileNumber;
  String? userType;

  UserModel({this.name,this.mobileNumber,this.userType});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'name':name,
      'mobileNum':mobileNumber,
      'userType':userType,
    };
  }

  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
      name: map['name'] != null?map['name'] as String : null,
      mobileNumber: map['mobileNum'] != null?map['mobileNum'] as String : null,
      userType: map['userType'] != null?map['userType'] as String : null,
    );
  }

  String toJson()=> jsonEncode(toMap());
  factory UserModel.fromJson(String source)=>UserModel.fromMap(jsonDecode(source) as Map<String, dynamic> );
}