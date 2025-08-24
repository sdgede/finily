class ModelCurrentOrganization {
  int? id;
  int? userId;
  String? name;
  bool? isPersonal;
  int? mediaId;
  String? createdAt;
  String? updatedAt;
  String? media;

  ModelCurrentOrganization({
    this.id,
    this.userId,
    this.name,
    this.isPersonal,
    this.mediaId,
    this.createdAt,
    this.updatedAt,
    this.media,
  });

  factory ModelCurrentOrganization.fromJson(Map<String, dynamic> json) {
    return ModelCurrentOrganization(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      isPersonal: json['is_personal'],
      mediaId: json['media_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'is_personal': isPersonal,
      'media_id': mediaId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'media': media,
    };
  }
}
