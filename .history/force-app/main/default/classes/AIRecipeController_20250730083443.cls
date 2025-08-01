public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipespe(String ingredients,String dietaryRestrictions,String mealtType){
    try{
//1. First will create a map to hold the input values

Map<String,ConnectApi.WrappedValues> ingredientsValue= new Map<String,ConnectApi.WrappedValue>();
ingredientsValue.value=ingredients;
Map<String,ConnectApi.WrappedValues> dietaryRestrictionsValue= new Map<String,ConnectApi.WrappedValue>();
dietaryRestrictionsValue.value=dietaryRestrictions;
Map<String,ConnectApi.WrappedValues> mealTypeValue= new Map<String,ConnectApi.WrappedValue>();
mealTypeValue.value=mealType;
Map<String,ConnectApi.WrappedValues> servingsValue= new Map<String,ConnectApi.WrappedValue>();
servingsValue.value=servings;

inputparams.put('ingredients',ingredientsValue);
inputparams.put('ingredients',dietaryRestrictionsValue);
inputparams.put('ingredients',mealTypeValue);
inputparams.put('ingredients',servingsValue);

//2. Will create the configuration which is required for invoking the prompt template.
ConnectApi.EinsteinPromptTemplateGenerationsInput promptTemplateConfiguration = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
executeTemplateInput.additonalConfig= new ConnectApi.EinsteinLlmAdditionalConfigInput();
excuteTemplateInput.additionalConfig.application='Recipe_Generator';
executeTemplateInput.isPreview=false;
executeTemplateInput.inputParams=inputParams;

//3.Invoke the EinstrienLLM API and execute the Prompt Template
ConnectAPi.EinsteinPromptTemplateGenerationsRepresentation generationsOutput =ConnectAPi.EinsteinLLM.generateMessagesFromPromptTemplate('Recipe_Generator',executeTemplateInput);
//4.Return the response.

ConnectApi.EinsteinLLMGenerationItemOutput response=generationsOutput.generations[0];
return response.text;

    }
    catch(Exception e){
        throw new AuraHandledException('Error getting recipes' + e.getMessge());
    }
  }
}