import 'package:flutter/material.dart';
import 'package:new_cola/pages/detail/banner_detail.dart';
import 'dart:math';

import 'package:new_cola/repository/banner_repo.dart';
import 'package:new_cola/widget/indicator.dart';

class BannerSliderView extends StatefulWidget {
  const BannerSliderView({super.key});

  @override
  State<BannerSliderView> createState() => _BannerSliderViewState();
}

class _BannerSliderViewState extends State<BannerSliderView> {
  var _selectedIndex = 0;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return FutureBuilder(
        future: BannerRepo().loadData(),
        builder: (context, snapshot){
     var list = snapshot.data ?? [];

     return Column(
       children: [
         SizedBox(
           height: 200,
           child: PageView.builder(
             onPageChanged: (index){
               setState(() {
                 _selectedIndex = index;
               });
             },
             itemCount: list.length,
             scrollDirection: Axis.horizontal,
             controller: controller,
             itemBuilder: (context, index) {
               var item = list[index];
               return Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 height: 180,
                 color: Colors.white,
                 child: GestureDetector(
                   onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => BannerDetail(id: item.id,)));
                   },
                   child: Stack(
                     fit: StackFit.expand,
                     children: [
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(10.0),
                           child: Image.network(list[index].imgUrl,
                               fit: BoxFit.cover),
                         ),
                       ),
                       Align(
                         alignment: Alignment.topCenter,
                         child: Container(
                           width: 50,
                           height: 20,
                           color: Color.fromARGB(
                             _random.nextInt(256),
                             _random.nextInt(256),
                             _random.nextInt(256),
                             _random.nextInt(256),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               );
             },
           ),
         ),
         Container(
           color: Colors.white,
           padding: EdgeInsets.symmetric(vertical: 10),
           margin: EdgeInsets.only(bottom: 10),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ...List.generate(
                 list.length,
                     (index) =>
                     Indicator(isActive: _selectedIndex == index ? true : false),
               )
             ],
           ),
         )
       ],
     );
    });
  }
}
