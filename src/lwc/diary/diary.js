import {api, LightningElement} from 'lwc';
export default class Diary extends LightningElement {

    @api diary;

    clickHandler(event){
        this.dispatchEvent(new CustomEvent('clicked',{detail: this.diary.Id}))
    }

}