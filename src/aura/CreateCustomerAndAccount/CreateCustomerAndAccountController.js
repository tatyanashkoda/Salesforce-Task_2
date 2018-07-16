({
   doInit  : function(component, event, helper) {
		/*var action = component.get("c.getAccounts");
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.customers", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);*/
	},

    clickCreateCustomer: function(component, event, helper) {    
            var account = component.get("v.newCustomer"); 
            
           	var saveAccountAction = component.get("c.saveCustomer");
        	saveAccountAction.setParams({
                "account":component.get("v.newCustomer")
            });  
            console.log(component.get("v.newCustomer.Name"));
            saveAccountAction.setCallback(this, function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    console.log("Good");
                }
                else{
                    console.log("Bad")
                }
            });
            $A.enqueueAction(saveAccountAction);                 
    },

})