import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogspath/models/path.dart';
import 'package:dogspath/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PathView extends StatefulWidget {
  final PathDetails details;

  const PathView({Key? key, required this.details}) : super(key: key);

  @override
  _PathViewState createState() => _PathViewState();
}

class _PathViewState extends State<PathView> {
  late AutoScrollController controller;
  late SwiperController imgController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,
        0,
        0,
        MediaQuery.of(context).padding.bottom,
      ),
      axis: Axis.horizontal,
      suggestedRowHeight: AppBar().preferredSize.height,
    );
    imgController = new SwiperController();
  }

  void selectCarouselImg({required int index}) {
    imgController.move(index, animation: true);
    setState(() => this.index = index);
    selectText(index: index);
  }

  void selectText({required int index}) {
    controller.scrollToIndex(index, preferPosition: AutoScrollPosition.middle);
    setState(() => this.index = index);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.white,
        );
    TextStyle descStyle = Theme.of(context).textTheme.caption!.copyWith(
          color: AppTheme.labelColor,
        );

    Widget titleBar = Container(
      height: AppBar().preferredSize.height,
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(width: AppBar().preferredSize.height / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(child: Text(widget.details.title, style: titleStyle)),
                Text(
                  "${widget.details.subPaths.length} Sub Paths",
                  style: descStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.black,
            child: Text(
              "Open Path",
              style: descStyle.copyWith(color: Color(0xFFACD3FF)),
            ),
          ),
        ],
      ),
    );

    Widget imageCarousel() {
      double h = AppBar().preferredSize.height * 4;
      return Container(
        height: h,
        alignment: Alignment.center,
        child: Swiper(
          autoplay: false,
          onIndexChanged: (value) => selectText(index: value),
          controller: imgController,
          curve: Curves.easeInOutBack,
          duration: 500,
          itemCount: widget.details.subPaths.length,
          itemBuilder: (context, index) => CachedNetworkImage(
            imageUrl: widget.details.subPaths[index].imgUrl,
            errorWidget: (context, url, error) {
              return Align(
                child: Text(
                  error == null ? "" : error.toString(),
                  style: descStyle,
                  textAlign: TextAlign.center,
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return Center(child: CircularProgressIndicator.adaptive());
            },
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget paths() {
      List<Widget> pathsText = [];
      Color defLabelColor = Color(0xFFACD3FF);
      widget.details.subPaths.forEach(
        (element) {
          int ind = widget.details.subPaths.indexOf(element);
          EdgeInsets margin = EdgeInsets.all(5);
          if (ind == widget.details.subPaths.length - 1)
            margin = EdgeInsets.fromLTRB(5, 5, 15, 5);
          if (ind == 0) margin = EdgeInsets.fromLTRB(15, 5, 5, 5);

          Widget text = Container(
            margin: margin,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => selectCarouselImg(index: ind),
              child: AutoScrollTag(
                controller: controller,
                index: ind,
                key: ValueKey(ind),
                child: Text(
                  element.title,
                  style: titleStyle.copyWith(
                    color: ind == index ? AppTheme.labelColor : defLabelColor,
                  ),
                ),
              ),
            ),
          );
          pathsText.add(text);
          if (ind != widget.details.subPaths.length - 1)
            pathsText.add(
              Container(
                margin: EdgeInsets.all(5),
                child: Icon(Icons.arrow_forward, color: Color(0xFFC3C3C3)),
              ),
            );
        },
      );
      return Container(
        height: AppBar().preferredSize.height,
        alignment: Alignment.center,
        color: Colors.black,
        child: ListView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: pathsText,
        ),
      );
    }

    return widget.details.subPaths.isEmpty
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(vertical: 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                titleBar,
                imageCarousel(),
                paths(),
              ],
            ),
          );
  }
}
