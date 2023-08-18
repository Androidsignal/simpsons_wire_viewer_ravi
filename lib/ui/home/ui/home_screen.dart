import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simpsons_character_viewer/ui/home/ui/home_view_mobile.dart';

import 'home_view_tablet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      /*mobile: (_) => OrientationLayoutBuilder(
        portrait: (context) => HomeMobilePortrait(),
        landscape: (context) => HomeMobileLandscape(),
      ),*/
      mobile: (_) => const HomeViewMobile(),
      tablet: (_) => const HomeViewTablet(),
    );
  }
}
