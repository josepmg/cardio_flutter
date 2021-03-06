import 'package:cardio_flutter/core/platform/mixpanel.dart';
import 'package:cardio_flutter/core/platform/settings.dart';
import 'package:cardio_flutter/core/widgets/side_menu_exit_button.dart';
import 'package:cardio_flutter/core/widgets/side_menu_header.dart';
import 'package:cardio_flutter/core/widgets/side_menu_item.dart';
import 'package:cardio_flutter/features/app_info/presentation/pages/app_info_page.dart';
import 'package:cardio_flutter/features/help/presentation/pages/patient_help_page.dart';
import 'package:cardio_flutter/features/help/presentation/pages/professional_help_page.dart';
import 'package:cardio_flutter/resources/cardio_colors.dart';
import 'package:cardio_flutter/resources/dimensions.dart';
import 'package:cardio_flutter/resources/keys.dart';
import 'package:cardio_flutter/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final Function addFunction;
  final String recomendation;
  final bool hasDrawer;
  final String userName;
  final String userCpf;

  BasePage({
    Key key,
    this.body,
    this.addFunction,
    this.recomendation = "",
    this.hasDrawer = false,
    this.userName = "Fulane",
    this.userCpf = "111.111.111-11",
  }) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
      fontSize: Dimensions.getTextSize(context, 22),
      color: CardioColors.white,
      fontWeight: FontWeight.w500,
    );
    return hasDrawer
        ? Scaffold(
            key: _scaffoldKey,
            floatingActionButton: (addFunction != null)
                ? ((Provider.of<Settings>(context, listen: false)
                            .getUserType() ==
                        Keys.PROFESSIONAL_TYPE)
                    ? FloatingActionButton(
                        onPressed: addFunction,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.lightBlueAccent[200],
                      )
                    : null)
                : null,
            body: body,
            backgroundColor: CardioColors.white,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              iconTheme: IconThemeData(
                color: CardioColors.white,
              ),
              title: Text(
                userName != null && recomendation == null
                    ? "Olá, $userName!"
                    : recomendation,
                style: _textStyle,
              ),
              backgroundColor: CardioColors.blue,
              leading: new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {
                  Mixpanel.trackEvent(
                    MixpanelEvents.OPEN_PAGE,
                    data: {"pageTitle": "Drawer"},
                  );
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
            ),
            drawer: Drawer(
              child: SafeArea(
                child: Container(
                  width: Dimensions.getConvertedWidthSize(context, 260),
                  padding: Dimensions.getEdgeInsets(context, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// Header
                      SideMenuHeader(
                        userName: userName,
                        userCpf: userCpf,
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),

                      /// Menu items
                      SideMenuItem(
                        text: Strings.about,
                        onTapFunction: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppInfoPage(),
                          ),
                        ),
                      ),
                      SideMenuItem(
                        text: Strings.help,
                        onTapFunction: () {
                          (Provider.of<Settings>(context, listen: false)
                                      .getUserType() ==
                                  Keys.PROFESSIONAL_TYPE)
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfessionalHelpPage(),
                                  ),
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientHelpPage(),
                                  ),
                                );
                        },
                      ),

                      /// Spacer
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),

                      /// Exit button
                      SideMenuExitButton(),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            floatingActionButton: (addFunction != null)
                ? ((Provider.of<Settings>(context, listen: false)
                            .getUserType() ==
                        Keys.PROFESSIONAL_TYPE)
                    ? FloatingActionButton(
                        onPressed: addFunction,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.lightBlueAccent[200],
                      )
                    : null)
                : null,
            body: body,
            backgroundColor: CardioColors.white,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              iconTheme: IconThemeData(
                color: CardioColors.white,
              ),
              title: Text(
                recomendation,
                style: _textStyle,
              ),
              backgroundColor: CardioColors.blue,
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          );
  }
}
