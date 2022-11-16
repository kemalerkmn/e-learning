import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning2/course/course.dart';

class Service {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  addEmployee(Course courseData) async {
    await _db.collection("Course").add(courseData.toMap());
  }

  updateEmployee(Course courseData, String documentId) async {
    await _db.collection("Course").doc(documentId).update(courseData.toMap());
  }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("Course").doc(documentId).delete();
  }

  Future<List<Course>> retrieveEmployees() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Course").get();

    return snapshot.docs
        .map((docSnapshot) => Course.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
