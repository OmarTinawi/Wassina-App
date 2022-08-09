class AddressModel {
  String title;
  String country;
  String city;
  String name;
  String address1;
  String? address2;
  String phone;
  String telephone;
  bool defaultAddress;

  AddressModel({
    required this.title,
    required this.country,
    required this.city,
    required this.name,
    required this.address1,
    this.address2,
    required this.phone,
    required this.telephone,
    this.defaultAddress = false,
  });
}

List<AddressModel> addresses = [
  AddressModel(title: "My Home", country: "Syria", city: "Damascus", name: "Omar Altinawi", address1: "Muhajreen Shata Building NO.6", phone: "+963966001101", telephone: "+963113739299" , defaultAddress: true),
  AddressModel(title: "Office", country: "Syria", city: "Homs", name: "Saleh Enayeh", address1: "Arnous near nabil nafiseh sweet", phone: "+963996006746", telephone: "+963114425685"),
  AddressModel(title: "Grandmother's home", country: "Syria", city: "Damascus", name: "Nayla Alsharif", address1: "Alrawdah Nouri Basha street Building NO.22", phone: "+963993442579", telephone: "+963113332432"),
];