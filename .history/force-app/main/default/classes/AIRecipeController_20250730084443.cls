public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipespe(String ingredients,String dietaryRestrictions,String mealtType,String servings){
    try{
//1. First will create a map to hold the input values
MAp<String,ConnectAPi.WrappedValue> inputParams= new Map<String,ConnectApi.WrappedValue>();

Map<String,ConnectApi.WrappedValue> ingredientsValue= new Map<String,ConnectApi.WrappedValue>();
ingredientsValue.value=ingredients;
Map<String,ConnectApi.WrappedValue> dietaryRestrictionsValue= new Map<String,ConnectApi.WrappedValue>();
dietaryRestrictionsValue.value=dietaryRestrictions;
Map<String,ConnectApi.WrappedValue> mealTypeValue= new Map<String,ConnectApi.WrappedValue>();
mealTypeValue.value=mealType;
Map<String,ConnectApi.WrappedValue> servingsValue= new Map<String,ConnectApi.WrappedValue>();
servingsValue.value=servings;

inputParams.put('ingredients',ingredientsValue);
inputParams.put('ingredients',dietaryRestrictionsValue);
inputParams.put('ingredients',mealTypeValue);
inputParams.put('ingredients',servingsValue);

//2. Will create the configuration which is required for invoking the prompt template.
ConnectApi.EinsteinPromptTemplateGenerationsInput executeTemplateInput = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
executeTemplateInput.additonalConfig= new ConnectApi.EinsteinLlmAdditionalConfigInput();
executeTemplateInput.additionalConfig.applicationName='Recipe_Generator';
executeTemplateInput.isPreview=false;
executeTemplateInput.inputParams=inputParams;

//3.Invoke the EinstrienLLM API and execute the Prompt Template
ConnectAPi.EinsteinPromptTemplateGenerationsRepresentation generationsOutput =ConnectAPi.EinsteinLLM.generateMessagesForPromptTemplate('Recipe_Generator',executeTemplateInput);
//4.Return the response.

ConnectApi.EinsteinLLMGenerationItemOutput response=generationsOutput.generations[0];
return response.text;

    }
    catch(Exception e){
        throw new AuraHandledException('Error getting recipes' + e.getMessage());
    }
  }
}