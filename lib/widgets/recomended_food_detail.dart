import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/data/api/api_with_http.dart';
import 'package:flutter_11_hour_lesson/models/app_colors.dart';
import 'package:flutter_11_hour_lesson/models/cart_model.dart';
import 'package:flutter_11_hour_lesson/models/dimensions.dart';
import 'package:flutter_11_hour_lesson/widgets/app_icon.dart';
import 'package:flutter_11_hour_lesson/widgets/big_text.dart';
import 'package:flutter_11_hour_lesson/widgets/expandable_text.widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatefulWidget {
  int recommendedId;
  RecommendedFoodDetail({Key? key, required this.recommendedId})
      : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var getRecommendedId =
        Get.put(ApiWithHttp()).listOfProductBottom[widget.recommendedId];

    var getGetx = Get.put(ApiWithHttp());
    getGetx.initProduct();
    if (getGetx.items.isNotEmpty) {
      CartModel? getQty = getGetx.items.values
              .every((element) => element.id != getRecommendedId.id)
          ? null
          : getGetx.items.values
              .firstWhere((element) => element.id == getRecommendedId.id);

      getGetx.setQty(getQty == null ? 0.toInt() : getQty.qty!.toInt());
    }
  }

  @override
  Widget build(BuildContext context) {
    var getGetx = Get.put(ApiWithHttp());
    var getRecommendedId =
        Get.put(ApiWithHttp()).listOfProductBottom[widget.recommendedId];
    print("${MediaQuery.of(context).size.height}");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: AppIcon(icon: Icons.clear)),
                  Obx((() => Badge(
                        showBadge: getGetx.items.isEmpty ? false : true,
                        badgeContent: Text("${getGetx.items.length}"),
                        child: AppIcon(icon: Icons.shopping_cart_outlined),
                      )))
                ]),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.radius20),
                        topLeft: Radius.circular(Dimension.radius20)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      top: Dimension.height10,
                      bottom: Dimension.height10,
                      left: Dimension.width10),
                  width: double.maxFinite,
                  child: BigText(
                    text: "${getRecommendedId.name}",
                    color: Colors.black,
                  )),
            ),
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://mvs.bslmeiyu.com/uploads"
                "/${getRecommendedId.img}",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimension.radius20),
                      topLeft: Radius.circular(Dimension.radius20))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.width20, right: Dimension.width20),
                    child:
                        ExpandedAbleText(text: getRecommendedId.description!),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                right: Dimension.width20,
                left: Dimension.width20,
                top: Dimension.height10,
                bottom: Dimension.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    getGetx.setQuantity(false);
                  },
                  child: AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconsize: Dimension.iconsize24,
                  ),
                ),
                Obx(
                  () => BigText(
                    text: "\$${getRecommendedId.price} " "x " "${getGetx.qty}",
                    size: Dimension.fontSize26,
                  ),
                ),
                InkWell(
                  onTap: () {
                    getGetx.setQuantity(true);
                  },
                  child: AppIcon(
                    icon: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconsize: Dimension.iconsize24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Dimension.bottomNavContainerSize,
            padding: EdgeInsets.only(
                top: Dimension.height30,
                bottom: Dimension.height30,
                left: Dimension.width20,
                right: Dimension.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimension.radius20 * 2,
                    ),
                    topRight: Radius.circular(
                      Dimension.radius20 * 2,
                    ))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height20,
                          bottom: Dimension.height20,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20)),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  InkWell(
                    onTap: () {
                      getGetx.addItem(getRecommendedId, getGetx.qty);
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: Dimension.height20,
                            bottom: Dimension.height20,
                            left: Dimension.width20,
                            right: Dimension.width20),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20)),
                        child: Obx((() => BigText(
                              text:
                                  '\$${getRecommendedId.price! * getGetx.qty.toInt()} | Add to cart',
                              color: Colors.white,
                            )))),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
