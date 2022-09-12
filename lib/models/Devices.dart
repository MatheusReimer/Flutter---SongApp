class Device {
  Device({
    required this.id,
    required this.isActive,
    required this.isPrivateSession,
    required this.isRestricted,
    required this.name,
    required this.type,
    required this.volumePercent,
  });

  String id;
  bool isActive;
  bool isPrivateSession;
  bool isRestricted;
  String name;
  String type;
  int volumePercent;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
      id: json["id"],
      isActive: json["is_active"],
      isPrivateSession: json["is_private_session"],
      isRestricted: json["is_restricted"],
      name: json["name"],
      type: json["type"],
      volumePercent: json["volume_percent"]);
}
