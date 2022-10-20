// Some data in comments because empty. int can't be empty.
// Some data in comments because identique to another one. Useless.

class recipess {
  int? id;
  String? title;
  String? course;
  String? cuisine;
  String? mainIngredient;
  String? description;
  String? source;
  // String? url;
  // String? urlHost;
  int? prepTime;
  int? cookTime;
  int? totalTime;
  int? servings;
  // int? yield;
  String? ingredients;
  String? directions;
  String? tags;
  // String? rating;
  // String? publicUrl;
  String? photoUrl;
  // String? private;
  // String? nutritionalScoreGeneric;
  // int? calories;
  // String? fat;
  // String? cholesterol;
  // String? sodium;
  // String? sugar;
  // String? carbohydrate;
  // String? fiber;
  // String? protein;
  // String? cost;

  recipess(
      {this.id,
      this.title,
      this.course,
      this.cuisine,
      this.mainIngredient,
      this.description,
      this.source,
      // this.url,
      // this.urlHost,
      this.prepTime,
      this.cookTime,
      this.totalTime,
      this.servings,
      // this.yield,
      this.ingredients,
      this.directions,
      this.tags,
      // this.rating,
      // this.publicUrl,
      this.photoUrl,
      // this.private,
      // this.nutritionalScoreGeneric,
      // this.calories,
      // this.fat,
      // this.cholesterol,
      // this.sodium,
      // this.sugar,
      // this.carbohydrate,
      // this.fiber,
      // this.protein,
      // this.cost
      });

  recipess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    course = json['course'];
    cuisine = json['cuisine'];
    mainIngredient = json['mainIngredient'];
    description = json['description'];
    source = json['source'];
    // url = json['url'];
    // urlHost = json['urlHost'];
    prepTime = json['prepTime'];
    cookTime = json['cookTime'];
    totalTime = json['totalTime'];
    servings = json['servings'];
    // yield = json['yield'];
    ingredients = json['ingredients'];
    directions = json['directions'];
    tags = json['tags'];
    // rating = json['rating'];
    // publicUrl = json['publicUrl'];
    photoUrl = json['photoUrl'];
    // private = json['private'];
    // nutritionalScoreGeneric = json['nutritionalScoreGeneric'];
    // calories = json['calories'];
    // fat = json['fat'];
    // cholesterol = json['cholesterol'];
    // sodium = json['sodium'];
    // sugar = json['sugar'];
    // carbohydrate = json['carbohydrate'];
    // fiber = json['fiber'];
    // protein = json['protein'];
    // cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['course'] = this.course;
    data['cuisine'] = this.cuisine;
    data['mainIngredient'] = this.mainIngredient;
    data['description'] = this.description;
    data['source'] = this.source;
    // data['url'] = this.url;
    // data['urlHost'] = this.urlHost;
    data['prepTime'] = this.prepTime;
    data['cookTime'] = this.cookTime;
    data['totalTime'] = this.totalTime;
    data['servings'] = this.servings;
    // data['yield'] = this.yield;
    data['ingredients'] = this.ingredients;
    data['directions'] = this.directions;
    data['tags'] = this.tags;
    // data['rating'] = this.rating;
    // data['publicUrl'] = this.publicUrl;
    data['photoUrl'] = this.photoUrl;
    // data['private'] = this.private;
    // data['nutritionalScoreGeneric'] = this.nutritionalScoreGeneric;
    // data['calories'] = this.calories;
    // data['fat'] = this.fat;
    // data['cholesterol'] = this.cholesterol;
    // data['sodium'] = this.sodium;
    // data['sugar'] = this.sugar;
    // data['carbohydrate'] = this.carbohydrate;
    // data['fiber'] = this.fiber;
    // data['protein'] = this.protein;
    // data['cost'] = this.cost;
    return data;
  }
}