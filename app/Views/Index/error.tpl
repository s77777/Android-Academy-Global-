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
      <h3><?php echo $DataPage['error'];?></h3>
      <hr/>
      <a href="/"><?php echo $DataPage['gohome'];?></a>
    </div>
</div>
<!-- Scripts -->
<?php include_once(APP_PATH_VIEWS .'Jscript.tpl');?>
</body>
</html>
