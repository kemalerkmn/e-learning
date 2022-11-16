// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String? courseTitle,
      durationText,
      completion,
      id,
      image,
      courseInfo,
      tutor,
      price;
  List<dynamic>? users;
  List<dynamic>? lessons;
  // bool? hasis;
  Course(
    this.lessons,
    this.users,
    this.price,
    this.courseInfo,
    this.tutor,
    this.id,
    // this.hasis,
    this.durationText,
    this.courseTitle,
    this.completion,
    this.image,
    // this.price,
  );
  Map<String, dynamic> toMap() {
    return {
      'courseTitle': courseTitle,
      'durationText': durationText,
      'completion': completion,
      // // 'hasis': hasis,
      'image': image,
      'price': price,
      'courseInfo': courseInfo,
      'tutor': tutor,
      'lessons': lessons,

      // 'price': price,
    };
  }

  Course.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        courseTitle = doc.data()!["courseName"],
        durationText = doc.data()!["Duration"],
        completion = doc.data()!["completion"],
        price = doc.data()!["price"],
        lessons = doc.data()!["lessons"],

        // hasis = doc.data()!["isHas"],
        image = doc.data()!["image"],
        courseInfo = doc.data()!["courseInfo"],
        tutor = doc.data()!["tutor"],
        users = doc.data()!["users"];
}

class Lesson {
  String? title;
  Lesson(
    this.title,
    // this.videoUrl,
  );
  Lesson.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : title = doc.data()!["title"];
}
