import '/backend/supabase/supabase.dart';
import '/components/app_nav_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'splash_copy_widget.dart' show SplashCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashCopyModel extends FlutterFlowModel<SplashCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for AppNav component.
  late AppNavModel appNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appNavModel = createModel(context, () => AppNavModel());
  }

  void dispose() {
    tabBarController?.dispose();
    appNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
