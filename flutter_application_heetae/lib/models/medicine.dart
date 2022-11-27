class Medicine {
  Medicine(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.alarms});
  final int id;
  final String name;
  final String? imagePath;
  final Set<String> alarms;
}
