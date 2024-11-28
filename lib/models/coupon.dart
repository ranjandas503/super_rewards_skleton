class Coupon {
  String? icon;
  String? title;
  String? coupon;

  Coupon({required this.icon, required this.title, required this.coupon});

  Coupon.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    coupon = json['coupon'];
  }
}
