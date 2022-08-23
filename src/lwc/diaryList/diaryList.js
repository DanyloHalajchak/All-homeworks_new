import {api, LightningElement, wire} from 'lwc';
import getDiaryByContactId from '@salesforce/apex/DiaryController.getDiaryByContactId';
import { createRecord, deleteRecord } from 'lightning/uiRecordApi'
import DIARY_OBJECT from '@salesforce/schema/Diary__c';
import NOTE_FIELD from '@salesforce/schema/Diary__c.Note__c';
import CONTACT_ID_FIELD from '@salesforce/schema/Diary__c.Contact__c';
import {refreshApex} from "@salesforce/apex";

export default class DiaryList extends LightningElement {

    @api recordId;
    showForm = false;


    @wire(getDiaryByContactId, {contactId : '$recordId'})
    diaries;


    addDiary(){
        this.showForm = !this.showForm;
    }


    createDiary(){

        const fields = {};
        fields[NOTE_FIELD.fieldApiName] = this.Note__c;
        fields[CONTACT_ID_FIELD.fieldApiName] = this.recordId;

        let recordInput = {apiName: DIARY_OBJECT.objectApiName, fields}

        createRecord(recordInput)
            .then(() => {
                refreshApex(this.diaries);
            })
            .catch(error => console.log(error));


            // .then(result => console.log('Created'))
            // .catch(error => console.log(error));

    }


    removeDiary(event){
        let id = event.detail;
        deleteRecord(id).then(() => {
            refreshApex(this.diaries);
        })
            .catch(error => console.log(error));
        console.log('id - '+event.detail);

    }


    handleNoteChange(event) {
        this.Note__c = event.target.value;
    }

}