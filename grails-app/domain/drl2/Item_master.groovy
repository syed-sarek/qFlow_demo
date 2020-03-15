package drl2

class Item_master {
    Long sl_no
    String category
    String item_name
    String description
    String model
    String brand
    String unit
    Long unit_price
    String remarks
    String added_by
    Date added_date
    Date update_date

    static mapping = {
        table 'item_master'

        version false
        sl_no column: 'sl_no'
        category column: 'category'
        item_name column: 'item_name'
        description column: 'description'
        model column: 'model'
        brand column: 'brand'
        unit column: 'unit'
        unit_price column: 'unit_price'
        remarks column: 'remarks'
        added_by column: 'added_by'
        added_date column: 'added_date'
        update_date column: 'update_date'

        id name: 'sl_no', generator: 'increment', type: 'long'
    }

    static constraints = {
        sl_no(display: true, nullable: true, editable: false)
//        trn_no(nullable: true, editable: false)
        category()
        item_name()
        description(nullable: true)
        model(nullable: true)
        brand(nullable: true)
        unit()
        unit_price(nullable: true)
        remarks(nullable: true)
        added_by(nullable: true, display: false)
        added_date(nullable: false, editable: false)
        update_date(nullable: true, filterpane: true)
    }
}
