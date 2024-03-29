public class ContactTriggerHandler {
    public static List<Contact> checkForDuplicates(List<Contact> newContacts) {
        //Step 1: Extract email from new contacts
        Set<String> newEmailSet = new Set<String>();
        for(contact newContact: newContacts) {
            if(newContact.email != null) {
                newEmailSet.add(newContact.email);
            }
        }
        //Step 2: Find duplicate contacts in database.
        Map<String, Contact> existingContactMap = new Map<String, Contact>();
        for(Contact existingContact: [SELECT id, name, email FROM Contact WHERE email in :newEmailSet]) {
            existingContactMap.put(existingContact.email, existingContact);
        }
        
        //Step 3: Compare and throw error
        for(Contact newContact: newContacts) {
            Contact duplicateContact = existingContactMap.get(newContact.email);
            if(duplicateContact != null) {
                newContact.addError('ERROR: There is already an identical record: ' + duplicateContact.Name);
            }
        }
        return newContacts;
    }
}