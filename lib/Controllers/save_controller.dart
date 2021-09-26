import 'package:equbapp/Models/collected_money_models.dart';
import 'package:get/get.dart';

class SaveMoneyCollectedData extends GetxController {
  RxList<CollectedMoneyModel> mycartList = <CollectedMoneyModel>[].obs;

  void addItem(final createdAt, final title, final frequency, final amount,
      final membersCount, final id, RxBool issaved) {
    final cartsproduct = CollectedMoneyModel(
        createdAt: createdAt,
        title: title,
        frequency: frequency,
        amount: amount,
        membersCount: membersCount,
        id: id,
        issaved: issaved);
    mycartList.add(cartsproduct);
    cartsproduct.issaved.value = true;
    print(cartsproduct.issaved.value);
  }
}
