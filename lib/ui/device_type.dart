
enum DeviceType {
  Phone,
  Tablet,
  Desktop,
}

DeviceType getDeviceType(double screenWidth) {
  if (screenWidth <= 576) {
    return DeviceType.Phone;
  } else if (screenWidth <= 900) {
    return DeviceType.Tablet;
  } else {
    return DeviceType.Desktop;
  }
}