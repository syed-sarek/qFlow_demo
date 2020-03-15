package drl2

class Employee {

    Long id
    String name
    String father
    String mother
    Date dob
    String nid
    String phone
    String email
    String address
    String designation
    String salary
    String status

    static mapping = {
        table 'hr_employee'

        version false
        id column: 'id', generator: 'increment'
        name column: 'name'
        father column: 'father'
        mother column: 'mother'
        dob column: 'dob'
        nid column: 'nid'
        phone column: 'phone'
        email column: 'email'
        address column: 'address'
        designation column: 'designation'
        salary column: 'salary'
        status column: 'status'
    }

    static constraints = {
        id(nullable: true)
        name()
        father()
        mother(nullable: true)
        dob()
        nid(nullable: true)
        phone()
        email(nullable: true, email:true)
        address()
        designation()
        salary()
        status(inList: ["Active", "Inactive"])
    }
}
