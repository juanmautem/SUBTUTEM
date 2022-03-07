

 <style type="text/css">
  .logo{
    width:  2vw;
    height: 2vw;
  }
</style>

<nav class="navbar navbar-expand-sm bg-success navbar-dark sticky-top d-flex mb-3">
  <!-- Brand/logo -->
  <a class="navbar-brand p-2 mr-auto" href="<?php echo site_url('ppal'); ?>"><img src="<?php echo base_url('assets/img/logoSUBTUTEM.png') ?>" class="logo"> S.U.B.T.U.T.E.M</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav p-2 ml-auto">
      <li class="nav-item ">
        <a class="nav-link" href="#"><?php echo $_SESSION['txtName']. " ". $_SESSION['txtLastName'];?></a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="<?php echo site_url('logout'); ?>">Salir</a>
      </li>
    </ul>
  </div>
</nav>