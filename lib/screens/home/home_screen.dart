import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';

import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedBox(height: 30);
    return Container(
      child: SizedBox(
        height: 30,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset("assets/icons/Notification.svg"),
                color: Colors.amber,
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "FASHION TRENDS",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w500, color: Colors.black,fontSize: 30,),
                  ),
                ),
                Center(
                  child: const Text(
                    "best Outfits for you",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  child: SearchForm(),
                ),
                const Categories(),
                const NewArrivalProducts(),
                const PopularProducts(),
                SizedBox(height: 80),
               Center(
                 child: Container(
                    child: const Text(
                      "@Mansi Chaure Copyrights Reserved...",
                      style: TextStyle(fontSize: 18, ),
                      
                    ),
                  ),
               ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
