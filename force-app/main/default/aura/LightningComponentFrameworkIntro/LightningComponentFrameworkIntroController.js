({
    doInit : function(component, event, helper) {
        // Grab the value of number one.
        let numberOne = component.get("v.numberOne");
        let numberTwo = component.get("v.numberTwo");
        
        if (numberTwo === undefined) {
            console.log("Number Two is not set at initialization.");
        }
    },
    
    addNumbers : function(component) {
        var numberOne = component.get("v.numberOne");
        var numberTwo = component.get("v.numberTwo");
        var sum = numberOne + numberTwo;
        component.set("v.sum", sum);
    },
    
    sumChanged : function(component, event, helper) {
        helper.helperMethod1(component);
    }
    
    
})