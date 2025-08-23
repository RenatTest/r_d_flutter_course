class AnimationCubitState {
  const AnimationCubitState({required this.size});

  final double size;

  AnimationCubitState copyWith({double? size}) {
    return AnimationCubitState(size: size ?? this.size);
  }
}
