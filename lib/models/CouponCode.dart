class CouponCode {
  String? title;
  String? code;

  CouponCode({required this.title, required this.code});

  CouponCode.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
  }
}
