import { LightningElement } from 'lwc';
import generateAIRecipes from '@salesforce/apex/AIRecipeController.generateAIRecipes';

export default class RecipeGenerator extends LightningElement {
formData={}
resipe=[]


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
             console.log("result",result)
                 console.log("result", result)
            this.formatResponse(result)
        }catch(error){
            console.error("Error generating recipes:", error)
        } finally{
            this.isGenerating = false
        }

}
 
    formatResponse(result){
        const correctJson=result.replaceAll(/[\n\u00A0]/g,'').trim()
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
               return recipe
        
            })
        }
        else{
            this.recipes=[]
        }
    }
}