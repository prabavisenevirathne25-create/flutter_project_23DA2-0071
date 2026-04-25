class Product {
  final String name;
  final String Category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.Category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });
}

final List<Product> products = [
  const Product(
    name: 'Modern Varsity Bomber',
    Category: 'Clothing',
    price: 4800.00,
    oldPrice: 5000.00,
    isFavorite: true,
    imageUrl: 'assets/images/jacket.png',
    description: 'Introducing the limited-edition Contrast Corduroy Jacket from Urban Threads. This rugged yet refined two-tone shacket is a modern classic, merging vintage textures with a bold, contemporary aesthetic. Crafted from premium wide-wale corduroy, it features a rich burnt-sienna body contrasted by olive-green sleeves and utility flap pockets. The soft charcoal inner lining ensures all-day comfort, while the snap-button closure adds a clean finish. Durable, multi-pocketed, and perfectly fitted, it’s the ultimate versatile layering piece for any season.',
  ),
  const Product(
    name: 'Buckled Lace-Up Heeled Bootie',
    Category: 'Footwear',
    price: 7000.00,
    oldPrice: 10000.00,
    imageUrl: 'assets/images/S4.png',
    description: 'This design is a Buckled Lace-Up Heeled Bootie. It features a rugged yet chic aesthetic, combining a high-top lace-up front with a side zipper for accessibility. A decorative side strap with a gold-tone buckle adds a refined detail, while the thick, lugged platform and chunky block heel provide stability and height. The interior is finished with a trendy leopard-print lining.The primary material is synthetic faux-suede (microsuede), offering a soft, matte texture. The outsole is made of durable thermoplastic rubber (TPR), providing excellent grip and impact resistance.',
  ),
  const Product(
    name: 'Holiday A-Line Pleated Dress',
    Category: 'Clothing',
    price: 2500.00,
    oldPrice: 3000.00,
    isFavorite: true,
    imageUrl: 'assets/images/Kids7.png',
    description: 'This design is a Plaid-Trimmed A-Line Dress. It features a classic, sleeveless A-line silhouette with a prominent central inverted box pleat that adds volume and structure. The hemline is uniquely embellished with four decorative bows crafted from a traditional dark navy and green plaid fabric, creating a sophisticated holiday or formal aesthetic.',
  ),
  const Product(
    name: 'Toddler Sailor Romper Set',
    Category: 'Clothing',
    price: 3000.00,
    oldPrice: 4000.00,
    imageUrl: 'assets/images/Kids2.png',
    description: 'This design is a Toddler Sailor Romper Set. It features a classic nautical aesthetic with a navy blue short-sleeved top, a traditional sailor collar with white striped piping, and a matching white necktie. The coordinating shorts include an elastic waistband and gold-tone anchor buttons. The ensemble is completed by a captain’s hat with an embroidered anchor emblem.The set is crafted from a cotton-polyester poplin, providing a crisp, structured look that remains breathable. This durable, woven fabric ensures the outfit maintains its sharp silhouette for formal events or photography.',
  ),
  const Product(
    name: 'Cropped bomber jacket',
    Category: 'Clothing',
    price: 5700.00,
    oldPrice: 6000.00,
    imageUrl: 'assets/images/wo3 - 1.png',
    description: 'This teal-colored biker jacket is meticulously crafted from premium vegan leather, specifically high-density polyurethane (PU). This advanced synthetic material is designed to mimic the luxurious look and buttery-soft feel of genuine lambskin while remaining entirely cruelty-free. The fabric features a fine, pebbled texture that enhances its durability, making it naturally water-resistant and easy to maintain with a simple damp cloth. Lightweight yet structured, the material provides excellent wind protection, making it an ideal choice for transitional weather and versatile, high-fashion styling.',
  ),
  const Product(
    name: 'Professional  Backpack',
    Category: 'Bags',
    price: 6300.00,
    oldPrice: 7000.00,
    imageUrl: 'assets/images/backpack.png',
    description: 'This design is a Professional Minimalist Backpack. It features a sleek, structured silhouette with a clean cream finish and contrasting brown leather accents on the top handle and zipper pulls. The design includes multiple organized compartments, a discrete gold-tone logo plate, and slim side pockets for a refined, modern aesthetic.',
  ),
];
