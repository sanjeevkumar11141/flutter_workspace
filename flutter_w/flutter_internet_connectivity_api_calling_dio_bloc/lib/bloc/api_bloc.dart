import 'package:bloc/bloc.dart';

import '../networking/api_response.dart';
import '../repository/api_repository.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiRepository apiRepository;

  ApiBloc(this.apiRepository) : super(ApiLoadingState()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(ApiLoadingState());
      ApiResponse<dynamic> response = await apiRepository.fetchPosts();
      if (response.status == Status.COMPLETED) {
        emit(ApiSuccessState(response.data));
      } else if (response.status == Status.ERROR) {
        emit(ApiErrorState(response.message ?? "Unknown error"));
      }
    });
  }
}
