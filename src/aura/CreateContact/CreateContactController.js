({
	clickCreatePrivateCustomer: function(component, event, helper) {    
        
        var saveAccountAction = component.get("c.saveContactAndAccount");
        saveAccountAction.setParams({
            "contact":component.get("v.newContact")
        });  
        saveAccountAction.setCallback(this, function(response){
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
    }

})