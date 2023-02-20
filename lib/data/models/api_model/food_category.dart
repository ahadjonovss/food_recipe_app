import 'package:drop_down_list/model/selected_list_item.dart';

class FoodCategory{
  static const genericFoods = "generic-foods";
  static const genericMeals = "generic-meals";
  static const packedFoods = "packed-foods";
  static const fastFoods = "fast-foods";

  static List<SelectedListItem>getSelectedItems(){
    List<SelectedListItem> selecteds = [];
    for(var i in ["generic-foods","generic-meals","packed-foods","fast-foods"]){
      selecteds.add(SelectedListItem(name: i));
    }
    return selecteds;
  }

}