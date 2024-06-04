import '/backend/api_requests/api_calls.dart';
import '/components/search_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Search Movies)] action in TextField widget.
  ApiCallResponse? apiResult;
  // Model for SearchText component.
  late SearchTextModel searchTextModel;

  @override
  void initState(BuildContext context) {
    searchTextModel = createModel(context, () => SearchTextModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    searchTextModel.dispose();
  }
}
