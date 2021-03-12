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
      <h3><?php echo $DataPage['data']['ads_room_name'];?></h3>
      <hr/>
      <ul class="list-group">
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['ads_room_name'];?>
          <span class="badge  badge-pill"><?php echo $DataPage['data']['ads_campaign_name'];?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['daily_limit'];?>
          <span class="badge  badge-pill"><?php echo ($DataPage['data']['daily_limit']==0?'Не задан':$DataPage['data']['daily_limit']);?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['Ad_limit'];?>
          <span class="badge  badge-pill"><?php echo ($DataPage['data']['Ad_limit']==0?'Не задан':$DataPage['data']['Ad_limit']);?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['cost_per_show'];?>
          <span class="badge  badge-pill"><?php echo $DataPage['data']['cost_per_show'];?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['status'];?>
          <span class="badge  badge-pill"><?php echo ($DataPage['data']['status']==0?'Остановлено':$DataPage['data']['status']);?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['date_start'];?>
          <span class="badge  badge-pill"><?php echo ($DataPage['data']['date_start']?$DataPage['data']['date_start']:'Не задана');?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['date_stop'];?>
          <span class="badge  badge-pill"><?php echo ($DataPage['data']['date_stop']?$DataPage['data']['date_stop']:'Не задана');?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['ads_place'];?>
          <span class="badge  badge-pill"><?php echo $DataPage['data']['ads_place'];?> </span>
        </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['limit_show'];?>
          <span class="badge  badge-pill"><?php echo $DataPage['data']['limit_show'];?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['theme'];?>
          <div class="badge  badge-pill" style="white-space: normal;text-align: right;"><?php echo $DataPage['data']['theme'];?> </div>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['target_group'];?>
          <span class="badge  badge-pill">
              <?php echo ($DataPage['data']['dmh_gender']==2?'женщины':'мужчины');?>
               от <?php echo $DataPage['data']['dmh_gender_age_start'];?> до <?php echo $DataPage['data']['dmh_gender_age_end'];?>
          </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['cities'];?>
          <span class="badge  badge-pill"><?php echo $DataPage['data']['cities'];?> </span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['interest_category'];?>
          <div class="badge  badge-pill" style="white-space: normal;text-align: right;"><?php echo $DataPage['data']['interest_category'];?> </div>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
           <?php echo $DataPage['link'];?>
          <span class="badge  badge-pill"><?php echo $DataPage['data']['link'];?> </span>
        </li>
      </ul>
    </div>
  </div>
</div>
<!-- Scripts -->
<?php include_once(APP_PATH_VIEWS .'Jscript.tpl');?>
</body>
</html>

