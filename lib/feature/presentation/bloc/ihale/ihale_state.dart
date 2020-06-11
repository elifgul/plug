import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plug/feature/domain/entity/ihale.dart';

@immutable
abstract class IhaleState extends Equatable {}

class Loading extends IhaleState {
  @override
  List<Object> get props => [];
}

class ListLoading extends IhaleState {
  @override
  List<Object> get props => [];
}


class Loaded extends IhaleState {
  final Ihale ihale;

  Loaded(this.ihale);

  @override
  List<Object> get props => [ihale];
}

class ListLoaded extends IhaleState {
  final List<Ihale> ihaleList;

  ListLoaded(this.ihaleList);

  @override
  List<Object> get props => [ihaleList];
}

class Error extends IhaleState {
  final String message;

  Error(this.message);

  @override
  List<Object> get props => [message];
}
