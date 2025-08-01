public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipespe(String ingredients,String dietaryRestrictions,String mealtType){
    try{
//1. First will create a map to hold the input values

inputParams = new Map<String,ConnectApi.WrappedValues> inputParams= new Map<String, ConnectApi
    }
    catch(Exception e){
        throm new throw new AuraHandledException('Error getting recipes' + e.getMessge());
    }
  }
}