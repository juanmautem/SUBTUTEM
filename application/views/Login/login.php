<style type="text/css">
main{
	height: 700px;
	overflow: hidden;
	width: 98%;
	margin: 1%;
	background-color: white;
	border-radius: 25px;
}
.tit2{
	text-align: center;
	font-family:Times New Roman;
	font-weight: bold;
	text-shadow: 2px 2px 2px lightgray;
	padding: 10px;
}
.img{
	width:  9vw;
	height: 9vw;
}
</style>

<main class="d-flex justify-content-center align-items-center flex-column" >
	<div class="d-flex justify-content-center">
		<div class="p-2">
			<h3 class="tit2">BIENVENIDO!</h3><hr>
		</div>
		
	</div>
	<div class="d-flex justify-content-center">
		<div class="p-2">
			<img src="<?php echo base_url('assets/img/logoSUBTUTEM.png') ?>" class="img">
		</div>
	</div>
	<br>
	<form action="<?php echo site_url('login2'); ?>" method="POST" class="d-flex justify-content-center align-items-center flex-column">
		<section class= "mb-3 p-2">
			<div class="input-group inp">
				<div class="input-group-prepend">
						<span class="input-group-text">Usuario</span>
				</div>
				<input type="text" class="form-control" id='txtUser' name='txtUser'>
			</div>
		</section>
		<section class= "mb-3 p-2">
			<div class="input-group inp">
				<div class="input-group-prepend">
						<span class="input-group-text">Contraseña</span>
				</div>
				<input type="password" class="form-control" id='txtPsw' name='txtPsw'>
			</div>
		</section>
		<br>
		<br>
		<section class= "mb-3 p-2">
			<button type="submit" class="btn btn-success" name="btnRegistrarme" value="1">Ingresar</button>
			<button type="submit" class="btn btn-link" name="btnRegistrarme" value="2">Registrarme</button>
		</section>
	</form>
	
</main>

