<!-- Header -->
<script type="text/javascript">
    var locale = "ru";
    var Class = "<?php echo $DataPage['Class'];?>";
</script>
<div class="panel-body my-4 mr-4">
 <div class="btn-group float-right" role="group">
   <?php if($DataPage['Class']!=='Auth') {?>
     <a href="/Auth/logout" class="btn btn-secondary"><?php echo $DataPage['Main']['logout'];?></a>
    <?php } ?>
  </div>
</div>

