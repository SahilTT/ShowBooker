import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_booker/res/app_context_extension.dart';

import '../enums/drawer_item_action.dart';

class DrawerMenu extends StatelessWidget{

  final Function(DrawerItemAction) onItemSelected;

  DrawerMenu({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(29, 33, 47, 0)),
      child: Drawer(
        backgroundColor: context.resources.color.colorAccentBg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12,),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Show",
                          style: TextStyle(
                              fontSize: 28.0,
                              color: context.resources.color.colorSecondaryText,
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Booker",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: context.resources.color.colorSecondaryText,
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
                onTap: () {
                  onItemSelected(DrawerItemAction.Dashboard);
                  Navigator.of(context).pop(); // Close the drawer
                },
              ),
              ListTile(
                title: Text(
                  "Now Showing",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
                onTap: () {
                  onItemSelected(DrawerItemAction.NowShowing);
                  Navigator.of(context).pop(); // Close the drawer
                },
              ),
              ListTile(
                title: Text(
                  "Upcoming Movies",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
                onTap: () {
                  onItemSelected(DrawerItemAction.Upcoming);
                  Navigator.of(context).pop(); // Close the drawer
                },
              ),
              ListTile(
                title: Text(
                  "Nearby Cinemas",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
                onTap: () {
                  print("click in nearby");
                  onItemSelected(DrawerItemAction.NearByCinema);

                  // Navigator.of(context).pop(); // Close the drawer
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Divider(
                  color: context.resources.color.colorInactiveText,
                ),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
              ),
              ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
