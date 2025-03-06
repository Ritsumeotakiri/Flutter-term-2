import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../repository/mock/locationRepository.dart';

///
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  final LocationsRepository repository;

  LocationsService(this.repository);

  //static const List<Location> availableLocations = fakeLocations;

  Future<List<Location>> fetchLocations() {
    return repository.getLocations();
  }