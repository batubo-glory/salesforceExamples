({
	fireAppEvent : function(component, event, helper) {
        let appEvent = $A.get("e.c:LCFCustomAppEvent");
        appEvent.setParams({"message" : "Application Event Fired!"});
        appEvent.fire();
        console.log('Fired App Event');
	}
})