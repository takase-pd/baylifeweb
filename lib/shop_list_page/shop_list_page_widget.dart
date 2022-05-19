import '../backend/backend.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../create_shop_page/create_shop_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShopListPageWidget extends StatefulWidget {
  const ShopListPageWidget({Key key}) : super(key: key);

  @override
  _ShopListPageWidgetState createState() => _ShopListPageWidgetState();
}

class _ShopListPageWidgetState extends State<ShopListPageWidget> {
  PagingController<DocumentSnapshot, ShopsRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ShopListPage'});
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
                                    'ショップ',
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
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent('Text-ON_TAP');
                                            logFirebaseEvent(
                                                'Text-Navigate-To');
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ShopListPageWidget(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            '一覧',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          logFirebaseEvent('Text-ON_TAP');
                                          logFirebaseEvent('Text-Navigate-To');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateShopPageWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          '追加',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.72,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: PagedListView<DocumentSnapshot<Object>,
                                      ShopsRecord>(
                                    pagingController: () {
                                      final Query<Object> Function(
                                              Query<Object>) queryBuilder =
                                          (shopsRecord) => shopsRecord;
                                      if (_pagingController != null) {
                                        final query = queryBuilder(
                                            ShopsRecord.collection);
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
                                      _pagingQuery =
                                          queryBuilder(ShopsRecord.collection);
                                      _pagingController.addPageRequestListener(
                                          (nextPageMarker) {
                                        queryShopsRecordPage(
                                          queryBuilder: (shopsRecord) =>
                                              shopsRecord,
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
                                        PagedChildBuilderDelegate<ShopsRecord>(
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
                                        final listViewShopsRecord =
                                            _pagingController
                                                .itemList[listViewIndex];
                                        return Container(
                                          height: 88,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    listViewIndex.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    listViewShopsRecord
                                                        .shopName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: StreamBuilder<
                                                      CatShopRecord>(
                                                    stream: CatShopRecord
                                                        .getDocument(
                                                            listViewShopsRecord
                                                                .catMain),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final textCatShopRecord =
                                                          snapshot.data;
                                                      return Text(
                                                        textCatShopRecord
                                                            .catName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    'Company Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream:
                                                        UsersRecord.getDocument(
                                                            listViewShopsRecord
                                                                .director),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final textUsersRecord =
                                                          snapshot.data;
                                                      return Text(
                                                        textUsersRecord
                                                            .displayName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'Text-ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text-Launch-U-R-L');
                                                          await launchURL(
                                                              listViewShopsRecord
                                                                  .instagram);
                                                        },
                                                        child: Text(
                                                          'Instagram',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'Text-ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text-Launch-U-R-L');
                                                          await launchURL(
                                                              listViewShopsRecord
                                                                  .twitter);
                                                        },
                                                        child: Text(
                                                          'Twitter',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'Text-ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text-Launch-U-R-L');
                                                          await launchURL(
                                                              listViewShopsRecord
                                                                  .web);
                                                        },
                                                        child: Text(
                                                          'Web',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
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