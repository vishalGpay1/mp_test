import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Desktop/flutter_mp_app/lib/navigator/region_list.dart';
import 'file:///C:/Users/user/Desktop/flutter_mp_app/lib/utils/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class RegionPage extends StatefulWidget {
  @override
  _RegionPageState createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> with TickerProviderStateMixin {

  AnimationController animationController;
  List<RegionList> regionList = RegionList.homeList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: whitecolor,
          appBar: AppBar(
            title: Text("Select a Region"),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List<Widget>.generate(regionList.length, (int index) {

                final int count = regionList.length;
                final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                  ),);
                animationController.forward();
                return HomeListView(
                  animation: animation,
                  animationController: animationController,
                  listData: regionList[index],
                  callBack: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) =>
                            regionList[index].navigateScreen,
                      ),
                    );
                  },
                );

              })
              ).p16().scrollVertical()),
    );
  }
}

class HomeListView extends StatelessWidget {
  final RegionList listData;
  final VoidCallback callBack;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  const HomeListView(
      {Key key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
            child: AspectRatio(
              aspectRatio: 4,
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                   "Select a region".text.xl3.bold.black.make(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.blueAccent),
                    ),
                    listData.title.text.bold.xl3.color(Colors.white).make(),
                    Material(
                      color: Colors.transparent,
                      shape: Vx.withRounded(5),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {
                          callBack();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
