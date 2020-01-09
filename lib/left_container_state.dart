class LeftContainerState {
  final String _title = 'left';
  String get title => _title;


  LeftContainerState.origin(){
    loadOriginData();
  }

  void loadMoreData(){
    //load data
    print('LeftContainerState load more data');
  }

  void loadOriginData() {
    print('LeftContainerState load origin data');

  }

}