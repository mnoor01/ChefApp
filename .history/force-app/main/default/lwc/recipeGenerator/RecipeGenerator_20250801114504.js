import { LightningElement } from 'lwc';
import generateAIRecipes from

export default class RecipeGenerator extends LightningElement {

    generateRecipes(event){
        this.formData=event.detail.formData
        console.log("this.formData",JSON.stringify(this.formData))
    }
}