<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Modalidad"%>
<%@page import="ModeloDAO.modalidadDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Util.conexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Inicio</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">GESPREC<span class="sr-only">(current)</span></a>
                    </li>  
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Menú Principal<span class="sr-only">(current)</span></a>
                    </li> 
                </ul>
            </div>
            
        </nav>
       
        <%
            conexionBD con = new conexionBD();
            Statement sat;
            ResultSet rs;
            sat = con.getConnection().createStatement();
            rs = sat.executeQuery("salect * from modalidad");
        %>
        
        
        <section class="mt-3">
            <div class="col-md-5 offset-md-4">
            <h1>Modalidad Contratación</h1>
            </div>
        </section>
        <section class="container mt-5 p-2">
            <div class="col-md-5 offset-md-4 ">
                <div class="card">
                    <div class="card-body">
                        <form method="POST" action="#">
                            
                            <div class="form-group">
                                <label for="name">Nombre del Contrato:</label>
                                <input type="text"  autofocus required name="name">
                            </div>
                            <button class="btn btn-primary btn-block">Buscar</button>
                        </form>
                        
                        <%
                            String nomBuscar=request.getParameter("name");
                            if (nomBuscar!=null){
                                sat = con.getConnection().createStatement();
                                rs = sat.executeQuery("select * from modalidad where Nombre_Modalidad LIKE"+"'%"+nomBuscar+"%'");
                            }else{
                                System.err.print("Error al buscar");
                            }
                        %>
                        
                    </div>
                </div>
            </div>
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Contratos:</h4>
                <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Estado</th>
                        
                    </tr>
                </thead>
                <%
                    modalidadDAO dao=new modalidadDAO();
                    List<Modalidad>list=dao.listar();
                    Iterator<Modalidad>iter=list.iterator();
                    Modalidad mod=null;
                    while(iter.hasNext()){
                        mod=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= mod.getId()%></td>
                        <td class="text-center"><%= mod.getNom()%></td>
                        <td><%= mod.getEstado()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            </div>
        </section>
    </body>
</html>
