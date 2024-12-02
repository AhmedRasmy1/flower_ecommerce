class AllCategoriesEntities {
  final String? message;
  final List<CategoriesEntities>? categories;

  AllCategoriesEntities({required this.message, required this.categories});
}

class CategoriesEntities {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoriesEntities({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
