
import 'package:my_shopping_app/features/SignUp/data/models/ErrorModel.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';

class UserModel extends UserEntity{
  UserModel({
      this.message,
     this.statusMsg,
    this.error,
    super.user,
      super.token,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'] != null ? ErrorModel.fromJson(json['errors']) : null;
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  ErrorModel ?error;

  @override
  // TODO: implement props
  List<Object?> get props => [super.props,message];

}

class UserDataModel extends UserDataEntity{
  UserDataModel({
      super.name,
      super.email,
      this.role,});

  UserDataModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? role;

@override
  // TODO: implement props
  List<Object?> get props =>[super.props,role];
}