String getTitlePart(String title) {
  List<String> parts = title.split('|');
  return parts.isNotEmpty ? parts[0] : title;
}
