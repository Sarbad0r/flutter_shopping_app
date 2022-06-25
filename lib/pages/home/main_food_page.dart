import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/models/app_colors.dart';
import 'package:flutter_11_hour_lesson/pages/home/food_page_body.dart';
import 'package:flutter_11_hour_lesson/widgets/big_text.dart';
import 'package:flutter_11_hour_lesson/widgets/small_text.dart';
import 'package:get/get.dart';


class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Tajikistan",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(text: 'Dushanbe', color: Colors.black54),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody(),)),
        ],
      ),
    );
  }
}
