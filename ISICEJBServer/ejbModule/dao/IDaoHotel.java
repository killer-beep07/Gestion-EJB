package dao;


import java.util.List;

import entities.Hotel;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.Local;
@Local
@PermitAll
public interface IDaoHotel extends IDaoLocale<Hotel> {
 // Adjust role name as per your configuration
	
	List<Hotel> findHotelsByCity(Ville selectedCity);
	
}
