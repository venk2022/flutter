// ignore_for_file: file_names

class Hackathon{
  static final items = [
    Item(
      id : 1,
      name : "Laptop A",
      desc: "A high-performance laptop suitable for gaming and professional work.",
      price: 1200.99,
      color: "Black",
      image: "https://cdn.thewirecutter.com/wp-content/media/2023/11/editing-laptop-2048px-231551-2x1-1.jpg?auto=webp&quality=75&crop=1.91:1&width=1200"
  )];
}


class Item{
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
  

}

