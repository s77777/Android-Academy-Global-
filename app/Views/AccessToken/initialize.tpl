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
      <form action="/AccessToken/authorization" method="POST">
        <div class="form-group">
          <label><?php echo $DataPage['client_id'];?></label>
          <input type="text" name="client_id" class="form-control" required placeholder="">
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['redirect_uri'];?></label>
          <input type="text" name="redirect_uri" class="form-control" required placeholder="">
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['display'];?></label>
          <select class="form-control" name="display">
          <?php foreach($DataPage['display_list'] as $key=>$value) { ?>
            <option value="<?php echo $key; ?>"><?php echo $value;?></option>
          <?php } ?>
          </select>
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['scope'];?></label>
          <input type="text" name="scope" class="form-control" required placeholder="">
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['response_type'];?></label>
          <input type="text" name="response_type" class="form-control" required placeholder="">
        </div>
        <button type="submit" class="btn btn-primary"><?php echo $DataPage['singup'];?></button>
      </form>
    </div>
  </div>
</div>
<!-- Scripts -->
<?php include_once(APP_PATH_VIEWS .'Jscript.tpl');?>
</body>
</html>

