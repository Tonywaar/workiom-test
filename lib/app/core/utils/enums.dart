enum RequestState { begin, loading, error, empty, success }

extension RequestStateX on RequestState {
  bool get isBegin => RequestState.begin == this;

  bool get isLoading => RequestState.loading == this;

  bool get isSuccess => RequestState.success == this;

  bool get isEmpty => RequestState.empty == this;

  bool get isError => RequestState.error == this;
}