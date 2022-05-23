import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../components/update_order_page_widget.dart';
import '../components/update_plan_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_list_page/plan_list_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderListPageWidget extends StatefulWidget {
  const OrderListPageWidget({Key key}) : super(key: key);

  @override
  _OrderListPageWidgetState createState() => _OrderListPageWidgetState();
}

class _OrderListPageWidgetState extends State<OrderListPageWidget> {
  PagingController<DocumentSnapshot, SoldRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OrderListPage'});
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    '商品',
                                    style: FlutterFlowTheme.of(context).title1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    'ショップ担当者のみ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
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
                                              logFirebaseEvent('Text_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_Navigate-To');
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlanListPageWidget(),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 16, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent('Text_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_Navigate-To');
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderListPageWidget(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              '注文',
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
                                        logFirebaseEvent('Button_ON_TAP');
                                        logFirebaseEvent('Button_Bottom-Sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x8E484848),
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.96,
                                                child: UpdatePlanPageWidget(),
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
                                        textStyle: FlutterFlowTheme.of(context)
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
                              FutureBuilder<List<ShopsRecord>>(
                                future: queryShopsRecordOnce(
                                  queryBuilder: (shopsRecord) =>
                                      shopsRecord.where('director',
                                          isEqualTo: currentUserReference),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ShopsRecord> containerShopsRecordList =
                                      snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final containerShopsRecord =
                                      containerShopsRecordList.isNotEmpty
                                          ? containerShopsRecordList.first
                                          : null;
                                  return Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.72,
                                    height: MediaQuery.of(context).size.height *
                                        0.72,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: PagedListView<
                                        DocumentSnapshot<Object>, SoldRecord>(
                                      pagingController: () {
                                        final Query<Object> Function(
                                                Query<Object>) queryBuilder =
                                            (soldRecord) => soldRecord.orderBy(
                                                'purchased',
                                                descending: true);
                                        if (_pagingController != null) {
                                          final query = queryBuilder(
                                              SoldRecord.collection);
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

                                        _pagingController = PagingController(
                                            firstPageKey: null);
                                        _pagingQuery =
                                            queryBuilder(SoldRecord.collection);
                                        _pagingController
                                            .addPageRequestListener(
                                                (nextPageMarker) {
                                          querySoldRecordPage(
                                            parent:
                                                containerShopsRecord.reference,
                                            queryBuilder: (soldRecord) =>
                                                soldRecord.orderBy('purchased',
                                                    descending: true),
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
                                                if (index != null) {
                                                  _pagingController.itemList
                                                      .replaceRange(index,
                                                          index + 1, [item]);
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
                                      builderDelegate:
                                          PagedChildBuilderDelegate<SoldRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitPulse(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewSoldRecord =
                                              _pagingController
                                                  .itemList[listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'Container_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_Bottom-Sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x8E484848),
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.96,
                                                        child:
                                                            UpdateOrderPageWidget(),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 88,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 8, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          listViewIndex
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'yMMMd',
                                                              listViewSoldRecord
                                                                  .purchased),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          'status',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          'customer name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          listViewSoldRecord
                                                              .totalAmount
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          listViewSoldRecord
                                                              .totalQuantity
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          listViewSoldRecord
                                                              .totalShippingFee
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
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
