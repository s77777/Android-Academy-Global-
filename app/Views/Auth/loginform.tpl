<!DOCTYPE HTML>
<html lang="ru">
<head>
<title><?php echo $DataPage['Title'];?></title>
<?php include_once(APP_PATH_VIEWS .'HeadMeta.tpl');?>
</head>
<body>
<?php include_once(APP_PATH_VIEWS .'Headr.tpl');?>
<div class="container col-sm-6">
  <div class="div-center">
    <div class="content">
      <h3><?php echo $DataPage['Headr'];?></h3>
      <hr/>
      <form action="/Auth/login" method="post">
        <div class="form-group">
          <label><?php echo $DataPage['email'];?></label>
          <input type="email" name="email" class="form-control" required placeholder="<?php echo $DataPage['pemail'];?>">
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['psw'];?></label>
          <input type="password" name="psw" class="form-control" required placeholder="<?php echo $DataPage['psw'];?>">
        </div>
        <button type="submit" class="btn btn-primary"><?php echo $DataPage['Headr'];?></button>
        <hr/>
        <a href="/Auth/register" class="btn btn-link"><?php echo $DataPage['singup'];?></a>
      </form>
    </div>
  </div>
</div>
<!-- Scripts -->
<?php include_once(APP_PATH_VIEWS .'Jscript.tpl');?>
</body>
</html>

