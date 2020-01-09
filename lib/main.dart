import 'package:flutter/material.dart';
import 'package:flutter_app/left_container_state.dart';
import 'package:flutter_app/right_container_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'left'),
            Tab(text: 'right'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Injector(
            initState: () {
//              print('left initState');
            },
            inject: [
              Inject<LeftContainerState>(
                () => LeftContainerState.origin(),
              )
            ],
            builder: (context) {
              final ReactiveModel<LeftContainerState> modelRm =
                  Injector.getAsReactive<LeftContainerState>();
              return InkWell(
                onTap: (){
                  modelRm.state.loadMoreData();
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.lightGreen,
                  child: Text(modelRm.state.title),
                ),
              );
            },
          ),
          Injector(
            initState: () {
//              print('right initState');
            },
            inject: [
              Inject<RightContainerState>(
                () => RightContainerState.origin(),
              )
            ],
            builder: (context) {
              final ReactiveModel<RightContainerState> modelRm =
                  Injector.getAsReactive<RightContainerState>();
              return InkWell(
                onTap: (){
                  modelRm.state.loadMoreData();
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.lightGreen,
                  child: Text(modelRm.state.title),
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
