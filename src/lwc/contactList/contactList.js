import {LightningElement} from 'lwc';

export default class ContactList extends LightningElement {
    contacts = [
        {
            Id: 1,
            Name: 'Oleh',
        },
        {
            Id: 2,
            Name: 'Nazar',
        },
        {
            Id: 3,
            Name: 'Daniel',
        }
    ]
}