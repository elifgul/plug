import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plug/feature/domain/entity/ihale.dart';

@immutable
abstract class IhaleEvent extends Equatable {
  const IhaleEvent();
}

class GetIhaleList extends IhaleEvent {
  @override
  List<Object> get props => [];
}

class GetIhaleDetail extends IhaleEvent {
  final Ihale ihale;
  GetIhaleDetail(this.ihale);

  @override
  List<Object> get props => [ihale];
}

class ConfirmIhale extends IhaleEvent {
  final Ihale ihale;
  ConfirmIhale(this.ihale);

  @override
  List<Object> get props => [ihale];
}

class RejectIhale extends IhaleEvent {
  final Ihale ihale;
  RejectIhale(this.ihale);

  @override
  List<Object> get props => [ihale];
}


class ExplanationIhale extends IhaleEvent {
  final Ihale ihale;
  ExplanationIhale(this.ihale);

  @override
  List<Object> get props => [ihale];
}