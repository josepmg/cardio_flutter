import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Exercise extends Equatable {
  final String id;
  final DateTime realizationDay;
  final String name;
  final int frequency;
  final String intensity;
  final int durationInMinutes;
  final DateTime inicialDate;
  final DateTime finalDate;
  final DateTime timeOfDay;
  final bool shortnessOfBreath;
  final bool excessiveFatigue;
  final bool dizziness;
  final bool bodyPain;
  final bool done;

  Exercise({
    this.realizationDay,
    this.timeOfDay,
    this.id,
    this.shortnessOfBreath,
    this.excessiveFatigue,
    this.dizziness,
    this.bodyPain,
    @required this.name,
    @required this.frequency,
    @required this.intensity,
    @required this.durationInMinutes,
    @required this.inicialDate,
    @required this.finalDate,
    @required this.done,
  });

  @override
  List<Object> get props => [
        timeOfDay,
        shortnessOfBreath,
        excessiveFatigue,
        dizziness,
        bodyPain,
        name,
        frequency,
        intensity,
        durationInMinutes,
        inicialDate,
        finalDate,
        id,
        done,
      ];
}
