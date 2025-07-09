class BasicVegetablesProductsList{
   BasicVegetablesProductsList();
  
   static const List<Map<String, dynamic>> productsList =  [
    {
      'id' : 'potato',
      'image': 'assets/images/potatoes.jpg',
      'name': 'Potato',
      'variants': [
           {'weight': '1 kg', 'price': '₹33'},
         ],
    },
   {
     'id' : 'onions',
     'image': 'assets/images/onions.webp',
     'name': 'Onions',
     'variants': [
              {'weight': '1 kg', 'price': '₹33'},
              {'weight': '2 kg', 'price': '₹66'},
            ],
    },
       {
     'id' : 'tomato',
     'image': 'assets/images/tomatoes.png',
     'name': 'Tomato',
     'variants': [
              {'weight': '1 kg', 'price': '₹33'},
              {'weight': '2 kg', 'price': '₹66'},
              {'weight': '500 gm', 'price': '₹16.50'},
            ],
    },

    
    {
      'id' : 'greenchilli',
      'image': 'assets/images/greenchilli.avif',
      'name': 'Greenchilli',
      'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'carrots',
      'image': 'assets/images/carrots.jpg',
      'name': 'Carrots',
      'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'vankaya',
      'image': 'assets/images/vankaya.webp',
      'name': 'vankaya',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'bendakaya',
      'image': 'assets/images/bendakaya.jpg',
      'name': 'Bendakaya',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
  ];
}
class LeafyVegetablesProductList{
  LeafyVegetablesProductList();
  
  static const  List<Map<String, dynamic>> productsList =  [
    {
      'id' : 'spinach',
      'image': 'assets/leafy_veg1.png',
      'name': 'Spinach',
      'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'fenugreek',
      'image': 'assets/leafy_veg2.png',
      'name': 'Fenugreek',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'coriander',
      'image': 'assets/leafy_veg3.png',
      'name': 'Coriander',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
  ];
}
class SeasonalItemsProductList{
  SeasonalItemsProductList();
  static const  List<Map<String, dynamic>> productsList =  [
    {
      'id' : 'mango',
      'image': 'assets/seasonal1.png',
      'name': 'Mango',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'lychee',
      'image': 'assets/seasonal2.png',
      'name': 'Lychee',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
    {
      'id' : 'watermelon',
      'image': 'assets/seasonal3.png',
      'name': 'Watermelon',
     'variants': [
    {'weight': '1 kg', 'price': '₹33'},
    {'weight': '2 kg', 'price': '₹66'},
    {'weight': '500 gm', 'price': '₹16.50'},
  ],
    },
  ];
}