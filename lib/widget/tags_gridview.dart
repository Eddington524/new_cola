import 'package:flutter/material.dart';
import 'package:new_cola/model/tags.dart';
import 'package:new_cola/repository/tags_repo.dart';
import 'package:new_cola/theme/custom_color.dart';

class TagsGridviewPage extends StatefulWidget {
  final Function updateTagsState;
  final Function toggleStartBtnActive;

  TagsGridviewPage({Key? key, required this.toggleStartBtnActive, required this.updateTagsState})
      : super(key: key);

  @override
  State<TagsGridviewPage> createState() => _TagsGridviewPageState();
}

class _TagsGridviewPageState extends State<TagsGridviewPage> {
  final List<String> _selectedlist = [];
  late int _currentSelectIdx;

  Future<List<Tags>>? _tags;

  @override
  void initState() {
    super.initState();
    _tags = TagsRepo().loadData();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: TagsRepo().loadData(),
        future: _tags,
        builder: (context, snapshot) {
          print("future builder build");
          var list = snapshot.data ?? [];
          return GridView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            scrollDirection: Axis.vertical,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              var item = list[index];
              return GestureDetector(
                onTap: () {
                  _currentSelectIdx = index;

                  if (_selectedlist.contains('$index')) {
                    _selectedlist.removeWhere((element) => element == '$index');
                  } else {
                    if (_selectedlist.length > 9) return showAlertDialog();
                    _selectedlist.add('$index');
                  }

                  if (_selectedlist.length >=3) {
                    widget.toggleStartBtnActive(true);
                  }else{
                    widget.toggleStartBtnActive(false);
                  }
                  widget.updateTagsState(_selectedlist);

                  setState(() {
                  });
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CustomColors().mainBlue,
                              width: _selectedlist.contains('$index') ? 5 : 0),
                          borderRadius: BorderRadius.circular(15)),
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(item.imgUrl, fit: BoxFit.cover),
                      ),
                    ),
                    Text('${item.title}')
                  ],
                ),
              );
            },
          );
        });
  }

// todo 갹 팝업별 파일 분리
  void showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("관심 태그 최대 갯수는 10개입니다"),
            //
            content: Text(
              "10개 이하로 선택해 주시기 바랍니다",
            ),
            actions: [
              TextButton(
                child: Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
