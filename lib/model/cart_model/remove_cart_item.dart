class RemoveItem {
  String? msg;

  RemoveItem({this.msg});

  factory RemoveItem.fromJson(Map<String, dynamic> json) {
    RemoveItem item = RemoveItem();
    item.msg = json['msg'];
    return item;
  }
}
