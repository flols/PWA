import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  DateTime birthDate;
  String image;
  String bloodGroup;
  int height;
  double weight;
  String eyeColor;
  Hair hair;
  String domain;
  String ip;
  Address address;
  String macAddress;
  String university;
  Bank bank;
  Company company;
  String ein;
  String ssn;
  String userAgent;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    maidenName: json["maidenName"],
    age: json["age"],
    gender: json["gender"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    password: json["password"],
    birthDate: DateTime.parse(json["birthDate"]),
    image: json["image"],
    bloodGroup: json["bloodGroup"],
    height: json["height"],
    weight: json["weight"]?.toDouble(),
    eyeColor: json["eyeColor"],
    hair: Hair.fromJson(json["hair"]),
    domain: json["domain"],
    ip: json["ip"],
    address: Address.fromJson(json["address"]),
    macAddress: json["macAddress"],
    university: json["university"],
    bank: Bank.fromJson(json["bank"]),
    company: Company.fromJson(json["company"]),
    ein: json["ein"],
    ssn: json["ssn"],
    userAgent: json["userAgent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "maidenName": maidenName,
    "age": age,
    "gender": gender,
    "email": email,
    "phone": phone,
    "username": username,
    "password": password,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "image": image,
    "bloodGroup": bloodGroup,
    "height": height,
    "weight": weight,
    "eyeColor": eyeColor,
    "hair": hair.toJson(),
    "domain": domain,
    "ip": ip,
    "address": address.toJson(),
    "macAddress": macAddress,
    "university": university,
    "bank": bank.toJson(),
    "company": company.toJson(),
    "ein": ein,
    "ssn": ssn,
    "userAgent": userAgent,
  };
}

class Address {
  String address;
  String city;
  Coordinates coordinates;
  String postalCode;
  String state;

  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    city: json["city"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
    postalCode: json["postalCode"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "coordinates": coordinates.toJson(),
    "postalCode": postalCode,
    "state": state,
  };
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Bank {
  String cardExpire;
  String cardNumber;
  String cardType;
  String currency;
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    cardExpire: json["cardExpire"],
    cardNumber: json["cardNumber"],
    cardType: json["cardType"],
    currency: json["currency"],
    iban: json["iban"],
  );

  Map<String, dynamic> toJson() => {
    "cardExpire": cardExpire,
    "cardNumber": cardNumber,
    "cardType": cardType,
    "currency": currency,
    "iban": iban,
  };
}

class Company {
  Address address;
  String department;
  String name;
  String title;

  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    address: Address.fromJson(json["address"]),
    department: json["department"],
    name: json["name"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "department": department,
    "name": name,
    "title": title,
  };
}

class Hair {
  String color;
  String type;

  Hair({
    required this.color,
    required this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
    color: json["color"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "type": type,
  };
}
