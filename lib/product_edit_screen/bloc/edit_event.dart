

abstract class EditEvent {
  @override
  List<Object> get props => [];
}

class FetchProduct extends EditEvent {
  final int id;

  FetchProduct(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateProduct extends EditEvent {
  final int id;
  final Map<String, dynamic> data;

  UpdateProduct(this.id, this.data);

  @override
  List<Object> get props => [id, data];
}
