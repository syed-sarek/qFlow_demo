package drl2

class Stock {

    Long id
    String item
    Long stock_quantity

    static mapping = {
        table 'inv_stock'

        version false
        id column: 'id', generator: 'increment'
        item column: 'item_name'
        stock_quantity column: 'stock_quantity'
    }

    static constraints = {
        id(nullable: true)
        item(nullable: true)
        stock_quantity(nullable: true)
    }
}
