package com.eataholic.dao.impl;

import com.eataholic.dao.UserDao;
import com.eataholic.model.Users;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserDaoImpl implements UserDao{
	
	Session session=new Configuration().configure().buildSessionFactory().openSession();  
    Transaction transaction=session.beginTransaction();  
	@Override
	public boolean getUserName(String name) {
		// TODO Auto-generated method stub  
		List<String> list=new ArrayList<String>();
		try{
			list=session.createQuery("select userName from Users where userName like ?").setParameter(0,name).list();		
		}
	    catch(Exception e){
	    	return false;
	    }
		if(list==null)return true;
		else if(list.size()==0)return true;
		else return false;
	}
	
	@Override
	public boolean getUserEmail(String email) {
		// TODO Auto-generated method stub
		List<String> list=new ArrayList<String>();
		try{
			list=session.createQuery("select eamil from Users where eamil like ?").setParameter(0,email).list();		
		}
	    catch(Exception e){
	    	return false;
	    }
		if(list==null)return true;
		else if(list.size()==0)return true;
		else return false;
	}

	@Override
	public boolean updateUserInfo(Users user) {
		// TODO Auto-generated method stub
		try{
			session.update(user);
			transaction.commit();
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public boolean addUser(Users user) {
		// TODO Auto-generated method stub
		try{
			session.save(user);
			transaction.commit();
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public Users getUserInfoByName(String name) {
		// TODO Auto-generated method stub
		Users user=new Users();
		try{
			user=(Users) session.get(Users.class,name);  		
		}
		catch(Exception e){
			
	    }
		return user;
	}

}
