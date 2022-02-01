part of 'models.dart';

class Orders {
  final String oname;
  final String ocolor;
  final String odesc;
  final String ophoto;
  final String ocontact;
  const Orders(
    this.oname,
    this.ocolor,
    this.odesc,
    this.ophoto,
    this.ocontact
  );
  List<Object> get props => [
    oname,
    ocolor,
    odesc,
    ophoto,
    ocontact,
  ];
}