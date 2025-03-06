import '../../model/ride/locations.dart';
import 'locationRepository.dart';

class MockLocationRepository extends LocationsRepository {
  final Location paris = Location(name: "Paris", country: Country.france);
  final Location toulouse = Location(name: "Toulouse", country: Country.france);

  @override
  Future<List<Location>> getLocations() async {
    return [paris, toulouse];
  }
}
