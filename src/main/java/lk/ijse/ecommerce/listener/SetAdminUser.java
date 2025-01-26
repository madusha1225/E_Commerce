package lk.ijse.ecommerce.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.entity.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

@WebListener
public class SetAdminUser implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        if (checkIsAdmin() == null) {
            Users users = new Users("Administrator","admin@gmail.com",0,"admin","Admin","1234",new ArrayList<>());
            saveAdmin(users);
        }
    }

    private void saveAdmin(Users users) {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(users);

        transaction.commit();
        session.close();
    }

    private Users checkIsAdmin(){
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        Users user = (Users) session.createQuery("FROM Users WHERE type = 'Admin'").uniqueResult();

        transaction.commit();
        session.close();

        return user;
    }
}
