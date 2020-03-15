package drl2

class Item_category {

    Long id
    String category
    String description

    static mapping = {
        table 'inv_itemcategory'
        version false

        id column: 'id', generator: 'increment'
        category column: 'category'
        description column: 'description'
    }

    static constraints = {
        id(nullable: true)
        category()
        description(nullable: true)
    }
}
