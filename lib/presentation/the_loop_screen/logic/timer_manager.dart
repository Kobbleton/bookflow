import 'dart:async';

class TimerManager {
  Timer? _timer;
  int durationMilliseconds;
  DateTime lastUpdateTime;
  Function? updateWord;
  Stream<int>? durationStream;
  late StreamSubscription<int> durationSubscription;

  TimerManager({this.durationMilliseconds = 500, this.updateWord})
      : lastUpdateTime = DateTime.now();
  void start() {
    if (_timer?.isActive ?? false) {
      return;
    }

    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      int elapsedMilliseconds =
          DateTime.now().difference(lastUpdateTime).inMilliseconds;
      if (elapsedMilliseconds >= durationMilliseconds) {
        updateWord?.call();
        lastUpdateTime = DateTime.now();
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }

  void listenToDurationUpdates(Stream<int> stream) {
    durationStream = stream;
    durationSubscription = durationStream!.listen((newDuration) {
      durationMilliseconds = newDuration;
    });
  }

  void updateDuration(int newDuration) {
    durationMilliseconds = newDuration;
    stop();
    start();
  }

  void dispose() {
    durationSubscription.cancel();
    _timer?.cancel();
  }
}
