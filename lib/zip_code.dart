class ZipCode {
  final String zonecode; // 우편번호
  final String roadAddress; // 도로명 주소
  final String bname;

  ZipCode(this.zonecode, this.roadAddress, this.bname); // 동 이름

  factory ZipCode.fromJson(Map<String, dynamic> json) {
    return ZipCode(
      json['zonecode'],
      json['roadAddress'],
      json['bname'],
    );
  }

  @override
  String toString() {
    return 'ZipCode{zonecode: $zonecode, roadAddress: $roadAddress, bname: $bname}';
  }
}
