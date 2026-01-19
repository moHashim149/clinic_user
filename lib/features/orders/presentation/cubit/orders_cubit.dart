import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';
@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
}
