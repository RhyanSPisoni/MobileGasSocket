class Item {
  late String title;
  late bool done; // Propriedade 'done' marcada como 'late'

  Item({required this.title, required this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
  }
}
