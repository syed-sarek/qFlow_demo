package drl2

class EmployeeController {

    static scaffold = Employee
    def save = {
        def contact = new Employee(params)
        contact.save flush: true, failOnError: true
        forward action: "show", id: contact.id
        flash.message = message(code: 'default.created.message', args: [message(code: 'Employee.label', default: 'Employee'), contact.id])
    }

    def index() {
        forward(action: "list")
    }

    def list(){
        if(session.user) {
            def queryResults2= Employee.findAll("from Employee b")
            render(view: "/Employee/list", model: [EmployeeList: queryResults2])
        }
        else
            redirect(controller:'user',action:'login')
    }

    def update(String id) {
        def personInstance = Employee.get(params.id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Employee.label', default: 'Employee'), id])
            redirect(action: "list")
            return
        }
        personInstance.properties = params
        if (!personInstance.save(flush: true)) {
            render(view: "edit", model: [personInstance: personInstance])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'Employee.label', default: 'Employee'), personInstance.id])
        redirect(action: "show", id: personInstance.id)
    }
}
