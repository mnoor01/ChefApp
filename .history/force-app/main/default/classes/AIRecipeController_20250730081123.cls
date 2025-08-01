public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipespe(String ingredients,String dietaryRestrictions,String mealtType){
    try{

    }
    catch(Exception e){
        throm new throw new AuraHandledException('Error getting recipes' + e.getMessge());
    }
  }
}