enum AddressType { home, office, other }

class Address {
  final String id;
  final String lable;
  final String fullAddress;
  final String city;
  final String state;
  final String zipcode;
  final bool isDefault;
  final AddressType type;

  const Address({
    required this.id,
    required this.lable,
    required this.fullAddress,
    required this.city,
    required this.state,
    required this.zipcode,
    this.isDefault = false,
    this.type = AddressType.home,
  });
  String get typeString => type.name;
}
