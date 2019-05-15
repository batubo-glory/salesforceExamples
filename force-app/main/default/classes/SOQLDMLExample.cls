public class SOQLDMLExample {
    
    private List<Contact> contactList = [SELECT lastname, firstname, id, email, phone, OwnerID, account.phone 
                                         FROM Contact 
                                         WHERE email = null OR phone = null];
    
    public void dataCompletenessCheck() {
        List<Contact> updateList = new List<Contact>();
        List<Task> insertTaskList = new List<Task>();
        for(Contact c: contactList) {
            if(c.email == null && c.phone == null) {
                Contact cUpdate = setDefaultPhone(c);
                Task newTask = new Task();
                newTask.subject = 'Aquire Email Address for Contact';
                newTask.OwnerId = c.OwnerId;
                newTask.WhoId = c.Id;
                updateList.Add(cUpdate);
                insertTaskList.add(newTask);
            } else if(c.phone == null) {
                Contact cUpdate = setDefaultPhone(c);
                updateList.Add(cUpdate);
            }
        }
        insert insertTaskList;
        database.update(updateList);
    }
    
    private contact setDefaultPhone(Contact c) {
        if(c.account.phone != null && c.phone == null) {
            c.phone = c.account.phone;
        }
        return c;
    }
    
    public void showResults() {
        system.debug(contactList);
    }

}