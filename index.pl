#!/usr/bin/perl
require ('./configFile.pm');

$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
if ($ENV{'REQUEST_METHOD'} eq "GET") {
   $buffer = $ENV{'QUERY_STRING'};
}

@pairs = split(/&/, $buffer); foreach $pair (@pairs) {    ($name, $value) = split(/=/, $pair);   $value =~ tr/+/ /;   $value =~ s/%(..)/pack("C", hex($1))/eg;   $FORM{$name} = $value;}
$id = $FORM{id};
$name = $FORM{name};
$phone = $FORM{phone};
$action = $FORM{action};
$search = $FORM{search};
$form_action="add";  
$buttonCaption="add";
$dbh = ConnectToMySql($Database); #Коннектимся в начале скрипта

#print printHeader("Однотабличная адресная книга с тремя полями");
print printHeader("One-table one-cgiFile simple dumb addressbook");



#-OTLADKA--#  print "$action <br>";


if ($action eq "add"){
$query = "INSERT into addressbook (name,phone) VALUES ('$name', '$phone')";
$sth = $dbh->prepare($query);
$sth->execute();
#-OTLADKA--#  if ($result){print "insert ok.<br>\n";}else{print "insertion <font color=red>fails.</font><br>\n";}

}elsif ($action eq "delet"){
	$query = "DELETE FROM addressbook WHERE id=$id";
	$sth = $dbh->prepare($query);
	$sth->execute();
#-OTLADKA--# 	if ($result){print "deletion ok.<br>\n";}else{print "deletion <font color=red>fails.</font><br>\n";}

}elsif ($action eq "edit"){
	$query = "select id, name, phone FROM addressbook WHERE id='$id'";
	$sth = $dbh->prepare($query);
	$sth->execute();
	while (@data = $sth->fetchrow_array()) {$edit_id = $data[0];$edit_name = $data[1];$edit_phone = $data[2];}
#-OTLADKA--# 	if ($result){print "selected for edition ok.<br>\n";}else{print "<font color=red>could not selected for edit </font><br>\n";}
	$buttonCaption="save";$form_action="save";
	Name
}elsif ($action eq "save"){
	$query = "UPDATE addressbook SET name = '$name', phone = '$phone' WHERE id = $id";
	$sth = $dbh->prepare($query);
	$sth->execute();
	while (@data = $sth->fetchrow_array()) {$edit_id = $data[0];$edit_name = $data[1];$edit_phone = $data[2];}
#-OTLADKA--# 	if ($result){print "selected for edition ok.<br>\n";$buttonCaption="edit";$form_action="edit";}else{print "<font color=red>could not selected for edit </font><br>\n";}
$buttonCaption="add";$form_action="add";
}

if($search){$search=" WHERE name LIKE '%$search%' OR phone LIKE '%$search%'"}


print <<HTML;
<form method="get" name="searching" action="$baseurl/index.pl">
	<table>
	<tr><td width=22%>&nbsp</td><td><font color=blue>search:</font><INPUT TYPE=text NAME="search" id=search size=30 value=""></td><td>
	<input type="submit" value="go"></td></tr>
	</table>
</form>
HTML



print <<HTML;
<form method="get" name="address" action="$baseurl/index.pl">
	<input type="hidden" name="action" value="$form_action">
	<input type="hidden" name="id" value="$id">
	<table>
	<tr><td>name</td><td>Phone</td></tr>
	<tr><td><INPUT TYPE=text NAME="name" id=name size=30 value="$edit_name"></td>
	<td><INPUT TYPE=text NAME="phone" id=phone value="$edit_phone" size=30> 
	<input type="submit" value="$buttonCaption"></td></tr>
	</table>
</form>
HTML


#-------list of contacts inside primitive table:
print "<table border=0>\n";
print "<tr><td>Name</td><td>Phone</td></tr>\n";

$query = "select id, name, phone FROM addressbook $search";
$sth = $dbh->prepare($query);
$sth->execute();
while (@data = $sth->fetchrow_array()) {
$id = $data[0];
$name = $data[1];
$phone = $data[2];
print "<tr bgcolor=$bgcolor><td>$name</td><td>$phone</td><td><a href=$baseurl/index.pl?id=$id&action=edit>edit</a> <a href='$baseurl/index.pl?id=$id&action=delet'>delet</a></td></tr>\n";
if ($bgcolor =~ "#EEEEEE") { $bgcolor = "white"; }else{$bgcolor = "#EEEEEE";}

}
print "</table>\n";


$dbh->disconnect; 
printFooter();
exit;


