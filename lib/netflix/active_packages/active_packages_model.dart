import '/flutter_flow/flutter_flow_util.dart';
import 'active_packages_widget.dart' show ActivePackagesWidget;
import 'package:flutter/material.dart';

class ActivePackagesModel extends FlutterFlowModel<ActivePackagesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
