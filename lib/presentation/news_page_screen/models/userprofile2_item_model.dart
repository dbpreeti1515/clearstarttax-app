import '../../../core/app_export.dart';

/// This class is used in the [userprofile2_item_widget] screen.
class Userprofile2ItemModel {
  Userprofile2ItemModel({
    this.userImage,
    this.andrewC,
    this.description,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgEllipse5);
    andrewC = andrewC ?? Rx("Andrew C.");
    description = description ??
        Rx("“It’s just so much of a relief you know? Somebody going through a major debt crisis I would say: take care of it now. Don’t wait for them to take your stuff. “");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? andrewC;

  Rx<String>? description;

  Rx<String>? id;
}
