/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $('#muestrame').click(function(){
        $('nav').toggleClass('mostrar'); 
    });
    $('nav').mouseleave(function(){
        $('nav').toggleClass('mostrar');
    });
    $('.mostrarLink').click(function(){
        $('.mostrarSeccion').slideToggle(1000);
    });
    $('#homeLeft').mouseenter(function(){ //Home izquierda
        
        $('#homeLeft').animate({opacity: '1'}, 300);
    });
    $('#homeLeft').mouseleave(function(){
         $('#homeLeft').animate({opacity: '0.5'}, 300);
    }); 
    $('#homeCenter').mouseenter(function(){ //Home centro
        
        $('#homeCenter').animate({opacity: '1'}, 300);
    });
    $('#homeCenter').mouseleave(function(){
         $('#homeCenter').animate({opacity: '0.5'}, 300);
    });
    $('#homeRight').mouseenter(function(){ //Home derecha
        
        $('#homeRight').animate({opacity: '1'}, 300);
    });
    $('#homeRight').mouseleave(function(){
         $('#homeRight').animate({opacity: '0.5'}, 300);
    });
    
    $('.zigma').animate({width: '36px', height: '36px', top: '0.6em', left: '5em'},1500); //zigma animation
    
  
    $('#dropdownMenu1').click(function(){
       $('#filtroArt').fadeToggle(500); 
    });
    $('#menuNo').hover(function(){
       $('#menuNo li > ul').fadeToggle(500);
    });
});
  function mostrar(menu){
    $(menu).slideToggle(800);
    }
var entero = 1;
function cantidad(){
    
    var todo = document.getElementById("todo");
    var modelo = "<section> <br><hr><section><label>Titulo del reactivo: </label><input type='text' size='35' name='titPregunta"+entero+"'> </section><section><label>Cuerpo:</label><br><textarea name='cuerPregunta"+entero+"' class='areaTexto' rows='5' placeholder='Escriba aquí'></textarea></section><section><label>Respuestas: </label><br><input type='radio' name='respPregunta"+entero+"'> a) <input type='text' size='20'><input type='radio' name='respPregunta"+entero+"'> b) <input type='text' size='20'><br><br><input type='radio' name='respPregunta"+entero+"'> c) <input type='text' size='20'><input type='radio' name='respPregunta"+entero+"'> d) <input type='text' size='20'><br><br></section><section><label>La respuesta correcta: </label><select name='correcta' style='color: #141414'><option>a</option><option>b</option><option>c</option><option>d</option></select></section><br><hr></section>";
    todo.innerHTML += modelo;
    entero++;
}