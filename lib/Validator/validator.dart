class Validator{
  static String? validateField({required String value}){
    if(value.isEmpty){
      return 'Text field not be empty';
  }
    return null;
  }
  static String? validatUserId({required String uid}){
    if(uid.isEmpty){
     return 'Text field not be empty';
}
    else if(uid.length<=5){
      return 'User id should not be greater than 5 characters';
}
    return null;
  }
}