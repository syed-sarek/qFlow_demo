package drl2

class CustomerController {
    static scaffold = Customer
    def index() {
        redirect(controller:'Customer',action:'list')
    }
    def list() {
        [CustomerList:Customer.list()]
    }
}
