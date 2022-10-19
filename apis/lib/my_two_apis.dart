import 'package:apis/models.dart/details_model.dart';
import 'package:apis/screens/beers_screen.dart';
import 'package:apis/screens/recipes_screen.dart';

final List<DetailsModel> links = [
  DetailsModel(
      title: "Beers",
      link: "https://api.sampleapis.com/avatar/info",
      screen: const BeersScreen(
          title: "Beers", apiLink: "https://api.sampleapis.com/avatar/info")),
  
  DetailsModel(
      title: "Recipes",
      link: "https://api.sampleapis.com/baseball/hitsSingleSeason",
      screen: const RecipesScreen(
        title: "Recipes",
        apiLink: "https://api.sampleapis.com/baseball/hitsSingleSeason",
      )),

];