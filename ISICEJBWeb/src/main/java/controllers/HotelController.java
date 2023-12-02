package controllers;

import java.io.IOException;
import java.util.List;

import dao.IDaoHotel;
import dao.IDaoVille;
import entities.Hotel;
import entities.Ville;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;


/**
 * Servlet implementation class HotelController
 */

public class HotelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IDaoVille daoV;
	@EJB
	private IDaoHotel daoH;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HotelController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		    String op = request.getParameter("op");

		    switch (op != null ? op : "") {
		        case "Envoyer":
		            handleEnvoyer(request);
		            break;
		        case "delete":
		            handleDelete(request, response);
		            break;
		        case "update":
		            handleUpdate(request);
		            System.out.println("Debug: Handling update operation");
		          
		           
		            break;
		          

		            case "filterByVille":
		                handleFilterByVille(request, response);
		                break;

		            default:
		                System.out.println("none");
		        }
		     
		    // Fetch the updated list of hotels after the operation
		    List<Hotel> hotels = daoH.findAll();
		    List<Ville> villes = daoV.findAll();

		    // Set the list of hotels as an attribute for the JSP
		    request.setAttribute("hotels", hotels);
		    request.setAttribute("villes", villes);

		    // Forward the request to the hotel.jsp page
		    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
		    dispatcher.forward(request, response);
		
	
	}
		private void handleEnvoyer(HttpServletRequest request) {
		    String nom = request.getParameter("nom");
		    String adresse = request.getParameter("adresse");
		    String telephone = request.getParameter("telephone");

		    // Retrieve the villeId from the request parameter
		    String villeId = request.getParameter("villeId");
		    Ville ville = (villeId != null) ? daoV.findById(Integer.parseInt(villeId)) : null;

		    daoH.create(new Hotel(nom, adresse, telephone, ville));
		}

		private void handleDelete(HttpServletRequest request, HttpServletResponse response)
		        throws IOException {
		    int id = Integer.parseInt(request.getParameter("id"));
		    daoH.delete(daoH.findById(id));
		    response.sendRedirect(request.getContextPath() + "/HotelController");
		}
		
		private void handleFilterByVille(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
		    String selectedCityIdParam = request.getParameter("selectedCityId");

		    if (selectedCityIdParam != null && !selectedCityIdParam.isEmpty()) {
		        try {
		            int selectedCityId = Integer.parseInt(selectedCityIdParam);

		            // Retrieve the selected city
		            Ville selectedCity = daoV.findById(selectedCityId);

		            if (selectedCity != null) {
		                // If a city is selected, filter hotels by city using the daoH.findHotelsByCity method
		                List<Hotel> filteredHotelList = daoH.findHotelsByCity(selectedCity);

		                // Convert the list to JSON and send it as the response
		                String jsonString = new Gson().toJson(filteredHotelList);
		                response.setContentType("application/json");
		                response.setCharacterEncoding("UTF-8");
		                response.getWriter().write(jsonString);
		            } else {
		                // Handle the case where the selected city is not found
		                response.getWriter().write("Selected city not found");
		            }
		        } catch (NumberFormatException e) {
		            // Handle the case where the selectedCityIdParam is not a valid integer
		            response.getWriter().write("Invalid city ID");
		        }
		    } else {
		        // If no city is selected, you might want to handle this case
		        response.getWriter().write("No city selected");
		    }
		}


		private void handleUpdate(HttpServletRequest request) {
		    int id = Integer.parseInt(request.getParameter("id"));
		    String nom = request.getParameter("nom");
		    String adresse = request.getParameter("adresse");
		    String telephone = request.getParameter("telephone");
		    String villeId = request.getParameter("villeId");
		    Ville ville = daoV.findById(Integer.parseInt(villeId));

		    // Create the updated object
		    Hotel updatedHotel = new Hotel(nom, adresse, telephone, ville);
		    updatedHotel.setId(id);

		    // Perform the update operation
		    Hotel result = daoH.update(updatedHotel);
		}

		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}