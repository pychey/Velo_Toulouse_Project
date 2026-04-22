import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import '../../../../model/bike_slot/bike_slot.dart';
import '../../../../model/station/station.dart';
import '../../../states/station_state.dart';

class ConfirmationViewModel extends ChangeNotifier {
  static const int totalSeconds = 30;

  final String stationId;
  final String slotId;
  final StationState stationState;

  Timer? _timer;
  int _secondsRemaining = totalSeconds;
  bool _timerFinished = false;

  ConfirmationViewModel({
    required this.stationId,
    required this.slotId,
    required this.stationState,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      stationState.reserveBike(stationId, slotId);
      _startTimer();
    });
  }

  int get secondsRemaining => _secondsRemaining;
  bool get timerFinished => _timerFinished;

  double get progress => _secondsRemaining / totalSeconds;

  String get formattedTime {
    final minutes = _secondsRemaining ~/ 60;
    final seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Station? get station => stationState.getStationById(stationId);

  BikeSlot? get slot => stationState.getSlot(stationId, slotId);

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining <= 1) {
        _secondsRemaining = 0;
        _timerFinished = true;
        timer.cancel();
      } else {
        _secondsRemaining -= 1;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}