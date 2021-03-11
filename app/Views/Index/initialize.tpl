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
      <h3><?php echo $DataPage['Title'];?></h3>
      <hr/>
              <div id="uploadfile" class="form-group mt-3">
            <label><?php echo $DataPage['foto'];?></label>
            <div class="card-body">
                <img id="userfoto" class="card-img-top" style="width: 100px;"  src="/download/<?php echo ($DataPage['data']['foto']!=''?$DataPage['data']['foto']:'nofoto.png');?>">
                <?php if ($DataPage['data']['foto']=='') {?>
                <form class="was-validated">
                    <div class="custom-file">
                        <div class="form-group mx-sm-3 mb-2">
                            <input type="hidden" name="id" value="<?php echo $DataPage['data']['id'];?>"/>
                            <input type="file" name="file" class="custom-file-input" value="" required />
                            <label class="custom-file-label"><?php echo $DataPage['nofoto'];?></label>
                            <div class="invalid-feedback"><?php echo $DataPage['filenotsel'];?></div>
                        </div>
                    </div>
                </form>
               <?php } ?>
            </div>
            <?php if ($DataPage['data']['foto']=='') {?>
            <div class="form-group mx-3">
                <button class="btn btn-primary" type="buttom" name="Upload"><?php echo $DataPage['uploadfile'];?></button>
            </div>
            <?php } ?>
        </div>
       <form action="/Index/updateDataUser" method="post">
        <input type="hidden" name="id" value="<?php echo $DataPage['data']['id'];?>"/>
        <div class="form-group">
          <label><?php echo $DataPage['email'];?></label>
          <input type="email" class="form-control" placeholder="" value="<?php echo $DataPage['data']['email'];?>" name="email" required/>
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['fname'];?></label>
          <input type="text" name="first_name" class="form-control" placeholder="" value="<?php echo $DataPage['data']['first_name'];?>" required/>
        </div>
        <div class="form-group">
          <label><?php echo $DataPage['lname'];?></label>
          <input type="text" name="last_name" class="form-control" placeholder="" value="<?php echo $DataPage['data']['last_name'];?>" required/>
        </div>
        <input type="hidden" name="foto" value="<?php echo $DataPage['data']['foto'];?>"/>
        <button type="submit" class="btn btn-primary"><?php echo $DataPage['save'];?></button>
      </form>
    <hr/>
     <h3><?php echo $DataPage['list_rooms'];?></h3>
     <hr/>
     <ul class="list-group">
          <?php foreach($DataPage['ads_rooms'] as $key=>$value) { ?>
          <li class="list-group-item"><a href='/AdsCampaign/index/<?php echo $value['id'];?>'><?php echo $value['ads_room_name'];?></a></li>
          <?php } ?>
      </ul>
    </div>
</div>
<!-- Scripts -->
<?php include_once(APP_PATH_VIEWS .'Jscript.tpl');?>
<script>
    var arrMsg=<?php echo json_encode($DataPage['errorjs']);?>;
    var Class='<?php echo $DataPage['Class'];?>';
</script>
<script src="/assets/js/Index.js"></script>
</body>
</html>
