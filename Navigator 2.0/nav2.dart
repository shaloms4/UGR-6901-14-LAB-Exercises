import 'package:flutter/material.dart';

class Course {
  String code;
  String title;
  String description;

  Course({required this.code, required this.title, this.description = ""});
}

class CoursesListScreen extends StatelessWidget {
  final List<Course> courses;
  final ValueChanged<Course> onCourseTapped;

  const CoursesListScreen({required this.courses, required this.onCourseTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courses List")),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text(course.code),
            onTap: () => onCourseTapped(course),
          );
        },
      ),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  const CourseDetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(course.title),
            Text(course.code),
            Text(course.description),
          ],
        ),
      ),
    );
  }
}

class CourseApp extends StatefulWidget {
  @override
  _CourseAppState createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  Course? _selectedCourse;

  List<Course> courses = [
    Course(
      code: "SiTE-001",
      title: "Introduction To Programming",
      description: "Computer Organization, Architecture, Programming",
    ),
    
  ];

  void _handleCourseTap(Course course) {
    setState(() {
      _selectedCourse = course;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('CourseListScreen'),
            child: CoursesListScreen(courses: courses, onCourseTapped: _handleCourseTap),
          ),
          if (_selectedCourse != null)
            MaterialPage(
              key: ValueKey(_selectedCourse!.code),
              child: CourseDetailsScreen(course: _selectedCourse!),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          
          setState(() {
            _selectedCourse = null;
          });
          return true;
        },
      ),
    );
  }
}
