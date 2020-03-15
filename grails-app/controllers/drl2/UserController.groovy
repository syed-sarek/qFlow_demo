package drl2

class UserController {
    def scaffold= User
    def login = {
    }
    def doLogin = {
        def user = User.findWhere(email:params['email'],
                password:params['password'])
        session.user = user
        if(!session.user) {
            flash.error = "Invalid Email or Password."
            redirect(controller:'user',action:'login')
        }
        else if (user && params['email']=='shahinhr@dekkogroup.com')
            redirect(controller:'Phonebook',action:'list_admin')
        else if (user && params['email']=='mintu.drl@dekkogroup.com')
            redirect(controller:'Machine_summary',action:'index')
//        else if (user)
//            redirect(controller:'Item_master',action:'index',params:[session.user])
        else if (user)
            redirect(controller:'Dashboard',action:'index')
        else
            flash.default = "Invalid Username"
//            redirect(controller:'user',action:'login')
    }

    def logout() {
        log.info "User agent: " + request.getHeader("User-Agent")
        session.invalidate()
        redirect(action: "login")
    }
	
	def module() {
		render(view:'/layouts/modules')
	}

    def updatePassword = {
        def email = params.email
        def password = params.password
        def password_current = params.password_current
        def passwordNew = params.passwordNew
        def val= User.executeQuery("select a.password from User a where a.email='${email}'")
        if([params.password_current] == val)
        {
            User.executeUpdate("update User c set c.password = '${passwordNew}' where c.email='${email}'")
            redirect(controller: 'User', action: 'login')
            flash.success = "Password Changed Successfully"
        }
        else if([params.password_current] != val){
            redirect(controller: 'User', action: 'login')
            flash.error = "Please enter valid Email & Password"
        }
    }
    def save = {
        def contact = new User(params)
        contact.save flush: true, failOnError: true
        redirect action: "show", id: contact.id
    }
}
