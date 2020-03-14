import 'package:cardio_flutter/features/exercises/domain/entities/exercise.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    DateTime timeOfDay,
    String id,
    DateTime realizationDay,
    bool shortnessOfBreath,
    bool excessiveFatigue,
    bool dizziness,
    bool bodyPain,
    @required String name,
    @required int frequency,
    @required String intensity,
    @required int durationInMinutes,
    @required DateTime inicialDate,
    @required DateTime finalDate,
    @required bool done,
  }) : super(
          timeOfDay: timeOfDay,
          id: id,
          shortnessOfBreath: shortnessOfBreath,
          excessiveFatigue: excessiveFatigue,
          dizziness: dizziness,
          bodyPain: bodyPain,
          name: name,
          frequency: frequency,
          intensity: intensity,
          durationInMinutes: durationInMinutes,
          inicialDate: inicialDate,
          finalDate: finalDate,
          realizationDay: realizationDay,
          done: done,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};
    if (timeOfDay != null) json['timeOfDay'] = timeOfDay.millisecondsSinceEpoch;
    if (inicialDate != null)
      json['inicialDate'] = inicialDate.millisecondsSinceEpoch;
    if (finalDate != null) json['finalDate'] = finalDate.millisecondsSinceEpoch;
    if (name != null) json['name'] = name;
    if (realizationDay != null) json['realizationDay'] = realizationDay;
    if (frequency != null) json['frequency'] = frequency;
    if (intensity != null) json['intensity'] = intensity;
    if (durationInMinutes != null)
      json['durationInMinutes'] = durationInMinutes;
    if (excessiveFatigue != null) json['excessiveFatigue'] = excessiveFatigue;
    if (shortnessOfBreath != null)
      json['shortnessOfBreath'] = shortnessOfBreath;
    if (dizziness != null) json['dizziness'] = dizziness;
    if (bodyPain != null) json['bodyPain'] = bodyPain;

    return json;
  }

  factory ExerciseModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return ExerciseModel(
      timeOfDay: (json['timeOfDay'] == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['timeOfDay']),
      inicialDate: (json['inicialDate'] == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['inicialDate']),
      finalDate: (json['finalDate'] == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['finalDate']),
      id: json['id'],
      name: json['name'],
      frequency: json['frequency'],
      intensity: json['intensity'],
      realizationDay: json['realizationDay'],
      durationInMinutes: json['durationInMinutes'],
      shortnessOfBreath: json['shortnessOfBreath'],
      excessiveFatigue: json['excessiveFatigue'],
      dizziness: json['dizziness'],
      bodyPain: json['bodyPain'],
      done: json['done'],
    );
  }

  factory ExerciseModel.fromEntity(Exercise exercise) {
    if (exercise == null) return null;
    return ExerciseModel(
        name: exercise.name,
        bodyPain: exercise.bodyPain,
        dizziness: exercise.dizziness,
        durationInMinutes: exercise.durationInMinutes,
        excessiveFatigue: exercise.excessiveFatigue,
        id: exercise.id,
        finalDate: exercise.finalDate,
        realizationDay: exercise.realizationDay,
        frequency: exercise.frequency,
        inicialDate: exercise.inicialDate,
        intensity: exercise.intensity,
        shortnessOfBreath: exercise.shortnessOfBreath,
        timeOfDay: exercise.timeOfDay,
        done: exercise.done);
  }

  factory ExerciseModel.fromDataSnapshot(DataSnapshot dataSnapshot, bool done) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> objectMap =
        dataSnapshot.value as Map<dynamic, dynamic>;

    objectMap['id'] = dataSnapshot.key;
    objectMap['done'] = done;

    return ExerciseModel.fromJson(objectMap);
  }
  static List<ExerciseModel> fromDataSnapshotList(
      DataSnapshot dataSnapshot, bool done) {
    if (dataSnapshot == null) return null;

    List<ExerciseModel> result = List<ExerciseModel>();
    Map<dynamic, dynamic> objectTodoMap =
        dataSnapshot.value as Map<dynamic, dynamic>;
    if (objectTodoMap != null) {
      for (MapEntry<dynamic, dynamic> entry in objectTodoMap.entries) {
        Map<dynamic, dynamic> exerciseMap = entry.value;
        exerciseMap['id'] = entry.key;
        exerciseMap['done'] = done;
        print(exerciseMap);
        result.add(ExerciseModel.fromJson(exerciseMap));
      }
    }

    return result;
  }
}
