import 'package:flutter/material.dart';

import 'package:flutterbelajar/pages/home_page.dart';
import 'package:flutterbelajar/pages/about_page.dart';

import 'package:flutterbelajar/container/ContainerSatu.dart';
import 'package:flutterbelajar/container/LatihanSatu.dart' as container_latihan;

import 'package:flutterbelajar/list_grid_view/detailScreenWidget.dart';
import 'package:flutterbelajar/list_grid_view/GridViewBuilderWidget.dart';
import 'package:flutterbelajar/list_grid_view/GridViewExtentWidget.dart';
import 'package:flutterbelajar/list_grid_view/GridViewImageWidget.dart';
import 'package:flutterbelajar/list_grid_view/GridViewWidget.dart';
import 'package:flutterbelajar/list_grid_view/gridWidget.dart';
import 'package:flutterbelajar/list_grid_view/LatihanLima.dart';
import 'package:flutterbelajar/list_grid_view/list-screenWidget.dart';
import 'package:flutterbelajar/list_grid_view/ListViewBuilderWidget.dart';
import 'package:flutterbelajar/list_grid_view/ListViewHorizontalWidget.dart';
import 'package:flutterbelajar/list_grid_view/ListViewKustomWidget.dart';
import 'package:flutterbelajar/list_grid_view/ListViewTerpisahWidget.dart';
import 'package:flutterbelajar/list_grid_view/ListViewWidget.dart';

import 'package:flutterbelajar/row_column/ColumnWidget.dart';
import 'package:flutterbelajar/row_column/LatihanDua.dart';
import 'package:flutterbelajar/row_column/LatihanSatu.dart'
    as row_column_latihan;
import 'package:flutterbelajar/row_column/RowColumnWidget.dart';
import 'package:flutterbelajar/row_column/RowWidget.dart';

import 'package:flutterbelajar/sized_expanded_stack/ExpandedWidget.dart';
import 'package:flutterbelajar/sized_expanded_stack/LatihanEmpat.dart';
import 'package:flutterbelajar/sized_expanded_stack/LatihanTiga.dart';
import 'package:flutterbelajar/sized_expanded_stack/LayoutDua.dart';
import 'package:flutterbelajar/sized_expanded_stack/LayoutEmpat.dart';
import 'package:flutterbelajar/sized_expanded_stack/LayoutSatu.dart';
import 'package:flutterbelajar/sized_expanded_stack/SizedBoxWidget.dart';
import 'package:flutterbelajar/sized_expanded_stack/StackWidget.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';

  static const containerSatu = '/container-satu';
  static const latihanSatuContainer = '/latihan-satu-container';

  static const detailScreen = '/detail-screen';
  static const listScreen = '/list-screen';
  static const gridViewBuilder = '/grid-view-builder';
  static const gridViewExtent = '/grid-view-extent';
  static const gridViewImage = '/grid-view-image';
  static const gridView = '/grid-view';
  static const grid = '/grid';
  static const latihanLima = '/latihan-lima';
  static const listViewBuilder = '/list-view-builder';
  static const listViewHorizontal = '/list-view-horizontal';
  static const listViewKustom = '/list-view-kustom';
  static const listViewTerpisah = '/list-view-terpisah';
  static const listView = '/list-view';

  static const column = '/column';
  static const latihanDua = '/latihan-dua';
  static const latihanSatuRowColumn = '/latihan-satu-row-column';
  static const rowColumn = '/row-column';
  static const row = '/row';

  static const expanded = '/expanded';
  static const latihanEmpat = '/latihan-empat';
  static const latihanTiga = '/latihan-tiga';
  static const layoutDua = '/layout-dua';
  static const layoutEmpat = '/layout-empat';
  static const layoutSatu = '/layout-satu';
  static const sizedBox = '/sized-box';
  static const stack = '/stack';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    about: (context) => AboutPage(),

    containerSatu: (context) => ContainerSatu(),
    latihanSatuContainer: (context) => container_latihan.LatihanSatu(),

    detailScreen: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      return ArticleDetailScreen(data: args);
    },
    listScreen: (context) => ArticleListScreen(),
    gridViewBuilder: (context) => GridViewBuilderWidget(),
    gridViewExtent: (context) => GridViewExtentWidget(),
    gridViewImage: (context) => GridViewImageWidget(),
    gridView: (context) => GridViewWidget(),
    grid: (context) => GridProductPage(),
    latihanLima: (context) => LatihanLima(),
    listViewBuilder: (context) => ListViewBuilderWidget(),
    listViewHorizontal: (context) => ListViewHorizontalWidget(),
    listViewKustom: (context) => ListViewKustomWidget(),
    listViewTerpisah: (context) => ListViewTerpisahWidget(),
    listView: (context) => ListViewWidget(),

    column: (context) => ColumnWidget(),
    latihanDua: (context) => LatihanDua(),
    latihanSatuRowColumn: (context) => row_column_latihan.LatihanSatu(),
    rowColumn: (context) => RowColumnWidget(),
    row: (context) => RowWidget(),

    expanded: (context) => Expandedwidget(),
    latihanEmpat: (context) => LatihanEmpat(),
    latihanTiga: (context) => LatihanTiga(),
    layoutDua: (context) => LayoutDua(),
    layoutEmpat: (context) => ProfileWidget(),
    layoutSatu: (context) => LayoutSatu(),
    sizedBox: (context) => SizedBoxWidget(),
    stack: (context) => StackWidget(),
  };
}
