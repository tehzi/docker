<?php
$i = 0;
$i++;
$cfg['Servers'][$i]['auth_type'] = 'config';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['connect_type'] = 'tcp';
$cfg['Servers'][$i]['compress'] = false;
/* Select mysqli if your server has it */
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = true;

/*
 * phpMyAdmin configuration storage settings.
 */
$cfg['DefaultLang'] = 'ru';
$cfg['ServerDefault'] = 1;
$cfg['Export']['compression'] = 'gzip';
$cfg['Export']['sql_dates'] = true;
$cfg['Export']['sql_drop_table'] = true;
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

/* User used to manipulate with storage */
$cfg['Servers'][$i]['connect_type'] = 'tcp';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = '${DB_USER}';
$cfg['Servers'][$i]['password'] = '${DB_PASSWORD}';
$cfg['Servers'][$i]['host'] = '${HOST}';


$cfg['Servers'][$i]['controluser'] = '${PMA_USER}';
$cfg['Servers'][$i]['controlpass'] = '${PMA_PASSWORD}';
$cfg['Servers'][$i]['controlhost'] = '${HOST}';

/* Storage database and tables */
$cfg['Servers'][$i]['pmadb'] = 'phpmyadmin';
$cfg['Servers'][$i]['bookmarktable'] = 'pma_bookmark';
$cfg['Servers'][$i]['relation'] = 'pma_relation';
$cfg['Servers'][$i]['table_info'] = 'pma_table_info';
$cfg['Servers'][$i]['table_coords'] = 'pma_table_coords';
$cfg['Servers'][$i]['pdf_pages'] = 'pma_pdf_pages';
$cfg['Servers'][$i]['column_info'] = 'pma_column_info';
$cfg['Servers'][$i]['history'] = 'pma_history';
$cfg['Servers'][$i]['tracking'] = 'pma_tracking';
$cfg['Servers'][$i]['designer_coords'] = 'pma_designer_coords';
$cfg['Servers'][$i]['userconfig'] = 'pma_userconfig';
$cfg['Servers'][$i]['recent'] = 'pma_recent';
$cfg['Servers'][$i]['table_uiprefs'] = 'pma_table_uiprefs';

// $cfg['UploadDir'] = '';
// $cfg['SaveDir'] = '';
?>