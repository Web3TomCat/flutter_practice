//顶部tab 切换 保持状态
import 'package:flutter/material.dart';

class KeepAliveTabBar extends StatefulWidget {
  @override
  _KeepAliveTabBarState createState() => _KeepAliveTabBarState();
}

class _KeepAliveTabBarState extends State<KeepAliveTabBar> with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3,vsync: this);
  }
  //销毁方法
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Alive Tab Bar'),
        bottom:  TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_bus)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          KeepAliveComponent(),
          KeepAliveComponent(),
          KeepAliveComponent(),
        ],
      ),
    );
  }
}


class KeepAliveComponent extends StatefulWidget {
  @override
  _KeepAliveComponentState createState() => _KeepAliveComponentState();
}

class _KeepAliveComponentState extends State<KeepAliveComponent> with AutomaticKeepAliveClientMixin{
  int _count = 0;
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;//重写保持状态方法

  void addFunc(){
    setState(() {
      _count ++;
    });
  }

  void reduce(){
    setState(() {
      _count --;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Add'),
            Text('$_count'+'Times',)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addFunc,
        tooltip: 'add',
        child: Icon(Icons.add),
      ),
    );
  }
}