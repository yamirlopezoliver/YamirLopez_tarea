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

	<form th:action="@{/submit}" method="post">
  <div class="form-group">
    <label for="start-date">Start Date:</label>
    <input type="text" class="form-control datepicker" id="start-date" name="startDate">
  </div>
  <div class="form-group">
    <label for="end-date">End Date:</label>
    <input type="text" class="form-control datepicker" id="end-date" name="endDate">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
	
</div>



</body>
</html>




