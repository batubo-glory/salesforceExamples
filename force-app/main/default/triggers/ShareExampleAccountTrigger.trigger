trigger ShareExampleAccountTrigger on Account (before insert) {

    if(trigger.isInsert) {
        List<AccountShare> acctShr = new LIst<AccountShare>();

        AccountShare oldOwner;

        for(Account a:trigger.new) {
            Account oldAcct = trigger.oldMap.get(a.Id);
            if(a.ownerId != oldAcct.ownerId ) {
                oldOwner.AccountId = a.Id;
                oldOwner.UserOrGroupID = oldAcct.Id;
                oldOwner.AccountAccessLevel = 'Edit';
                oldOwner.RowCause = Schema.AccountShare.RowCause.Manual;
                acctShr.add(oldOwner);
            }
        } 
        Database.insert(acctShr);
    }
}