enum ResourceStatus {
  initial,
  loading,
  success,
  error,
}

class Resource<T> {
  final ResourceStatus status;
  final T? data;
  final String? error;

  const Resource({
    required this.status,
    this.data,
    this.error,
  });

  const Resource.initial()
      : status = ResourceStatus.initial,
        data = null,
        error = null;

  const Resource.loading()
      : status = ResourceStatus.loading,
        data = null,
        error = null;

  const Resource.success(T this.data)
      : status = ResourceStatus.success,
        error = null;

  const Resource.error(String this.error)
      : status = ResourceStatus.error,
        data = null;

  bool get isInitial => status == ResourceStatus.initial;
  bool get isLoading => status == ResourceStatus.loading;
  bool get isSuccess => status == ResourceStatus.success;
  bool get isError => status == ResourceStatus.error;
}