
import 'reg_ex.dart';

/// contains validators for forms
class FormValidator {



  static String? validateEmail(String value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Please enter an email";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter a password";
    } else {
      return null;
    }
  }

  static String? validateMobile(String value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    // else if (!regExp.hasMatch(value)) {
    //   return 'Please enter valid mobile number';
    // }
    else if (value.length < 8) {
      return 'Phone number can\'t be smaller than 8 digits';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Please enter a name";
    }
    if (!RegEx.alphabetRegEx.hasMatch(name)) {
      return "Name shouldn't contain digits";
    }
    return null;
  }

  static String? validateFileName(String fileName) {
    if (fileName.isEmpty) {
      return "New file name is required";
    }
    if (RegEx.slashRegEx.hasMatch(fileName)) {
      return "Please enter a valid file name, file name shouldn't contain slashes";
    }
    return null;
  }

  static String? validateFolderName(String folderName) {
    if (folderName.isEmpty) {
      return "New folder name is required";
    }
    if (RegEx.slashRegEx.hasMatch(folderName)) {
      return "Please enter a valid folder name, folder name shouldn't contain slashes";
    }
    return null;
  }
}