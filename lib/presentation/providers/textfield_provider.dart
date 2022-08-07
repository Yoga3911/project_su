import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/presentation/providers/user_provider.dart';

//! LOGIN
class TextFieldLoginProvider with ChangeNotifier {
  late TextEditingController _username;
  late TextEditingController _password;
  late TextEditingController _username2;
  late TextEditingController _nik;
  late TextEditingController _password2;
  late TextEditingController _password3;

  TextFieldLoginProvider() {
    _username = TextEditingController();
    _password = TextEditingController();
    _username2 = TextEditingController();
    _password2 = TextEditingController();
    _password3 = TextEditingController();
    _nik = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _username2.dispose();
    _nik.dispose();
    _password2.dispose();
    _password3.dispose();
    super.dispose();
  }

  TextEditingController get getUsername => _username;
  TextEditingController get getPassword => _password;
  TextEditingController get getPassword2 => _password2;
  TextEditingController get getPassword3 => _password3;
  TextEditingController get getUsername2 => _username2;
  TextEditingController get getNIK => _nik;
}

//! REGISTER
class TextFieldRegisterProvider with ChangeNotifier {
  late TextEditingController _username;
  late TextEditingController _password1;
  late TextEditingController _password2;
  late TextEditingController _desa;

  late bool _isTap;
  late List<String> _dataDesa;

  TextFieldRegisterProvider() {
    _username = TextEditingController();
    _password1 = TextEditingController();
    _password2 = TextEditingController();
    _desa = TextEditingController();
    _desa.text = "Pilih Desa";

    _isTap = false;
    _dataDesa = ["Kemiri", "Pakis", "Suci", "Panti"];
  }

  @override
  void dispose() {
    _username.dispose();
    _password1.dispose();
    _password2.dispose();
    _desa.dispose();
    super.dispose();
  }

  TextEditingController get getUsername => _username;
  TextEditingController get getPassword1 => _password1;
  TextEditingController get getPassword2 => _password2;
  TextEditingController get getDesa => _desa;
  List<String> get getDataDesa {
    _dataDesa.sort((a, b) => a.compareTo(b));
    return _dataDesa;
  }

  set setDesa(String val) {
    _desa.text = val;
    notifyListeners();
  }

  set setIsTap(bool val) {
    _isTap = val;
    notifyListeners();
  }

  bool get getIsTap => _isTap;
}

//! EDIT PROFILE
class TextFieldProfileProvider with ChangeNotifier {
  late TextEditingController _fullName;
  late TextEditingController _nik;
  late TextEditingController _birthDate;
  late TextEditingController _birthPlace;
  late TextEditingController _address;
  late TextEditingController _gender;
  late TextEditingController _telpon;
  late TextEditingController _alasan;
  late bool _isTap;
  File? _ktp;
  File? _kk;

  TextFieldProfileProvider() {
    _fullName = TextEditingController();
    _nik = TextEditingController();
    _birthDate = TextEditingController();
    _birthPlace = TextEditingController();
    _address = TextEditingController();
    _gender = TextEditingController();
    _telpon = TextEditingController();
    _alasan = TextEditingController();
    _isTap = false;
  }

  @override
  void dispose() {
    _fullName.dispose();
    _nik.dispose();
    _birthDate.dispose();
    _birthPlace.dispose();
    _address.dispose();
    _gender.dispose();
    _telpon.dispose();
    _alasan.dispose();
    super.dispose();
  }

  set setIsTap(bool val) {
    _isTap = val;
    notifyListeners();
  }

  bool get getIsTap => _isTap;

  TextEditingController get getFullName => _fullName;
  TextEditingController get getNIK => _nik;
  TextEditingController get getBirthDate => _birthDate;
  TextEditingController get getBirthPlace => _birthPlace;
  TextEditingController get getAddress => _address;
  TextEditingController get getGender => _gender;
  TextEditingController get getTelpon => _telpon;
  TextEditingController get getAlasan => _alasan;

  //! FOTO KTP & KK
  set setKTP(File val) {
    _ktp = val;
    notifyListeners();
  }

  set setKK(File val) {
    _kk = val;
    notifyListeners();
  }

  File? get getKTP => _ktp;
  File? get getKK => _kk;

  set setGender(String val) {
    _gender.text = val;
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();
  DateTime? _dateData;

  set setDateData(DateTime val) => _dateData = val;
  DateTime? get getDateData => _dateData;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setDateData = picked;
      _birthDate.text =
          DateFormat("EEEE, dd-MMMM-yyyy", "in_ID").format(selectedDate);
    }
  }

  void fillData(UserProvider userProvider, {String? alasan}) {
    final user = userProvider.getUser;
    user!.fullName != "-" ? _fullName.text = user.fullName : null;
    user.nik != "-" ? _nik.text = user.nik : null;
    user.address != "-" ? _address.text = user.address : null;
    user.telpon != "-" ? _telpon.text = user.telpon : null;
    user.birthPlace != "-" ? _birthPlace.text = user.birthPlace : null;
    final date = DateTime.fromMillisecondsSinceEpoch(user.birthDate);
    user.birthDate != 0
        ? _birthDate.text =
            DateFormat("EEEE, dd-MMMM-yyyy", "in_ID").format(date)
        : null;
    user.birthDate != 0 ? setDateData = date : null;
    user.gender != "-" ? _gender.text = user.gender : null;
    if (alasan != null) {
      _alasan.text = alasan;
    }
  }
}
