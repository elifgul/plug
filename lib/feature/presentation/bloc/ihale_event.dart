import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IhaleEvent extends Equatable {
  const IhaleEvent();
}

class GetIhaleList extends IhaleEvent {

  @override
  List<Object> get props => [];
}

class GetIhaleDetail extends IhaleEvent {
  int ihaleId;
  GetIhaleDetail(this.ihaleId);

  @override
  List<Object> get props => [ihaleId];
}

class ConfirmIhale extends IhaleEvent {
  int ihaleId;
  @override
  List<Object> get props => [ihaleId];
}

class RejectIhale extends IhaleEvent {
  int ihaleId;
  @override
  List<Object> get props => [ihaleId];
}


class ExplanationIhale extends IhaleEvent {
  int ihaleId;
  @override
  List<Object> get props => [ihaleId];
}