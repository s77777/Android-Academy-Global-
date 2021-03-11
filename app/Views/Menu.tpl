<!-- Menu -->
<?php $Menu=include(APP_PATH_LOCALE.LANG.'/Menu.php');?>
<nav id="menu">
    <h2><?php echo $Menu['text'];?></h2>
	<ul>
	    <?php foreach($Menu['items'] as $key=>$value) {?>
            <li><a href="#" action="<?php echo $value['action'];?>"><?php echo $value['text'];?></a></li>
	    <?php }?>
        </ul>
</nav>