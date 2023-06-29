class item {
  bool? done;

  item({this.done});

  item.fromJson(Map<String, dynamic> json) {
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['done'] = this.done;
    return data;
  }
}
