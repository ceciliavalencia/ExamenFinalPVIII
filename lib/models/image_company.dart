import 'dart:convert';

class ImagesCompany {
  ImagesCompany({
    required this.id,
    required this.logos,
  });

  int id;
  List<Logo> logos;

  factory ImagesCompany.fromJson(String str) =>
      ImagesCompany.fromMap(json.decode(str));

  factory ImagesCompany.fromMap(Map<String, dynamic> json) => ImagesCompany(
        id: json["id"],
        logos: List<Logo>.from(json["logos"].map((x) => Logo.fromMap(x))),
      );
}

class Logo {
  Logo({
    required this.aspectRatio,
    this.filePath,
    required this.id,
    required this.fileType,
  });

  double aspectRatio;
  String? filePath;
  String id;
  String fileType;

  get logos {
    if (this.filePath != null)
      return 'https://image.tmdb.org/t/p/w500${this.filePath}';

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Logo.fromJson(String str) => Logo.fromMap(json.decode(str));

  factory Logo.fromMap(Map<String, dynamic> json) => Logo(
        aspectRatio: json["aspect_ratio"].toDouble(),
        filePath: json["file_path"],
        id: json["id"],
        fileType: json["file_type"],
      );
}
