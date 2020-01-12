import 'package:flutter/material.dart';
import 'package:flutter_app/container_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne>
    with AutomaticKeepAliveClientMixin<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Injector(
      //
      key: Key('1'),
      inject: [
        Inject<ContainerState>(
          () => ContainerState(),
        )
      ],
      builder: (context) {
        return StateBuilder(
          models: [Injector.getAsReactive<ContainerState>()],
          initState: (BuildContext context, modelRm) {
            modelRm.setState((state) => state.futureIncrease());
          },
          builder: (_, modelRm) {
            return modelRm.whenConnectionState(
              onError: (_) => ErrorScreen(),
              onWaiting: () => WaittingScreen(),
              onData: (state) => DataScreen(modelRm: modelRm),
              onIdle: () => null,
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DataScreen extends StatelessWidget {
  final ReactiveModel<ContainerState> modelRm;

  const DataScreen({
    Key key,
    @required this.modelRm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        modelRm.setState((state) => state.futureIncrease());
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.lightGreen,
        child: Text('${modelRm.state.count}'),
      ),
    );
  }
}

class WaittingScreen extends StatelessWidget {
  const WaittingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
