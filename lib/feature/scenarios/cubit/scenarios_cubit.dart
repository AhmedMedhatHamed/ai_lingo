import 'package:ai_lingo/feature/scenarios/cubit/scenarios_state.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:ai_lingo/feature/scenarios/repo/scenario_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScenariosCubit extends Cubit<ScenariosState> {
  ScenariosCubit({required this.scenarioRepository})
    : super(ScenariosInitialState());

  final ScenarioRepository scenarioRepository;

  List<Scenario> _scenarios = [];

  List<Scenario> get scenarios => _scenarios;

  Future<void> getScenarios() async {
    emit(ScenariosLoadingState());

    try {
      _scenarios = await scenarioRepository.getScenarios();
      emit(ScenariosSuccessState(scenarios: _scenarios));
    } catch (e) {
      emit(ScenariosErrorState(message: e.toString()));
    }
  }
}
