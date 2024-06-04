import '/components/profile_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel1;
  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel2;
  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel3;
  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel4;
  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel5;
  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel6;

  @override
  void initState(BuildContext context) {
    profileCardModel1 = createModel(context, () => ProfileCardModel());
    profileCardModel2 = createModel(context, () => ProfileCardModel());
    profileCardModel3 = createModel(context, () => ProfileCardModel());
    profileCardModel4 = createModel(context, () => ProfileCardModel());
    profileCardModel5 = createModel(context, () => ProfileCardModel());
    profileCardModel6 = createModel(context, () => ProfileCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profileCardModel1.dispose();
    profileCardModel2.dispose();
    profileCardModel3.dispose();
    profileCardModel4.dispose();
    profileCardModel5.dispose();
    profileCardModel6.dispose();
  }
}
