import 'package:brandy_user/features/auth/data/models/user_model.dart';
import 'package:brandy_user/features/cart/data/models/cart_item_model.dart';
import 'package:brandy_user/features/orders/data/models/location_model.dart';
import 'package:brandy_user/features/orders/data/models/purchase_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderModel {
  final int id;
  final String code,status,date;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "order_items")
  final List<CartItemModel> orderItems;
  @JsonKey(name: "status_key")
  final int? statusKey;
  final LocationModel? pickup;
  final LocationModel? delivery;
  final UserModel? courier;
  final UserModel? user;
  final PurchaseModel? purchase;
  @JsonKey(name: "chat_id")
  final int? chatId;


  const OrderModel({
    required this.id,
    required this.code,
    required this.status,
    required this.date,
    this.storeName,
    required this.orderItems,
    this.statusKey,
    this.pickup,
    this.user,
    this.delivery,
    this.courier,
    this.purchase,
    this.chatId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
