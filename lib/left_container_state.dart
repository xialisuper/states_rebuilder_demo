class LeftContainerState {
  final String title = 'left';
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