import { LightningElement } from 'lwc';
import generateAIRecipes from '@salesforce/apex/AIRecipeController.generateAIRecipes';

export default class RecipeGenerator extends LightningElement {
formData={}
   async generateRecipes(event){
        this.formData=event.detail.formData
        console.log("this.formData",JSON.stringify(this.formData));

        await generateAIRecipes({
           ingredients:this.formData.ingredients,
           dietaryRestrictions,
           mealType,
           servings
        });
    }
}