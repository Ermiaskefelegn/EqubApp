import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:equbapp/Components/due_paymnet_widget.dart';
import 'package:equbapp/Controllers/due_paymnet_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuePaymnetCarusel extends StatefulWidget {
  const DuePaymnetCarusel({Key? key}) : super(key: key);

  @override
  _DuePaymnetCaruselState createState() => _DuePaymnetCaruselState();
}

class _DuePaymnetCaruselState extends State<DuePaymnetCarusel> {
  @override
  void initState() {
    super.initState();
  }

  final DuePaymnetProvider duePaymnetProvider = Get.put(DuePaymnetProvider());
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return duePaymnetProvider.isloading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: AutoSizeText(
                  "Due Paymnets",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Obx(
                () {
                  return CarouselSlider.builder(
                    carouselController: _controller,
                    itemBuilder: (context, index, realIDx) {
                      var dataList = duePaymnetProvider.getdata[index];
                      return DuePaymnet(
                        duePaymnetModel: dataList,
                        press: () {},
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 0.6,
                        height: MediaQuery.of(context).size.height / 3.5,
                        initialPage: 0,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayInterval: Duration(seconds: 8),
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true),
                    itemCount: duePaymnetProvider.getdata.length,
                  );
                },
              )
            ],
          );
    ;
  }
}
