import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Exercise extends Equatable {
  final String id;
  final DateTime executionDay;
  final String executionTime;
  final String name;
  final int frequency;
  final String intensity;
  final int durationInMinutes;
  final DateTime initialDate;
  final DateTime finalDate;
  final bool shortnessOfBreath;
  final bool excessiveFatigue;
  final bool dizziness;
  final bool bodyPain;
  final bool done;

  Exercise({
    this.executionDay,
    this.id,
    this.shortnessOfBreath,
    this.excessiveFatigue,
    this.dizziness,
    this.bodyPain,
    this.executionTime,
    @required this.name,
    this.frequency,
    @required this.intensity,
    @required this.durationInMinutes,
    this.initialDate,
    this.finalDate,
    @required this.done,
  });

  @override
  List<Object> get props => [
        executionDay,
        shortnessOfBreath,
        excessiveFatigue,
        dizziness,
        bodyPain,
        name,
        frequency,
        intensity,
        durationInMinutes,
        initialDate,
        finalDate,
        id,
        done,
        executionTime,
      ];
}