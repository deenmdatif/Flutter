// Abstract class Role
abstract class Role {
  void displayRole();
}

// Class Person
class Person implements Role {
  final String name;
  final int age;
  final String address;

  Person({required this.name, required this.age, required this.address});

  // Getter methods
  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  // Abstract method implementation
  @override
  void displayRole() {
    print("Role: Person");
  }
}

// Class Student
class Student extends Person {
  final String studentID;
  final String grade;
  final List<int> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name: name, age: age, address: address);

  // Override displayRole method
  @override
  void displayRole() {
    print("Role: Student");
  }

  // Method to calculate average score
  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// Class Teacher
class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  // Override displayRole method
  @override
  void displayRole() {
    print("Role: Teacher");
  }

  // Method to display courses taught
  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// StudentManagementSystem class
class StudentManagementSystem {
  void main() {
    // Creating a Student instance
    Student student = Student(
      name: "John Doe",
      age: 20,
      address: "123 Main St",
      studentID: "S123",
      grade: "A",
      courseScores: [90, 85, 82],
    );

    // Creating a Teacher instance
    Teacher teacher = Teacher(
      name: "Mrs. Smith",
      age: 35,
      address: "456 Oak St",
      teacherID: "T456",
      coursesTaught: ["Math", "English", "Bangla"],
    );

    // Displaying Student Information
    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName}");
    print("Age: ${student.getAge}");
    print("Address: ${student.getAddress}");
    print("Average Score: ${student.calculateAverageScore()}");
    print("");

    // Displaying Teacher Information
    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName}");
    print("Age: ${teacher.getAge}");
    print("Address: ${teacher.getAddress}");
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem().main();
}
