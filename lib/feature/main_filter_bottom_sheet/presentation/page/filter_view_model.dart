
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/domain/entity/locality.dart';
import 'package:flutter/material.dart';
import 'package:view_model_divider/view_model.dart';

class FilterViewModel extends ViewModel {
  late List<String> localityListStrings =LocalityList.values.map((locality) => locality.name(context)).toList();
  FilterViewModel(super.context);


  //лист с добавленными городами
  final isActiveCityList = ValueNotifier(<String>[]);
  //лист от енамки всех городов
  

  
  void addCity(int index){
    final String result = localityListStrings[index];
    isActiveCityList.value = [...isActiveCityList.value,result];
  }
  void delete(int index){
    isActiveCityList.value.removeAt(index);
    isActiveCityList.value = isActiveCityList.value;
  }

  

}