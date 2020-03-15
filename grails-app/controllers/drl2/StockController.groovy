package drl2

class StockController {

    static scaffold = Stock
    def index() {
        redirect(controller:'Stock',action:'list')
    }
    def report() {
        if(session.user) {
                def queryResults = Stock.findAll("from Stock b")
                render(view: "/Stock/report", model: [StockList: queryResults])
            }
        else
            redirect(controller:'user',action:'login')
    }

    def list() {
        if(session.user) {
            def queryResults = Stock.findAll("from Stock b")
            render(view: "/Stock/list", model: [StockList: queryResults])
        }
        else
            redirect(controller:'user',action:'login')
    }
}
