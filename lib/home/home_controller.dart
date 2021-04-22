import 'package:devquiz/home/home_respository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/model/quiz_model.dart';
import 'package:devquiz/shared/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  final repository = HomeRespository();

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
