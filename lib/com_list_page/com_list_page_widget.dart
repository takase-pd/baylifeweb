import '../backend/backend.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../components/update_com_page_widget.dart';
import '../components/update_plan_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ComListPageWidget extends StatefulWidget {
  const ComListPageWidget({Key key}) : super(key: key);

  @override
  _ComListPageWidgetState createState() => _ComListPageWidgetState();
}

class _ComListPageWidgetState extends State<ComListPageWidget> {
  PagingController<DocumentSnapshot, CompaniesRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ComListPage'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HeaderWidget(),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainMenuWidget(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 0, 16, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '企業',
                                    style: FlutterFlowTheme.of(context).title1,
                                  ),
                                  Text(
                                    'Adminのみ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 16, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'COM_LIST_PAGE_PAGE_Text_lus0gmfg_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_Navigate-To');
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComListPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                '一覧',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'COM_LIST_PAGE_PAGE_追加_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_Bottom-Sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x8E484848),
                                            context: context,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.64,
                                            ),
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.96,
                                                  child: UpdateComPageWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: '追加',
                                        options: FFButtonOptions(
                                          width: 80,
                                          height: 32,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textLight,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 4,
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: FlutterFlowTheme.of(context).sLight,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.72,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: PagedListView<DocumentSnapshot<Object>,
                                      CompaniesRecord>(
                                    pagingController: () {
                                      final Query<Object> Function(
                                              Query<Object>) queryBuilder =
                                          (companiesRecord) => companiesRecord;
                                      if (_pagingController != null) {
                                        final query = queryBuilder(
                                            CompaniesRecord.collection);
                                        if (query != _pagingQuery) {
                                          // The query has changed
                                          _pagingQuery = query;
                                          _streamSubscriptions
                                              .forEach((s) => s?.cancel());
                                          _streamSubscriptions.clear();
                                          _pagingController.refresh();
                                        }
                                        return _pagingController;
                                      }

                                      _pagingController =
                                          PagingController(firstPageKey: null);
                                      _pagingQuery = queryBuilder(
                                          CompaniesRecord.collection);
                                      _pagingController.addPageRequestListener(
                                          (nextPageMarker) {
                                        queryCompaniesRecordPage(
                                          queryBuilder: (companiesRecord) =>
                                              companiesRecord,
                                          nextPageMarker: nextPageMarker,
                                          pageSize: 25,
                                          isStream: true,
                                        ).then((page) {
                                          _pagingController.appendPage(
                                            page.data,
                                            page.nextPageMarker,
                                          );
                                          final streamSubscription =
                                              page.dataStream?.listen((data) {
                                            final itemIndexes =
                                                _pagingController.itemList
                                                    .asMap()
                                                    .map((k, v) => MapEntry(
                                                        v.reference.id, k));
                                            data.forEach((item) {
                                              final index = itemIndexes[
                                                  item.reference.id];
                                              final items =
                                                  _pagingController.itemList;
                                              if (index != null) {
                                                items.replaceRange(
                                                    index, index + 1, [item]);
                                                _pagingController.itemList = {
                                                  for (var item in items)
                                                    item.reference: item
                                                }.values.toList();
                                              }
                                            });
                                            setState(() {});
                                          });
                                          _streamSubscriptions
                                              .add(streamSubscription);
                                        });
                                      });
                                      return _pagingController;
                                    }(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate: PagedChildBuilderDelegate<
                                        CompaniesRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      ),

                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewCompaniesRecord =
                                            _pagingController
                                                .itemList[listViewIndex];
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'COM_LIST_Container_7oqbaudz_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_Bottom-Sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x8E484848),
                                              context: context,
                                              constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.64,
                                              ),
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.96,
                                                    child: UpdateComPageWidget(
                                                      company:
                                                          listViewCompaniesRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 88,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      listViewIndex.toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      listViewCompaniesRecord
                                                          .name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 6,
                                                    child: FutureBuilder<
                                                        UsersRecord>(
                                                      future: UsersRecord
                                                          .getDocumentOnce(
                                                              listViewCompaniesRecord
                                                                  .director),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textUsersRecord =
                                                            snapshot.data;
                                                        return Text(
                                                          textUsersRecord.uid,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 6,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'COM_LIST_PAGE_PAGE_Text_zeqvhghu_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_Launch-U-R-L');
                                                        await launchURL(
                                                            listViewCompaniesRecord
                                                                .web);
                                                      },
                                                      child: Text(
                                                        listViewCompaniesRecord
                                                            .web,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
