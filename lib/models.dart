
class RecipeModel {
  late String appLabel;
  late String appImgUrl;
  late double appCalories;
  late String appUrl;

  RecipeModel({
    this.appLabel = 'Label',
    this.appImgUrl = "ImgUrl",
    this.appCalories = 0.00,
    this.appUrl = "AppUrl"
  });

  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      appLabel: recipe['label'],
      appImgUrl: recipe['image'],
      appCalories: recipe['calories'],
      appUrl: recipe['url'],
    );
  }
}