import '/features/shipping/shipping.dart';

class AddressRepository {
  List<Address> getAddresses() {
    return const [
      Address(
        id: '1',
        lable: 'Home',
        fullAddress: 'No.54,Main Road, Wathtala',
        city: 'Wathtala',
        state: 'WP',
        zipcode: '1002',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        lable: 'Office',
        fullAddress: 'No.3/23/A/ Main Street, Colombo',
        city: 'Colombo',
        state: 'WP',
        zipcode: '2000',
        type: AddressType.office,
      ),
    ];
  }

  Address? getDefaultAddress() {
    return getAddresses().firstWhere(
      (address) => address.isDefault,
      orElse: () => getAddresses().first,
    );
  }
}
