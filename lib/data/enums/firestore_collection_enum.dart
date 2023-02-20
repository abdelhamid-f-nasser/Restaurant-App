enum FirestoreCollection{
  food('food_items'),
  orders('orders'),
  favourite('user_favourites');

  const FirestoreCollection(this.path);

  final String path;

}
