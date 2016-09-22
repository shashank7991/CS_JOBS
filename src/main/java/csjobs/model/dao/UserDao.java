package csjobs.model.dao;

import java.util.List;

import csjobs.model.User;

public interface UserDao {

    User getUser( Long id );

    User getUser( String email );

    User saveUser( User user );

	List<User> getUsers();

	User getReviewer( Long id );
	
	List<User> getReviwers();
	
	User saveReviewer();
	
	User getUserByUsername(String username );
}
