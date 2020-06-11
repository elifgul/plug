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
    }
  }
}
