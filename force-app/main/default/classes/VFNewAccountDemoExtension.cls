public class VFNewAccountDemoExtension {
    ApexPages.StandardController stdController;
    
    public Contact childContact;// {get;set;}
    
    public VFNewAccountDemoExtension(ApexPages.StandardController stdController) {
        childContact = new Contact();
        this.stdController = stdController;
    }

    public Contact getchildContact(){
        return childContact;
    } 
    public void setchildContact(Contact newContact){
         childContact = newContact;
    } 

	
    public PageReference saveAccountAndContact(){
        stdController.save();
        childContact.accountid = stdController.getId();
        insert childContact;
        return stdController.view();
    }
}