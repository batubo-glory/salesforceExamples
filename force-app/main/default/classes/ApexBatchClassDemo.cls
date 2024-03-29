/*
New Batch Class Example
Why do we use batch apex?
    • Batch Apex operates in batches, and allows us to operate on a vastly 
      greater amount of data than normal, thousands or millions of records. 
        • To accomplish this every batch transaction operates on a new set
          of governor limits.
    • Another benefit is that if one batch fails, the others still will 
      continue, and not be rolled back.
Notes:
    • Batch Apex is asynchronus, with all the benefits and downsides that
      may have.
	• If your code accesses external objects and is used in batch Apex, 
      use Iterable<sObject> instead of Database.QueryLocator.
    • To monitor all existing batch jobs you can go to Setup → Monitoring
      → Apex Jobs or Jobs → Apex Jobs
*/



// To start we must implement the batch interface. This is what allows us to have
// batch apex, and requires us to have a start(), execute(), and finish() method. 
global with sharing class ApexBatchClassDemo implements Database.Batchable<sObject> {
// Also, must be global!    

    // Every batch requires a start() method
    global Database.QueryLocator start(Database.BatchableContext BC){
        // Get all of the accounts we will be operating on.
        String query = 'SELECT Id,Name FROM Account';
        return database.getQueryLocator(query);
    }

    // Every batch requires an execute().
    global void execute(Database.BatchableContext BC, list<Account> accList){
        for(Account acc : accList)
        {        
            // Update the Account Name 
            acc.Name = acc.Name + 'Batch';
        }
        update accList;
    }

    // Every batch requires a finish().
    // By now you might also be wondering what "Database.BatchableContext" 
    // is, this is used to track the job, and aside from making sure it
    // is present, you can ignore it.
    global void finish(Database.BatchableContext BC){
        //Here we would perform any post execution logic.
    }
/*
    To execute the batch process simply instantiate, and execute as so:
        NewBatchClass nbc = new NewBatchClass();
        database.executeBatch(nbc);
    
    If we add a second parameter like so to execution:
        NewBatchClass nbc = new NewBatchClass();
        database.executeBatch(nbc, 150);
    We wil only operate on a batch of that size, by default it operates on a batch of 200.
*/
}