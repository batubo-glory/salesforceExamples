({
	fireCustomEvent : function(component, event, helper) {
		let customEvent = component.getEvent("customEvent");
        customEvent.setParams({
            "message" : "Component Event Fired."
        });
        customEvent.fire();
	}
})