part of 'models.dart';

class Orders {
  final String oname;
  final String ocolor;
  final String ocontact;
  final String odesc;
  final String ophoto;
  const Orders(
    this.oname,
    this.ocolor,
    this.ocontact,
    this.odesc,
    this.ophoto
  );
  List<Object> get props => [
    oname,
    ocolor,
    ocontact,
    odesc,
    ophoto
  ];
}