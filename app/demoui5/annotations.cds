using EmployeeService as service from '../../srv/cat-service';


annotate service.EmployeeDetails with {
    EmployeeID          @Common: {Label: 'Employee ID'};
    
    @Common.ValueListWithFixedValues
    EmployeeID          @Common.ValueList: {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'OrdersDetails',
        Parameters     : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                ValueListProperty: 'OrderID',
                LocalDataProperty: EmployeeID,
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                ValueListProperty: 'CustomerID'
            },
        ],
        SearchSupported: true

    };

    Address          @Common.ValueList: {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'EmployeeDetails',
        Parameters     : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                ValueListProperty: 'Address',
                LocalDataProperty: Address,
            } 
            
        ],
        SearchSupported: true

    };
}