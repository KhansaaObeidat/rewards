import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'main_container_bloc.dart';

class MainContainer extends StatefulWidget {
  MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final _bloc = MainContainerBloc();
  //tab bar step 1
  void changeActivePage(int index) {
    setState(() {
      _bloc.activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // make value listenable
    return ValueListenableBuilder<int>(
      valueListenable: _bloc.currentTabIndexNotifer,
      builder: (context, index, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
              child: IndexedStack(
            index: index,
            children: _bloc.navTabs,
          )),
          bottomNavigationBar: ConvexAppBar(
            controller: _bloc.controller,
            style: TabStyle.flip,
            backgroundColor: Colors.red,
            items:  [
              TabItem(
                icon: Icons.home,
                title:AppLocalizations.of(context)!.buttom_tabber_home,
              ),TabItem(
                icon: Icons.present_to_all,
                title:AppLocalizations.of(context)!.buttom_tabber_rewards,
              ),TabItem(
                icon: Icons.receipt,
                title:AppLocalizations.of(context)!.buttom_tabber_score,
              ),TabItem(
                icon: Icons.person,
                title:AppLocalizations.of(context)!.buttom_tabber_profile,
              ),
             
            ],
          ),
        );
      },
    ); 
  }
}
