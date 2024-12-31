class Occasion {
  Occasion({
    this.image,
    this.createdAt,
    this.name,
    this.id,
    this.slug,
    this.updatedAt,
    this.message,
    this.error,
    this.stack,
  });

  final String? image;
  final DateTime? createdAt;
  final String? name;
  final String? id;
  final String? slug;
  final DateTime? updatedAt;
  final String? message;
  final String? error;
  final String? stack;

  // Factory method to safely parse JSON
  factory Occasion.fromJson(Map<dynamic, dynamic> json) {
    return Occasion(
      image: json["image"] as String?,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      name: json["name"] as String?,
      id: json["_id"] as String?,
      slug: json["slug"] as String?,
      updatedAt: json["updatedAt"] != null
          ? DateTime.tryParse(json["updatedAt"])
          : null,
      message: json["message"] as String? ?? "",
      error: json["error"] as String? ?? "",
      stack: json["stack"] as String? ?? "",
    );
  }

  // Convert object to JSON
  Map<dynamic, dynamic> toJson() {
    return {
      "image": image,
      "createdAt": createdAt?.toIso8601String(),
      "name": name,
      "_id": id,
      "slug": slug,
      "updatedAt": updatedAt?.toIso8601String(),
      "message": message,
      "error": error,
      "stack": stack,
    };
  }
}
