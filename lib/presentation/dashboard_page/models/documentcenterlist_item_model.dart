import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';

/// This class is used in the [documentcenterlist_item_widget] screen.
class DocumentcenterlistItemModel {
  DocumentcenterlistItemModel({
    this.documentCenter,
    this.titleText,
    this.descriptionText,
    this.id,
    required this.routeName,
  }) {
    documentCenter =
        documentCenter ?? Rx(ImageConstant.imgSolarDocumentAddOutline);
    titleText = titleText ?? Rx("Document Center");
    descriptionText =
        descriptionText ?? Rx("View and Upload Essential Case Files");
    id = id ?? Rx("");

  }

  Rx<String>? documentCenter;

  Rx<String>? titleText;

  Rx<String>? descriptionText;

  Rx<String>? id;
  Rx<Widget> routeName;
}
