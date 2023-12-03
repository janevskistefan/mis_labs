import 'package:flutter/material.dart';

void main() {
  runApp(const Lab1Exercise());
}

class Lab1Exercise extends StatefulWidget {
  const Lab1Exercise({super.key});

  @override
  State<Lab1Exercise> createState() => _Lab1ExerciseState();
}

class _Lab1ExerciseState extends State<Lab1Exercise> {
  final GlobalKey<FormState> _addCourseFormKey = GlobalKey<FormState>();
  final TextEditingController _addCourseTextEditingController =
      TextEditingController();

  List<String> courses = [
    'Мобилни информациски системи',
    'Мобилни информациски системи',
    'Мобилни информациски системи',
    'Мобилни информациски системи',
    'Мобилни информациски системи'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff121212),
            title: const Text('201117', style: TextStyle(color: Colors.white)),
          ),
          body: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int courseIndex) {
                return courseTile(courseIndex);
              }),
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return FloatingActionButton(
                onPressed: () {
                  displayAddCourseDialog(context);
                },
                child: const Icon(Icons.add),
              );
            },
          ),
        ));
  }

  Widget courseTile(int courseIndex) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
          title: Text(courses[courseIndex],
              style: const TextStyle(color: Colors.white)),
          tileColor: const Color(0xff121212),
          contentPadding: const EdgeInsets.all(10),
          trailing: IconButton(
              icon: const Icon(Icons.delete_outlined),
              color: Colors.white,
              onPressed: () => setState(() {
                    courses.removeAt(courseIndex);
                  }))),
    );
  }

  displayAddCourseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return addCourseDialog(context);
      },
    );
  }

  Widget addCourseDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text("Додади нов курс"),
      children: [
        Form(
            key: _addCourseFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _addCourseTextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Внеси име на курс',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    String enteredCourseName =
                        _addCourseTextEditingController.text;
                    setState(() => courses.add(enteredCourseName));
                    Navigator.of(context).pop();
                    _addCourseTextEditingController.clear();
                  },
                  child: const Text('Додај курс'),
                ),
              ],
            ))
      ],
    );
  }
}
