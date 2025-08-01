public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipespe(String ingredients,String dietaryRestrictions,String mealtType){
    try{
//1. First will create a map to hold the input values

Map<String,ConnectApi.WrappedValues> inputParams= new Map<String,ConnectApi.WrappedValue>();


    }
    catch(Exception e){
        throm new throw new AuraHandledException('Error getting recipes' + e.getMessge());
    }
  }
}