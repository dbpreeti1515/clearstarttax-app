import '../../../core/app_export.dart';

/// This class is used in the [article_item_widget] screen.
class ArticleItemModel {
  ArticleItemModel({
    this.articleImage,
    this.articleTitle,
    this.readMoreText,
    this.id,
  }) {
    articleImage = articleImage ?? Rx(ImageConstant.imgRectangle5);
    articleTitle = articleTitle ??
        Rx("IRS Postpones Controversial Reporting Rule for Third-Party Platform Transactions");
    readMoreText = readMoreText ?? Rx("Read more");
    id = id ?? Rx("");
  }

  Rx<String>? articleImage;

  Rx<String>? articleTitle;

  Rx<String>? readMoreText;

  Rx<String>? id;
}
