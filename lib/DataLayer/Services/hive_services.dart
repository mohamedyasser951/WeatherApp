import 'package:hive/hive.dart';

class HiveServices {
  Future<bool> isExisting({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;

    return length != 0;
  }

  addBox<T>({required String boxName, required List<T> items}) async {
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.add(items);
    }
  }

 Future<List> getBox({required String boxName}) async {
    List boxData = [];
    final openBox = await Hive.openBox(boxName);

    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxData.add(openBox.getAt(i));
    }
    return boxData;
  }
}
