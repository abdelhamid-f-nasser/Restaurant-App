import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/firestore_collection_enum.dart';

class UserFavouritesDataSource extends BaseDataSource {
  UserFavouritesDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreFavouriteFoodCollection =>
      firestoreInstance.collection(FirestoreCollection.favourite.path);

  //Todo Add retrieval and storage of favourites
}
