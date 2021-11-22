class Address {
  int id = -1;
  String street= "";
  String house ="";
  int floor =-1;
  String apartment ="";
  int entrance = -1;
  String? lat = "";
  String? lng = "";
  int? user =-1;

  Address(this.street, this.house, this.floor, this.apartment, this.entrance,
      this.lat, this.lng, this.user);

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    house = json['house'];
    floor = json['floor'];
    apartment = json['apartment'];
    entrance = json['entrance'];
    lat = json['lat'];
    lng = json['lng'];
    user = json['user'];
  }
}