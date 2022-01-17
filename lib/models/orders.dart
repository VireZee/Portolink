part of 'models.dart';

class Orders {
  final String oid;
  final String oname;
  final String ocolor;
  final String ocontact;
  final String odesc;
  final String ophoto;
  final String createdAt;
  const Orders(
    this.oid,
    this.oname,
    this.ocolor,
    this.ocontact,
    this.odesc,
    this.ophoto,
    this.createdAt
  );
  List<Object> get props => [
    oid,
    oname,
    ocolor,
    ocontact,
    odesc,
    ophoto,
    createdAt
  ];
}