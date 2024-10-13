import '/backend/supabase/supabase.dart';
import '/components/app_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_copy_copy_model.dart';
export 'splash_copy_copy_model.dart';

class SplashCopyCopyWidget extends StatefulWidget {
  const SplashCopyCopyWidget({Key? key}) : super(key: key);

  @override
  _SplashCopyCopyWidgetState createState() => _SplashCopyCopyWidgetState();
}

class _SplashCopyCopyWidgetState extends State<SplashCopyCopyWidget> {
  late SplashCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashCopyCopyModel());
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
                                          'Air Conditional',
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
                                            'Control air-cond with an IR',
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
                      EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 9.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Auto Comfort-Level',
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
                      Switch.adaptive(
                        value: _model.switchValue ??= true,
                        onChanged: (newValue) async {
                          setState(() => _model.switchValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FutureBuilder<List<IrRow>>(
                                        future: (_model.requestCompleter1 ??=
                                                Completer<List<IrRow>>()
                                                  ..complete(
                                                      IrTable().querySingleRow(
                                                    queryFn: (q) => q.eq(
                                                      'name',
                                                      'on_off',
                                                    ),
                                                  )))
                                            .future,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<IrRow> buttonIrRowList =
                                              snapshot.data!;
                                          final buttonIrRow =
                                              buttonIrRowList.isNotEmpty
                                                  ? buttonIrRowList.first
                                                  : null;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              if (buttonIrRow!.dataField!) {
                                                await IrTable().update(
                                                  data: {
                                                    'data': false,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'name',
                                                    'on_off',
                                                  ),
                                                );
                                              } else {
                                                await IrTable().update(
                                                  data: {
                                                    'data': true,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'name',
                                                    'on_off',
                                                  ),
                                                );
                                              }

                                              setState(() => _model
                                                  .requestCompleter1 = null);
                                            },
                                            text: 'On/Off',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 200.0,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 65.0, 0.0, 0.0),
                                      child: Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: FutureBuilder<List<IrRow>>(
                                                future: (_model
                                                            .requestCompleter6 ??=
                                                        Completer<List<IrRow>>()
                                                          ..complete(IrTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'name',
                                                              'temp_up',
                                                            ),
                                                          )))
                                                    .future,
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
                                                  List<IrRow> iconIrRowList =
                                                      snapshot.data!;
                                                  final iconIrRow =
                                                      iconIrRowList.isNotEmpty
                                                          ? iconIrRowList.first
                                                          : null;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (iconIrRow!
                                                          .dataField!) {
                                                        await IrTable().update(
                                                          data: {
                                                            'data': false,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'name',
                                                            'temp_up',
                                                          ),
                                                        );
                                                      } else {
                                                        await IrTable().update(
                                                          data: {
                                                            'data': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'name',
                                                            'temp_up',
                                                          ),
                                                        );
                                                      }

                                                      setState(() => _model
                                                              .requestCompleter6 =
                                                          null);
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_up_sharp,
                                                      color: Colors.black,
                                                      size: 50.0,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 145.0, 0.0, 0.0),
                                            child: FutureBuilder<List<IrRow>>(
                                              future: (_model
                                                          .requestCompleter5 ??=
                                                      Completer<List<IrRow>>()
                                                        ..complete(IrTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q.eq(
                                                            'name',
                                                            'temp_down',
                                                          ),
                                                        )))
                                                  .future,
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
                                                List<IrRow> iconIrRowList =
                                                    snapshot.data!;
                                                final iconIrRow =
                                                    iconIrRowList.isNotEmpty
                                                        ? iconIrRowList.first
                                                        : null;
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (iconIrRow!.dataField!) {
                                                      await IrTable().update(
                                                        data: {
                                                          'data': false,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'name',
                                                          'temp_down',
                                                        ),
                                                      );
                                                    } else {
                                                      await IrTable().update(
                                                        data: {
                                                          'data': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'name',
                                                          'temp_down',
                                                        ),
                                                      );
                                                    }

                                                    setState(() => _model
                                                            .requestCompleter5 =
                                                        null);
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 50.0,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        75.0, 65.0, 75.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FutureBuilder<List<IrRow>>(
                                          future: (_model.requestCompleter3 ??=
                                                  Completer<List<IrRow>>()
                                                    ..complete(IrTable()
                                                        .querySingleRow(
                                                      queryFn: (q) => q.eq(
                                                        'name',
                                                        'mode',
                                                      ),
                                                    )))
                                              .future,
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
                                            List<IrRow> containerIrRowList =
                                                snapshot.data!;
                                            final containerIrRow =
                                                containerIrRowList.isNotEmpty
                                                    ? containerIrRowList.first
                                                    : null;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (containerIrRow!
                                                    .dataField!) {
                                                  await IrTable().update(
                                                    data: {
                                                      'data': false,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'name',
                                                      'mode',
                                                    ),
                                                  );
                                                } else {
                                                  await IrTable().update(
                                                    data: {
                                                      'data': true,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'name',
                                                      'mode',
                                                    ),
                                                  );
                                                }

                                                setState(() => _model
                                                    .requestCompleter3 = null);
                                              },
                                              child: Container(
                                                width: 70.0,
                                                height: 70.0,
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    'Mode',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        FutureBuilder<List<IrRow>>(
                                          future: (_model.requestCompleter4 ??=
                                                  Completer<List<IrRow>>()
                                                    ..complete(IrTable()
                                                        .querySingleRow(
                                                      queryFn: (q) => q.eq(
                                                        'name',
                                                        'fan',
                                                      ),
                                                    )))
                                              .future,
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
                                            List<IrRow> containerIrRowList =
                                                snapshot.data!;
                                            final containerIrRow =
                                                containerIrRowList.isNotEmpty
                                                    ? containerIrRowList.first
                                                    : null;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (containerIrRow!
                                                    .dataField!) {
                                                  await IrTable().update(
                                                    data: {
                                                      'data': false,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'name',
                                                      'fan',
                                                    ),
                                                  );
                                                } else {
                                                  await IrTable().update(
                                                    data: {
                                                      'data': true,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'name',
                                                      'fan',
                                                    ),
                                                  );
                                                }

                                                setState(() => _model
                                                    .requestCompleter4 = null);
                                              },
                                              child: Container(
                                                width: 70.0,
                                                height: 70.0,
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    'Fan',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  75.0, 16.0, 75.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FutureBuilder<List<IrRow>>(
                                    future: IrTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'name',
                                        'cold',
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IrRow> buttonIrRowList =
                                          snapshot.data!;
                                      final buttonIrRow =
                                          buttonIrRowList.isNotEmpty
                                              ? buttonIrRowList.first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          if (buttonIrRow!.dataField!) {
                                            await IrTable().update(
                                              data: {
                                                'data': false,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'name',
                                                'cold',
                                              ),
                                            );
                                          } else {
                                            await IrTable().update(
                                              data: {
                                                'data': true,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'name',
                                                'cold',
                                              ),
                                            );
                                          }

                                          setState(() =>
                                              _model.requestCompleter2 = null);
                                        },
                                        text: 'Cold',
                                        options: FFButtonOptions(
                                          width: 90.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFFFFCC9),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(5.0),
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                        ),
                                        showLoadingIndicator: false,
                                      );
                                    },
                                  ),
                                  FutureBuilder<List<IrRow>>(
                                    future: IrTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'name',
                                        'hot',
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IrRow> buttonIrRowList =
                                          snapshot.data!;
                                      final buttonIrRow =
                                          buttonIrRowList.isNotEmpty
                                              ? buttonIrRowList.first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          if (buttonIrRow!.dataField!) {
                                            await IrTable().update(
                                              data: {
                                                'data': false,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'name',
                                                'hot',
                                              ),
                                            );
                                          } else {
                                            await IrTable().update(
                                              data: {
                                                'data': true,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'name',
                                                'hot',
                                              ),
                                            );
                                          }

                                          setState(() =>
                                              _model.requestCompleter2 = null);
                                          await _model
                                              .waitForRequestCompleted2();
                                        },
                                        text: 'Hot',
                                        options: FFButtonOptions(
                                          width: 90.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFFF7276),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(30.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        showLoadingIndicator: false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: FutureBuilder<List<IrRow>>(
                                          future: (_model.requestCompleter2 ??=
                                                  Completer<List<IrRow>>()
                                                    ..complete(IrTable()
                                                        .querySingleRow(
                                                      queryFn: (q) => q.eq(
                                                        'name',
                                                        'timer',
                                                      ),
                                                    )))
                                              .future,
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
                                            List<IrRow> buttonIrRowList =
                                                snapshot.data!;
                                            final buttonIrRow =
                                                buttonIrRowList.isNotEmpty
                                                    ? buttonIrRowList.first
                                                    : null;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                if (buttonIrRow!.dataField!) {
                                                  await IrTable().update(
                                                    data: {
                                                      'data': false,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'name',
                                                      'timer',
                                                    ),
                                                  );
                                                } else {
                                                  await IrTable().update(
                                                    data: {
                                                      'data': true,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'name',
                                                      'timer',
                                                    ),
                                                  );
                                                }

                                                setState(() => _model
                                                    .requestCompleter2 = null);
                                              },
                                              text: 'Timer',
                                              options: FFButtonOptions(
                                                width: 200.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              showLoadingIndicator: false,
                                            );
                                          },
                                        ),
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
                  ),
                  navThreeIcon: Icon(
                    Icons.air,
                    color: FlutterFlowTheme.of(context).alternate,
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
