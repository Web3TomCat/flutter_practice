import 'package:flutter/material.dart';

const searchList = [
  '11-A',
  '11-B',
  '22-C',
  '22-D',
];
const recentSugget = [
  'AA',
  'BB',
];

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search bar'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
              // print('onpressed');
              showSearch(context: context,delegate: SearchBarDelegate());
            },
          )
        ],
      ),
    );
  }
}



class SearchBarDelegate extends SearchDelegate<String>{
  //清除
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  //返回上一页 （关闭该页面）
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,

      ),
      onPressed: (){
        close(context,null);
      },
    );
  }

  //展示搜索结果
  @override
  Widget buildResults(BuildContext context){
    return Container(
      width: 100.0,
      height: 100.0,
      
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  //搜索提示性文字
  @override
  Widget buildSuggestions(BuildContext context){
    final resultlist = query.isEmpty ? recentSugget : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
      itemCount: resultlist.length,
      itemBuilder: (context,index) => ListTile(
        title: RichText(
          text: TextSpan(
            text:resultlist[index].substring(0,query.length),
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: resultlist[index].substring(query.length),
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          
        ),
      ),
    );
  }

}