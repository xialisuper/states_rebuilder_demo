class ContainerState {
  int _count = 0;
  int get count => _count;

  void increase() {
    _count++;
  }

  void futureIncrease() async {
    final result = await Future.delayed(Duration(seconds: 1), () {
      return 1;
    });
    _count += result;
    // Future.delayed(Duration(seconds: 3), () {
    //   _count += 1;
    // });
  }

  void loadMoreData() {
    //load data
    print('LeftContainerState load more data');
  }

  void loadOriginData() {
    print('LeftContainerState load origin data');
  }
}
