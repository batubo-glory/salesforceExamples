({
	helperMethod1 : function(component) {
        let text = 'The sum was changed.';
        
        this.helperMethod2(component, text);
	},
    
    helperMethod2 : function(component, text) {
        component.set("v.changedText", text);
        component.set("v.textUpdated", true);
        component.set("v.display", false);
    }
    
})