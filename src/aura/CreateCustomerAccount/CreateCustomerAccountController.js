({
	clickCreateAccountCustomer: function(component, event, helper) {    
        
        var saveAccountAction = component.get("c.saveCustomerAccount");
        saveAccountAction.setParams({
            "customerAccount":component.get("v.newCustomerAccount")
        });  
        console.log(component.get("v.newCustomerAccount.Name"));
        saveAccountAction.setCallback(this, function(response){
            console.log(component.get("v.newCustomerAccount"));
            var state = response.getState();
            if(state === "SUCCESS"){
                var qq = response.getReturnValue();
                console.log("Good");
            }
            else{
                console.log("Bad")
            }
        });
        $A.enqueueAction(saveAccountAction);                 
    },
})