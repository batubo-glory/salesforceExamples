public class testingVisualforceExampleController {
    public String lastName {get;set;}
    public String param {get;set;}
    
    public testingVisualforceExampleController() {
    }
    
    public pageReference save() {
        PageReference pageTest = page.success;
        Contact newContact = new Contact(lastName = this.lastName);
        insert newContact;
        pageTest.setRedirect(true);
        return pageTest;
    }
}