import 'package:preeti_s_application3/presentation/HomeScreen/HomeScreen.dart';
import 'package:preeti_s_application3/presentation/HomeScreen/controller/HomeScreenController.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/get_in_touch_screen.dart';

import '../../../core/app_export.dart';
import 'documentcenterlist_item_model.dart';
import 'article_item_model.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel {

  Rx<List<DocumentcenterlistItemModel>> documentcenterlistItemList = Rx([
    DocumentcenterlistItemModel(
      routeName: Homescreen(selectedIndexValue: 1,).obs,
        documentCenter: ImageConstant.imgSolarDocumentAddOutline.obs,
        titleText: "Document Center".obs,
        descriptionText: "View and Upload Essential Case Files".obs),
    DocumentcenterlistItemModel(
        routeName: Homescreen(selectedIndexValue: 2,).obs,
        documentCenter: ImageConstant.imgSettings.obs,
        titleText: "Payment Hub".obs,
        descriptionText: "Make a Payment, Review History, Update Method".obs),
    DocumentcenterlistItemModel(
        routeName: Homescreen(selectedIndexValue: 3,).obs,
        documentCenter: ImageConstant.imgCalendar.obs,
        titleText: "Schedule an Appointment".obs,
        descriptionText: "Set Up Your Appointment in a Few Clicks".obs),
    DocumentcenterlistItemModel(
        routeName: GetInTouchScreen().obs,

        documentCenter: ImageConstant.imgSolarChatDotsBroken.obs,
        titleText: "Get In Touch".obs,
        descriptionText:
            "Connect with Your Assigned Case Manager via Message".obs)
  ]);

  Rx<List<ArticleItemModel>> articleItemList = Rx([
    ArticleItemModel(
        articleImage: ImageConstant.imgRectangle5.obs,
        articleTitle:
            "IRS Postpones Controversial Reporting Rule for Third-Party Platform Transactions"
                .obs,
        readMoreText: "Read more".obs),
    ArticleItemModel(
        articleImage: ImageConstant.imgRectangle5100x146.obs,
        articleTitle:
            "Future of Taxes: How Consumption Tax Enhances Long-Term Prosperity........"
                .obs,
        readMoreText: "Read more".obs)
  ]);

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse5.obs,
        andrewC: "Andrew C.".obs,
        description:
            "“It’s just so much of a relief you know? Somebody going through a major debt crisis I would say: take care of it now. Don’t wait for them to take your stuff. “"
                .obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse680x80.obs,
        andrewC: "Lori L.".obs,
        description:
            "“I’m just not as stressed as I was once the compromised offer was given to me, and if anybody else is going through this issue please give Clear Start Tax a call.”"
                .obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse61.obs,
        andrewC: "David M.".obs,
        description:
            "“I don’t know what I would have done without their help. I really don’t… I would recommend Clear Start Tax Relief because they did a good job for me. “"
                .obs)
  ]);
}
