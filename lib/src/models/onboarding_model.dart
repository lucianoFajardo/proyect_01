// ignore_for_file: camel_case_types
class onboardingModel {
  String title;
  String subtitle;
  String bodyData;
  String pathImage;

  onboardingModel(
      {required this.title,
      required this.bodyData,
      required this.subtitle,
      required this.pathImage});

  copyWith({
    String? title,
    String? subtitle,
    String? bodyData,
    String? pathImage,
  }) {
    return onboardingModel(
        title: title ?? this.title,
        bodyData: bodyData ?? this.bodyData,
        subtitle: subtitle ?? this.subtitle,
        pathImage: pathImage ?? this.pathImage);
  }

  factory onboardingModel.fromMap(Map<dynamic, dynamic> map) {
    return onboardingModel(
        title: map['title'],
        bodyData: map['bodyData'],
        subtitle: map['subtitle'],
        pathImage: map['pathImag']);
  }
}
