package services;

import java.util.List;

import dao.IDaoRemote;
import dao.IDaoVille;
import entities.Hotel;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

@Stateless(name = "kenza")
public class VilleService implements IDaoRemote<Ville>, IDaoVille {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Ville create(Ville o) {
		em.persist(o);
		return o;
	}

	@Override
	public boolean delete(Ville o) {
		em.remove(em.contains(o) ? o : em.merge(o));
		return true;
	}

	@Override
	public Ville update(Ville o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Ville findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Ville.class, id);
	}

	@Override
	public List<Ville> findAll() {
		Query query = em.createQuery("select v from Ville v");
		return query.getResultList();
	}

	@Override
	public List<Hotel> findByVille(String nom) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
