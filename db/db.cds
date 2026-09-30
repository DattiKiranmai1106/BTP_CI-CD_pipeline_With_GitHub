using {
  cuid,
  managed
} from '@sap/cds/common';

namespace Company.EmployeeManagement;
entity EmployeeSchema : cuid {
        Name           : String(50);
        EmpEmail       : String(50);
        Age            : Integer;
        CompanyAddress : String(100);
        MobileNumber   : String(15);
        Salary         : Decimal(12, 2);
        Number         : String(30);
        RAm : String(20);
}

entity StudentSchema : managed {
    key ID     : UUID;
        Name   : String(50);
        Email  : String(50);
        age    : Integer;
        Mobile : Integer;
        Shyam : String(40);
        Ram2:String(20);
        Ram:String(20);
}

type Text {
    Language   : String(20);
    LongTextID : String(10);
    LongText   : String(3000);
};


entity EmployeeAddress : Text,managed {
    key ID         : UUID;
        EmployeeID : UUID;
        Address    : String(100);
        City       : String(50);
        Pincode    : String(10);
}

entity EmployeeDetails : Text {
    Key EmployeeID : String;
        Address    : String(100);
        City       : String(50);
        Pincode    : String(10);
}


entity Customers {
    key CustomerID : String(10);
        Name       : String(100);
        orders     : Association to many OrdersDetails
                     on orders.CustomerID = $self.CustomerID;
}

entity OrdersDetails {
    key OrderID    : String(10);
        CustomerID : String(10);
        Amount     : Decimal(15,2);
        customer   : Association to one Customers
                     on customer.CustomerID = CustomerID;
}

entity Orders {
    key OrderID : String(10);
        Customer : String(100);
        Status   : String(20);

        items    : Composition of many OrderItems
                   on items.OrderID = $self.OrderID;
}

entity OrderItems {
    key ItemID   : Integer;
        OrderID  : String(10);
        Product  : String(100);
        Quantity : Integer;
        Price    : Decimal(15,2);
}