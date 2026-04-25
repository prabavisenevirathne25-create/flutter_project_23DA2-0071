import '/features/order.dart';

class OrderRepository {
  List<Order> getOrders() {
    return [
      Order(
        OrderNumber: '124258',
        itemCount: 2,
        totalAmount: 5000.00,
        status: OrderStatus.active,
        imageUrl: 'assets/images/Kids7.png',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '524675',
        itemCount: 1,
        totalAmount:400.00,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/jacket.png',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '246759',
        itemCount: 1,
        totalAmount: 6300.00,
        status: OrderStatus.cancelled,
        imageUrl: 'assets/images/backpack.png',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];
  }

  List<Order> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
