import 'dart:convert';

import 'package:devquiz/shared/model/question_model.dart';

enum Level { easy, medium, hard, expert}

extension LevelStringExt on String {
  Level get parse => {
        "easy": Level.easy,
        "medium": Level.medium,
        "hard": Level.hard,
        "expert": Level.expert
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.easy: "easy",
        Level.medium: "medium",
        Level.hard: "hard",
        Level.expert: "expert"
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
