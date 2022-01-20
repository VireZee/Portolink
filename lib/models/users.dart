part of 'models.dart';

class Users {
  final String uid;
  final String photo;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String message;
  final String dark;
  final String created;
  final String updated;
  final String entered;
  final String left;
  const Users(
    this.uid,
    this.photo,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.message,
    this.dark,
    this.created,
    this.updated,
    this.entered,
    this.left
  );
  List<Object> get props => [
    uid,
    photo,
    name,
    phone,
    email,
    password,
    message,
    dark,
    created,
    updated,
    entered,
    left
  ];
}