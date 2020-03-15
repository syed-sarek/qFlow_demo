package drl2

class Item_masterController {
    static scaffold = Item_master
    def save = {
        def contact = new Item_master(params)
        contact.save flush: true, failOnError: true
        forward action: "show", id: contact.sl_no
        flash.message = message(code: 'default.created.message', args: [message(code: 'Item_master.label', default: 'Machine'), contact.sl_no])
    }

    def index() {
//        forward(action: "list")

    }

    def list(){
        if(session.user) {
            def queryResults= Item_master.findAll("from Item_master b")
            render(view: "/Item_master/list", model: [Item_masterList: queryResults])
        }
        else
            redirect(controller:'user',action:'login')
    }


    def update(Long sl_no) {
        def personInstance = Item_master.get(sl_no)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Item_master.label', default: 'Item_master'), sl_no])
            redirect(action: "list")
            return
        }
        personInstance.properties = params
        if (!personInstance.save(flush: true)) {
            render(view: "edit", model: [personInstance: personInstance])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'Item_master.label', default: 'Machine'), personInstance.sl_no])
        redirect(action: "show", id: personInstance.sl_no)
    }
}