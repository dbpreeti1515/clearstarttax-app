import '../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {
  Userprofile1ItemModel({
    this.corporateTransparencyText,
    this.readMoreText,
    this.id,
  }) {
    corporateTransparencyText = corporateTransparencyText ??
        Rx("Corporate Transparency Act: What You Need to Know Before Jan. 1, 2024");
    readMoreText = readMoreText ?? Rx("Read more");
    id = id ?? Rx("");
  }

  Rx<String>? corporateTransparencyText;

  Rx<String>? readMoreText;

  Rx<String>? id;
}
