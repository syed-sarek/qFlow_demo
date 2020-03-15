package drl2

class PhonebookController {

    def index() {
        forward(action: "list")
    }

    def list(){
        def queryResults2= Employee.findAll("from Employee b")
        render(view: "/Phonebook/list", model: [PhonebookList: queryResults2])
    }
}
