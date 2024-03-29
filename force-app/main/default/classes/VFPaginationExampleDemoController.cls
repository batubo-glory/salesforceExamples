public class VFPaginationExampleDemoController {
    public ApexPages.StandardSetController setController {get;set;}
    public List<Account> displayedAccounts {
        get{
        	return setController.getRecords();
    	}
        set;
    }
    
    public VFPaginationExampleDemoController(){
        setController = new ApexPages.StandardSetController([SELECT id, name FROM account]);
        setController.setPageSize(5);
    }
}