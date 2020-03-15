package drl2

import grails.transaction.Transactional
import org.hibernate.SessionFactory;

@Transactional
class Export_garmentsService {

    SessionFactory sessionFactory;
    def listExport_garments(){
        String query = "SELECT * from export_garments where buyer_name='CV'";
        def personList = sessionFactory.getCurrentSession().createSQLQuery(query).list();
        return personList;
    }
}
