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
<h1>Registra Concurso</h1>

		<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-5">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
				</div>
			</div>
			<div class="row" style="margin-top: 5%">
			
			<div class="col-md-4">
			<label class="control-label" for="id_fechaini">Fecha de inicio</label>
				<input class="form-control" type="date" id="id_fechaini">
			</div>	
			<div class="col-md-4">
				<label class="control-label" for="id_fechafin">Fecha final</label>
				<input class="form-control" type="date" id="id_fechafin">
			</div>
			</div>
				</div>
				<div class="row" style="margin-top: 2%">
			<div class="col-sm-1">
				<label class="control-label" for="id_estado">Estado</label > 
			</div>	
			<div class="col-sm-1">
				<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" name="estado" value="1"/>
			</div>			
		</div>
		<div class="row" style="margin-top: 5%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Crear Concurso</button>
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
            url: "registraConcurso", 
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
	$('#id_fechaini').val('');
	$('#id_fechafin').val('');
	$('#id_estado').val('');
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
                
                fechaini:{
                    selector: "#id_fechaini",
                    validators:{
                        notEmpty: {
                             message: 'La fecha es obligatorio'
                        }
                    }
                },
                
                fechafin:{
                    selector: "#id_fechafin",
                    validators:{
                        notEmpty: {
                             message: 'La fecha final es obligatoria'
                        }
                    }
                },
              
                estado:{
                    selector: "#id_estado",
                    validators:{
                        notEmpty: {
                             message: 'El estado es obligatorio'
                        }
                    }
                },
        }   
    });

    
});
</script>


</body>
</html>




