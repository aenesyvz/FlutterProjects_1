class OnBoard{
  final image,title,description;

  OnBoard({required this.image, required this.title, required this.description});
}

 List<OnBoard> demoData = [
  OnBoard(image: "assets/images/order.png", title: "Order Your Food", description:  'Now you can order food any time  right from your mobile.'),
  OnBoard(image: "assets/images/cook.png", title: 'Cooking Safe Food', description:  'We are maintain safty and We keep clean while making food.'),
  OnBoard(image: "assets/images/deliver.png", title:  'Quick Delivery', description:   'Orders your favorite meals will be  immediately deliver')
];