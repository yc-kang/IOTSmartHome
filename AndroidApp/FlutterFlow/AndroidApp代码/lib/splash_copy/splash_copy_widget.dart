import '/backend/supabase/supabase.dart';
import '/components/app_nav_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_copy_model.dart';
export 'splash_copy_model.dart';

class SplashCopyWidget extends StatefulWidget {
  const SplashCopyWidget({Key? key}) : super(key: key);

  @override
  _SplashCopyWidgetState createState() => _SplashCopyWidgetState();
}

class _SplashCopyWidgetState extends State<SplashCopyWidget>
    with TickerProviderStateMixin {
  late SplashCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashCopyModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100.0,
                        height: 1.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 12,
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 87,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.00, 1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sensors',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                fontSize: 24.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'Sensors Data Monitoring',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: Color(0xFF57636C),
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.00, -1.00),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.asset(
                                          'assets/images/Launcher_2.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Graph',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      unselectedLabelStyle: TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      indicatorWeight: 1.0,
                                      tabs: [
                                        Tab(
                                          text: 'Air Quality',
                                        ),
                                        Tab(
                                          text: 'Humidity',
                                        ),
                                        Tab(
                                          text: 'Temperature',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 210.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: FutureBuilder<
                                                    List<SensorDataRow>>(
                                                  future: SensorDataTable()
                                                      .queryRows(
                                                    queryFn: (q) => q
                                                        .gte(
                                                          'id',
                                                          101,
                                                        )
                                                        .order('time',
                                                            ascending: true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<SensorDataRow>
                                                        chartSensorDataRowList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 370.0,
                                                      height: 230.0,
                                                      child:
                                                          FlutterFlowLineChart(
                                                        data: [
                                                          FFLineChartData(
                                                            xData:
                                                                chartSensorDataRowList
                                                                    .take(20)
                                                                    .toList()
                                                                    .map((e) =>
                                                                        e.time)
                                                                    .withoutNulls
                                                                    .toList(),
                                                            yData: chartSensorDataRowList
                                                                .take(20)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.dataField)
                                                                .withoutNulls
                                                                .toList(),
                                                            settings:
                                                                LineChartBarData(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              barWidth: 2.0,
                                                              isCurved: true,
                                                              preventCurveOverShooting:
                                                                  true,
                                                            ),
                                                          )
                                                        ],
                                                        chartStylingInfo:
                                                            ChartStylingInfo(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          borderWidth: 1.0,
                                                        ),
                                                        axisBounds: AxisBounds(
                                                          minY: 1700.0,
                                                          maxY: 2200.0,
                                                        ),
                                                        xAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title: 'Time (hhmm)',
                                                          titleTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 8.0,
                                                          ),
                                                          labelInterval: 4.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) => val
                                                                    .toString(),
                                                          ),
                                                        ),
                                                        yAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title:
                                                              'Air Quality (ppm)',
                                                          titleTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          labelInterval: 100.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) => val
                                                                    .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 210.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: FutureBuilder<
                                                    List<SensorDataRow>>(
                                                  future: SensorDataTable()
                                                      .queryRows(
                                                    queryFn: (q) => q
                                                        .gte(
                                                          'id',
                                                          51,
                                                        )
                                                        .lte(
                                                          'id',
                                                          70,
                                                        )
                                                        .order('time',
                                                            ascending: true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<SensorDataRow>
                                                        chartSensorDataRowList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 370.0,
                                                      height: 230.0,
                                                      child:
                                                          FlutterFlowLineChart(
                                                        data: [
                                                          FFLineChartData(
                                                            xData:
                                                                chartSensorDataRowList
                                                                    .take(20)
                                                                    .toList()
                                                                    .map((e) =>
                                                                        e.time)
                                                                    .withoutNulls
                                                                    .toList(),
                                                            yData: chartSensorDataRowList
                                                                .take(20)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.dataField)
                                                                .withoutNulls
                                                                .toList(),
                                                            settings:
                                                                LineChartBarData(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              barWidth: 2.0,
                                                              isCurved: true,
                                                              preventCurveOverShooting:
                                                                  true,
                                                            ),
                                                          )
                                                        ],
                                                        chartStylingInfo:
                                                            ChartStylingInfo(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          borderWidth: 1.0,
                                                        ),
                                                        axisBounds: AxisBounds(
                                                          minY: 0.0,
                                                          maxY: 100.0,
                                                        ),
                                                        xAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title: 'Time (hhmm)',
                                                          titleTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 8.0,
                                                          ),
                                                          labelInterval: 4.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) => val
                                                                    .toString(),
                                                          ),
                                                        ),
                                                        yAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title: 'Humidity (%)',
                                                          titleTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          labelInterval: 10.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) => val
                                                                    .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 210.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: FutureBuilder<
                                                    List<SensorDataRow>>(
                                                  future: SensorDataTable()
                                                      .queryRows(
                                                    queryFn: (q) => q
                                                        .lte(
                                                          'id',
                                                          20,
                                                        )
                                                        .order('time',
                                                            ascending: true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<SensorDataRow>
                                                        chartSensorDataRowList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 370.0,
                                                      height: 230.0,
                                                      child:
                                                          FlutterFlowLineChart(
                                                        data: [
                                                          FFLineChartData(
                                                            xData:
                                                                chartSensorDataRowList
                                                                    .take(20)
                                                                    .toList()
                                                                    .map((e) =>
                                                                        e.time)
                                                                    .withoutNulls
                                                                    .toList(),
                                                            yData: chartSensorDataRowList
                                                                .take(20)
                                                                .toList()
                                                                .map((e) =>
                                                                    e.dataField)
                                                                .withoutNulls
                                                                .toList(),
                                                            settings:
                                                                LineChartBarData(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              barWidth: 2.0,
                                                              isCurved: true,
                                                              preventCurveOverShooting:
                                                                  true,
                                                            ),
                                                          )
                                                        ],
                                                        chartStylingInfo:
                                                            ChartStylingInfo(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          borderWidth: 1.0,
                                                        ),
                                                        axisBounds: AxisBounds(
                                                          minY: 15.0,
                                                          maxY: 30.0,
                                                        ),
                                                        xAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title: 'Time (hhmm)',
                                                          titleTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 8.0,
                                                          ),
                                                          labelInterval: 4.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) => val
                                                                    .toString(),
                                                          ),
                                                        ),
                                                        yAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title:
                                                              'Temperature (C)',
                                                          titleTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              TextStyle(
                                                            fontSize: 8.0,
                                                          ),
                                                          labelInterval: 5.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) => val
                                                                    .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: wrapWithModel(
                model: _model.appNavModel,
                updateCallback: () => setState(() {}),
                child: AppNavWidget(
                  navOneIcon: Icon(
                    Icons.home,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  navTwoIcon: Icon(
                    Icons.area_chart,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  navThreeIcon: Icon(
                    Icons.air,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
