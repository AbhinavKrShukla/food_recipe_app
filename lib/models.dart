
class RecipeModel {
  late String appLabel;
  late String appImgUrl;
  late double appCalories;
  late double totalTime;
  late String appUrl;

  RecipeModel({
    this.appLabel = 'Label',
    this.appImgUrl = "ImgUrl",
    this.appCalories = 0.00,
    this.appUrl = "AppUrl",
    this.totalTime = 0.00
  });

  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      appLabel: recipe['label'],
      appImgUrl: recipe['image'],
      appCalories: recipe['calories'],
      appUrl: recipe['url'],
      totalTime: recipe['totalTime']
    );
  }
}