
extension StringExtensions on String {

  // Capitalize first letter to string
  String toCapitalize(){
    if(isEmpty) return this;

    if(length == 1) return toUpperCase();

    return this[0].toUpperCase() + substring(1);
  }

}