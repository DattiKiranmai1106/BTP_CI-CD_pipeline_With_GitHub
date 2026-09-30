const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {

   const service = await cds.connect.to('db');
   const bp = await cds.connect.to('API_BUSINESS_PARTNER'); 

    this.on('READ', 'A_BusinessPartner', async req => {        
        return bp.run(req.query);       
    });

    this.on("READ","EntityServiceEmployee",async(req)=>{
        try {
        return service.run()
        }catch(error){
        console.log(error);
        }
    })

    this.on("getEmployeeData",async(req)=>{
        try {
           return "Kiranmai" ;
        }catch(error){
        console.log(error);
        }
    })

    this.on("postEmployeeData",async(req)=>{
        try {
           return "Kiranmai" ;
        }catch(error){
        console.log(error);
        }
    })

   this.before('CREATE', 'EntityServiceEmployee', (req) => {
        if (req.data.Name) {
            req.data.Name = req.data.Name.toUpperCase();
        }
    });

    // ON
    this.on('CREATE', 'EntityServiceEmployee', async (req) => {

        console.log('2. ON event');

        const tx = cds.tx(req);

        const employee = await tx.run(
            INSERT.into('Company.EmployeeManagement.EmployeeSchema')
                .entries(req.data)
        );

        return employee;

    });


    // AFTER
    this.after('CREATE', 'EntityServiceEmployee', (data) => {
        
        console.log('3. AFTER event');
        console.log('Created employee:', data.Name);

    });
    
});