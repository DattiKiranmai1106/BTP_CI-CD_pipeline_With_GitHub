sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("com.sap.demo.demoui5.controller.View1", {
        onInit() {
        },
        // onPress: function(){
        //     var oFilter = new sap.ui.model.Filter("EmployeeID", sap.ui.model.FilterOperator.EQ, "1");
        //     this.getOwnerComponent().getModel().read("/EmployeeDetails",{
        //         urlParameters: { "$select": "EmployeeID,Address" },
        //         filters:[oFilter],
        //         success:function(oData){
        //           console.log(oData);
        //         },
        //         error: function(oError){
        //          console.log(oError); 
        //         }
        //     })
        // }
    });
});