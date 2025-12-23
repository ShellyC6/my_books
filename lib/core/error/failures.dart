import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure(this.errorMessage, [List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  const ServerFailure():super('Erreur du serveur, veuillez reéessayer plus tard');

  @override
  List<Object?> get props => [];
}
