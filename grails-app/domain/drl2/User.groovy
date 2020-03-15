package drl2

class User {
    Long id
    String name
    String role
    String status
    String email
    String password
    String toString()
    { "$email" }

    static constraints =
            {
                id(nullable: true)
                name(nullable: true)
                email(email:true, nullable: false)
                password(password:true, nullable: false)
                role(nullable: false, inList: ["User", "Admin", "Super Admin"])
                status(nullable: true, inList: ["Active", "Inactive"])
            }
    static mapping = {
        table 'users'

        version false
        id column: 'id', generator: 'increment'
        name column: 'name'
        email column: 'email'
        password column: 'password'
        role column: 'role'
        status column: 'status'
    }
}
