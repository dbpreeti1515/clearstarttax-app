import '../../../core/app_export.dart';
import 'newsarticle_item_model.dart';

/// This class defines the variables used in the [tax_news_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TaxNewsModel {
  Rx<List<NewsarticleItemModel>> newsarticleItemList = Rx([
    NewsarticleItemModel(
        articleImage: ImageConstant.imgRectangle5.obs,
        articleTitle:
            "IRS Postpones Controversial Reporting Rule for Third-Party Platform Transactions"
                .obs,
        readMoreText: "Read more".obs),
    NewsarticleItemModel(
        articleImage: ImageConstant.imgRectangle5100x146.obs,
        articleTitle:
            "Future of Taxes: How Consumption Tax Enhances Long-Term Prosperity........"
                .obs,
        readMoreText: "Read more".obs),
    NewsarticleItemModel(
        articleImage: ImageConstant.imgRectangle51.obs,
        articleTitle:
            "Corporate Transparency Act: What You Need to Know Before Jan. 1, 2024"
                .obs,
        readMoreText: "Read more".obs),
    NewsarticleItemModel(
        articleImage: ImageConstant.imgRectangle52.obs,
        articleTitle:
            "Unlock Tax-Free Giving with Qualified Charitable Distributions up........"
                .obs,
        readMoreText: "Read more".obs),
    NewsarticleItemModel(
        articleImage: ImageConstant.imgRectangle53.obs,
        articleTitle:
            "Unraveling the Mysteries of Tax Relief: Tax Credits vs. Tax Deductions"
                .obs,
        readMoreText: "Read more".obs),
    NewsarticleItemModel(
        articleImage: ImageConstant.imgRectangle54.obs,
        articleTitle:
            "Strategize Your Retirement: Maximize Tax Benefits with These End-of-Year Tax Tips"
                .obs,
        readMoreText: "Read more".obs)
  ]);
}
