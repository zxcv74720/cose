import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final searchData = [
    '성수',
    '성심당',
    '홍대 카페'
  ];

  void _clearSearchData() {
    setState(() {
      searchData.clear();
    });
  }

  void _removeSearchItem(String item) {
    setState(() {
      searchData.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      autoFocus: true,
                      shape: WidgetStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      elevation: const WidgetStatePropertyAll(0),
                      side: WidgetStateProperty.all(const BorderSide(color: primary, width: 2)),
                      backgroundColor: const WidgetStatePropertyAll(white),
                      hintText: '장소, 주소로 검색',
                      hintStyle: WidgetStateProperty.all(grey16TextStyle),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      '취소',
                      style: primary16TextStyle,
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.03, width * 0.03, height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '최근 검색어',
                    style: grey13TextStyle,
                  ),
                  GestureDetector(
                    onTap: _clearSearchData,
                    child: Text(
                      '비우기',
                      style: grey13TextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: ListView.builder(
                  itemCount: searchData.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(searchData[index], style: black16TextStyle),
                        IconButton(
                          onPressed: () => _removeSearchItem(searchData[index]),
                          icon: Icon(Icons.close, color: disableButtonGrey, size: 18),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}