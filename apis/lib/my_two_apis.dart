import 'package:apis/models.dart/details_model.dart';
import 'package:apis/screens/beers_ale_screen.dart';
import 'package:apis/screens/beers_stouts_screen.dart';
import 'package:apis/screens/recipes_screen.dart';

final List<DetailsModel> links = [
  DetailsModel(
      title: "Beers Ale",
      link: "https://api.sampleapis.com/beers/ale",
      screen: const BeersScreen(
          title: "Beers Ale", apiLink: "https://api.sampleapis.com/beers/ale")),

  DetailsModel(
      title: "Beers Stouts",
      link: "https://api.sampleapis.com/beers/stouts",
      screen: const BeersstoutsScreen(
          title: "Beers Stouts", apiLink: "https://api.sampleapis.com/beers/stouts")),
  
  DetailsModel(
      title: "Recipes",
      link: "https://api.sampleapis.com/recipes/recipes",
      screen: const RecipesScreen(
        title: "Recipes",
        apiLink: "https://api.sampleapis.com/recipes/recipes",
      )),

];