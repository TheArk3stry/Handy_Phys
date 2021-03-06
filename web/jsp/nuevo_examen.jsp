<%-- 
    Document   : nuevo_examen
    Created on : 13/08/2015, 08:55:22 PM
    Author     : ivan-hdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title id="title">Creaundo un examen...</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/estilo_menu.css">
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/muestra.js"></script>
        <script>
            function titulo(t){
                document.getElementById("title").innerHTML = t.value;
            }
        </script>
    </head>
    <body>
        <section class="integrarMenu">
            <jsp:include page="../menu.jsp" flush="true"></jsp:include>
        </section>
        <section class="integrarCont">
    <h1>CREAR EXAMEN DE PRACTICA</h1>
    <form action="../servlets/subirExam" method="POST" onsubmit="document.getElementById('cuantos').value = entero;" class="formularioNuevoExa" style="border-right: 10px solid #098ddf; border-top: 5px solid #098ddf">
        <input id="cuantos" type="hidden" value="" name="cuantos">
        <section>
            <h3><label for="tituloExam">Titulo del examen: </label></h3>
            <section class="col-md-5">
                <input required onkeyup="titulo(this)" type="text" size="35" class="form-control" name="tituloExam" id="tituloExam">
            </section>
        </section><br>
        <section>
            <h3><label>Descripcion del examen:</label></h3>
            <section class="col-md-5">
                <textarea onkeyup="this.value = this.value;" name="descripcionExam" class="areaTexto form-control"  placeholder="Una breve descripcion"></textarea>
            </section>
        </section>
        <section>
            <section class="col-md-3" style="position: relative; top: -9em">
                <h3><label>Parcial al que va destinado</label></h3>
                <select required  name="parcial" class="form-control" style="color: #141414">
                    <option>Seleccione el parcial</option>
                    <option value="1">Parcial 1</option>
                    <option value="2">Parcial 2</option>
                    <option value="3">Parcial 3</option>
                </select>    
            </section>
            <section class="col-md-3" style="position: relative; top: -9em">
                <h3><label>Unidad de aprendizaje</label></h3>
                <select required name="unidad" class="form-control"  style="color:#141414">
                    <option>Seleccione una unidad de aprendizaje</option>
                    <option value="1">Fisica 2</option>
                </select>
            </section>
        </section><br>
        <!--Preguntas -->
        <section class="col-md-12" id="todo">
            <section class="col-md-12 container">
                <br> <hr>
                <h2>Pregunta 1</h2>
                <section class="col-md-4">
                    <label>
                        <h3>Pregunta:</h3>
                        <textarea style="color: #141414" required name="pregunta1" class="areaTexto" rows="5" placeholder="Empezar a escribir..."></textarea>
                    </label>
                </section>
                <section class="col-md-4">
                    <h3><label>Respuestas: </label></h3>
                    <label>A) <input required style="color: #141414" name="respuesta1.a" type="text" size="20"></label>
                    <label>B) <input required style="color: #141414" name="respuesta1.b" type="text" size="20"></label><br><br>
                    <label>C) <input required style="color: #141414" name="respuesta1.c" type="text" size="20"></label>
                    <label>D) <input required style="color: #141414" name="respuesta1.d" type="text" size="20"></label><br><br>
                </section>
                <section class="col-md-4">
                    <h3><label>La respuesta correcta es: </label></h3>
                    <select required  class="form-control-static" name="correcta1" style="color: #141414; position: relative; top: -3.2em; left: 20em">
                        <option value="a">A)</option>
                        <option value="b">B)</option>
                        <option value="c">C)</option>
                        <option value="d">D)</option>
                    </select>
                </section>
                <br><hr>
            </section>
            <section id="sig"></section>
        </section>
        <br><br>
        <section class="container">
            <button class="btn btn-danger" onclick="window.location.href = '../jsp/todo_simulExam.jsp'" type="button">Cancelar</button>
            <button onclick="cantidad()" type="button"  class="btn  btn-info">Agregar pregunta</button>
            <input type="submit" value="Enviar" style="float: right" class="btn btn-success">
        </section>
        </form>
        </section>
    </body>
</html>
<!--
/rdY/rS0VqFyWK56rFDf/rSiDRd6Dq61WTdfDTycr161eaDfDTTyWK5WAq61WTd56TTyWK5TDq61WTD/6F6yDYaf/rSi/r/Y/rSiAldr/rSiqyaRDR/8/rSiuq61WTM5RLarAl//6aAyWK5ar261WT05/rSiqTGUAq61WTDa/rSi/rS1rRRa6lDqAqoU6161W261eq61WTx5/rSi6FyTr161WTRrAl//RT=yWK5ArlSyWFTyWTTyWK7yWK7yWK7yWK7yWK7yWK7yWK7yWK5eAR85/rSirTGADROyWK5rD6/56lD/A6jyWTTyWYyAAR/qAq61WTRdr6aeR6RW/rSiq2jyWTTyWYySDR/eA6oTDROyWK5/RLae/rSir1jyWTaUR6RuDRWyWK70dX61WTDa/rSir6a8r161WTDarX61WYSiWr6yWK55/rSirTar/rSiW16ZArTjqaSyWK7yWTT9Vq6ZDA44
-->
