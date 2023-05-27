import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api/features/repositories/domain/entities/repositories.dart';
import 'package:github_api/features/repositories/domain/use_cases/repositories_use_case.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final RepositoriesUseCase repositoriesUseCase;
  RepositoriesBloc(this.repositoriesUseCase)
      : super(RepositoriesState.initial()) {
    on<SearchRepositoriesEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      emit(state.copyWith(
          repos: await repositoriesUseCase.call(state.searchController.text),
          isLoading: false));
    });
  }
}
