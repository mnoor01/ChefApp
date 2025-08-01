public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipespe(String ingredients,String dietaryRestrictions,String mealtType){
    try{
//1. First will create a map to hold the input values

Map<String,ConnectApi.WrappedValues> ingredientsValue= new Map<String,ConnectApi.WrappedValue>();
ingredientsValue.value=ingredients;
Map<String,ConnectApi.WrappedValues> dietaryRestrictionsValue= new Map<String,ConnectApi.WrappedValue>();
dietaryRestrictions.value=dietaryRestrictions;
Map<String,ConnectApi.WrappedValues> mealTypeValue= new Map<String,ConnectApi.WrappedValue>();
mealTypeValue.value=mealType;
Map<String,ConnectApi.WrappedValues> servingsValue= new Map<String,ConnectApi.WrappedValue>();
servingsValue.value=servings;


    }
    catch(Exception e){
        throm new throw new AuraHandledException('Error getting recipes' + e.getMessge());
    }
  }
}