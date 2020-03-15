package drl2

class Daily_salesController {

    static scaffold = Daily_sales
    def index() {
        redirect(controller:'Daily_sales',action:'list')
    }
    def list() {
        if(session.user) {
            def fromDate = params.fromDate
            def toDate = params.toDate
            if (params.fromDate == null && params.toDate == null) {
                def queryResults = Daily_sales.findAll("from Daily_sales b ORDER BY b.date DESC")
                render(view: "/daily_sales/list", model: [Daily_salesList: queryResults])
            } else {
                def queryResults = Daily_sales.findAll("from Daily_sales b where b.date between $fromDate and $toDate ORDER BY b.date DESC")
                render(view: "/daily_sales/list", model: [Daily_salesList: queryResults])
            }
        }
        else
            redirect(controller:'user',action:'login')
    }
    def save(){
        def contact = new Daily_sales(params)
        if (params.quantity1 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity1) where c.item='$params.item_name1'")
            contact.item_name = [params.item_name1].join(", ")
            contact.quantity = [params.quantity1].join(", ")
        }
        if (params.quantity2 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity2) where c.item='$params.item_name2'")
            contact.item_name = [params.item_name1, params.item_name2].join(", ")
            contact.quantity = [params.quantity1, params.quantity2].join(", ")
        }
        if (params.quantity3 != '') {
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity3) where c.item='$params.item_name3'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3].join(", ")
        }
        if (params.quantity4 != '') {
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity4) where c.item='$params.item_name4'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4].join(", ")
        }
        if (params.quantity5 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity5) where c.item='$params.item_name5'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4, params.item_name5].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4, params.quantity5].join(", ")
        }
        if (params.quantity6 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity6) where c.item='$params.item_name6'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4, params.item_name5, params.item_name6].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4, params.quantity5, params.quantity6].join(", ")
        }
        if (params.quantity7 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity7) where c.item='$params.item_name7'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4, params.item_name5, params.item_name6, params.item_name7].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4, params.quantity5, params.quantity6, params.quantity7].join(", ")
        }
        if (params.quantity8 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity8) where c.item='$params.item_name8'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4, params.item_name5, params.item_name6, params.item_name7, params.item_name8].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4, params.quantity5, params.quantity6, params.quantity7, params.quantity8].join(", ")
        }
        if (params.quantity9 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity9) where c.item='$params.item_name9'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4, params.item_name5, params.item_name6, params.item_name7, params.item_name8, params.item_name9].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4, params.quantity5, params.quantity6, params.quantity7, params.quantity8, params.quantity9].join(", ")
        }
        if (params.quantity10 != ''){
            Stock.executeUpdate("update Stock c set c.stock_quantity = (c.stock_quantity-$params.quantity10) where c.item='$params.item_name10'")
            contact.item_name = [params.item_name1, params.item_name2, params.item_name3, params.item_name4, params.item_name5, params.item_name6, params.item_name7, params.item_name8, params.item_name9, params.item_name10].join(", ")
            contact.quantity = [params.quantity1, params.quantity2, params.quantity3, params.quantity4, params.quantity5, params.quantity6, params.quantity7, params.quantity8, params.quantity9, params.quantity10].join(", ")
        }
//        def incr= Daily_sales.executeQuery("select (CASE WHEN max(c.id) = null THEN 0 ELSE max(c.id) END)+1 from Daily_sales c').join(',')")
//        def incr11= sprintf('%05d',incr)
//        contact.trn_no =[params.item_name1,params.quantity1]join(","), incr11
        contact.save flush: true, failOnError: true
        redirect(controller: 'Daily_sales', action: 'invoice', id: contact.id)
    }

    def invoice(Long id) {
        def inv_no = Daily_sales.get(id)
        def com_info = Company.executeQuery("from Company a")
		def item_list = Daily_sales.executeQuery("from Daily_sales a where a.id='$id'")
//        redirect(controller: 'Daily_sales', action: 'invoice', id: inv_no.id, model: [com_name: com_name])
        render(view: "/daily_sales/invoice", model: [id: inv_no, com_info: com_info, item_list: item_list])
    }
}
