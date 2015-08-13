<%@page import="beans.userBean"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Menu Principal</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/fonts.css">
        <link rel="stylesheet" href="css/EsilosSocial.css">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/muestra.js"></script>
        <script>
           
               function send(){
                   var prioridad = $('#prioridadAv option:selected').val();
                   var cuerpo = $('#enviarAviso').html();
                 
                   
                   $.ajax({
                       url: "servlets/Avisos",
                       type: 'POST',
                       data: {plantilla: cuerpo,tituloAv: $('#tituloAv').val(), cuerpoAv: $('#cuerpoAv').val(), prioridadAv: prioridad, grupoAv: $('#grupoAv').val()},
                       async: true,
                       beforeSend: function(){$('#enviarAviso').html('<h1>Enviando aviso...</h1>');},
                       success: function(html){
                           
                           $('#enviarAviso').html(html);
                        },
                       error: function(err){
                           alert("Ha habido un error al intentar mandar su petici�n"+err.toString());
                       }
                       
                   });
               };
        function verificaGrupo(texto){
            console.log(texto.value);
            $.ajax({
                url: "servlets/Grupos",
                type: "POST",
                data: {grupo: texto.value, tipo: "revisar"},
                success: function(html){
                    $('#grupoAv').css('border', html);
                }
            });
        }
            
        </script> 
          <%
       try{
        if(session.isNew()){
            session.setAttribute("tipo", "Anonimo");
            userBean user = new userBean();
            session.setAttribute("userData", user);
        }
        if(session.getAttribute("tipo").equals("Administrador")){
            %>
            <style>
                nav{
                    background-color: #ECF0F1;
                    color: #141414;
                }
                #hmenu{
                    background-color: #ECF0F1;
                    color: #141414;
                }
                label{
                    color: #141414;
                }
                .menu a{
                    color: #141414;
                }
                section ul{
                    background-color: #3A539B;
                }
                .menu li:hover{
                    box-shadow: 0 0  #AD1A1A inset;  
                }
            </style>
    <%
        }
       }catch(Exception e){
           session.invalidate();
           out.println("<script>window.location.reload()</script>");
       }
    %>
    </head>
  
    <body>
        <img id="muestrame" class="zigma" src="assets/icons/zigma.png" alt="zigma">
        <div id="hmenu" style=" border-bottom: 2px #ECF0F1 groove" class="navbar navbar-inverse col-xs-12">
            <ul class="list-unstyled text-uppercase log list-inline  list-group-item-text">
                <button class="btn btn-link">
                    <span  
                    <% if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){%>
                    class="glyphicon glyphicon-log-out"></span>
                    <%}else{%>
                        class="glyphicon glyphicon-log-in"></span>
                    <%}%> 
                </button>
                <ul class="keys  list-group-item  list-unstyled">
                    
                    <% if(session.isNew() || session.getAttribute("tipo").equals("Anonimo")){ %>
                    <li><a class="sublist" href="pages/login.html" target="iframe">Iniciar Sesion</a></li>
                    <li><a class="sublist" href="pages/registrate.html" target="iframe">Registrarse</a></li>
                    <%}%>
                    <%
                    if(session.getAttribute("tipo").equals("Administrador") || session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){%>
                    <form action="jsp/logout.jsp" method="POST"><li style="color: #ECF0F1"><input type="submit" style="position: absolute; opacity: 0; left: 0.1em; height: 1.3em; width: 100%">Cerrar sesion</li></form>
                    <%}%>
                    
                </ul>
            </ul>
            <% if(!session.getAttribute("tipo").equals("Anonimo")){             
            %>
            <ul id="menuNo">
            <li><span class="glyphicon glyphicon-alert btn-lg" style="color: #ECF0F1; top: .2em; "></span>
                 <% if(session.getAttribute("tipo").equals("Alumno")){%>
                <ul class="cajaNo list-unstyled">
                    <section style="margin: 1em;">
                    <li><label>Avisos</label></li>
                    <li class="altaPrioridad"><label>Titulo Aviso: </label><section>Aviso con alta prioridad</section></li>
                    <li class="mediaPrioridad"><label>Titulo Aviso: </label><section>Aviso con media prioridad</section></li>
                    <li class="bajaPrioridad"><label>Titulo Aviso: </label><section>Aviso con baja prioridad</section></li>
                    </section>
               </ul>
                <% }
                    if(session.getAttribute("tipo").equals("Profesor")){ %>
                    <ul class="cajaNo list-unstyled" id="enviarAviso">
                    <li><label>Crear aviso</label></li>
                    <li> 
                        <section style="padding: 5px">

                            <section>
                                Titulo Aviso: <input style="color: #141414" type="text" size="30" id="tituloAv" name="tituloAv">
                                <section style="margin: 2px;">Aviso: <br>
                                    <textarea maxlength="100" style="color: #141414" id="cuerpoAv" name="cuerpoAv"></textarea>
                                </section>
                                <section>
                                    <select style="color: black" id="prioridadAv" name="prioridadAv">
                                        <option value="1">Prioridad alta</option>
                                        <option value="2">Prioridad media</option>
                                        <option value="3">Prioridad baja</option>
                                    </select>
                                </section>
                                <section>
                                    <lable for="grupoAv">Grupo al que va dirigido el aviso:<input style="color: #141414" onkeyup="verificaGrupo(this)" type="text" maxlength="10" id="grupoAv"></lable>
                                </section>
                                <br>
                                <input  class="btn boton btn-block" onclick="send()" type="button" value="ENVIAR">
                            </section>
                        </section></li>   
                        
               </ul> <%}
                %>     
                 <label><%=session.getAttribute("nickname") %></label></li>   
            </ul> <% } %>
        
        <section class="">
        	<form class="form-inline text-right">
                    <section class="form-group">
                    <section>
                        <input id="buscar" type="text" class="form-control"  placeholder="Buscar">
                        <button id="btn_buscar" class="btn boton"><span class="glyphicon glyphicon-search"></span></button>
                    </section>
                </section>
            </form>
        </section>
        </div>
    
            <nav>
                <ul class="menu" id="Principal">
            <li><a href="pages/home.html" target="iframe">P�gina Principal</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li><a href="jsp/profile.jsp" target="iframe">Mi Perf�l</a></li>
            <% 
                if(session.getAttribute("tipo").equals("Alumno")){ %>
             <li><a href="jsp/mis_preguntas.jsp" target="iframe">Mis Preguntas</a></li>
            <%}
                }%>
            <li onClick="mostrar(contentS)"><a href="#">Contenido</a></li>
            <section id="contentS" name="onMenu">
                <ul class="list-unstyled text-uppercase text-right list-group-item-text">
                    <li><a class="sublist" href="jsp/todo_articulos.jsp" target="iframe">Teoria</a></li>
                    <li><a class="sublist" href="jsp/todo_preguntas.jsp" target="iframe">Preguntas</a></li>
                    <li><a class="sublist" href="jsp/examenes.jsp" target="iframe">Examenes</a></li>
                    <%
                        if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
                    <li><a class="sublist" href="jsp/todo_simulExam.jsp" target="iframe">Simulador Examen</a></li>
                    <% }%>
                </ul>
            </section>
            <%
            
             if(session.getAttribute("tipo").equals("Profesor") || session.getAttribute("tipo").equals("Alumno")){ %>
            <li onclick="mostrar(feedS)"><a href="#">Feedback</a></li>
            <section id="feedS" name="onMenu">
                <form action="jsp/enviarFeed.jsp" class="form" target="iframe"  method="post">
                    <section class="text-center col-xs-12 form-group">
                        <textarea class="form-control " rows="3" name="feed" placeholder="Escribe una sugerencia"></textarea>
                    </section>
                    <br>
                    <section class="form-group col-xs-12">
                        <button type="submit" class="col-xs-12 btn boton"><span class="glyphicon glyphicon-check"></span> </button>
                    </section>
                </form>
            </section>
              <li><a href="jsp/ConfigurarCuenta.jsp" target="iframe">Configuraci�n de Cuenta</a></li><%} %>
            <%if(session.getAttribute("tipo").equals("Administrador")){ %>
            <li><a href="pages/admin_SPS.html" target="iframe">Registro de Actividad</a></li>
            <li><a href="jsp/admin_feedback.jsp" target="iframe">Feedback</a></li>
            <li><a href="pages/admin_reporte.html" target="iframe">Reportes</a></li>
            <li><a href="jsp/registroProfe.jsp" target="iframe">Registrar profesor</a></li>
            <li><a href="jsp/admin_blacklist.jsp" target="iframe">BlackList</a></li>
          
            <%}%>
        </ul>
        </nav>
        <iframe id="iframe" name="iframe" src="pages/home.html">
        </iframe>
        <div class="social">
        <ul>
            <li><a href="http://www.facebook.com" class="icon-facebook2"></a></li>
            <li><a href="http://www.twitter.com" class="icon-twitter2"></a></li>
            <li><a href="http://plus.google.com" class="icon-google-plus2"></a></li>
             <li><a href="http://https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=12&ct=1430950593&rver=6.4.6456.0&wp=MBI_SSL_SHARED&wreply=https:%2F%2Fblu175.mail.live.com%2Fdefault.aspx%3Frru%3Dinbox&lc=3082&id=64855&mkt=es-es&cbcxt=mai" class="icon-mail"></a></li>
            
        </ul>
        </div> 
    </body>
</html>

<!--MD5
/rdY/rS0VqFyWK56rFDf/rSiDRd6Dq61WTdfDTycr161eaDfDTTyWK5WAq61WTd56TTyWK5TDq61WTD/6F6yDYaf/rSi/r/Y/rSiAldr/rSiqyaRDR/8/rSiuq61WTM5RLarAl//6aAyWK5ar261WT05/rSiqTGUAq61WTDa/rSi/rS1rRRa6lDqAqoU6161W261eq61WTx5/rSi6FyTr161WTRrAl//RT=yWK5ArlSyWFTyWTTyWK7yWK7yWK7yWK7yWK7yWK7yWK7yWK5eAR85/rSirTGADROyWK5rD6/56lD/A6jyWTTyWYyAAR/qAq61WTRdr6aeR6RW/rSiq2jyWTTyWYySDR/eA6oTDROyWK5/RLae/rSir1jyWTaUR6RuDRWyWK70dX61WTDa/rSir6a8r161WTDarX61WYSiWr6yWK55/rSirTar/rSiW16ZArTjqaSyWK7yWTT9Vq6ZDA44
-->