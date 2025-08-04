public with sharing class AIRecipeController {
    @AuraEnabled
  public Static String generateAIRecipes(String ingredients,String dietaryRestrictions,String mealType,String servings){
    try{
//1. First will create a map to hold the input values
MAp<String,ConnectAPi.WrappedValue> inputParams= new Map<String,ConnectApi.WrappedValue>();

ConnectApi.WrappedValue ingredientsValue= new ConnectApi.WrappedValue();
ingredientsValue.value=ingredients;
ConnectApi.WrappedValue dietaryRestrictionsValue= new ConnectApi.WrappedValue();
dietaryRestrictionsValue.value=dietaryRestrictions;
ConnectApi.WrappedValue mealTypeValue= new ConnectApi.WrappedValue();
mealTypeValue.value=mealType;
ConnectApi.WrappedValue servingsValue= new ConnectApi.WrappedValue();
servingsValue.value=servings;

inputParams.put('ingredients',ingredientsValue);
inputParams.put('ingredients',dietaryRestrictionsValue);
inputParams.put('ingredients',mealTypeValue);
inputParams.put('ingredients',servingsValue);

//2. Will create the configuration which is required for invoking the prompt template.
ConnectApi.EinsteinPromptTemplateGenerationsInput executeTemplateInput = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
executeTemplateInput.additionalConfig= new ConnectApi.EinsteinLlmAdditionalConfigInput();
executeTemplateInput.additionalConfig.applicationName='PromptBuilderReview';
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