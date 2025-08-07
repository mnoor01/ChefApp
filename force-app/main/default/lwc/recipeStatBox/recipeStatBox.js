import { LightningElement,api } from 'lwc';

export default class RecipeStatBox extends LightningElement {

    @api title
    @api ariaValue
    @api iconName
}