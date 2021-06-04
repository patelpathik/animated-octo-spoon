class PathDetails {
  final String id;
  final String title;
  final List<SubPathDetails> subPaths;

  PathDetails(this.id, this.title, this.subPaths);

  factory PathDetails.fromJson(Map<String, dynamic> json) {
    return PathDetails(
      json['id'],
      json['title'],
      json['sub_paths'] != null
          ? json['sub_paths']
              .map<SubPathDetails>(
                (subPathJson) => SubPathDetails.fromJson(subPathJson),
              )
              .toList()
          : [],
    );
  }
}

class SubPathDetails {
  final String id;
  final String title;
  final String imgUrl;

  SubPathDetails(this.id, this.title, this.imgUrl);

  factory SubPathDetails.fromJson(Map<String, dynamic> json) {
    return SubPathDetails(json['id'], json['title'], json['image']);
  }
}
