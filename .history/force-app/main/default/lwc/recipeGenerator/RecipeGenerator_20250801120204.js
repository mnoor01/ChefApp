import { LightningElement } from 'lwc';
import generateAIRecipes from '@salesforce/apex/AIRecipeController.generateAIRecipes';

export default class RecipeGenerator extends LightningElement {
formData={}
   async generateRecipes(event){
        this.formData=event.detail.formData
        console.log("this.formData",JSON.stringify(this.formData));
try {

}
    catch(error){
        
    }    await generateAIRecipes({
           ingredients:this.formData.ingredients,
           dietaryRestrictions:this.formData.dietaryRestrictions,
           mealType:this.formData.mealType,
           servings:this.formData.servings
        });
    }
}