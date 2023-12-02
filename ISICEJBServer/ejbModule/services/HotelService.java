package services;

import java.util.List;

import dao.IDaoHotel;
import dao.IDaoRemote;
import entities.Hotel;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

@Stateless(name = "amine")
public class HotelService implements IDaoRemote<Hotel>, IDaoHotel {
	@EJB
    private IDaoHotel daoHotel;
	@PersistenceContext
	private EntityManager em1;

	@Override
	@PermitAll
	public Hotel create(Hotel o) {
		em1.persist(o);
		return o;
	}

	@Override
	@PermitAll
	public boolean delete(Hotel o) {
		em1.remove(em1.contains(o) ? o : em1.merge(o));
		return true;
	}

	@Override
	@PermitAll
	public Hotel update(Hotel o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PermitAll
	public Hotel findById(int id) {
		// TODO Auto-generated method stub
		return em1.find(Hotel.class, id);
	}

	@Override
	@PermitAll
	public List<Hotel> findAll() {
		Query query = em1.createQuery("select h from Hotel h");
		return query.getResultList();
	}
//
//	@Override
//	@TransactionAttribute(TransactionAttributeType.REQUIRED)
//	@PermitAll
//	public List<Hotel> findHotelsByCity(Ville city) {
//	    // Assuming that your Hotel entity has a reference to the Ville entity, and the relationship is mapped in your JPA entities
//
//	    // Use a JPQL query to select hotels by villeId
//	    String jpql = "SELECT h FROM Hotel h WHERE h.city.id = :villeId";
//
//	    // Create a query object
//	    TypedQuery<Hotel> query = em1.createQuery(jpql, Hotel.class);
//
//	    // Set the parameter for villeId
//	    query.setParameter("villeId", city.getId()); // Assuming that Ville entity has a method getId()
//
//	    // Execute the query and return the result
//	    return query.getResultList();
//	}
	@Override
	@PermitAll
	public List<Hotel> findByVille(String nom) {
		List<Hotel> individus = null;
		individus = em1
		              .createQuery("select h from Hotel h where h.ville.nom = ?1", Hotel.class)
		              .setParameter(1, nom)
		              .getResultList();
		return individus;
	}

	@Override
	public List<Hotel> findHotelsByCity(Ville selectedCity) {
		// TODO Auto-generated method stub
		return null;
	}

	public IDaoHotel getDaoHotel() {
		return daoHotel;
	}

	public void setDaoHotel(IDaoHotel daoHotel) {
		this.daoHotel = daoHotel;
	}

	public EntityManager getEm1() {
		return em1;
	}

	public void setEm1(EntityManager em1) {
		this.em1 = em1;
	}
}