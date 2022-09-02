import {LightningElement, api, wire} from 'lwc';
import getContactsByAccountId from '@salesforce/apex/ContactController.getContactsByAccountId';
import addContact from '@salesforce/apex/ContactController.addContact';
import { refreshApex } from '@salesforce/apex';
import { getRecordNotifyChange } from 'lightning/uiRecordApi';
export default class RelatedContacts extends LightningElement {
    @api recordId;
    showForm = false;


    @wire(getContactsByAccountId, {accountId : '$recordId'})
    contacts;

    addContact(){
        this.showForm = !this.showForm;
    }

    createContact(){
        addContact({accountId: this.recordId, lastName: this.lastName})
            .then(() => {
                refreshApex(this.contacts);
                getRecordNotifyChange(recordId);
            })
            .catch(error => console.log(error));
    }



    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

}