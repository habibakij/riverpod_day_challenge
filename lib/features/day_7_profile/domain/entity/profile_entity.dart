class ProfileEntity {
  final int? id;
  final String? email;
  final String? name;
  final String? role;
  final String? avatar;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  ProfileEntity({
    this.id,
    this.email,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });
}
