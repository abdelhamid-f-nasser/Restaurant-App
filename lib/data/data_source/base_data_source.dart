

import 'package:cloud_firestore/cloud_firestore.dart';

class BaseDataSource {

  BaseDataSource({required this.firestoreInstance});

  final FirebaseFirestore firestoreInstance;
}
