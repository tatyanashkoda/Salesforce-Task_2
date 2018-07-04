({
    doInit : function(component, event, helper) {

        var action = component.get("c.getAccount");
        action.setParams({"accountId": component.get("v.recordId")});

        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.account", response.getReturnValue());
            } else {
                console.log('Problem getting account, response state: ' + state);
            }
        });
        $A.enqueueAction(action);
    },

    handleSaveContact: function(component, event, helper) {
      
            var saveContactAction = component.get("c.saveContactWithAccount");
            console.log(component.get("v.customer"));
            saveContactAction.setParams({
                "contact": component.get("v.customer"),
                "accountId": component.get("v.recordId")
            });

            // Configure the response handler for the action
            saveContactAction.setCallback(this, function(response) {
                var state = response.getState();
                if(state === "SUCCESS") {
					Console.log("Good work");
                }
                else if (state === "ERROR") {
                    console.log('Problem saving contact, response state: ' + state);
                }
                else {
                    console.log('Unknown problem, response state: ' + state);
                }
            });

            // Send the request to create the new contact
            $A.enqueueAction(saveContactAction);
        
        
    },

	handleCancel: function(component, event, helper) {
	    $A.get("e.force:closeQuickAction").fire();
    }
})