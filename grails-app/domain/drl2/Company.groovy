package drl2

class Company {
    Long company_id
    String name
    String short_name
    String address
    String phone
    String mobile
    String email
    String website
    String country
    String contact_person


    static mapping = {
        table 'admin_company'

        version false
        company_id column: 'company_id'
        name column: 'name'
        short_name column: 'short_name'
        address column: 'address'
        phone column: 'phone'
        mobile column: 'mobile'
        email column: 'email'
        website column: 'website'
        country column: 'country'
        contact_person column: 'contact_person'

        id name: 'company_id', generator: 'increment', type: 'long', defaultValue: 1
    }

    static constraints = {
        company_id(display: false, nullable: true, editable: false)
        name()
        short_name(nullable: true)
        address()
        phone(nullable: true)
        mobile(phone: true)
        email(email: true, nullable: true)
        website(nullable: true)
        country()
        contact_person()
    }
}
