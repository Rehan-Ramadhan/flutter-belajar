import 'package:flutter/material.dart';
import 'package:flutterbelajar/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.about);
              },
              child: Text("Masuk Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.containerSatu);
              },
              child: Text("Container Satu"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanSatuContainer);
              },
              child: Text("Latihan Satu Container"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.detailScreen);
              },
              child: Text("Detail Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listScreen);
              },
              child: Text("List Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.gridViewBuilder);
              },
              child: Text("Grid View Builder"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.gridViewExtent);
              },
              child: Text("Grid View Extent"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.gridViewImage);
              },
              child: Text("Grid View Image"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.gridView);
              },
              child: Text("Grid View"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.grid);
              },
              child: Text("Grid"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanLima);
              },
              child: Text("Latihan Lima"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listViewBuilder);
              },
              child: Text("List View Builder"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listViewHorizontal);
              },
              child: Text("List View Horizontal"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listViewKustom);
              },
              child: Text("List View Kustom"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listViewTerpisah);
              },
              child: Text("List View Terpisah"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listView);
              },
              child: Text("List View"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.column);
              },
              child: Text("Column"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanDua);
              },
              child: Text("Latihan Dua"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanSatuRowColumn);
              },
              child: Text("Latihan Satu Row Column"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.rowColumn);
              },
              child: Text("Row Column"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.row);
              },
              child: Text("Row"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.expanded);
              },
              child: Text("Expanded"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanEmpat);
              },
              child: Text("Latihan Empat"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.latihanTiga);
              },
              child: Text("Latihan Tiga"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.layoutDua);
              },
              child: Text("Layout Dua"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.layoutEmpat);
              },
              child: Text("Layout Empat"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.layoutSatu);
              },
              child: Text("Layout Satu"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.sizedBox);
              },
              child: Text("Sized Box"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.stack);
              },
              child: Text("Stack"),
            ),
          ],
        ),
      ),
    );
  }
}
