import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/domain/repository/ihale_repository.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';

class IhaleBilgiBloc extends Bloc<IhaleEvent, IhaleState> {

  final IhaleRepository ihaleRepository;

  IhaleBilgiBloc({this.ihaleRepository});

  @override
  IhaleState get initialState => Loading();

  @override
  Stream<IhaleState> mapEventToState(IhaleEvent event) async* {
    if (event is GetIhaleDetail) {
      try {
        yield Loaded(event.ihale);
      } on Error {
        yield Error("Couldn't fetch ihale!");
      }
    } else if (event is ConfirmIhale) {
      try {
        yield Loaded(await ihaleRepository.confirmIhale(event.ihale.id));
      } on Error {
        yield Error("Couldn't confirm ihale!");
      }
    } else if (event is RejectIhale) {
      try {
        yield Loaded(await ihaleRepository.rejectIhale(event.ihale.id));
      } on Error {
        yield Error("Couldn't reject ihale!");
      }
    } else if (event is ExplanationIhale) {
      try {
        yield Loaded(await ihaleRepository.explanationIhale(event.ihale.id));
      } on Error {
        yield Error("Couldn't explanation ihale!");
      }
    }
  }
}