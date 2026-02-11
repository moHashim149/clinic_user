part of 'select_location_cubit.dart';

@immutable
abstract class SelectLocationState {}

class SelectLocationInitial extends SelectLocationState {}

class ChangeIndex extends SelectLocationState {}

class OnMapCreateSuccess extends SelectLocationState {}

class GetCurrentLoading extends SelectLocationState {}

class GetCurrentFailure extends SelectLocationState {
  final String error;

  GetCurrentFailure({required this.error});
}

class GetCurrentSuccess extends SelectLocationState {}

class GetPlacesLoading extends SelectLocationState {}

class GetPlacesSuccess extends SelectLocationState {}

class GetPlacesFailure extends SelectLocationState {
  final String error;

  GetPlacesFailure({required this.error});
}

class UpdateCameraLocation extends SelectLocationState {}

class UpdateCameraFailure extends SelectLocationState {}

class SetSearchResultValueState extends SelectLocationState {}

class GetAutoCompleteState extends SelectLocationState {}

class SelectLocationLoaded extends SelectLocationState {
  final Position currentLocation;

  SelectLocationLoaded({required this.currentLocation});
}

class CheckLocationTechLoading extends SelectLocationState {}

class CheckLocationTechFailure extends SelectLocationState {}
class CountriesFailure extends SelectLocationState {
  final String error;
  CountriesFailure({required this.error});
}
class CountriesLoading extends SelectLocationState {}
class CountriesLoaded extends SelectLocationState {}

class AddAddressLoading extends SelectLocationState {}

class AddAddressLoaded extends SelectLocationState {}

class AddAddressFailure extends SelectLocationState {}

class UpdateAddressLoading extends SelectLocationState {}

class UpdateAddressLoaded extends SelectLocationState {}

class UpdateAddressFailure extends SelectLocationState {}

class DeleteAddressLoading extends SelectLocationState {}

class DeleteAddressLoaded extends SelectLocationState {}

class DeleteAddressFailure extends SelectLocationState {}
