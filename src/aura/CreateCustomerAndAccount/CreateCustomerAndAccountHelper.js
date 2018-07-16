({
	    createCustomer : function (component,Account){         
        var action = component.get("c.saveCustomer");
        action.setParams({"account":Account});
            console.log("dsaf"+component.get("v.newCustomer.Name"));
            console.log(action.setParams({"customer":Account}));
        action.setCallback(this,function(response){
        var state = response.getState();
			if (component.isValid() && state === "SUCCESS") {
                var cust = component.get("v.customers");
                cust.push(response.getReturnValue());
                component.set("v.customers", cust);
            }
        });
       $A.enqueueAction(action);        
    }
})