/*
se crea el modelo Address para el manejo de
la información de la dirección del usuario
*/

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
      };
}
