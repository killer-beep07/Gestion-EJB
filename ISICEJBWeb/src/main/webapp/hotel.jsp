<%@page import="entities.Hotel"%>
<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css.css">

<meta charset="ISO-8859-1">
<title>Gestion des hotels</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Autres balises head... -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

</head>
<style>
/* Your existing styles here */
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f0f8ff; /* Light Sky Blue */
}

h1 {
	color: black; /* Black */
	font-size: 2em;
	font-family: 'Arial', sans-serif;
	text-align: center;
}

/* Add additional styles if needed */

/* Hotel form styles */
.hotel-form {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.form-input, .form-select {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.form-select {
	cursor: pointer;
}

.form-submit {
	background-color: #4caf50; /* Green */
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
}

.form-submit:hover {
	background-color: #45a049; /* Darker Green */
}

/* Hotel table styles */
.hotel-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.hotel-table th, .hotel-table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

.hotel-table thead {
	background-color: #3498db; /* Blue */
	color: #fff;
}

.hotel-table a {
	display: inline-block;
	padding: 8px 12px;
	text-decoration: none;
	transition: background-color 0.3s;
}

.hotel-table a:hover {
	background-color: #45a049; /* Darker Green */
}

.bndelete {
	display: inline-block;
	padding: 8px 12px;
	text-decoration: none;
	background-color: #fa2909; /* Rouge */
	color: #fff;
	border: 1px solid #f44336;
	border-radius: 4px;
}

.bnupdate {
	display: inline-block;
	padding: 8px 12px;
	text-decoration: none;
	background-color: #3498db; /* Bleu */
	color: #fff;
	border: 1px solid #f44336;
	border-radius: 4px;
}

.delete-button {
	color: white;
	background-color: red;
	padding: 5px 10px;
	text-decoration: none;
	border-radius: 3px;
}

/* Style for the Modify button */
.modify-button {
	color: white;
	background-color: blue;
	padding: 5px 10px;
	text-decoration: none;
	border-radius: 3px;
}

.swal2-confirm.swal2-styled {
	background-color: #4caf50; /* Green */
	color: #fff;
}

.swal2-confirm.swal2-styled:hover {
	background-color: #45a049; /* Darker Green */
}
</style>

<script>
    function confirmDelete(id) {
        var confirmation = confirm("Voulez-vous vraiment supprimer ce Hotel ?");
        if (confirmation) {
            window.location.href = "HotelController?op=delete&id=" + id;
        } else {
            // Annulation de la suppression
        }
    } 
   
  
    function modifierHotel(id) {
        Swal.fire({
            title: 'Modifier un Hotel',
            html:
                '<input id="nom" class="swal2-input" placeholder="Nom">' +
                '<input id="adresse" class="swal2-input" placeholder="Adresse">' +
                '<input id="telephone" class="swal2-input" placeholder="Telephone">' +
                '<select id="villeId" class="swal2-select" style="width: 100%;">' +
                '   <c:forEach items="${villes}" var="v">' +
                '       <option value="${v.id}">${v.nom}</option>' +
                '   </c:forEach>' +
                '</select>',
                showCancelButton: true,
            confirmButtonText: 'Modifier',
            preConfirm: () => {
                const nom = Swal.getPopup().querySelector('#nom').value;
                const adresse = Swal.getPopup().querySelector('#adresse').value;
                const telephone = Swal.getPopup().querySelector('#telephone').value;
                const villeId = Swal.getPopup().querySelector('#villeId').value;

                if (!nom || !adresse || !telephone || !villeId) {
                    Swal.showValidationMessage('Veuillez remplir tous les champs.');
                }

                return { nom, adresse, telephone, villeId };
            }
        }).then((result) => {
            if (!result.dismiss) {
                const { nom, adresse, telephone, villeId } = result.value;
                // Construisez l'URL avec les donn�es
                const url = "HotelController?op=update&id=" + id +
                    "&nom=" + nom + "&adresse=" + adresse +
                    "&telephone=" + telephone  +
                    "&villeId=" + villeId;

                // Redirigez l'utilisateur vers l'URL
                window.location.href = url;
            }
        });
    }
    
     
   
    $(document).ready(function () {
        $('#hotelTable').DataTable();
    });


    function filterByVille() {
        var villeId = document.getElementById("villeFilter").value;
        $.ajax({
            url: 'HotelController?op=filterByVille&selectedCityId=' + villeId,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                $('#hotelTable').DataTable().clear().rows.add(data).draw();
            },
            error: function (error) {
                console.error('Error retrieving data:', error);
            }
        });
    }

</script>






<body>
	<form action="${pageContext.request.contextPath}/HotelController"
		method="get" class="hotel-form">
		Nom : <input type="text" name="nom" class="form-input" /> <br>
		Adresse : <input type="text" name="adresse" class="form-input" /> <br>
		Telephone : <input type="text" name="telephone" class="form-input" />
		<br> <label for="Ville">Ville :</label> <select id="ville"
			name="villeId" class="form-select">
			<c:forEach var="v" items="${villes}">
				<option value="${v.id}">${v.nom}</option>
			</c:forEach>
		</select><br> <input name="op" type="submit" value="Envoyer"
			class="form-submit" /> <input type="hidden" name="op"
			value="ajouter" />

	</form>
<label for="Ville">Filter by Ville :</label>

<select id="villeFilter" name="villeFilter" class="form-select" onchange="filterByVille(this.value)">
    <option value="">All Cities</option>
    <c:forEach var="v" items="${villes}">
        <option value="${v.id}">${v.nom}</option>
    </c:forEach>
</select><br>
	<h1>Liste des hotels :</h1>
	<table class="hotel-table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nom</th>
				<th>Adresse</th>
				<th>Telephone</th>
				<th>Ville</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${hotels}" var="v">
				<tr>
					<td>${v.id}</td>
					<td>${v.nom}</td>
					<td>${v.adresse}</td>
					<td>${v.telephone}</td>
					<td>${v.ville.nom}</td>
					<td><a href="#" onclick="confirmDelete(${v.id})"
						class="delete-button">Supprimer</a> - <a
						href="javascript:void(0);" onclick="modifierHotel(${v.id})"
						class="modify-button">Modifier</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>
