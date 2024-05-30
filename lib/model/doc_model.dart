
class DocumentModel {
  DocumentModel({
    required this.id, 
    required this.text
  });

  final String id;
  final String text;

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    final id = json["id"].toString();
    final text = json["text"].toString();
    return DocumentModel(
      id: id, 
      text: text
    );
  }
}