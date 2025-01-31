// Comments
// Variables and Data Types
// Control Flows and Looping
// Functions and Methods
// Void creates a function which does not return a value
// Main () name of the function (reserved for Dart)
// {code to be executed when the function runs}

void main() {
  // call the function
  greeting();
  print(addTwo(100));

  var result = addTwo(30);
  print(result);

  var inferredString = "William";

  String explicitString = "Jattin";

  print(inferredString + " " + explicitString);

  // null safety
  int? someNumber;

  print(someNumber);
  someNumber = 12;
  print(someNumber);

  // late keyword
  late int willBeNumber;

  int? goals;
  
  // control the flow
  if (goals != null) {
    print(goals + 2);
  } else {
    print("The variable goals is null");
  }

  // variable declaration
  // type of identifier/name = value;
  // Dynamic types
  // var identifier/name = value;

  // custom functions
  void greeting() {
    print("Hello");
  }

  // Operation with options or parameters
  int addTwo(int number) {
    return number + 2;
  }

  // built-in data types
  // numeric data types
  int age = 21;
  num count = 3;
  double temp = 29.9;

  // booleans (true or false)

  String school = "University of Miami";
  print("My school is $school");

  // built-in type operations
  print("My school name has ${school.length} characters");

  if (school.length > 20) {
    print("Your school has a long name");
  } else {
    print("Your school has a short name");
  }
}

// Collections: lists, arrays, and maps
// Strings for expressing text

