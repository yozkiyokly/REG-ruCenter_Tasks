#package configFile;

use DBI;
use DBD::mysql;
use CGI qw(:standard);

sub ConnectToMySql {
#--EDIT SQL server credentials BELOW--
my $db = "testbase";
my $host = "localhost";
my $userid = "buratino";
my $passwd = "tupoi";
#--Ok with SQLserver config-----------
my $connectionInfo="dbi:mysql:$db;$host";
my $l_dbh = DBI->connect($connectionInfo,$userid,$passwd);
return $l_dbh;
}


# uncomment & modify if need absolute url:
# $baseurl="http://localhost/perl/addrbook";


#----------------------------------------------------------------------
sub printHeader($title){
return header,'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//RU" >
<html lang="ru">
<head>
<meta charset="UTF8" />
<title>',@_[0],'</title></head>
<body><center>';
}

#----------------------------------------------------------------------
sub printFooter(){
print "<br><br><pre><small><font color='orange'>Sorry for LATIN: \nnewly installed Debian11 have hardfixable UTF encoding problem \nand i'm forced to program with a minimal cyrillic using possibilities.\n there are two recodings between MariaDB and Apache2\n Reinstallation will solve this. \nAnd surely, it will solve a 32bit instead of 64bit kernel problem, also.\n\n
Sincerely, WRB-RIPN (yozki.ru)</small></pre><font>";
print "\n\n</body></html>\n\n";}


return true;
