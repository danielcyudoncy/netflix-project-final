import '/components/monthly_suscription_widget.dart';
import '/components/yearly_suscription_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_suscribtion_plan_widget.dart' show MySuscribtionPlanWidget;
import 'package:flutter/material.dart';

class MySuscribtionPlanModel extends FlutterFlowModel<MySuscribtionPlanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for MonthlySuscription component.
  late MonthlySuscriptionModel monthlySuscriptionModel;
  // Model for YearlySuscription component.
  late YearlySuscriptionModel yearlySuscriptionModel;

  @override
  void initState(BuildContext context) {
    monthlySuscriptionModel =
        createModel(context, () => MonthlySuscriptionModel());
    yearlySuscriptionModel =
        createModel(context, () => YearlySuscriptionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    monthlySuscriptionModel.dispose();
    yearlySuscriptionModel.dispose();
  }
}
