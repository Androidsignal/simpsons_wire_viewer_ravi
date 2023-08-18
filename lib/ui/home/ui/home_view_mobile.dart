import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/infrastructure/util/utils.dart';
import 'package:simpsons_character_viewer/ui/details/ui/details_screen.dart';
import 'package:simpsons_character_viewer/ui/home/bloc/home_bloc.dart';
import 'package:simpsons_character_viewer/ui/home/ui/widgets/item_home_list.dart';

class HomeViewMobile extends StatefulWidget {
  final bool isTabletView;

  const HomeViewMobile({
    Key? key,
    this.isTabletView = false,
  }) : super(key: key);

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.dismissKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              context.read<HomeBloc>().add(SearchData(value));
            },
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.filteredTopics != current.filteredTopics ||
              previous.selectedData != current.selectedData,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 5),
              itemCount: state.filteredTopics.length,
              itemBuilder: (context, index) {
                final data = state.filteredTopics[index];
                bool selected = state.selectedData == data;
                return ItemHomeList(
                  data: data,
                  selected: selected,
                  onPressed: () {
                    if (widget.isTabletView) {
                      context.read<HomeBloc>().add(SelectedData(data));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(data: data)),
                      );
                    }
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1);
              },
            );
          },
        ),
      ),
    );
  }
}
