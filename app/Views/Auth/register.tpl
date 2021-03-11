<!DOCTYPE HTML>
<html lang="ru">
<head>
<title><?php echo $DataPage['Title'];?></title>
<?php include_once(APP_PATH_VIEWS .'HeadMeta.tpl');?>
<meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body>
<?php include_once(APP_PATH_VIEWS .'Headr.tpl');?>
<div class="container col-sm-6">
  <div class="div-center">
    <div class="content">
      <h3><?php echo $DataPage['HeadrRegister'];?></h3>
      <hr/>
      <form action="/Auth/adduser" method="post">
        <div class="form-group">
          <label><?php echo $DataPage['email'];?></label>
          <input type="email" name="email" class="form-control" required placeholder="<?php echo $DataPage['pemail'];?>">
        </div>
          <input type="hidden" name="register_token" value="<?php echo $DataPage['register_token'];?>">
        <div class="form-group">
          <label><?php echo $DataPage['psw'];?></label>
          <input type="password" name="psw" class="form-control" required placeholder="<?php echo $DataPage['psw'];?>">
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['psw2'];?></label>
          <input type="password" name="psw2" class="form-control" required placeholder="<?php echo $DataPage['psw2'];?>">
        </div>
          <button type="button" class="btn btn-primary"><?php echo $DataPage['register'];?></button>
      </form>
    </div>
  </div>
</div>
<!-- Scripts -->
<?php include_once(APP_PATH_VIEWS .'Jscript.tpl');?>
<script>
    var arrMsg=<?php echo json_encode($DataPage['error']);?>;
    var Class='<?php echo $DataPage['Class'];?>';
</script>
<script src="/assets/js/register.js"></script>
</body>
</html>


