class Categories{
   String categoryName;

  Categories({required this.categoryName});

  static List<Categories> getCategories(){
    return <Categories>[
      Categories(categoryName: 'Personal'),
      Categories(categoryName: 'Home'),
      Categories(categoryName: 'Work'),
      Categories(categoryName: 'Weekend'),
      Categories(categoryName: 'Dog'),
      Categories(categoryName: 'Fun Activity'),

    ];
  }

}