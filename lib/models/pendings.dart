part of 'models.dart';

class Pendings {
  final String pname;
  final String pcolor;
  final String pdesc;
  final String pstatus;
  final String ptext;
  final String addBy;
  const Pendings(
    this.pname,
    this.pcolor,
    this.pdesc,
    this.pstatus,
    this.ptext,
    this.addBy
  );
  List<Object> get props => [
    pname,
    pcolor,
    pdesc,
    pstatus,
    ptext,
    addBy
  ];
}