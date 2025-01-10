const String tableContact = 'tbl_contact';

const String columnId = 'id';
const String columnName = 'name';
const String columnMobile = '';
const String columnEmail = 'email';
const String columnAddress = 'tbl_contact';
const String columnCompany = 'tbl_contact';
const String columnDesignation = 'tbl_contact';
const String columnWebsite = 'tbl_contact';
const String columnImage = 'tbl_contact';
const String columnFavorite = 'tbl_contact';

class ContactModel {
  int id;
  String name;
  String mobile;
  String email;
  String address;
  String company;
  String designation;
  String website;
  String image;
  bool favorite;

  ContactModel(
      {this.id = -1,
      required this.name,
      required this.mobile,
      this.email = '',
      this.address = '',
      this.company = '',
      this.designation = '',
      this.website = '',
      this.image = '',
      this.favorite = false});
}
