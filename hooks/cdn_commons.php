<?php
$base_dev = "/mnt/cdn/commons/dev/";
$output = shell_exec("cd $base_dev; git pull origin master");
echo "<pre>$output</pre>";
?>