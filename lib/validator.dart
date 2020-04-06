const String EMAIL_PATTERN = "^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$";
const String PW_PATTERN = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\$"; // by Art. 8 characters, at least 1 letter and 1 number.

class Checker {

  String value;

  bool get isBlank => (value == null || value.trim().isEmpty);
  bool get isNotBlank => ((value != null) && (value.trim().isNotEmpty));

  bool get isValidEmail {
    RegExp regExp = RegExp(EMAIL_PATTERN);
    return (regExp.hasMatch(value));
  }

  bool get isValidPassword {
    // RegExp regExp = RegExp(PW_PATTERN);
    // return (regExp.hasMatch(value));
    return (value.length >= 8);
  }

  bool get isValidThaiNationalityID {

    var val = value.replaceAll('-', '');
    bool _result = (val.length == 13);

    if (_result) {
      int _initNum = 13;
      int _sum = 0;

      for (int i = 0; i < val.length - 1; i++) {
        var s = val[i];
        if (i > 0) _initNum--;
        int chkNum = int.parse(s) * _initNum;
        _sum = _sum + chkNum;
      }
      var chkSum = _sum % 11;
      var chkDigit = 11 - chkSum;
      var strChk = chkDigit.toString();
      
      _result = (strChk[strChk.length - 1] == val[val.length - 1]);
    }

    return _result;
  }
}

