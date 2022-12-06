import 'package:mypod_flutter/import_helper.dart';
import 'package:mypod_flutter/router.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 30.h,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  centerTitle: false,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: false,
                    titlePadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    title: customTile(),
                    background: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(msg: 'Welcome,', fontSize: 10.sp),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              customText(
                                  msg: 'B-09, Shree Pragati Society',
                                  fontSize: 10.sp),
                              customText(
                                  msg: 'VijayNagar, Kalyan east',
                                  fontSize: 10.sp),
                              customText(msg: ' 421306', fontSize: 10.sp),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  pinned: true,
                  floating: false,
                  automaticallyImplyLeading: true,
                ),
              ];
            },
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 75.h,
              width: 1.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  // SizedBox(
                  //   height: 60.h,
                  //   child: GridView(
                  //     physics: const BouncingScrollPhysics(),
                  //     shrinkWrap: true,
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 3,
                  //         mainAxisSpacing: 2.w,
                  //         crossAxisSpacing: 15.w),
                  //     children: [
                  //       circularIcon(Icons.home),
                  //       circularIcon(Icons.receipt_long),
                  //       circularIcon(Icons.event),
                  //     ],
                  //   ),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      circularIcon(
                          msg: 'My Home',
                          icon: Icons.home,
                          onTap: () {
                            context.goNamed(myHome);
                          }),
                      circularIcon(
                          msg: 'Maintenance',
                          icon: Icons.receipt_long,
                          onTap: () {
                            context.goNamed(myMaintenanceBook);
                          }),
                      circularIcon(msg: 'Events', icon: Icons.event),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
