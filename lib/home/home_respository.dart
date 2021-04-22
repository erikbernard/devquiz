import 'dart:convert';

import 'package:devquiz/shared/model/quiz_model.dart';
import 'package:devquiz/shared/model/user_model.dart';
import 'package:flutter/services.dart';

class HomeRespository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
