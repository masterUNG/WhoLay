class UserModel {
  // Field

  String firstName;
  String lastName;

  String gender; // m = male; f = female
  String race;
  String nationality;
  String religion;
  DateTime birthdate;
  bool showAge;
  bool showBirthdate;
  String docCountry;
  String docType;
  String docNo;
  DateTime docExpire;

  String addrNo;
  String addrPlace;
  String addrRoad;
  String addrTumbol;
  String addrAmphor;
  String addrProvince;
  String addrZipCode;
  String addrCountry;

  // Constructor
  UserModel(
      this.firstName,
      this.lastName,
      this.gender,
      this.race,
      this.nationality,
      this.religion,
      this.birthdate,
      this.showAge,
      this.showBirthdate,
      this.docCountry,
      this.docType,
      this.docNo,
      this.docExpire,
      this.addrNo,
      this.addrPlace,
      this.addrRoad,
      this.addrTumbol,
      this.addrAmphor,
      this.addrProvince,
      this.addrZipCode,
      this.addrCountry);
}
