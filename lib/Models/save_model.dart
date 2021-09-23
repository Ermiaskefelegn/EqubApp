class Save {
  final String name;
  bool isSave;
  Save({this.isSave = false, required this.name});
  void toogleSave() {
    isSave = !isSave;
  }
}
