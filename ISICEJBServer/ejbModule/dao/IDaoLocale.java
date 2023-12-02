package dao;

import java.util.List;

import entities.Hotel;
import jakarta.annotation.security.PermitAll;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.Local;

@Local
@PermitAll
public interface IDaoLocale <T> {
	
	public T create(T o);
	public boolean delete(T o);
	public T update(T o);
	public T findById(int id);
	public List<T> findAll();
	List<Hotel> findByVille(String nom);
	
	

}

