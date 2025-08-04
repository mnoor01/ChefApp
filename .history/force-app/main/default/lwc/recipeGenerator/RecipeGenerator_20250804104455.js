import { LightningElement } from 'lwc';
import generateAIRecipes from '@salesforce/apex/AIRecipeController.generateAIRecipes';

export default class RecipeGenerator extends LightningElement {
formData={}

   async generateAIRecipes(event){
        this.formData=event.detail.formData
        console.log("this.formData",JSON.stringify(this.formData));
try {
   const result=  await generateAIRecipes({
           ingredients:this.formData.ingredients,
           dietaryRestrictions:this.formData.dietaryRestrictions,
           mealType:this.formData.mealType,
           servings:this.formData.servings
        });
             console.error("result",result)

}
    catch(error){
         console.error("Error generating recipes:",error)
   
    }   
    }
    formatResponse(result){
        result.replaceAll(/[\n\u00A0]/g,'').trim()
        this.recipes=JSON.parse(correctJSON)

        if(parsedResponse?.recipes?.length>0){
           this.recipes= parsedResponse.recipes.map(recipe=>{
               if(!recipe.tags){
                recipe.tags=[]
               }
               if(!recipe.total_time){
                const prepTime= parseInt(recipe.prept_time) || 0;
                const cookTime= parseInt(recipe.cook_time) ||0;
                recipe.total_time = '${prepTime+cookTime} min'
               }
               recipe
        
            })
        }
        else{
            this.recipes=[];
        }
    }
}