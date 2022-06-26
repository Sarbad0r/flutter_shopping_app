import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/data/api/api_with_http.dart';
import 'package:flutter_11_hour_lesson/models/app_colors.dart';
import 'package:flutter_11_hour_lesson/models/dimensions.dart';
import 'package:flutter_11_hour_lesson/models/product_model.dart';
import 'package:flutter_11_hour_lesson/pages/screens/popular_food.dart';
import 'package:flutter_11_hour_lesson/widgets/big_text.dart';
import 'package:flutter_11_hour_lesson/widgets/icon_and_text_widget.dart';
import 'package:flutter_11_hour_lesson/widgets/recomended_food_detail.dart';
import 'package:flutter_11_hour_lesson/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double height = Dimension.pageViewContainer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print("Current page value $_currentPageValue");
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var getProductFromApi = Get.put(ApiWithHttp());

    print("Size of screen height:  ${MediaQuery.of(context).size.height}");
    print("Size of screen width:  ${MediaQuery.of(context).size.width}");
    return Column(
      children: [
        Obx(() => getProductFromApi.listOfproductTop.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: Dimension.pageView,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: getProductFromApi.listOfproductTop.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Get.to(RecommendedFoodDetail());
                          },
                          child: _buildPageItem(getProductFromApi, index));
                    }),
              )),
        Obx(() => DotsIndicator(
              dotsCount: getProductFromApi.listOfproductTop.isEmpty
                  ? 1
                  : getProductFromApi.listOfproductTop.length,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            )),
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: Dimension.width10,
              ),
              SmallText(
                text: '·',
                size: 18,
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              SmallText(text: 'Food pairing')
            ],
          ),
        ),
        Obx((() => getProductFromApi.listOfProductBottom.isEmpty
            ? Container()
            : ListView.builder(
                itemCount: getProductFromApi.listOfProductBottom.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopularFood()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: Dimension.width20,
                          right: Dimension.width20,
                          bottom: Dimension.height10),
                      child: Row(
                        children: [
                          Container(
                            height: Dimension.listViewImgSize,
                            width: Dimension.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://mvs.bslmeiyu.com/uploads"
                                        "/${getProductFromApi.listOfProductBottom[index].img}"))),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimension.listViewTextConSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimension.radius20),
                                      bottomRight:
                                          Radius.circular(Dimension.radius20)),
                                  color: Colors.white),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: Dimension.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: getProductFromApi
                                            .listOfProductBottom[index].name
                                            .toString()),
                                    SizedBox(
                                      height: Dimension.height10,
                                    ),
                                    SmallText(
                                        text: getProductFromApi
                                            .listOfProductBottom[index].description!.substring(0,20)+"..."
                                            .toString()),
                                    SizedBox(
                                      height: Dimension.height20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            color: Colors.black54,
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            color: Colors.black54,
                                            iconColor: AppColors.iconColor2),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: '1.7km',
                                            color: Colors.black54,
                                            iconColor: AppColors.iconColor2)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })))
      ],
    );
  }

  Widget _buildPageItem(ApiWithHttp getProductFromApi, int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageViewContainer,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://mvs.bslmeiyu.com/" +
                        "uploads/" +
                        getProductFromApi.listOfproductTop[index].img!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                BoxShadow(color: Colors.white, offset: Offset(5, 0)),
              ], borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                        text: getProductFromApi.listOfproductTop[index].name
                            .toString()),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              getProductFromApi.listOfproductTop[index].stars!
                                  .toInt(),
                              (index) => Icon(
                                    Icons.star,
                                    size: 15,
                                    color: AppColors.mainColor,
                                  )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: '4,5',
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '1287 comments', color: Colors.black54)
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            color: Colors.black54,
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: '1.7km',
                            color: Colors.black54,
                            iconColor: AppColors.iconColor2),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: '1.7km',
                            color: Colors.black54,
                            iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
