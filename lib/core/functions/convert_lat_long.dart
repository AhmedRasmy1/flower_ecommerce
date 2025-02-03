List<double> convertLatLong(String? latLong) {
  if (latLong == null || latLong.isEmpty) {
    return [30.0299336, 31.2706293, 12];
  }
  try {
    List<String> parts = latLong.split(',');

    if (parts.length != 2) {
      throw FormatException('الإحداثيات غير صحيحة');
    }
    double latitude = double.parse(parts[0]);
    double longitude = double.parse(parts[1]);

    return [latitude, longitude];
  } catch (e) {
    print('خطأ: $e');
    return [0.0, 0.0];
  }
}