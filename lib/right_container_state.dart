class RightContainerState {
  RightContainerState.origin(){
    loadOriginData();
  }
  final String title = 'right';

  void loadMoreData(){
    //load data
    print('RightContainerState load more data');
  }

  void loadOriginData() {
    print('RightContainerState load origin data');

  }

}