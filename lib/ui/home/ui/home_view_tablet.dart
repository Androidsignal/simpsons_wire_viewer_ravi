import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/ui/details/ui/details_screen.dart';
import 'package:simpsons_character_viewer/ui/home/bloc/home_bloc.dart';

import 'home_view_mobile.dart';

class HomeViewTablet extends StatelessWidget {
  const HomeViewTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            const Expanded(
              flex: 2,
              child: HomeViewMobile(isTabletView: true),
            ),
            Expanded(
              flex: 3,
              child: state.selectedData == null
                  ? Scaffold(
                      appBar: AppBar(automaticallyImplyLeading: false),
                      backgroundColor: Colors.white,
                    )
                  : DetailsScreen(data: state.selectedData!),
            ),
          ],
        );
      },
    );
  }
}
