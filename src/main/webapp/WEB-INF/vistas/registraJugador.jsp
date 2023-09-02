<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra Jugador</h1>

	<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
				</div>
			</div>
			
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Alias</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el alias" maxlength="20">
				</div>
			</div>
			
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_pais">País</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_pais" name="pais" placeholder="Ingrese el país" maxlength="40">
				</div>
			</div>
			
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_juego">Juego</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_juego" name="juego" placeholder="Ingrese el juego" maxlength="40">
				</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_experiencia">Experiencia</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_experiencia" name="experiencia" placeholder="Ingrese tiempo de experiencia" maxlength="3">
		 		</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Crear Jugador</button>
		</div>	
	</form>
	
</div>

<script type="text/javascript">

$("#id_registrar").click(function (){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
    //Pregunta si es valido el formulario(Si no tiene errores)
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraJugador", 
            data: $('#id_form').serialize(),
            success: function(data){
            	mostrarMensaje(data.MENSAJE);
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(data.MSG_ERROR);
            }
    	});
	}   
    	
	
});


function limpiarFormulario(){
	$('#id_nombre').val('');
	$('#id_alias').val('');
	$('#id_pais').val('');
	$('#id_juego').val('');
	$('#id_experiencia').val('');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                alias:{
                    selector: "#id_alias",
                    validators:{
                        notEmpty: {
                             message: 'El alias es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El alias es de 3 a 40 caracteres'
                        },
                    }
                },
                pais:{
                    selector: "#id_pais",
                    validators:{
                        notEmpty: {
                             message: 'El pais es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El pais es de 3 a 30 caracteres'
                        },
                    }
                },
                juego:{
                    selector: "#id_juego",
                    validators:{
                        notEmpty: {
                             message: 'El juego es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El juego es de 3 a 35 caracteres'
                        },
                    }
                },
                experiencia:{
                    selector: "#id_experiencia",
                    validators:{
                        notEmpty: {
                             message: 'La experiencia es obligatoria'
                        },
                       // regexp: {
                         //   regexp: /^[0-4]{3}$/,
                           // message: 'el tiempo es 3 dígitos'
                      // }
                    }
                },
        }   
    });

    
});
</script>



</body>
</html>




