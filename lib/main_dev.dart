import 'package:provider/provider.dart';
import 'data/repositories/station/station_repository.dart';
import 'data/repositories/station/station_repository_mock.dart';
import 'main_common.dart';
import 'ui/states/station_state.dart';
import 'ui/states/user_location_state.dart';

List<InheritedProvider> get devProviders {
  final stationRepository = StationRepositoryMock();

  return [
    Provider<StationRepository>(create: (_) => stationRepository),
    ChangeNotifierProvider<StationState>(
      create: (_) => StationState(repository: stationRepository),
    ),
    ChangeNotifierProvider<UserLocationState>(
      create: (_) => UserLocationState(repository: stationRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}