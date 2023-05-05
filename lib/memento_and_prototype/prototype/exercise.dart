enum TargetMuscle {
  chest('가슴'),
  arm('팔'),
  shoulder('어깨'),
  back('등'),
  leg('다리');

  final String part;
  const TargetMuscle(this.part);
}

abstract class Prototype {
  Prototype clone();
}

class Exercise implements Prototype {
  TargetMuscle target;
  int weight;

  Exercise({
    required this.target,
    required this.weight,
  });

  Exercise.init()
      : target = TargetMuscle.leg,
        weight = 10;

  factory Exercise.clone(Exercise exercise) {
    return Exercise(
      target: exercise.target,
      weight: exercise.weight,
    );
  }

  @override
  Prototype clone() {
    return Exercise.clone(this);
  }
}
