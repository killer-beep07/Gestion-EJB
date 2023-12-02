<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
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

.container {
    max-width: 800px;
    margin: 0 auto;
}

form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

input, select {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

label {
    margin-top: 10px;
    display: block;
}

select {
    cursor: pointer;
}

input[type="submit"] {
    background-color: #4caf50; /* Green */
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049; /* Darker Green */
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

thead {
    background-color: #3498db; /* Blue */
    color: #fff;
}

.bndelete {
    display: inline-block;
    padding: 8px 12px;
    text-decoration: none;
    background-color: #FA2909; /* Red */
    color: #fff;
    border: 1px solid #f44336;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.bnupdate {
    display: inline-block;
    padding: 8px 12px;
    text-decoration: none;
    background-color: #3498db; /* Blue */
    color: #fff;
    border: 1px solid #f44336;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.bndelete:hover {
    background-color: #d32f2f;
    border-color: #d32f2f;
}

.bnupdate:hover {
    background-color: #2980b9; /* Darker Blue */
    border-color: #2980b9;
}

.swal2-popup {
    font-size: 14px;
    background-color: #f0f8ff; /* Light Sky Blue */
}

.swal2-title {
    color: black; /* Black */
}

.swal2-content {
    color: black; /* Black */
}

.swal2-input, .swal2-select {
    margin-bottom: 10px;
    width: 100%;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.swal2-validation-message {
    font-size: 14px;
    color: red; /* Red */
}

.swal2-confirm {
    background-color: green; /* Blue */
    color: green;
}
.swal2-confirm.swal2-styled {
    background-color: #4caf50; /* Green */
    color: #fff;
}

.swal2-confirm.swal2-styled:hover {
    background-color: #45a049; /* Darker Green */
}


.modifier {
    color: green; /* Change modifier color to blue */
}

.swal2-cancel {
    background-color: #fa2909; /* Red */
    color: #fff;
}




</style>




</head>
 <script>
        function confirmDelete(id) {
            var confirmation = confirm("Voulez-vous vraiment supprimer cette Ville ?");
            if (confirmation) {
                window.location.href = "VilleController?op=delete&id=" + id;
            } else {
                // Annulation de la suppression
            }
        }
        function modifierEtudiant(id) {
            Swal.fire({
                title: 'Modifier le nom de cette ville',
                html:
                    '<input id="nom" class="swal2-input" placeholder="Nom">' ,
                showCancelButton: true,
                confirmButtonText: 'Modifier',
                preConfirm: () => {
                    const nom = Swal.getPopup().querySelector('#nom').value;
                   

                    if (!nom ) {
                        Swal.showValidationMessage('Veuillez remplir tous les champs.');
                    }

                    return { nom };
                }
            }).then((result) => {
                if (!result.dismiss) {
                    const { nom } = result.value;
                    // Construisez l'URL avec les données
                    const url = "VilleController?op=update&id=" + id +
                        "&nom=" + nom ;

                    // Redirigez l'utilisateur vers l'URL
                    window.location.href = url;
                }
            });
        }
        </script>

<body>
<h1>Gestion des Villes</h1>
	<form action="VilleController" method="get">
		
		<table border="0">
            <tr>
            <td>Ville</td>
            <td><input id="ville" type="text" name="ville" value=""  required=""/></td>
            <td>
            <input name="op" type="submit" value="Ajouter" />
            </td>
            </tr>
        
    </table>
	</form>

	
	
	
    
    <h2>Liste des villes :</h2>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nom</th>
				<th>Supprimer</th>
				<th>Modifier</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${villes}" var="v">
				<tr>
					<td>${v.id}</td>
					<td>${v.nom}</td>
					
					<td><a class="bndelete" href="#"
						onclick="confirmDelete(${v.id})">Supprimer</a></td>
					<td><a class="bnupdate" href="javascript:void(0);"
						onclick="modifierEtudiant(${v.id})">Modifier</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
    
</body>
</html>