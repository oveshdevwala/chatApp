part of 'new_contact_bloc.dart';

@immutable
sealed class NewContactEvent {}

class GetAllContact extends NewContactEvent{}