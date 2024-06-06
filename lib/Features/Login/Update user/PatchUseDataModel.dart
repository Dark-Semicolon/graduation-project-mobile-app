class PatchUseData {
  String? name;

  PatchUseData({
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    return data;
  }
}
