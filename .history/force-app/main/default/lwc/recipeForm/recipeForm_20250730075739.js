import { LightningElement } from 'lwc';

export default class RecipeForm extends LightningElement {
formData={}
    dietaryOptions=[{label:'None',value:'vegetarian'},{label:'Vegeterian',value:'vegetarian'},
{label:'Vegan',value:'vegan'},{label:'Gluten Free',value:'glutenFree'}]

mealTypeOptions=[{label:'Breakfast',value:'breakfast'},{label:'Lunch',value:'lunch'},
{label:'Dinner',value:'dinner'},{label:'Brunch',value:'brunch'}]

handleChange(event){
const {name,value}=event.target;
this.formData[name]=value;    


}
genserateRecipe(){
this.dispatchEvent
}
}