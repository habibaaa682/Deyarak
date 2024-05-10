import 'package:deyarakapp/Featurs/Home/data/Models/property_model/property_model.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/image_place_holder.dart';
import 'package:deyarakapp/controllers/Wishlist_controllers/add_to_user_wishlist.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../controllers/sharedPrefrenceController.dart';
import '../../../../../../core/utils/api_service.dart';

class PropertySlideShow extends StatefulWidget {
  const PropertySlideShow({
    super.key,
    required this.propertyModel,
  });
  final PropertyModel propertyModel;
  @override
  State<PropertySlideShow> createState() => _PropertySlideShow();
}

late List<Widget> pages;
int activeimg = 0;
PageController _pageController = PageController(initialPage: 0);

class _PropertySlideShow extends State<PropertySlideShow>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController sizeanimationcontroller;
  late AnimationController coloranimationcontroller;
  late Animation changeColor;
  bool isActive = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*pages = List.generate(
        widget.homePropertiesModel.images!.length, (index) => ImagePlaceHolder(imgpath:widget.homePropertiesModel.images![index].url.toString()));*/
    sizeanimationcontroller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 100),
        value: 1,
        upperBound: 1.5,
        lowerBound: 1);

    coloranimationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    changeColor = ColorTween(
            begin: const Color.fromARGB(130, 84, 84, 84).withOpacity(.7),
            end: Colors.red)
        .animate(coloranimationcontroller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Widget> pages = widget.propertyModel.data!.images
            ?.map((image) => ImagePlaceHolder(imgpath: image.url.toString()))
            .toList() ??
        [];

    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                activeimg = value;
              });
            },
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: pages[index],
              );
            },
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                widget.propertyModel.data!.images!.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          /*  _pageController.animateToPage(index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);*/
                        },
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: activeimg == index
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Colors.grey,
                        ),
                      ),
                    )),
          ),
        ),
      ),
      Positioned(
          top: 5,
          right: 20,
          child: ScaleTransition(
            scale: sizeanimationcontroller,
            child: AnimatedBuilder(
              animation: coloranimationcontroller,
              builder: (context, child) {
                return IconButton(
                  onPressed: () {
                    sizeanimationcontroller.forward().then((value) => {
                          isActive
                              ? {
                                  coloranimationcontroller.forward(),
                                  sizeanimationcontroller.reverse(),
                                  WishlistController(ApiService(Dio()))
                                      .addToWishlist(context,
                                          userId:
                                              GlobalSharedPreferences.getString(
                                                  'userId'),
                                          propertyId:
                                              '662eb3e293cecf21985e3af6',
                                          token:
                                              GlobalSharedPreferences.getString(
                                                  'token'))
                                }
                              : {
                                  coloranimationcontroller.reverse(),
                                  sizeanimationcontroller.reverse(),
                                  WishlistController(ApiService(Dio()))
                                      .removeFromWishlist(
                                    context,
                                    userId: GlobalSharedPreferences.getString(
                                        'userId'),
                                    propertyId: '662eb3e293cecf21985e3af6',
                                    token: GlobalSharedPreferences.getString(
                                        'token'),
                                  )
                                }
                        });
                    isActive = !isActive;
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 30,
                  ),
                  color: changeColor.value,
                );
              },
            ),
          )),
    ]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
