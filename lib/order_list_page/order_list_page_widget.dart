import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../components/update_order_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../plan_list_page/plan_list_page_widget.dart';
import '../custom_code/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderListPageWidget extends StatefulWidget {
  const OrderListPageWidget({Key key}) : super(key: key);

  @override
  _OrderListPageWidgetState createState() => _OrderListPageWidgetState();
}

class _OrderListPageWidgetState extends State<OrderListPageWidget> {
  PagingController<DocumentSnapshot, OrdersRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];
  int count = 0;

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
      resizeToAvoidBottomInset: false,
      body: Column(
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
                                              logFirebaseEvent(
                                                  'ORDER_LIST_Text_844r48sl_ON_TAP');
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
                                              logFirebaseEvent(
                                                  'ORDER_LIST_Text_3sgzeybv_ON_TAP');
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
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: PagedListView<
                                        DocumentSnapshot<Object>, OrdersRecord>(
                                      pagingController: () {
                                        final Query<Object> Function(
                                                Query<Object>) queryBuilder =
                                            (ordersRecord) => ordersRecord
                                                .orderBy('purchased',
                                                    descending: true);
                                        if (_pagingController != null) {
                                          final query = queryBuilder(
                                              OrdersRecord.collection());
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
                                        _pagingQuery = queryBuilder(
                                            OrdersRecord.collection());
                                        _pagingController
                                            .addPageRequestListener(
                                                (nextPageMarker) {
                                          queryOrdersRecordPage(
                                            parent:
                                                containerShopsRecord.reference,
                                            queryBuilder: (ordersRecord) =>
                                                ordersRecord.orderBy(
                                                    'purchased',
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
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              OrdersRecord>(
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
                                          final listViewOrdersRecord =
                                              _pagingController
                                                  .itemList[listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ORDER_LIST_Container_pbgvwp6p_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_Bottom-Sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x8E484848),
                                                  context: context,
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.56,
                                                  ),
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
                                                            UpdateOrderPageWidget(
                                                          order:
                                                              listViewOrdersRecord,
                                                        ),
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
                                                              'MMMd, y h:mm a',
                                                              listViewOrdersRecord
                                                                  .purchased),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: FaIcon(
                                                          ShippingStatusExt.create(
                                                                  listViewOrdersRecord
                                                                      .status)
                                                              .icon,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          size: ShippingStatusExt.create(
                                                                      listViewOrdersRecord
                                                                          .status)
                                                                  .size -
                                                              8,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'MMMd, y h:mm a',
                                                              listViewOrdersRecord
                                                                      .updated ??
                                                                  listViewOrdersRecord
                                                                      .purchased),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          CurrencyChecker.create(
                                                                  listViewOrdersRecord
                                                                      .totalAmount
                                                                      .toString())
                                                              .formated,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          listViewOrdersRecord
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
                                                          CurrencyChecker.create(
                                                                  listViewOrdersRecord
                                                                      .totalShippingFee
                                                                      .toString())
                                                              .formated,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
