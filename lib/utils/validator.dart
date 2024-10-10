class Validator {

  String? fieldNullCheck(String data,String quote) {
    if (data.isEmpty) {
      return quote;
    }
    return null;
  }

  String? nameValidate(String name) {
    if (name.isEmpty) {
      return 'name is required';
    }
    if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? validateNameStructure(String name){
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegExp.hasMatch(name)) {
      return 'Invalid characters in the name';
    }
    return null;
  }

  String? emailValidate(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,7})$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? passwordNullChech(String pwd) {
    if (pwd.isEmpty) {
      return 'password field is required';
    }
    return null;
  }

  String? validatePasswordStrengh(String password){
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()-_+=])[a-zA-Z0-9!@#\$%^&*()-_+=]{7,}$');
    if (!regex.hasMatch(password)) {
      return 'Please follow the required Rules to fill password';
    }
    return null;
  }

}
