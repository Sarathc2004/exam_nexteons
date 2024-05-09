class GlobalGalleryItem {
  final String id;
  final String name;
  final String globalGalleryCategoryId;
  final int docType;
  final int uid;
  final int type;
  final String url;
  final String createdUserId;
  final int createdAt;
  final dynamic updatedUserId;
  final int updatedAt;
  final int status;
  final int v;

  GlobalGalleryItem({
    required this.id,
    required this.name,
    required this.globalGalleryCategoryId,
    required this.docType,
    required this.uid,
    required this.type,
    required this.url,
    required this.createdUserId,
    required this.createdAt,
    required this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  factory GlobalGalleryItem.fromJson(Map<String, dynamic> json) {
    return GlobalGalleryItem(
      id: json['_id'],
      name: json['_name'],
      globalGalleryCategoryId: json['_globalGalleryCategoryId'],
      docType: json['_docType'],
      uid: json['_uid'],
      type: json['_type'],
      url: json['_url'],
      createdUserId: json['_createdUserId'],
      createdAt: json['_createdAt'],
      updatedUserId: json['_updatedUserId'],
      updatedAt: json['_updatedAt'],
      status: json['_status'],
      v: json['__v'],
    );
  }
}
