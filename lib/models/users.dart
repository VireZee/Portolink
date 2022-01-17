part of 'models.dart';

class Users {
  final String uid;
  final String photo;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String message;
  final String createdAt;
  final String updateAt;
  const Users(
    this.uid,
    this.photo,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.message,
    this.createdAt,
    this.updateAt
  );
  List<Object> get props => [
    uid,
    photo,
    name,
    phone,
    email,
    password,
    message,
    createdAt,
    updateAt
  ];
}