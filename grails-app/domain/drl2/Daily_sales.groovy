package drl2

class Daily_sales {

    Long id
    Date date
    String trn_no
    String item_name
    String quantity
    Long price
	Long customer_id
    String notes
    String sold_by

    static mapping = {
        table 'sales_daily'

        version false
        id column: 'id', generator: 'increment'
        date column: 'sales_date'
        trn_no column: 'trn_no'
        item_name column: 'item_name'
        quantity column: 'quantity'
        price column: 'price'
        customer_id column: 'customer_id'
        notes column: 'notes'
        sold_by column: 'sold_by'
    }

    static constraints = {
        id(nullable: true, editable: false)
        date(editable: false)
        trn_no()
        item_name()
        quantity()
        price()
		customer_id(nullable: true)
        notes(nullable: true)
        sold_by()
    }
}
