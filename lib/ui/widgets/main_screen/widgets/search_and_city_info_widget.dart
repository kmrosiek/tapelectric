import 'package:flutter/material.dart';
import 'package:weathet_app/ui/widgets/main_screen/widgets/city_info_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/widgets/search_widget.dart';

class SearchAndCityInfoWidget extends StatelessWidget {
  const SearchAndCityInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchWidget(),
                SizedBox(height: 70),
                CityInfoWidget(),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
