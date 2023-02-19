enum FirestoreCollection{
  food('food_items'),
  orders('orders');

  const FirestoreCollection(this.path);

  final String path;

}
