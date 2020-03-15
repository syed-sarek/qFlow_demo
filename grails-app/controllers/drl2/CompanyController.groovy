package drl2

class CompanyController {
    static scaffold = Company
    def index() {
        redirect (action:'create')
    }

    def save(){
        def contact = new Company(params)
        contact.save flush: true, failOnError: true
        redirect action: "show", id: contact.company_id
        def downloadedfile= request.getFile('file')
        String logo = "D:/qFlow/grails-app/assets/images/" + "company.jpg"
        downloadedfile.transferTo(new File(logo))
    }
}