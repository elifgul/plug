import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/domain/repository/ihale_repository.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';

class IhaleBloc extends Bloc<IhaleEvent, IhaleState> {
  final IhaleRepository ihaleRepository;

  IhaleBloc({@required this.ihaleRepository});

  @override
  IhaleState get initialState => ListLoading();

  @override
  Stream<IhaleState> mapEventToState(IhaleEvent event) async* {

    if (event is GetIhaleList) {
      try {
        yield ListLoaded(await ihaleRepository.getIhaleList());
      } on Error {
        print("Couldn't fetch ihale list!");
        yield Error("Couldn't fetch ihale list!");
      }
    } else if (event is GetIhaleDetail) {
      try {
        yield Loaded(await ihaleRepository.getIhale(event.ihaleId));
      } on Error {
        yield Error("Couldn't fetch ihale!");
      }
    } else if (event is ConfirmIhale) {
      try {
        await ihaleRepository.confirmIhale(event.ihaleId);
        yield ListLoading();
      } on Error {
        yield Error("Couldn't confirm ihale!");
      }
    } else if (event is RejectIhale) {
      try {
        await ihaleRepository.rejectIhale(event.ihaleId);
        yield ListLoading();
      } on Error {
        yield Error("Couldn't reject ihale!");
      }
    } else if (event is ExplanationIhale) {
      try {
        await ihaleRepository.explanationIhale(event.ihaleId);
        yield ListLoading();
      } on Error {
        yield Error("Couldn't explanation ihale!");
      }
    }
  }
}
