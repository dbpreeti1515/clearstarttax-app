import '../../../core/app_export.dart';
import 'userprofile1_item_model.dart';
import 'userprofile2_item_model.dart';

/// This class defines the variables used in the [news_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NewsPageModel {
  Rx<List<Userprofile1ItemModel>> userprofile1ItemList = Rx([
    Userprofile1ItemModel(
        corporateTransparencyText:
            "Corporate Transparency Act: What You Need to Know Before Jan. 1, 2024"
                .obs,
        readMoreText: "Read more".obs),
    Userprofile1ItemModel(
        corporateTransparencyText:
            "Corporate Transparency Act: What You Need to Know Before Jan. 1, 2024"
                .obs,
        readMoreText: "Read more".obs),
    Userprofile1ItemModel(
        corporateTransparencyText:
            "Corporate Transparency Act: What You Need to Know Before Jan. 1, 2024"
                .obs,
        readMoreText: "Read more".obs)
  ]);

  Rx<List<Userprofile2ItemModel>> userprofile2ItemList = Rx([
    Userprofile2ItemModel(
        userImage: ImageConstant.imgEllipse5.obs,
        andrewC: "Andrew C.".obs,
        description:
            "“It’s just so much of a relief you know? Somebody going through a major debt crisis I would say: take care of it now. Don’t wait for them to take your stuff. “"
                .obs),
    Userprofile2ItemModel(
        userImage: ImageConstant.imgEllipse680x80.obs,
        andrewC: "Lori L.".obs,
        description:
            "“I’m just not as stressed as I was once the compromised offer was given to me, and if anybody else is going through this issue please give Clear Start Tax a call.”"
                .obs),
    Userprofile2ItemModel(
        userImage: ImageConstant.imgEllipse61.obs,
        andrewC: "David M.".obs,
        description:
            "“I don’t know what I would have done without their help. I really don’t… I would recommend Clear Start Tax Relief because they did a good job for me. “"
                .obs)
  ]);
}
