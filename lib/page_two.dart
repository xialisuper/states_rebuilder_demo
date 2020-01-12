import 'package:flutter/material.dart';
import 'package:flutter_app/container_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo>
    with AutomaticKeepAliveClientMixin<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Injector(
      key: Key('2'),
      initState: () {
//              print('right initState');
      },
      inject: [
        Inject<ContainerState>(
          () => ContainerState(),
        )
      ],
      builder: (context) {
        final ReactiveModel<ContainerState> modelRm =
            Injector.getAsReactive<ContainerState>(context: context);
        return InkWell(
          onTap: () {
            // modelRm.state.increase();
            modelRm.setState((state) => state.increase());
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey,
            child: Text('${modelRm.state.count}'),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
