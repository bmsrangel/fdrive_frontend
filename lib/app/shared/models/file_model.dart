class FileModel {
  FileModel({
    this.id,
    this.fileName,
    this.filePath,
    this.size,
    this.format,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  final int id;
  final String fileName;
  final String filePath;
  final String size;
  final String format;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;

  factory FileModel.fromMap(Map<String, dynamic> json) => FileModel(
        id: json["id"],
        fileName: json["fileName"],
        filePath: json["filePath"],
        size: json["size"],
        format: json["format"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fileName": fileName,
        "filePath": filePath,
        "size": size,
        "format": format,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
      };
}
