package drl2

class Customer {

    Long id
    String name
    String phone
    String email
    String address
    String country
    String status

    static mapping = {
        table 'inv_customer'

        version false
        id column: 'id', generator: 'increment'
        name column: 'name'
        phone column: 'phone'
        email column: 'email'
        address column: 'address'
        country column: 'country'
        status column: 'status'
    }

    static constraints = {
         id(nullable: true, editable: false)
         name()
         phone()
         email(email: true)
         address()
         country()
         status(inList: ["Regular", "Irregular"])
    }
}
