trigger ContactTrigger on Contact (before insert, before update, before delete, after delete, after undelete, after update, after insert) {
    if(trigger.isBefore){
        if(trigger.isInsert){
			ContactTriggerHandler.checkForDuplicates(trigger.new);            	
        } else if(trigger.isUpdate){
            
        } else if(trigger.isDelete){
            
        }
        
    } else if (trigger.isAfter){
        if(trigger.isInsert) {
            
        } else if(trigger.isUpdate) {
            
        } else if(trigger.isDelete) {
            
        } else if(trigger.isUndelete) {
            
        }
    }
}