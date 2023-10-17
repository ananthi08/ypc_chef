import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// for signup model
class Signup {
  String email;
  String password;
  String userName;
  String mobileNumber;
  Signup({
    required this.email,
    required this.password,
    required this.userName,
    required this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'userName': userName,
      'mobileNumber': mobileNumber,
    };
  }

  factory Signup.fromMap(Map<String, dynamic> map) {
    return Signup(
      email: map['email'] as String,
      password: map['password'] as String,
      userName: map['userName'] as String,
      mobileNumber: map['mobileNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Signup.fromJson(String source) =>
      Signup.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ............................................../.........................
// for signin model
class Signinn {
  String email;
  String password;
  // String OTP;
  Signinn({
    required this.email,
    required this.password,
    // required this.OTP,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      // 'userName': OTP,
    };
  }

  factory Signinn.fromMap(Map<String, dynamic> map) {
    return Signinn(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Signinn.fromJson(String source) =>
      Signinn.fromMap(json.decode(source) as Map<String, dynamic>);
}

// /for reset password
class Resetpassword {
  String newpassword;
  String? email;

  Resetpassword({
    required this.newpassword,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'password': newpassword, 'email': email};
  }

  factory Resetpassword.fromMap(Map<String, dynamic> map) {
    return Resetpassword(
      newpassword: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resetpassword.fromJson(String source) =>
      Resetpassword.fromMap(json.decode(source) as Map<String, dynamic>);
}

// forgetpassword verify email

class Verifyemail {
  String email;

  Verifyemail({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory Verifyemail.fromMap(Map<String, dynamic> map) {
    return Verifyemail(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Verifyemail.fromJson(String source) =>
      Verifyemail.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ./..............send otp with mobile number ./.......sendotpwith_mobilenumber

class sendOtP {
  String mobileNumber;

  sendOtP({
    required this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mobileNumber': mobileNumber,
    };
  }

  factory sendOtP.fromMap(Map<String, dynamic> map) {
    return sendOtP(
      mobileNumber: map['mobileNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory sendOtP.fromJson(String source) =>
      sendOtP.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ............verify otp with mob num

class VerifyOTP {
  String? otp;
  String? mobileNumber;
  VerifyOTP({
    required this.otp,
    required this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'otp': otp,
      'mobileNumber': mobileNumber,
    };
  }

  factory VerifyOTP.fromMap(Map<String, dynamic> map) {
    return VerifyOTP(
      otp: map['otp'] as String,
      mobileNumber: map['mobileNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOTP.fromJson(String source) =>
      VerifyOTP.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ./...............OTP IN SIGNIN LOGIN....

class VerifyOTPRequest {
  String? mobileNumber;
  String otp;
  String userId;
  VerifyOTPRequest({
    required this.otp,
    required this.mobileNumber,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'otp': otp,
      'mobileNumber': mobileNumber,
      'userId': userId,
    };
  }

  factory VerifyOTPRequest.fromMap(Map<String, dynamic> map) {
    return VerifyOTPRequest(
      mobileNumber: map['mobileNumber'] as String,
      otp: map['otp'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOTPRequest.fromJson(String source) =>
      VerifyOTPRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
