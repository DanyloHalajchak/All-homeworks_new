@RestResource(UrlMapping='/contact/*')
global class ContactRest {

    final static String lastEndpointSection = 'contact';

    @HttpGet
    global static void getContacts() {

        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String contactId = req.requestUri.substring(
                req.requestURI.lastIndexOf(lastEndpointSection) + lastEndpointSection.length())
                .removeStart('/');
        res.headers.put('Content-Type', 'application/json');
        if (String.isBlank(contactId)) {
            res.responseBody = Blob.valueOf(JSON.serializePretty([
                    SELECT Id, Name, Description
                    FROM Contact
            ]));
//            res.statusCode = 400;
//            res.responseBody = Blob.valueOf('Contact Id is missing');
//            return;
        }else{
            res.responseBody = Blob.valueOf(JSON.serializePretty([
                    SELECT Id, Name, Description
                    FROM Contact
                    WHERE Id = :contactId
            ]));
        }
    }

    @HttpPost
    global static void createContact(String lastName, String description) {
        RestResponse res = RestContext.response;
        Contact contact = new Contact();
        contact.description = description;
        contact.lastName = lastName;
        insert contact;
        res.headers.put('Content-Type', 'application/json');
        res.responseBody = Blob.valueOf(JSON.serialize(contact));
    }

    @HttpPatch
    global static void updateContact(String lastName, String description) {

        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String contactId = req.requestUri.substring(
                req.requestURI.lastIndexOf(lastEndpointSection) + lastEndpointSection.length())
                .removeStart('/');
        if (String.isBlank(contactId)) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf('Contact Id is missing');
            return;
        }
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :contactId];
        if (contacts.isEmpty()) {
            res.statusCode = 404;
            res.responseBody = Blob.valueOf('Contact not found.');
            return;
        }
        Contact contact = contacts.get(0);
        contact.description = description;
        contact.LastName = LastName;
        update contact;
        res.headers.put('Content-Type', 'application/json');
        res.responseBody = Blob.valueOf(JSON.serialize(contact));
    }

    @HttpDelete
    global static void deleteContact() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String contactId = req.requestUri.substring(
                req.requestURI.lastIndexOf(lastEndpointSection) + lastEndpointSection.length())
                .removeStart('/');
        System.debug(contactId);
        if (String.isBlank(contactId)) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf('Contact Id is missing');
            return;
        }
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :contactId];
        if (contacts.isEmpty()) {
            res.statusCode = 404;
            res.responseBody = Blob.valueOf('Contact not found.');
            return;
        }
        delete contacts;
    }

}
