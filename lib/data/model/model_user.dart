class ModelUser {
  int? id;
  String? name;
  String? email;
  bool? emailVerifiedAt;
  int? currentOrganizationId;
  int? mediaId;
  String? createdAt;
  String? updatedAt;

  ModelUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.currentOrganizationId,
    this.mediaId,
    this.createdAt,
    this.updatedAt,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      currentOrganizationId: json['current_organization_id'],
      mediaId: json['media_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'current_organization_id': currentOrganizationId,
      'media_id': mediaId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
