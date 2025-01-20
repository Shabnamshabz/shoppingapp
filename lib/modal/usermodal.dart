class Usermodal
{ final String uid;
final String email;
final String password;
final String firstname;
final String lastname;
final String dob;
final String gender;
final String? address;
Usermodal({required this.uid, required this.email, required this.password, required this.firstname, required this.lastname,
    required this.dob, required this.gender,this.address});

Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'email': this.email,
      'password': this.password,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'dob': this.dob,
      'gender': this.gender,
      'address': this.address,
    };
  }

  factory Usermodal.fromMap(Map<String, dynamic> map) {
    return Usermodal(
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      dob: map['dob'] as String,
      gender: map['gender'] as String,
      address: map['address'] as String,
    );
  }
}