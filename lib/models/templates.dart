part of 'models.dart';

class Templates {
  final String tid;
  final String tphoto;
  final String tname;
  final String tdesc;
  final String tprice;
  const Templates(
    this.tid,
    this.tphoto,
    this.tname,
    this.tdesc,
    this.tprice
  );
  List<Object> get props => [
    tid,
    tphoto,
    tname,
    tdesc,
    tprice
  ];
}