class RestaurantFilter {
  final String imagePath;
  final String filterString;
  final int index;

  RestaurantFilter({
    required this.filterString,
    required this.imagePath,
    required this.index,
  });
}

List<RestaurantFilter> restaurantFilters = <RestaurantFilter>[
  RestaurantFilter(
    filterString: 'All',
    imagePath: 'images/sipping_coffee.png',
    index: 0,
  ),
  RestaurantFilter(
    filterString: 'Pizza',
    imagePath: 'images/couple.png',
    index: 1,
  ),
  RestaurantFilter(
    filterString: 'Japanese',
    imagePath: 'images/eating_with_chopsticks.png',
    index: 2,
  ),
  RestaurantFilter(
    filterString: 'Vegetarian',
    imagePath: 'images/sipping_coffee.png',
    index: 3,
  ),
  RestaurantFilter(
    filterString: 'Vegan',
    imagePath: 'images/couple.png',
    index: 4,
  ),

];
