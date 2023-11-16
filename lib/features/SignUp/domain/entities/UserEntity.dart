import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  UserEntity({
      this.user, 
      this.token,});

  UserDataEntity? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user,token];


}

class UserDataEntity extends Equatable{
  UserDataEntity({
      this.name, 
      this.email, 
     });


  String? name;
  String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [name,email];


}