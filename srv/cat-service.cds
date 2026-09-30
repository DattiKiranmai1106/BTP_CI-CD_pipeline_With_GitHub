using { Company.EmployeeManagement as db }
from '../db/db';
using { API_BUSINESS_PARTNER as bp } from './external/API_BUSINESS_PARTNER';

service EmployeeService {

    entity EntityServiceEmployee as projection on db.EmployeeSchema;

    entity EmployeeAddress as projection on db.EmployeeAddress;

    entity EmployeeDetails as projection on db.EmployeeDetails;

    entity Customers as projection on db.Customers;
    entity OrdersDetails as projection on db.OrdersDetails;

    entity A_BusinessPartner as projection on bp.A_BusinessPartner{
        BusinessPartner,
        BusinessPartnerUUID,
        BusinessPartnerFullName
    };

    type Text {
    Language   : String(20);
    LongTextID : String(10);
    LongText   : String(3000);
    };

    function getEmployeeData(EmployeeID: String)                                                        returns String;
    action postEmployeeData(EmployeeID: String, EmployeeName: String)                                                        returns String;
}

service StudentService {

    entity ServiceStudent as projection on db.StudentSchema;

}
