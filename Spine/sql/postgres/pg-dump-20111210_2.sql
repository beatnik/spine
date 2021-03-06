--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: adminaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('adminaccess_id_seq', 20, true);


--
-- Name: attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('attribute_id_seq', 252, true);


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('content_id_seq', 195, true);


--
-- Name: macro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('macro_id_seq', 6, true);


--
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('message_id_seq', 24, true);


--
-- Name: messagegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('messagegroup_id_seq', 4, true);


--
-- Name: navbarbuttons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('navbarbuttons_id_seq', 211, true);


--
-- Name: navbars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('navbars_id_seq', 33, true);


--
-- Name: revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('revision_id_seq', 1, false);


--
-- Name: style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('style_id_seq', 33, true);


--
-- Name: usergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('usergroup_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: wiki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spineuser
--

SELECT pg_catalog.setval('wiki_id_seq', 1, false);


--
-- Data for Name: adminaccess; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO adminaccess VALUES (1, 'message', 'admin', '111');
INSERT INTO adminaccess VALUES (2, 'adminaccess', 'users', '000');
INSERT INTO adminaccess VALUES (3, 'style', 'admin', '111');
INSERT INTO adminaccess VALUES (4, 'content', 'admin', '111');
INSERT INTO adminaccess VALUES (5, 'content', 'users', '111');
INSERT INTO adminaccess VALUES (6, 'message', 'users', '111');
INSERT INTO adminaccess VALUES (7, 'navbar', 'admin', '111');
INSERT INTO adminaccess VALUES (8, 'macros', 'users', '111');
INSERT INTO adminaccess VALUES (9, 'macros', 'admin', '111');
INSERT INTO adminaccess VALUES (10, 'wiki', 'users', '111');
INSERT INTO adminaccess VALUES (11, 'stats', 'users', '111');
INSERT INTO adminaccess VALUES (12, 'wiki', 'admin', '111');
INSERT INTO adminaccess VALUES (13, 'adminaccess', 'admin', '111');
INSERT INTO adminaccess VALUES (14, 'style', 'users', '111');
INSERT INTO adminaccess VALUES (15, 'navbar', 'users', '111');
INSERT INTO adminaccess VALUES (16, 'users', 'admin', '111');
INSERT INTO adminaccess VALUES (17, 'fileman', 'admin', '111');
INSERT INTO adminaccess VALUES (18, 'usergroup', 'admin', '111');
INSERT INTO adminaccess VALUES (19, 'fileman', 'users', '111');


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO attribute VALUES (1, 'i18n', 'macroset_exists', 'en', 'This macroset already exists!');
INSERT INTO attribute VALUES (2, 'i18n', 'folder_not_exists', 'en', ' This folder does not exist!');
INSERT INTO attribute VALUES (3, 'i18n', 'valid_perms', 'nl', 'U heeft niet voldoende rechten voor deze operatie : ');
INSERT INTO attribute VALUES (4, 'i18n', 'enter_name', 'nl', 'Naam invoegen');
INSERT INTO attribute VALUES (5, 'i18n', 'folder_exists', 'en', ' This folder already exists!');
INSERT INTO attribute VALUES (6, 'i18n', 'filetype_not_exists', 'en', 'This filetype association does not exist!');
INSERT INTO attribute VALUES (7, 'i18n', 'filetype_exists', 'en', 'This filetype association already exists!');
INSERT INTO attribute VALUES (8, 'i18n', 'file_not_exists', 'en', 'This file does not exists!');
INSERT INTO attribute VALUES (9, 'i18n', 'file_exists', 'en', 'This file already exists!');
INSERT INTO attribute VALUES (10, 'i18n', 'enter_name', 'en', 'Enter name');
INSERT INTO attribute VALUES (11, 'i18n', 'edit_user', 'en', 'Edit a user');
INSERT INTO attribute VALUES (12, 'i18n', 'edit_style', 'en', 'Edit style');
INSERT INTO attribute VALUES (13, 'i18n', 'edit_navbar', 'en', 'Edit a navigation bar');
INSERT INTO attribute VALUES (14, 'i18n', 'edit_message', 'en', 'Edit a message');
INSERT INTO attribute VALUES (15, 'i18n', 'edit_macroset', 'en', 'Edit a macroset');
INSERT INTO attribute VALUES (16, 'i18n', 'edit_content', 'en', 'Edit a content');
INSERT INTO attribute VALUES (17, 'i18n', 'edit_button', 'en', 'Edit a button in the navigation bar');
INSERT INTO attribute VALUES (18, 'i18n', 'docroot_permissions', 'en', 'Does the document root directory have correct permissions?');
INSERT INTO attribute VALUES (19, 'i18n', 'delete_button', 'en', 'Delete a button from the navigation bar');
INSERT INTO attribute VALUES (20, 'i18n', 'create_style', 'en', 'Create new style');
INSERT INTO attribute VALUES (21, 'i18n', 'create_user', 'en', 'Add a new user');
INSERT INTO attribute VALUES (22, 'i18n', 'create_usergroup', 'en', 'Add a user to a usergroup');
INSERT INTO attribute VALUES (23, 'i18n', 'create_message', 'en', 'Create a new message');
INSERT INTO attribute VALUES (24, 'i18n', 'create_navbar', 'en', 'Create a new navigation bar');
INSERT INTO attribute VALUES (25, 'i18n', 'create_macroset', 'en', 'Add a new macroset');
INSERT INTO attribute VALUES (26, 'i18n', 'create_filetype', 'en', 'Add new filetype association');
INSERT INTO attribute VALUES (27, 'i18n', 'create_macro', 'en', 'Add a new macro');
INSERT INTO attribute VALUES (28, 'i18n', 'create_content', 'en', 'Create a new content');
INSERT INTO attribute VALUES (29, 'i18n', 'create_adminaccess', 'en', 'Add new admin access permissions');
INSERT INTO attribute VALUES (30, 'i18n', 'copy_style', 'en', 'Copy style');
INSERT INTO attribute VALUES (31, 'i18n', 'copy_messagegroup', 'en', 'Copy a messagegroup');
INSERT INTO attribute VALUES (32, 'i18n', 'copy_navbar', 'en', 'Copy a navigation bar');
INSERT INTO attribute VALUES (33, 'i18n', 'copy_file', 'en', 'Copy a file');
INSERT INTO attribute VALUES (34, 'i18n', 'copy_macroset', 'en', 'Copy a macroset');
INSERT INTO attribute VALUES (35, 'i18n', 'copy_failed', 'en', 'Unable to copy file.');
INSERT INTO attribute VALUES (36, 'i18n', 'copy_content', 'en', 'Copy a content');
INSERT INTO attribute VALUES (37, 'i18n', 'content_exists', 'en', 'This content already exists!');
INSERT INTO attribute VALUES (38, 'i18n', 'content_not_exists', 'en', 'This content does not exist!');
INSERT INTO attribute VALUES (39, 'i18n', 'adminaccess_exists', 'en', 'These admin access permissions already exist!');
INSERT INTO attribute VALUES (40, 'i18n', 'adminaccess_not_exists', 'en', 'These admin access permissions do not exist!');
INSERT INTO attribute VALUES (41, 'i18n', 'add_button', 'en', 'Add a button to the navigation bar');
INSERT INTO attribute VALUES (42, 'i18n', 'create_adminaccess', 'nl', 'Nieuwe toegangsrechten toevoegen');
INSERT INTO attribute VALUES (43, 'i18n', 'remove_adminaccess', 'nl', 'Toegangsrechten verwijderen<br> ');
INSERT INTO attribute VALUES (44, 'i18n', 'save_adminaccess', 'nl', 'Toegangsrechten opslaan<br>');
INSERT INTO attribute VALUES (45, 'i18n', 'adminaccess_exists', 'nl', 'Deze toegangsrechten bestaan reeds!');
INSERT INTO attribute VALUES (46, 'i18n', 'adminaccess_not_exists', 'nl', 'Deze toegangsrechten bestaan niet!');
INSERT INTO attribute VALUES (47, 'i18n', 'create_content', 'nl', 'Nieuwe content aanmaken');
INSERT INTO attribute VALUES (48, 'i18n', 'remove_content', 'nl', 'Content verwijderen<br>');
INSERT INTO attribute VALUES (49, 'i18n', 'edit_content', 'nl', 'Content wijzigen<br>');
INSERT INTO attribute VALUES (50, 'i18n', 'save_content', 'nl', 'Content opslaan<br>');
INSERT INTO attribute VALUES (51, 'i18n', 'copy_content', 'nl', 'Content kopieren');
INSERT INTO attribute VALUES (52, 'i18n', 'content_exists', 'nl', 'Deze content bestaat reeds!');
INSERT INTO attribute VALUES (53, 'i18n', 'content_not_exists', 'nl', 'Deze content bestaat niet!');
INSERT INTO attribute VALUES (54, 'i18n', 'create_style', 'nl', 'Nieuwe style aanmaken');
INSERT INTO attribute VALUES (55, 'i18n', 'remove_style', 'nl', 'Style verwijderen<br>');
INSERT INTO attribute VALUES (56, 'i18n', 'edit_style', 'nl', 'Style wijzigen<br>');
INSERT INTO attribute VALUES (57, 'i18n', 'save_style', 'nl', 'Style opslaan<br>');
INSERT INTO attribute VALUES (58, 'i18n', 'copy_style', 'nl', 'Style kopieren');
INSERT INTO attribute VALUES (59, 'i18n', 'style_exists', 'nl', 'Deze style bestaat reeds!<br>');
INSERT INTO attribute VALUES (60, 'i18n', 'style_not_exists', 'nl', 'Deze style bestaat niet!<br>');
INSERT INTO attribute VALUES (61, 'i18n', 'new_upload', 'nl', 'Upload een bestand<br>');
INSERT INTO attribute VALUES (62, 'i18n', 'new_folder', 'nl', 'Folder aanmaken<br>');
INSERT INTO attribute VALUES (63, 'i18n', 'copy_file', 'nl', 'Bestand kopieren');
INSERT INTO attribute VALUES (64, 'i18n', 'rename_file', 'nl', 'Bestand van naam veranderen<br>');
INSERT INTO attribute VALUES (65, 'i18n', 'read_folder', 'nl', 'Inhoud van de folder lezen<br> ');
INSERT INTO attribute VALUES (66, 'i18n', 'mkdir_failed', 'nl', 'Folder kan niet aangemaakt worden.');
INSERT INTO attribute VALUES (67, 'i18n', 'copy_failed', 'nl', 'Bestand kan niet gekopieerd worden.');
INSERT INTO attribute VALUES (68, 'i18n', 'remove_failed', 'nl', 'Bestand kan niet verwijderd worden.');
INSERT INTO attribute VALUES (69, 'i18n', 'rename_failed', 'nl', 'Bestand kan niet van naam veranderd worden.');
INSERT INTO attribute VALUES (70, 'i18n', 'readdir_failed', 'nl', 'Inhoud van folder kan niet gelezen worden.');
INSERT INTO attribute VALUES (71, 'i18n', 'docroot_permissions', 'nl', 'Heeft document root correcte toegangsrechten?');
INSERT INTO attribute VALUES (72, 'i18n', 'upload_failed', 'nl', 'Bestand kan niet geupload worden. Rapporteer een programmafout als dit een blijvend probleem is.');
INSERT INTO attribute VALUES (73, 'i18n', 'upload_unknown', 'nl', 'Fout bij het aanmaken van het bestand:');
INSERT INTO attribute VALUES (74, 'i18n', 'file_exists', 'nl', 'Dit bestand bestaat reeds!<br>');
INSERT INTO attribute VALUES (75, 'i18n', 'file_not_exists', 'nl', 'Dit bestand bestaat niet!<br>');
INSERT INTO attribute VALUES (76, 'i18n', 'folder_exists', 'nl', 'Deze folder bestaat reeds!<br>');
INSERT INTO attribute VALUES (77, 'i18n', 'folder_not_exists', 'nl', 'Deze folder bestaat niet!<br>');
INSERT INTO attribute VALUES (78, 'i18n', 'create_message', 'nl', 'Nieuw bericht toevoegen');
INSERT INTO attribute VALUES (79, 'i18n', 'remove_message', 'nl', 'Bericht verwijderen<br>');
INSERT INTO attribute VALUES (80, 'i18n', 'edit_message', 'nl', 'Bericht wijzigen<br>');
INSERT INTO attribute VALUES (81, 'i18n', 'save_message', 'nl', 'Bericht opslaan<br>');
INSERT INTO attribute VALUES (82, 'i18n', 'save_messagegroup', 'nl', 'Berichtengroep opslaan<br>');
INSERT INTO attribute VALUES (83, 'i18n', 'copy_messagegroup', 'nl', 'Berichtengroep kopieren');
INSERT INTO attribute VALUES (84, 'i18n', 'messagegroup_exists', 'nl', 'Deze berichtengroep bestaat reeds!<br>');
INSERT INTO attribute VALUES (85, 'i18n', 'messagegroup_not_exists', 'nl', 'Deze berichtengroep bestaat niet!<br> ');
INSERT INTO attribute VALUES (86, 'i18n', 'view_stats', 'nl', 'Statistieken bekijken<br>');
INSERT INTO attribute VALUES (87, 'i18n', 'remove_stats', 'nl', 'Statistieken verwijderen<br>');
INSERT INTO attribute VALUES (88, 'default', 'lang', 'admin', 'en');
INSERT INTO attribute VALUES (89, 'message', 'news', 'order', 'desc');
INSERT INTO attribute VALUES (90, 'mimetype', 'content', 'txt', 'text/plain');
INSERT INTO attribute VALUES (91, 'mimetype', 'content', 'shtml', 'text/html');
INSERT INTO attribute VALUES (92, 'mimetype', 'content', 'css', 'text/css');
INSERT INTO attribute VALUES (93, 'mimetype', 'content', 'svgz', 'image/svg+xml');
INSERT INTO attribute VALUES (94, 'mimetype', 'content', 'svg', 'image/svg+xml');
INSERT INTO attribute VALUES (95, 'mimetype', 'content', 'png', 'image/png');
INSERT INTO attribute VALUES (96, 'mimetype', 'content', 'gif', 'image/gif');
INSERT INTO attribute VALUES (97, 'mimetype', 'content', 'jpe', 'image/jpeg');
INSERT INTO attribute VALUES (98, 'mimetype', 'content', 'jpeg', 'image/jpeg');
INSERT INTO attribute VALUES (99, 'mimetype', 'content', 'jpg', 'image/jpeg');
INSERT INTO attribute VALUES (100, 'mimetype', 'content', 'js', 'application/x-javascript');
INSERT INTO attribute VALUES (101, 'mimetype', 'content', 'xsl', 'application/xml');
INSERT INTO attribute VALUES (102, 'mimetype', 'content', 'xml', 'application/xml');
INSERT INTO attribute VALUES (103, 'mimetype', 'content', 'xhtml', 'application/xhtml+xml');
INSERT INTO attribute VALUES (104, 'mimetype', 'content', 'xht', 'application/xhtml+xml');
INSERT INTO attribute VALUES (105, 'mimetype', 'content', 'rdf', 'application/rdf+xml');
INSERT INTO attribute VALUES (106, 'mimetype', 'content', 'rss', 'application/rss+xml');
INSERT INTO attribute VALUES (107, 'mimetype', 'content', 'xml', 'text/xml');
INSERT INTO attribute VALUES (108, 'mimetype', 'content', 'htm', 'text/html');
INSERT INTO attribute VALUES (109, 'mimetype', 'content', 'html', 'text/html');
INSERT INTO attribute VALUES (245, 'stats', 'counter', 'plain.css', '1');
INSERT INTO attribute VALUES (248, 'stats', 'counter', 'gscape.css', '1');
INSERT INTO attribute VALUES (249, 'stats', 'counter', 'index.html', '9');
INSERT INTO attribute VALUES (251, 'stats', 'counter', 'test.html', '18');
INSERT INTO attribute VALUES (238, 'stats', 'counter', 'login.html', '15');
INSERT INTO attribute VALUES (243, 'stats', 'counter', '_admin-v1.2.css', '766');
INSERT INTO attribute VALUES (246, 'stats', 'counter', 'littlehome.html', '2');
INSERT INTO attribute VALUES (240, 'stats', 'counter', 'spine.js', '880');
INSERT INTO attribute VALUES (242, 'stats', 'counter', '_admin.css', '83');
INSERT INTO attribute VALUES (194, 'i18n', 'macroset_not_exists', 'en', 'This macroset does not exist!');
INSERT INTO attribute VALUES (195, 'i18n', 'messagegroup_exists', 'en', 'This messagegroup already exists!');
INSERT INTO attribute VALUES (196, 'i18n', 'messagegroup_not_exists', 'en', 'This messagegroup does not exist!');
INSERT INTO attribute VALUES (197, 'i18n', 'mkdir_failed', 'en', 'Unable to create folder.');
INSERT INTO attribute VALUES (198, 'i18n', 'navbar_exists', 'en', 'This navigation bar already exists!');
INSERT INTO attribute VALUES (199, 'i18n', 'navbar_not_exists', 'en', 'This navigation bar does not exist!');
INSERT INTO attribute VALUES (200, 'i18n', 'new_folder', 'en', 'Create a folder');
INSERT INTO attribute VALUES (201, 'i18n', 'new_upload', 'en', 'Upload a file');
INSERT INTO attribute VALUES (202, 'i18n', 'read_folder', 'en', 'Read folder contents');
INSERT INTO attribute VALUES (203, 'i18n', 'readdir_failed', 'en', 'Unable to read folder.');
INSERT INTO attribute VALUES (204, 'i18n', 'remove_adminaccess', 'en', 'Remove admin access permissions');
INSERT INTO attribute VALUES (205, 'i18n', 'remove_content', 'en', 'Remove a content');
INSERT INTO attribute VALUES (206, 'i18n', 'remove_failed', 'en', 'Unable to remove file.');
INSERT INTO attribute VALUES (207, 'i18n', 'remove_filetype', 'en', 'Remove filetype association');
INSERT INTO attribute VALUES (208, 'i18n', 'remove_macro', 'en', 'Remove a macro');
INSERT INTO attribute VALUES (209, 'i18n', 'remove_macroset', 'en', 'Remove a macroset');
INSERT INTO attribute VALUES (210, 'i18n', 'remove_message', 'en', 'Remove a message');
INSERT INTO attribute VALUES (211, 'i18n', 'remove_messagegroup', 'en', 'Remove a messagegroup');
INSERT INTO attribute VALUES (212, 'i18n', 'remove_navbar', 'en', 'Remove a navigation bar');
INSERT INTO attribute VALUES (213, 'i18n', 'remove_stats', 'en', 'Remove statistics');
INSERT INTO attribute VALUES (214, 'i18n', 'remove_style', 'en', 'Remove style');
INSERT INTO attribute VALUES (215, 'i18n', 'remove_user', 'en', 'Remove a user');
INSERT INTO attribute VALUES (216, 'i18n', 'remove_usergroup', 'en', 'Remove a user from a usergroup');
INSERT INTO attribute VALUES (217, 'i18n', 'rename_failed', 'en', 'Unable to rename file.');
INSERT INTO attribute VALUES (218, 'i18n', 'rename_file', 'en', 'Rename a file');
INSERT INTO attribute VALUES (219, 'i18n', 'save_adminaccess', 'en', 'Save admin access permissions');
INSERT INTO attribute VALUES (220, 'i18n', 'save_content', 'en', 'Save a content');
INSERT INTO attribute VALUES (221, 'i18n', 'save_filetype', 'en', 'Save filetype association');
INSERT INTO attribute VALUES (222, 'i18n', 'save_macro', 'en', 'Save a macro');
INSERT INTO attribute VALUES (223, 'i18n', 'save_message', 'en', 'Save a message');
INSERT INTO attribute VALUES (224, 'i18n', 'save_messagegroup', 'en', 'Save a messagegroup');
INSERT INTO attribute VALUES (225, 'i18n', 'save_navbar', 'en', 'Save a navigation bar');
INSERT INTO attribute VALUES (226, 'i18n', 'save_style', 'en', 'Save style');
INSERT INTO attribute VALUES (227, 'i18n', 'save_user', 'en', 'Save a user');
INSERT INTO attribute VALUES (228, 'i18n', 'style_exists', 'en', 'This style already exists!');
INSERT INTO attribute VALUES (229, 'i18n', 'style_not_exists', 'en', 'This style does not exist!');
INSERT INTO attribute VALUES (230, 'i18n', 'upload_failed', 'en', 'File could not be uploaded. If this problem persists, submit a bug report.');
INSERT INTO attribute VALUES (231, 'i18n', 'upload_unknown', 'en', 'Error creating file:');
INSERT INTO attribute VALUES (232, 'i18n', 'user_exists', 'en', 'This user already exists!');
INSERT INTO attribute VALUES (233, 'i18n', 'user_not_exists', 'en', 'This user does not exist!');
INSERT INTO attribute VALUES (234, 'i18n', 'usergroup_exists', 'en', 'This user is already part of this usergroup!');
INSERT INTO attribute VALUES (235, 'i18n', 'valid_perms', 'en', 'You do not have valid permissions for this operation : ');
INSERT INTO attribute VALUES (236, 'i18n', 'valid_perms', 'en', 'You do not have valid permissions for this operation : ');
INSERT INTO attribute VALUES (237, 'i18n', 'view_stats', 'en', 'View statistics');
INSERT INTO attribute VALUES (247, 'stats', 'counter', 'gscape.html', '4');
INSERT INTO attribute VALUES (252, 'stats', 'counter', 'search.html', '2');
INSERT INTO attribute VALUES (241, 'stats', 'counter', 'jquery.js', '1117');
INSERT INTO attribute VALUES (244, 'stats', 'counter', 'spine-v1.2.css', '777');
INSERT INTO attribute VALUES (239, 'stats', 'counter', 'spine.css', '99');
INSERT INTO attribute VALUES (250, 'stats', 'counter', 'toc.html', '2');


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO content VALUES (87, 'test.html', '', 0, 'blank', 'main', 1, '', '2011-10-11 13:43:23', 'admin', 'users', '1111', '<p>
</p>
<div id="preview" class="preview">&nbsp;</div>
<p><strong><input class="button" onclick="$(''#preview'').load(''index.html'').slideToggle(''slow'');" type="button" value="Preview" /></strong></p>
<table style="width: 240px; height: 42px;" border="0">
<tbody>
<tr>
<td><strong>This</strong></td>
<td><strong>That</strong></td>
</tr>
<tr>
<td>happy</td>
<td>sad</td>
</tr>
</tbody>
</table>
<ul>
<li>a</li>
<li>b</li>
<li>c</li>
<li>d</li>
<li>e</li>
</ul>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (2, 'documentation/developing.html', 'Developing', 0, 'main', 'main', 1, 'developing plugin code', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Developing for SPINE</h2>

<p>There are currently two ways to interact with SPINE. Both use perl packages so we pressume you have sufficient skills.</p>

<h3>Tag Handlers</h3>
<p>While parsing the content data, certain tags will specific handlers. You can pass parameters to the packages. You will find an Env.pm file in lib/SPINE/Handler. This package is SPINE::Handler::Env (see the first line). The code in this file can be triggered by using a tag in your content.</p>

<pre>&lt;?SPINE_Env?&gt;</pre>

<p>The string after the SPINE_ is handled as a module name so this will call SPINE::Handler::Env.
SPINE will pass everything between SPINE_ and ?> as a parameter to the module so you can handle the parameters yourself.</p>
<p>The SPINE::Handler::Env file is constructed as follows.</p>
<pre>package SPINE::Handler::Env;

use strict;
use SPINE::Constant;
use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #The entire bit between SPINE_ and ?>
  my ($params) = $tag =~ m,(([^)]*)),g;
  my @params = split(/,/,$params);
  my $body = undef;
  #If there are parameters, they''re stored in @params
  for(keys(%ENV) )
  { $body .= "$_ => $ENV{$_}
&lt;br&gt;"; }
  return $body;
}

1;
__END__
</pre>
<p>Besides the package declaration and using some extra modules, the package contains one subroutine:
handler. This subroutine is called with 3 parameters. The first one is an instance of Apache::Request. 
You can use it to parse or manipulate the HTTP header. It also can be used to read form parameters with the param function.
</pre>
<pre>my $foo = $request->param("foo");</pre>
<p>The Second parameter is an instance of the DBI Database Handler. The database handler is connected to the 
database specified for this setup. You can pass direct SQL queries to it. Consult the DBI documentation on how to achieve this.
SPINE itself passes the database handler as a parameter to an abstract DBI layer that handles calls between handlers and the database with objects. The third parameter is the actual string used to call the package. In the case of </p>

<pre>&lt;?SPINE_Env?&gt;</pre>

<p>this is </p>

<pre>Env</pre>

<p>but in other cases it might contain the parameters too. For instance</p>

<pre>&lt;?SPINE_Env("foo","bar")?&gt;</pre>

<p>will still call the package SPINE::Handler::Env but the third parameter will be</p>

<pre>Env("foo","bar")</pre>
<p>You will have to extract those parameters yourself. The provided Env package has some basic code for this purpose.
SPINE will expect SPINE::Handler::Env to return a string as a result of the package call.</p>

<h3>Administration Handlers</h3>
<p>Developing Administration Handlers is a bit harder.</p>

<p>You will find an Env.pm file in lib/SPINE/Handler/Admin. This package is SPINE::Handler::Admin::Env (see the first line). The only way this module is triggered is by directly calling it (preferably through a link in the administration section).For instance, you can call the Env package by using http://www.yoursite.com/admin/env/ as an address.</p>

<p>The SPINE::Handler::Admin::Env file is constructed as follows.</p>
<pre>
package SPINE::Handler::Admin::Env;

use strict;
use SPINE::Base::Content;
use SPINE::Constant;

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $body = undef;
  for(keys(%ENV) )
  { $body .= "$_ => $ENV{$_}
&lt;br&gt;"; }
  my $c = SPINE::Base::Content->new({body=>$body,style=>''admin''});
  return $c;
}

1;
__END__
</pre>
<p>The admininstration handler does not expect a plain string but an instance of SPINE::Base::Content.
You can set several of the content attributes. Two of the most important ones are body and style. In body, you''ll need to set the actual text you wish to display. In this case, this is where the listing of environment variables comes. In style, you define which style to use.
</p>
<p>
Besides the package declaration and using some extra modules and SPINE::Base::Content, the package contains one subroutine:
handler. This subroutine is called with 2 parameters. The first one is an instance of Apache::Request. You can use it to parse or manipulate the HTTP header. It also can be used to read form parameters with the param function.</p>

<pre>my $foo = $request->param("foo");</pre>

<p>The Second parameter is an instance of the DBI Database Handler. The database handler is connected to the 
database specified for this setup. You can pass direct SQL queries to it. Consult the DBI documentation on how to achieve this.
SPINE itself passes the database handler as a parameter to an abstract DBI layer that handles calls between handlers and the database with objects.</p>

<h3>Configuration & Installation</h3>
<p>
Both these handler types can be dropped in the specific Perl directories and they will work. It is highly recommended that you restart Apache. There is no specific configuration besides the one your package requires. You can access the Apache configuration settings 
(similar to the settings needed for SPINE itself) through the Apache::Request instance.</pre>

<p>For instance</p>

<pre>$request->dir_config("webmaster")</pre>
<p>will access the setting defined in the Apache configuration file as</p>

<pre>    PerlSetVar webmaster ''John Doe''</pre>

<p>If you need certain configuration settings, it might be handy to make it accessible like this. 
This way there is no unnecessary file I/O.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (8, '.administration/access', 'Administration Access', 0, '.admin', 'main', 1, '', '2011-10-12 11:51:48', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
$error
<div class="spine-panelcel" style="width: 20%"><b>Admin Section</b></div>
<div class="spine-panelcel" style="width: 10%"><b>Usergroup</b></div>
<div class="spine-panelcel" style="width: 20%"><b>Permissions&nbsp;(rwx)</b></div>
<div class="spine-spacercel"></div></div>
$list', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (93, '.administration/navbar', 'Navigation Bar Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:09:45', 'admin', 'admin', '1111', '<form method="post" action="<?SPINE_Location?>admin/navbar/save/">
<div name="adminpanel" class="spine-fullpanel">

$error<b>Navigation Bar Edit : $filename</b><br>
<input type="submit" value="Save" class="spine-button">
<input type="button" value="Advanced" onClick="o=document.getElementById(''spine-advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="spine-button">
<br><b>Settings :</b>
</div>

<div name="adminpanel" class="spine-fullpanel" id="spine-advanced" style="height: auto; width: 100%;">
 <div class="spine-panelcel" style="width: 10%; height: auto">Owner:<br/>$owner</div>
 <div class="spine-panelcel" style="width: 18%; height: auto">Usergroup:<br/><select name="usergroup" class="spine-general">$usergroup</select></div>
 <div class="spine-panelcel" style="width: 18%; height: auto">Group Permissions:<br/>$gpermissions</div>
 <div class="spine-panelcel" style="width: 18%; height: auto">Public Permissions:<br/>$wpermissions</div>
 <div class="spine-panelcel" style="width: 18%; height: auto">Modified:<br/>$modified</div>
 <div class="spine-spacercel"></div>
</div>

<input type="hidden" name="name" value="$filename">
<input type="hidden" name="action" value="settings">
<div name="adminpanel" class="spine-fullpanel" style="border: 1px; height: auto">
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Alignment:&nbsp;&nbsp;<br><select name="alignment">$alignment</select>&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Positioning:&nbsp;&nbsp;<br><select name="positioning">$positioning</select>&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Font:&nbsp;&nbsp;<br><input type="text" size="9" name="font" class="spine-input" value="$font">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Size:&nbsp;&nbsp;<br><input type="text" size="3" name="size" class="spine-input" value="$size">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Color:&nbsp;&nbsp;<br><input type="text" size="7" name="color" class="spine-input" value="$color">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Style:&nbsp;&nbsp;<br><select name="style">$style</select>&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; padding-right: 2px; height: auto">Separator:&nbsp;&nbsp;<br><input type="text" size="7" name="separator" class="spine-input" value="$separator">&nbsp;&nbsp;</div>
 <div class="spine-spacercel"></div>
</div> 

</form>
<div name="adminpanel" class="spine-fullpanel"><hr width="95%"></div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 18%">URL:</div>
 <div class="spine-panelcel" style="width: 18%">Image:</div>
 <div class="spine-panelcel" style="width: 18%">Label:</div>
 <div class="spine-panelcel" style="width: 18%">&nbsp;</div> 
 <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel" style="height: auto">
<form method="post" action="<?SPINE_Location?>admin/navbar/addbutton/" style="padding: 0; margin: 0; display: inline;">
<input type="hidden" name="name" value="$filename">
<input type="hidden" name="id" value="$navbar">
<input type="hidden" name="position" value="$position">
 <div class="spine-panelcel" style="width: 18%"><input type="text" size="25" name="link" class="spine-input" value=""></div>
 <div class="spine-panelcel" style="width: 18%"><input type="text" size="25" name="image" class="spine-input" value=""></div>
 <div class="spine-panelcel" style="width: 18%"><input type="text" size="25" name="label" class="spine-input" value=""></div>
 <div class="spine-panelcel" style="width: 18%"><input type="image" src="<?SPINE_Images?>save.png" alt="Save" style="padding: 0px"></div> 
 <div class="spine-spacercel"></div>
</form>
</div>

<!-- Button list -->

$buttonlist

<div name="adminpanel" class="spine-fullpanel"><hr width="95%">Preview:<br /><?SPINE_Navbar("$filename")?></div>', '', '');
INSERT INTO content VALUES (6, 'documentation/features.html', 'Features', 0, 'main', 'main', 1, 'features', '2007-05-04 23:00:41', 'admin', 'admin', '0010', '<h2>Features</h2>
<dir>
<li>Easy to use Webbased administration: Administrate your site through web forms</li>
<li>Integrate components into your pages: Navigation bars, macros, message boards, page statistics, ...</li>
<li>Full template support: Easily switch between available styles or add custom styles</li>
<li>Supports Apache 1.3x and Apache 2.x (mod_perl v1 and v2) : Fast page loading and administration</li>
<li>Mix Static and Dynamic content transparently</li>
<li>Unix style access control restrictions: Permit access to pages based on usernames and usergroups.</li>
<li>Usergroup based adminstrative permissions: Restrict access to administrative panels based on usergroups.</li>
<li>Minimal requirements: Very few extra packages required.</li>
<li>File manager: Create folders and Copy, upload and rename files in a chrooted environment.</li>
<li>Extensive API: Developers can add both normal plugins and administration plugins. Integrate with Apache configuration and additional mod_perl handlers.</li>
<li>Uses database for storage: Support mysql &amp; postgresql</li>
<li>Short and search engine friendly URLs: Documents are visible are regular files</li>
<li>No data files: Load database, copy images files, copy Apache configuration and starting using. Single installation per webserver</li>
<li>Simultaneous unique setups</li>
<li>Native access logging with advanced details: browser, IP, ...</li>
<li>Manage any media type: Generate HTML, XML, CSS,..</li>
<li>Short learning process &amp; No programming required </li>
<li>Search engine plugin </li>
</dir>
', 'Features!!', '');
INSERT INTO content VALUES (7, 'documentation/faq.html', 'FAQ', 0, 'main', 'main', 1, 'faq frequently asked question answer', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Frequently Asked Questions</h2>
<p>Q: So you mean, this is free?!?</p>
<p>A: Yes, SPINE is free software. It''s released under the GPL. 
This mean that you can use and change the source code for any purpose you desire.
The only restriction is that if you distribute the software (or your modified version 
of the software), you must do so under the GPL. In a nutshell, you must make the source 
code available to whoever you distribute the software and you cannot restrict that 
person from also redistributing the results. See COPYING and COPYRIGHT for more information
on the GPL.</p>

<p>Q: Can I run multiple sites with this?</p>
<p>A: Yes, you can run several sites with this engine. You can use one database or use 
a database per site. You can define subsites, subdomains, define a default database, 
password or user. See INSTALL on how to add different sections.</p>

<p>Q: Where are all the files? Don''t I need config files and stuff?</p>
<p>A: All of the data is now stored in either the database or directly in apache''s httpd.conf.
You don''t need any external files. This has the advantage that shell call exploits are not 
possible. It''s also a lot easier to maintain several sites. The downside is that a quick hack 
by editing the files directly is no longer possible. You can however edit the entries in the 
database if you have SQL skills.</p>

<p>Q: So where do I put the other files?</p>
<p>A: You mean the .pm files? You put the both the SPINE/* and the Apache/* files in the shared perl modules directory.
You can easily install the perl modules with:</p>

<pre>  perl Makefile.PL
  make</pre>
  
<p>and as root (superuser)</p>

<pre>  make install</pre>
  
<p>This will make sure the files get copied into the right directories (plus, it generates man pages too ;) )</p>
  
<p>Q: I only see .html files on my site. Is this normal?</p>
<p>A: SPINE now works extremly transparently. You can generate any type of content without 
actually having that content. You can even make the visitor think he''s visiting an ASP, 
JSP or PHP based site.</p>

<p>Q: So there is no way of knowing if a website is using SPINE.</p>
<p>A: Well, there is a server signature in the generated error message, but that can be removed as well.</p>

<p>Q: Hey. Between releases, you changed the database table structure.</p>
<p>A: Didn''t you see this is all still under development? It''s quite stable but some features
haven''t been implemented yet so they will be fixed in next releases. Upgrading to a next 
version will probably break your current setup. </p>

<p>Q: I''d like to have one of those editor components in my administration section.</p>
<p>A: There are no plans in included that functionality in the core. There are plans of 
providing this feature as a patch. One of the reasons for this is that editor components
abuse certain browser features and are not really cross-browser compatible. You will probably
have to choose between a patch for Mozilla and one for Internet Explorer.</p>

<p>Q: I know this runs on Apache. What about IIS?</p>
<p>A: SPINE is written for mod_perl, a modular version of perl that attaches itself to the
Apache core and allows slick interaction between Apache processes and perl code. IIS currently
doesn''t support mod_perl. When it does, I might perform some tests. I realize the CGI version 
did (probably) work on a Windows platform but we just had to make certain sacrifices.</p>

<p>Q: Can I program my own components or even have extras in the administration?</p>
<p>A: SPINE has a really flexible and modular design. It''s quite easy to write your own handlers.
Check the Developers Notes for more information on both tag and administration handlers.</p>

<p>Q: Your SQL file does not work with *SOME RDBMS*. Are there any plans in supporting *THAT RDBMS*?</p>
<p>A: I''m always open for suggestions. I realize that using a different DBD will require adjusting both 
the stub data as some of the code. If you would like to share some of your knowledge on specific 
issues regarding this problem, don''t hesitate to contact me.</p>

<p>Q: You hardly have any documentation.</p>
<p>A: Yes, this is one of the vices of probably most programmers. They don''t document.
Bother me enough about it and I might just write some documentation.</p>
<p>Q: So how does it all work?</p>
<p>A: You create page (called a ''content''). You can name it just about anything. A content contains your general page contents. You select a style (similar to a page theme, layout) and you''re done.</p>

<p>Q: So what are all the tags about?</p>
<p>A: Besides the normal HTML tags, SPINE uses it''s own set of tags to indicate where to insert components. A good example is the title tag. Each content has a title attribute and you can insert that title in your content or style by adding a &lt;?SPINE_Title?&gt; tag.
Most tags are mapped to a SPINE Plugin and might require some parameters. Check the Plugin documentation to learn more about this.</p>

<p>Q: These tags look a lot like PHP tags. Are you using PHP?</p>
<p>A: The reason why the tags look like PHP tags is a legacy issue. The original SPINE concept was based on a CMS that was built in PHP in the late 1990s. To preserve compatibility, the tag formatting remained unchanged.</p>

<p>Q: So what if I already have a predesigned page. Can I create a content out of it?</p>
<p>A: You have two options. First, you can just keep the file and copy it in the defined location. SPINE can mix virtual and actual files without problems. If you wish to use some of the SPINE features (such as a page counter), you should create a content.
But you can keep the existing page layout completly. Create a new content page, copy the existing page layout HTML into the content body field and set the content style to ''blank''. The blank style is an empty style.</p>

<p>Q: I always need a style in a content?</p>
<p>A: Yes. The style body is merged with the content body to generate the actual page. There is an empty style (called ''blank'') that can be used if you want to store your entire page layout in the content.</p>

<p>Q: If I can keep my entire layout in the content, why would I use styles?</p>
<p>A: Styles allow you to define a page layout once and apply it to multiple contents. You can easily update your page style without having to change all the contents that are applied to it.</p>

<p>Q: So what should I store in the style and what should I store in the content?</p>
<p>A: The style typically contains your page layout. It''s the part of your page that is the same for every content. For simple sites, you use a single style and map it to all your contents. Nothing stops you from using a different style for each content.</p>

<p>Q: Where exactly is the content inserted in the style?</p>
<p>A: SPINE looks for a specific tag in the style that indicates where to insert the content. Each content that has this style defined, will be inserted into the style on the place of the marker.</p>

<p>Q: I see that the content and the style have several extra fields in the administration. What are they all about?</p>
<p>A: Each of those fields is either used for page generation or can be used as a tag. For instance, the permissions are used for access control. The Title attribute is mapped to the &lt;?SPINE_Title?&gt; tag.</p>

<p>Q: What if I don''t want to create a HTML file but a CSS file. Can I store it in SPINE too?</p>
<p>A: Yes. Create a content with the CSS extension (e.g style.css) and copy your CSS data into the content body. Set the style to ''blank'' (unless you have a style somewhere that has some predefined CSS that you want merged with the content).
Also set the correct content type. By default contents are set to content type ''text/html''. For CSS files, you need ''text/css''.</p>

<p>Q: What are these content types?</p>
<p>A: When a webserver serves data to a browser (e.g Internet Explorer), the browser needs to know how to handle the data. This is usually done by specifying what kind of data is sent.
Normally, the webserver sends a header along with the data. The header defines the data type (e.g text/html for HTML files, text/plain for text files, etc). Normally this happens transparently.
Your webserver usually guesses what data is sent. SPINE does not guess. You have to specify what data type you''re sending. If you leave the content type field empty, SPINE assumes you''re sending ''text/html'' (aka HTML) data.</p>

<p>Q: So what else can SPINE display?</p>
<p>A: Normally you can display any type of text data (XML, CSS, Javascript, HTML, etc). SPINE supports plugins and they can generate just about any data type you want. The PieStats plugin that is supplied with the SPINE package generates PNG images. See the PieStats documentation for more information.</p>

<p>Q: How come I can''t access certain pages but when I log in into the administration section, they are clearly there and I can edit them?</p>
<p>A: There are a number of possibilities but the most common reason why this happens is that you are not logged in when you try to load the pages. Try logging in (without going to the administration section) and then loading the pages.</p>

<p>Q: How come certain pages don''t show up in the search results but when I log in into the administration section, they are clearly there and I can edit them?</p>
<p>A: See the previous question. The search engine will only return pages to which you have access.</p>

<p>Q: When I search for a specific page with the search engine, the page is not in the results, although I have access to it.</p>
<p>A: The search engine uses search keywords and does not search on body contents. Define the keywords in the content administration.</p>

<p>Q: The search engine is very limited. How come this does not support the features you normally would expect from a search engine.</p>
<p>A: Because that''s normally part of the normal functionality of a content management system. The search engine is provided as a very basic tool. Extra plugins might offer the functionality you require.</p>

<p>Q: I want to keep notes on the content. Can I do this?</p>
<p>A: The content and style administration have comment fields. This information is purely for administrative purposes. You can use it to add notes on a current pages, keep a changes log or add copyright information.</p>

<p>Q: I have a number of CGI scripts I want to use on my page. I wish to include the required forms in a content. Can I do this?</p>
<p>A: Ofcourse. For a CGI script, a content is just like a normal HTML file. You can do whatever you want in it.</p>

<p>Q: Does SPINE support *FEATURE*?</p>
<p>A: SPINE currently focusses on what Content Management Systems are all about. There are plugins included that provide some of the basic requirements of website creating. External plugins might support the features you need.</p>

<p>Q: What are navigation bars all about?</p>
<p>A: Navigation bars are groups of links (sometimes buttons). The Administration backend has a navigation bar section where you can manage navigation bars.</p>

<p>Q: So can I mix images with plain links in a navigation bar?</p>
<p>A: Yes. If you don''t define an image link, the label is used as a link.</p>

<p>Q: So what about adding plain text in a navigation bar?</p>
<p>A: If you don''t specify a link, the label appears as plain text.</p>

<p>Q; What if I want to open the link in a different window or frame?</p>
<p>A: Each button on the navigation bar has extra preferences. Click on the Preferences icon on the right side, next to the delete button. The Preferences pane has a field to define the target frame or window.</p>

<p>Q: What if I want to define a specific CSS class to the button?</p>
<p>A: See above. The Preferences pane has a field to define a CSS class for the button.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (13, 'documentation/tags.html', 'Tags', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Using Tags in your content</h2>
<h3>&lt;?SPINE_Content?&gt;</h3>
Use this tag in the Style to indicate where the content is inserted.
<h3>&lt;?SPINE_Env?&gt;</h3>
This tag is mapped to the Environment plugin (SPINE::Handler::Env). It dumps all the environment variables.
<h3>&lt;?SPINE_Location?&gt;</h3>
This tag is mapped to the <i>Location</i> configuration in your Apache setup. For example, the location setup for the current host is : <pre><?SPINE_Location?></pre>
<h3>&lt;?SPINE_Login?&gt;</h3>
This tag generates the login form as used in <a href="login.html">the login page</a>.
<h3>&lt;?SPINE_Macro?&gt;</h3>
This tag is mapped to the Macro handler. Define which macro is loaded by setting the <i>Macros</i> list in the <i>Administration</i> section. Pass the keyword as a parameter. For example:
<pre>This is SPINE version &lt;?SPINE_Macro("SPINE_Version")?&gt;!</pre>
This is SPINE version <?SPINE_Macro("SPINE_Version")?>!</pre>
<h3>&lt;?SPINE_Message?&gt;</h3>
This tag is mapped to the Message handler. Pass the message group as parameter. For example:
<pre>&lt;?SPINE_Message("test")?&gt;</pre>
Pass the message ID as second parameter to display one message at a time.
<h3>&lt;?SPINE_Message_Body?&gt;</h3>
This tag is mapped to the Message handler. It can be used in the message content to change the position of the actual message.
<h3>&lt;?SPINE_Message_Comments?&gt;</h3>
This tag is mapped to the Message handler. This is the number of replies on this message.
<h3>&lt;?SPINE_Message_Date?&gt;</h3>
This tag is mapped to the Message handler. This is the date on which the message was posted.
<h3>&lt;?SPINE_Message_DateTime?&gt;</h3>
This tag is mapped to the Message handler. This is the date and time on which the message was posted.
<h3>&lt;?SPINE_Message_Group?&gt;</h3>
This tag is mapped to the Message handler. This is the message group.
<h3>&lt;?SPINE_Message_Id?&gt;</h3>
This tag is mapped to the Message handler. This is the message ID.
<h3>&lt;?SPINE_Message_Owner?&gt;</h3>
This tag is mapped to the Message handler. This is the message owner (usually the person posting the message).
<h3>&lt;?SPINE_Message_Parent_Id?&gt;</h3>
This tag is mapped to the Message handler. This is the parent message ID.
<h3>&lt;?SPINE_Message_Parent_Subject?&gt;</h3>
This tag is mapped to the Message handler. This is the parent message subject.
<h3>&lt;?SPINE_Message_Subject?&gt;</h3>
This tag is mapped to the Message handler. This is the message subject.
<h3>&lt;?SPINE_Message_Time?&gt;</h3>
This tag is mapped to the Message handler. This is the time on which the message was posted.
<h3>&lt;?SPINE_Navbar?&gt;</h3>
This tag is mapped to the Navigation Bar handler. Pass the message group as parameter. For example:
<pre>&lt;?SPINE_Navbar("main")?&gt;</pre>
<h3>&lt;?SPINE_Page?&gt;</h3>
This tag contains the current filename. For example:
<pre><?SPINE_Page?></pre>
<h3>&lt;?SPINE_PieStats?&gt;</h3>
This tag is mapped to the Pie Chart statistics plugin. This plugin generates PNG data. Make sure to set your <i>style</i> to <i>blank</i> and the <i>Content-Type</i> to <i>image/png</i>. This plugin requires additional modules and is not part of a default installation.
<h3>&lt;?SPINE_Referer?&gt;</h3>
This tag contains refering page. For example:
<pre><?SPINE_Referer?></pre>
<h3>&lt;?SPINE_Search?&gt;</h3>
This tag is mapped to the search engine plugin. This plugin will search through the content keywords and list the content names that match the query.
<h3>&lt;?SPINE_Servername?&gt;</h3>
This tag contains the servername. For example:
<pre><?SPINE_Servername?></pre>
<h3>&lt;?SPINE_Stats?&gt;</h3>
This tag is mapped to the statistics handler. Required plugin is either <i>hits</i> or <i>modified</i>. Hits can be used for a page visitor counter. <pre><?SPINE_Stats("hits")?> visits.</pre>Modified will display the modification date of the page.
<pre><?SPINE_Stats("modified")?> visits.</pre>
<h3>&lt;?SPINE_Title?&gt;</h3>
This tag contains the page title. It is constructed of the <i>content</i> and the <i>style</i> title value. For example:
<pre><?SPINE_Title?></pre>
<h3>&lt;?SPINE_User?&gt;</h3>
This tag contains the logged in user. For example:
<pre><?SPINE_User?></pre>
<h3>&lt;?SPINE_Webmaster?&gt;</h3>
This tag contains the site webmaster. This value is defined in the Apache configuration for the location. For example:
<pre><?SPINE_Webmaster?></pre>
<h3>&lt;?SPINE_Wiki?&gt;</h3>
This tag is mapped to the Wiki plugin. 
<h3>&lt;?SPINE_XMLChanges?&gt;</h3>
This tag is mapped to the XML Changes plugin. It will generate XML output of the most recent changes. Make sure to set your <i>style</i> to <i>xml</i> and the <i>Content-Type</i> to <i>text/xml</i>.
', 'This page lists the tags that can be used in the pages.', '');
INSERT INTO content VALUES (19, 'documentation/toc.html', 'Table of Contents', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<pre>
Installation

cfr Install.html

Configuration

cfr Install.html

Site Administration
 Getting Started
 - The first step in building your Spine site is selecting the style. 
   The style is usually defined once and contains the static section of each page.
   This is where you define what your page looks like: what colors to use, where to put a menu bar, define CSS style sheets, etc.
   Spine elements that are generally placed in the Style include Navbars, Macros and Page visit statistics.
 - Once you defined your own page style, start by creating content. The name of the content file is the filename you use in your URL.
   e.g. There is a content called ''index.html''. 
   Your complete page output is a merge of the style and the content (together with all the smaller elements you have defined in either).
 General
 Content
   Creating New Content
   - ...
   - If you create a content that already exists, the existing content is not overwritten but loaded in the Edit pane.
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.
   Editing Existing Content
   - ...
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.

   - Click on the "Advanced" button to show the advanced content properties.
     -> ...
   Copying Content
   - To copy a content from your setup, select the name from the dropdown box, provide the Content target name and press the Copy button.
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.
   Deleting Content
   - To delete a content from your setup, select the name from the dropdown box and press the Delete button. Confirm your action by pressing "OK" in the Java popup.
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.
 Style
   Creating New Styles
   Editing Existing Styles
   Copying Styles
   Deleting Styles
 Navbar
   Creating New Navbars
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Messages
   Creating New Messages
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Macros
   Creating New Navbars
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Users
   Creating New Navbars
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Filemanager
   Uploading Files
   Creating Folders

Advanced
 Database
 Development
   Content Handlers
   Admin Handlers

Reference
  Tag Reference
Index


Including CSS files in Spine
-
You can include any type of data in your content. Make sure you define the correct content-type. Define any static sections of your content in the style or use an empty stylesheet.

Hidden Files
...







Test Plan
---------

- Create Content that already exists
- Create Content that already exists but is not writeable
- Edit a Content that doesn''t exist
- Copy a Content that doesn''t exist
- Copy a Content that does exist to a Content that does exist
- Copy a Content that does exist but is not readable
- Copy a Content that does exist to a Content that does exist but is not readable
- Remove a Content that doesn''t exist
- Remove a Content that does exist but is not writeable
- Save a Content that doesn''t exist
- Save a Content that does exist but is not writeable
- Set Content to restricted and try to access it as a different user.

</pre>', 'This is a stub Table of Contents that I''m using to write documentation for.', '');
INSERT INTO content VALUES (20, 'documentation/index.html', 'Documentation', 0, 'main', 'main', 1, 'documentation faq howto tips development', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Documentation</h2>
<?SPINE_Navbar("docs")?>', 'Listing available documentation', '');
INSERT INTO content VALUES (21, 'documentation/screenshots.html', 'Screenshots', 0, 'main', 'main', 1, '', '2007-02-22 23:11:32', 'admin', 'users', '1010', '<h2>Screenshots</h2>
<center>
<a href="<?SPINE_Images?>screenshot/content.png"><img src="<?SPINE_Images?>screenshot/content.png" border="0" width="431" height="458"></a><br>Content Administration</a>
<br><br>

<a href="<?SPINE_Images?>screenshot/fileman.png"><img src="<?SPINE_Images?>screenshot/fileman.png" border="0" width="432" height="168"></a><br>File Manager</a>
<br><br>

<a href="<?SPINE_Images?>screenshot/navbar.png"><img src="<?SPINE_Images?>screenshot/navbar.png" border="0" width="432" height="308"></a><br>Navigation Bar Administration</a>
<br><br>

<a href="<?SPINE_Images?>screenshot/stats.png"><img src="<?SPINE_Images?>screenshot/stats.png" border="0" width="432" height="306"></a><br>Visitor Statistics</a>
<br><br>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (22, 'documentation/alternate.html', 'Alternative Datatypes', 0, 'main', 'main', 1, 'data datatype development', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Alternative Datatypes</h2>
Besides HTML, you can also generate any type of data you wish. You can define a content type to each content.
SPINE contains examples of both plain text content and binary content.<br><br>

<u>changes.xml - plain text content</u><br>
changes.xml generates an XML feed of changes since a certain date. The content type for this content is set to text/xml.
changes.xml uses a style, called xml. The content itself has some extra XML tags and a SPINE tag plugin. The XMLChanges plugin will generate XML data and will insert it into the style.
<br><br>
For instance :
<pre>
&lt;?xml version="1.0"?&gt;
&lt;changes&gt;
&lt;content name="admin-content" modified="2003-12-22 00:00:59"/&gt;
&lt;content name="admin-message" modified="2003-12-21 02:06:10"/&gt;
&lt;content name="changes.xml" modified="2003-12-22 00:11:30"/&gt;
&lt;content name="graph_stat.png" modified="2003-12-21 13:24:54"/&gt;
&lt;content name="messagetest.html" modified="2003-12-21 01:03:41"/&gt;
&lt;content name="_admin-content-adv" modified="2003-12-22 00:03:11"/&gt;
&lt;/changes&gt;
</pre>
Only the first line is part of the style. The second and last line are hardcoded in the content. The remaining lines are generated by the plugin.<br><br>

<u>graph_stat.png - binary content</u><br>
graph_stat.png generates PNG data of the requests statistics from the log handler. The content type for this content is set to image/png.
graph_stat.png uses an empty style. The content itself (and therefor the entire data part) only contains PieStats plugin. The results of this plugin is PNG data. The plugin itself still allows passing parameters.
<br><br>
for instance : 
<pre>graph_stat.png?page=index&category=useragent</pre>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (17, 'documentation/install.html', 'Installation Notes', 0, 'main', 'main', 1, '', '2011-09-18 22:09:12', 'admin', 'users', '1111', '<h2>Installation Notes for Spine v<?SPINE_Macro("SPINE_Version")?></h2>
<u>Where to get SPINE</u><br><br>
You can find links to download the latest version of the source, packages, and
utilities at http://www.spinecms.org, the SPINE community website.
<br><br>
<u>Requirements</u><br><br>
Spine has very few dependencies.
<ul>
<li>Apache 1.X (development is based on version 1.3.28 and tested on 1.3.33)<br>or<br>
Apache 2.X (development is based on version 2.054)
</li>
<li>mod_perl 1.X (development is based on version 1.27 and tested on 1.29)<br>or<br>
mod_perl 2.X (development is based on version 2.01)</li>
<li>Apache::Request [libapreq] (development is based on version 1.2 and tested on 1.33)<br>or<br>
apreq2 (development is based on version 2.5.7)
</li>
<li>Digest::MD5 (development on version 2.20 and tested on 2.33)</li>
<li>DBI (development on version 1.32 and tested on 1.40)</li>
<li>DBD::Mysql (development on version 2.1021 and tested on 2.9004)<br>or<br>
DBD::Pg (development on version 1.4.2)</li>
<li>Apache::DBI (development on version 0.91 and tested on 0.94)</l>
<li>Mysql 3.X<br>or<br>
Postgresql (development is based on version 7.4)</li>
</ul>
<u>Generating SQL statements for users</u><br><br>
Use the on-line tool to generate the correct SQL statements for the admin user. By default, version 1.3 beta does not include a default password.
Visit <a href="http://spine.sourceforge.net/createuser.html">http://spine.sourceforge.net/createuser.html</a> to generate a custom SQL statement to create the admin account.
<br><br>


<u>Installation on Debian</u><br><br>
On Debian, install the following packages :
<ul>
<li>apache-perl</li>
<li>libapache-dbi-perl</li>
<li>libdbd-mysql-perl</li>
<li>mysql-client</li>
<li>mysql-server</li>
<li>libapache-request-perl</li>
</ul>

<u>Mysql Configuration</u><br><br>
Development is based on mysql and postgresql.<br><br>
See <a href="mysqldb.html">Using Mysql with Spine</a> or <a href="postgresqldb.html">Using Postgresql with Spine</a>
<br><br>
<u>Perl Modules Installation</u><br><br>

There is a perl makefile included. Install the modules in the default perl location with:
<pre>
  bash# perl Makefile.PL
  bash# make</pre>
  
and as root (superuser)
<pre>
  bash# make install</pre>

Make sure you have Apache::Request installed. If you have questions about installing this, consult the administrator.<br><br>

<u>Apache Configuration</u><br><br>

Sample configuration files for both Apache (<a href="apache-conf.incl">apache-conf.incl</a>) and Apache2 (<a href="apache2-conf.incl">apache2-conf.incl</a>) are included.
Edit your apache config file (by default httpd.conf) as follows :
<pre>
&lt;IfModule mod_perl.c&gt;
 # PerlModule Apache::DBI
 # Remove the # above if you have Apache::DBI installed and you wish to use it

  &lt;Location /spine&gt;
           SetHandler perl-script
           PerlHandler Apache::SPINE::Index
           PerlSetVar dbd mysql
           PerlSetVar dbname spine
           PerlSetVar dbuser user
           PerlSetVar dbpwd password
           PerlSetVar main index.html
           PerlSetVar webmaster ''John Doe''
           PerlSetVar sitename ''SPINE Example site'' 
           PerlSetVar chroot /home/www/html
           PerlLogHandler Apache::SPINE::Log
  &lt;/Location&gt;

&lt;/IfModule&gt;</pre>

If your Apache configuration is set up to allow drop in configuration files, use <pre>apache-conf.incl</pre> as a template. On Debian installations, copy the configuration files in

<pre>
/etc/apache-perl/conf.d</pre>

<ul>
<li>The dbname is the database name (you defined earlier).</li>
<li>The dbuser is the user as which you connect to mysql (consult your mysql documentation for this setting)</li>
<li>The dbpwd is the user password you use to connect to mysql (consult your mysql documentation for this setting)</li>
<li>The main variable is ''content'' name that is loaded by default (like a index.html).</li>
</ul>

If your Apache configuration is set up to allow drop in configuration files, use <i>apache-conf.incl</i> as a template. On Debian installations, copy the configuration files in

<pre>
/etc/apache-perl/conf.d</pre>
<br>
Restart the webserver, by default by running
<pre>
apachectl restart</pre>
On Debian installations, restart Apache with
<pre>
./etc/init.d/apache-perl restart</pre>
Loading Apache::DBI will improve the access speed to the database by pooling connections. Apache::DBI is not required but recommended. Set the virtual directory you want to use in the location tag.
<pre>
&lt;Location /directory&gt;</pre>

Existing directories and files will still work properly.
By default, SPINE will use the mysql DBD driver (You still need this installed on your system - see Requirements list). If you wish to use a different DBD, fill in the appropriate value.
<pre>
PerlSetVar dbd Pg</pre>

If you doubt, ask your system administrator.
You can define which database to use for the current virtual directory.
<pre>
PerlSetVar dbname spine</pre>

If you have multiple virtual directories, this setting can prevent record overlapping.
<pre>
  &lt;Location /bob&gt;
           ...
           PerlSetVar dbname bobdb
           PerlSetVar dbuser bob
            ...
  &lt;/Location&gt;

  &lt;Location /john&gt;
           ...
           PerlSetVar dbname johndb
           PerlSetVar dbuser john
            ...
  &lt;/Location&gt;</pre>
Just make sure you install the default database data first in both databases.
Using the main variable, you can define which content will be used by default.
<pre>
PerlSetVar main index.html</pre>

SPINE defined some hardcoded macros. One of those tags is

<pre>
&lt;?SPINE_Webmaster?&gt;</pre>

This tag will be swapped with the value defined in the webmaster variable.
<pre>
PerlSetVar webmaster ''John Doe''</pre>

Another hardcoded macro is the sitename. The macro defined for this value is

<pre>
&lt?SPINE_Sitename?&gt;</pre>

This tag will be swapped with the value defined in the sitename variable.

<pre>
PerlSetVar sitename ''SPINE Example site'' </pre>
<u>Copy Images</u><br>
Copy the images from the images subdir to your main images directory (eg. /var/www/images)
<br><br>

<u>Starting using Spine</u>
<br><br>
Go to <pre>http://SERVERNAME/LOCATION/login.html</pre> and use the credentials below:
Default login info:   <ol>
<li>User:admin</li>
<li>Password:  foo</li>
</ol>', 'Installation instruction', 'text/html');
INSERT INTO content VALUES (92, '.administration/content', 'Content Administration', 0, '.admin', 'main', 1, '', '2011-10-12 11:53:49', 'admin', 'admin', '1111', '<script language="javascript" src="jquery.js"></script>
<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tinymce_init.js"></script>

<script type="text/javascript">
var tinyMCEmode = false;
var changed = false;
var randomstring = "";
$(document).ready(function(){
  $(''#help'').hide();
  $(''#preview'').hide();
 });

function randomString() 
{var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
  var string_length = 8;
  randomstring = '''';
  for (var i=0; i<string_length; i++) 
  { var rnum = Math.floor(Math.random() * chars.length);
     randomstring += chars.substring(rnum,rnum+1);
   }
}

function toogleEditorMode(sEditorID) {
    try {
        if(tinyMCEmode) {
            tinyMCEmode = false;
            tinyMCE.execCommand("mceRemoveControl",tinyMCEmode,"body");
            $(''#switch'').text(''Text'');
        } else {
           tinyMCEmode = true; 
           tinyMCE.execCommand("mceAddControl", tinyMCEmode, "body");
            $(''#switch'').text(''Visual'');
        }
    } catch(e) {
        //error handling
    }
}
</script>

<div id="spine-attributes" class="spine-dialog" style="border: 1px solid; overflow: auto; height: 200px">
<img border="0" align="right" valign="top" src="/images/delete.png" onclick="$(''#spine-attributes'').hide();"><b>&nbsp;Custom Attributes</b><br>
<div style="width: 590px; height: 1.75em" id="attrlist">&nbsp;</div>
</div>

<div id="spine-realtags" class="spine-dialog" style="border: 1px solid: overflow:auto;height: 350px;">
<img border="0" align="right" valign="top" src="/images/delete.png" onClick="document.getElementById(''spine-realtags'').style.display=''none''; return false;">
<script type="text/javascript">
$(document).ready(function(){
  $(''#help'').hide();
 });
</script>
<u>Usable tags:</u><br>
&lt;?SPINE_Content?&gt;, 
&lt;?SPINE_Env?&gt;, 
&lt;?SPINE_Images?&gt;, 
&lt;?SPINE_Location?&gt;, 
&lt;?SPINE_Login?&gt;, 
&lt;?SPINE_Macro("<i>key</i>")?&gt;, 
&lt;?SPINE_Message("<i>messagegroup</i>"[,"<i>id</i>"])?&gt;, 
&lt;?SPINE_Message_Body?&gt;, 
&lt;?SPINE_Message_Comments?&gt;, 
&lt;?SPINE_Message_Date?&gt;, 
&lt;?SPINE_Message_DateTime?&gt;, 
&lt;?SPINE_Message_Group?&gt;, 
&lt;?SPINE_Message_Id?&gt;, 
&lt;?SPINE_Message_Owner?&gt;, 
&lt;?SPINE_Message_Parent_Id?&gt;
<br />
<u>Usable tags:</u>
<br>
&lt;?SPINE_Env?&gt;, 
&lt;?SPINE_Message_Parent_Subject?&gt;, 
&lt;?SPINE_Message_Subject?&gt;, 
&lt;?SPINE_Message_Time?&gt;, 
&lt;?SPINE_Navbar("<i>navbarname</i>")?&gt;,
&lt;?SPINE_Page?&gt; 
&lt;?SPINE_Referer?&gt;, 
&lt;?SPINE_Search?&gt;, 
&lt;?SPINE_Servername?&gt;, 
&lt;?SPINE_Stats("hits")?&gt;, 
&lt;?SPINE_Stats("modified")?&gt;,
&lt;?SPINE_Title?&gt;, 
&lt;?SPINE_User?&gt;, 
&lt;?SPINE_Webmaster?&gt;, 
&lt;?SPINE_XMLChanges?&gt;
</div><!-- spine_realtags -->

<div class="spine-dialog" id="tags" style="width:900px; height:140px">
<img border="0" align="right" valign="top" src="/images/delete.png" onclick="$(''#tags'').hide(); return false;">


<div class="spine-dialog" id="spine-tags" style="width:900px; height:140px">
</div>
<form method="post" action="<?SPINE_Location?>admin/style/save/">

<div name="adminpanel" class="spine-fullpanel" style="position: relative">
<div class="spine-help" id="spine-help">
</div>
$error<b>Style Edit : $filename $lock</b><br>
<input type="submit" value="Save" class="spine-button">
<input type="button" value="Advanced" onClick="o=document.getElementById(''spine-advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="spine-button">
<input type="hidden" name="name" value="$filename">
<a href="#" style="position:absolute; top:5px; right:5px;" onClick="$(''#help'').load(''.help-style'').slideToggle(''slow''); return false;">Help</a>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Size :</div>
 <div class="spine-panelcel" style="width: 25%">$size bytes</div>
 <div class="spine-panelcel" style="width: 15%">Last Modified : </div>
 <div class="spine-panelcel" style="width: 25%">$lastmod</div>
 <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Title :</div>
 <div class="spine-panelcel" style="width: 25%"><input class="spine-input" name="title" value="$title" size="25" type="text"></div>
 <div class="spine-panelcel" style="width: 15%">Macros : </div>
 <div class="spine-panelcel" style="width: 25%"><select name="macros" class="spine-general">
<option value="">none
$macros
</select></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel" id="spine-advanced2" style="height: auto ; width: 100%;">
<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Owner :</div>
 <div class="spine-panelcel" style="width: 25%">$owner</div>
 <div class="spine-panelcel" style="width: 15%">Group : </div>
 <div class="spine-panelcel" style="width: 25%"><select name="usergroup" class="spine-general">$group</select>
 </div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Permissions :</div>
 <div class="spine-panelcel" style="width: 55%">Group : $gpermissions &nbsp;&nbsp;&nbsp;&nbsp; Public : $wpermissions</div>
 <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
Comment :<br>
<textarea cols="150" rows="8" name="icomment" class="spine-input">$icomment</textarea>
</div>

</div>

<div name="adminpanel" class="spine-fullpanel">
Contents :<br>
<textarea cols="150" rows="25" name="body" class="spine-input">$body</textarea>
</div>
</form>

&lt;?SPINE_Message_Parent_Subject?&gt;, &lt;?SPINE_Message_Subject?&gt;, &lt;?SPINE_Message_Time?&gt;, &lt;?SPINE_Navbar("<i>navbarname</i>")?&gt;,
&lt;?SPINE_Page?&gt; &lt;?SPINE_Referer?&gt;, &lt;?SPINE_Search?&gt;, &lt;?SPINE_Servername?&gt;, &lt;?SPINE_Stats("hits")?&gt;, &lt;?SPINE_Stats("modified")?&gt;,
&lt;?SPINE_Title?&gt;, &lt;?SPINE_User?&gt;, &lt;?SPINE_Webmaster?&gt;, &lt;?SPINE_XMLChanges?&gt;</div>

<form method="post" action="<?SPINE_Location?>admin/content/save/" name="editcontent">
$error
<div name="adminpanel" class="spine-fullpanel" style="position: relative">
<div class="spine-preview" id="preview">
</div>
<div class="spine-help" id="help">
</div>
<b>Content Edit: $filename $lock </b><br>
<input value="Save" class="spine-button" type="submit">
<input type="button" value="Preview" onClick="$(''#preview'').load(''<?SPINE_Location?>$filename'').slideToggle(''slow''); return false;" class="spine-button">
<input value="Advanced" onclick="$(''#spine-advanced'').toggle(); return false;" class="spine-button" type="button">
<input name="name" value="$filename" type="hidden">
<a href="#" style="position:absolute; top:5px; right:5px;" onClick="$(''#help'').load(''.help-content'').slideToggle(''slow''); return false;">Help</a>
</div>
<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Size:</div>
 <div class="spine-panelcel" style="width: 25%">$size bytes</div>
 <div class="spine-panelcel" style="width: 15%">Last Modified: </div>
 <div class="spine-panelcel" style="width: 25%">$lastmod</div>
 <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Title:</div>
 <div class="spine-panelcel" style="width: 25%"><input class="spine-input" name="title" value="$title" size="25" type="text"></div>
 <div class="spine-panelcel" style="width: 15%">Style: </div>
 <div class="spine-panelcel" style="width: 25%"><select name="style" class="spine-general">
<option>Select Style $stylelist</select></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel" id="spine-advanced" style="height: auto ; width: 100%;">
<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Enter to &lt;br&gt;:</div>
 <div class="spine-panelcel" style="width: 25%">$breaks</div>
 <div class="spine-panelcel" style="width: 15%">Log Acces: </div>
 <div class="spine-panelcel" style="width: 25%">$logging</div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Macros:</div>
 <div class="spine-panelcel" style="width: 25%"><select name="macros" class="spine-general">
<option value="">none
$macrolist
</select></div>
 <div class="spine-panelcel" style="width: 15%">Keywords:</div>
 <div class="spine-panelcel" style="width: 25%"><input name="keywords" value="$keywords" size="30" class="spine-input" type="text"></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Owner:</div>
 <div class="spine-panelcel" style="width: 25%">$owner</div>
 <div class="spine-panelcel" style="width: 15%">Group:</div>
 <div class="spine-panelcel" style="width: 25%"><select name="usergroup" class="spine-general">$group</select>
 </div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Permissions:</div>
 <div class="spine-panelcel" style="width: 25%; height: auto">Group: $gpermissions<br>Public&nbsp;: $wpermissions</div>
 <div class="spine-panelcel" style="width: 15%">Content-type:</div>
 <div class="spine-panelcel" style="width: 25%"><input class="spine-input" name="type" value="$type" size="25" type="text">&nbsp;<a href="#" onClick="document.editcontent.type.value=''$mimetype''; return false;">Find</a></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
Comment:<br>
<textarea cols="150" rows="6" name="icomment" class="spine-input">$icomment</textarea>
</div>
</div>
<div name="adminpanel" class="spine-fullpanel">
Contents:&nbsp;&nbsp;&nbsp;<a href="#" onClick="$.post(''/spine/admin/attr/'', { name: encodeURI(''$filename'') },  function(data) { $(''#attrlist'').html(data); } ); $(''#spine-attributes'').show(); return false;">Attributes</a>&nbsp;&nbsp;<a href="#" onClick="$(''#spine-realtags'').show(); return false;">Tags</a>&nbsp;&nbsp;Switch editor mode: <a href="#" id="switch" title="hide TinyMCE" onclick="toogleEditorMode(''body''); return false;">Visual</a><br>
<textarea cols="150" id="body" rows="30" name="body" class="spine-input"$disabled>$body</textarea><br>
</div>
</form>', 'I''m not sure what this is...', '');
INSERT INTO content VALUES (24, 'documentation/quickstart.html', 'Getting Started', 0, 'main', 'main', 1, 'quick start tutorial documentation', '2007-02-22 23:14:51', 'admin', 'users', '1010', '<h2>Getting Started with Spine</h2>
<u>Step 1: Login</u><br>
Select the Login link.<br>
<dir><img src="<?SPINE_Images?>step1a.png" border="1"></dir>
Use <i>admin</i> as username and <i>foo</i> as password and click on the <i>login</i> button.<br>
<dir><img src="<?SPINE_Images?>step1b.png" border="1"></dir>
The login page now indicates if the login was successful.<br>
<dir><img src="<?SPINE_Images?>step1c.png" border="1"></dir>
<u>Step 2: Administration</u><br>
You are now in the <i>Administration</i> section of the site. Enter <i>welcome.html</i> in the <i>New content</i> input field and click on the <i>Create</i> button.<br>
<dir><img src="<?SPINE_Images?>step2.png" border="1"></dir>
<u>Step 3: Creating your first page.</u><br>
This is the <i>Content Administration</i> for <i>welcome.html</i>. Some stub values are already in place.<br>
<dir><img src="<?SPINE_Images?>step3a.png" border="1"></dir>
Fill in your page body in the main text area. Leave the <i>Style</i> selection unchanged for now. Click on the <i>Save</i> button when you''re done.<br>
<dir><img src="<?SPINE_Images?>step3b.png" border="1"></dir>

<u>Step 4: View the result</u><br>
Click on the <i>Logout</i> link and load <i>welcome.html</i>.<br>
<dir><img src="<?SPINE_Images?>step4.png" border="1"></dir><b>You''re done!</b>

', 'This is a very quick way to start editing pages in SPINE.', '');
INSERT INTO content VALUES (25, 'documentation/license.html', '', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<pre>
The General Public License (GPL)
Version 2, June 1991

Copyright (C) 1989, 1991 Free Software Foundation, Inc. 675 Mass Ave,
Cambridge, MA 02139, USA. Everyone is permitted to copy and distribute
verbatim copies of this license document, but changing it is not allowed.

Preamble

The licenses for most software are designed to take away your freedom to share
and change it. By contrast, the GNU General Public License is intended to
guarantee your freedom to share and change free software--to make sure the
software is free for all its users. This General Public License applies to most of
the Free Software Foundation''s software and to any other program whose
authors commit to using it. (Some other Free Software Foundation software is
covered by the GNU Library General Public License instead.) You can apply it to
your programs, too.

When we speak of free software, we are referring to freedom, not price. Our
General Public Licenses are designed to make sure that you have the freedom
to distribute copies of free software (and charge for this service if you wish), that
you receive source code or can get it if you want it, that you can change the
software or use pieces of it in new free programs; and that you know you can do
these things.

To protect your rights, we need to make restrictions that forbid anyone to deny
you these rights or to ask you to surrender the rights. These restrictions
translate to certain responsibilities for you if you distribute copies of the
software, or if you modify it.

For example, if you distribute copies of such a program, whether gratis or for a
fee, you must give the recipients all the rights that you have. You must make
sure that they, too, receive or can get the source code. And you must show
them these terms so they know their rights.

We protect your rights with two steps: (1) copyright the software, and (2) offer
you this license which gives you legal permission to copy, distribute and/or
modify the software.

Also, for each author''s protection and ours, we want to make certain that
everyone understands that there is no warranty for this free software. If the
software is modified by someone else and passed on, we want its recipients to
know that what they have is not the original, so that any problems introduced by
others will not reflect on the original authors'' reputations.

Finally, any free program is threatened constantly by software patents. We wish
to avoid the danger that redistributors of a free program will individually obtain
patent licenses, in effect making the program proprietary. To prevent this, we
have made it clear that any patent must be licensed for everyone''s free use or
not licensed at all.

The precise terms and conditions for copying, distribution and modification
follow.

GNU GENERAL PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND
MODIFICATION

0. This License applies to any program or other work which contains a notice
placed by the copyright holder saying it may be distributed under the terms of
this General Public License. The "Program", below, refers to any such program
or work, and a "work based on the Program" means either the Program or any
derivative work under copyright law: that is to say, a work containing the
Program or a portion of it, either verbatim or with modifications and/or translated
into another language. (Hereinafter, translation is included without limitation in
the term "modification".) Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not covered by
this License; they are outside its scope. The act of running the Program is not
restricted, and the output from the Program is covered only if its contents
constitute a work based on the Program (independent of having been made by
running the Program). Whether that is true depends on what the Program does.

1. You may copy and distribute verbatim copies of the Program''s source code as
you receive it, in any medium, provided that you conspicuously and appropriately
publish on each copy an appropriate copyright notice and disclaimer of warranty;
keep intact all the notices that refer to this License and to the absence of any
warranty; and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and you may at
your option offer warranty protection in exchange for a fee.

2. You may modify your copy or copies of the Program or any portion of it, thus
forming a work based on the Program, and copy and distribute such
modifications or work under the terms of Section 1 above, provided that you also
meet all of these conditions:

a) You must cause the modified files to carry prominent notices stating that you
changed the files and the date of any change.

b) You must cause any work that you distribute or publish, that in whole or in
part contains or is derived from the Program or any part thereof, to be licensed
as a whole at no charge to all third parties under the terms of this License.

c) If the modified program normally reads commands interactively when run, you
must cause it, when started running for such interactive use in the most ordinary
way, to print or display an announcement including an appropriate copyright
notice and a notice that there is no warranty (or else, saying that you provide a
warranty) and that users may redistribute the program under these conditions,
and telling the user how to view a copy of this License. (Exception: if the
Program itself is interactive but does not normally print such an announcement,
your work based on the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole. If identifiable
sections of that work are not derived from the Program, and can be reasonably
considered independent and separate works in themselves, then this License,
and its terms, do not apply to those sections when you distribute them as
separate works. But when you distribute the same sections as part of a whole
which is a work based on the Program, the distribution of the whole must be on
the terms of this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest your rights to
work written entirely by you; rather, the intent is to exercise the right to control
the distribution of derivative or collective works based on the Program.

In addition, mere aggregation of another work not based on the Program with the
Program (or with a work based on the Program) on a volume of a storage or
distribution medium does not bring the other work under the scope of this
License.

3. You may copy and distribute the Program (or a work based on it, under
Section 2) in object code or executable form under the terms of Sections 1 and 2
above provided that you also do one of the following:

a) Accompany it with the complete corresponding machine-readable source
code, which must be distributed under the terms of Sections 1 and 2 above on a
medium customarily used for software interchange; or,

b) Accompany it with a written offer, valid for at least three years, to give any
third party, for a charge no more than your cost of physically performing source
distribution, a complete machine-readable copy of the corresponding source
code, to be distributed under the terms of Sections 1 and 2 above on a medium
customarily used for software interchange; or,

c) Accompany it with the information you received as to the offer to distribute
corresponding source code. (This alternative is allowed only for noncommercial
distribution and only if you received the program in object code or executable
form with such an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for making
modifications to it. For an executable work, complete source code means all the
source code for all modules it contains, plus any associated interface definition
files, plus the scripts used to control compilation and installation of the
executable. However, as a special exception, the source code distributed need
not include anything that is normally distributed (in either source or binary form)
with the major components (compiler, kernel, and so on) of the operating system
on which the executable runs, unless that component itself accompanies the
executable.

If distribution of executable or object code is made by offering access to copy
from a designated place, then offering equivalent access to copy the source
code from the same place counts as distribution of the source code, even though
third parties are not compelled to copy the source along with the object code.

4. You may not copy, modify, sublicense, or distribute the Program except as
expressly provided under this License. Any attempt otherwise to copy, modify,
sublicense or distribute the Program is void, and will automatically terminate
your rights under this License. However, parties who have received copies, or
rights, from you under this License will not have their licenses terminated so long
as such parties remain in full compliance.

5. You are not required to accept this License, since you have not signed it.
However, nothing else grants you permission to modify or distribute the Program
or its derivative works. These actions are prohibited by law if you do not accept
this License. Therefore, by modifying or distributing the Program (or any work
based on the Program), you indicate your acceptance of this License to do so,
and all its terms and conditions for copying, distributing or modifying the
Program or works based on it.

6. Each time you redistribute the Program (or any work based on the Program),
the recipient automatically receives a license from the original licensor to copy,
distribute or modify the Program subject to these terms and conditions. You
may not impose any further restrictions on the recipients'' exercise of the rights
granted herein. You are not responsible for enforcing compliance by third parties
to this License.

7. If, as a consequence of a court judgment or allegation of patent infringement
or for any other reason (not limited to patent issues), conditions are imposed on
you (whether by court order, agreement or otherwise) that contradict the
conditions of this License, they do not excuse you from the conditions of this
License. If you cannot distribute so as to satisfy simultaneously your obligations
under this License and any other pertinent obligations, then as a consequence
you may not distribute the Program at all. For example, if a patent license would
not permit royalty-free redistribution of the Program by all those who receive
copies directly or indirectly through you, then the only way you could satisfy
both it and this License would be to refrain entirely from distribution of the
Program.

If any portion of this section is held invalid or unenforceable under any particular
circumstance, the balance of the section is intended to apply and the section as
a whole is intended to apply in other circumstances.

It is not the purpose of this section to induce you to infringe any patents or other
property right claims or to contest validity of any such claims; this section has
the sole purpose of protecting the integrity of the free software distribution
system, which is implemented by public license practices. Many people have
made generous contributions to the wide range of software distributed through
that system in reliance on consistent application of that system; it is up to the
author/donor to decide if he or she is willing to distribute software through any
other system and a licensee cannot impose that choice.

This section is intended to make thoroughly clear what is believed to be a
consequence of the rest of this License.

8. If the distribution and/or use of the Program is restricted in certain countries
either by patents or by copyrighted interfaces, the original copyright holder who
places the Program under this License may add an explicit geographical
distribution limitation excluding those countries, so that distribution is permitted
only in or among countries not thus excluded. In such case, this License
incorporates the limitation as if written in the body of this License.

9. The Free Software Foundation may publish revised and/or new versions of the
General Public License from time to time. Such new versions will be similar in
spirit to the present version, but may differ in detail to address new problems or
concerns.

Each version is given a distinguishing version number. If the Program specifies a
version number of this License which applies to it and "any later version", you
have the option of following the terms and conditions either of that version or of
any later version published by the Free Software Foundation. If the Program does
not specify a version number of this License, you may choose any version ever
published by the Free Software Foundation.

10. If you wish to incorporate parts of the Program into other free programs
whose distribution conditions are different, write to the author to ask for
permission. For software which is copyrighted by the Free Software Foundation,
write to the Free Software Foundation; we sometimes make exceptions for this.
Our decision will be guided by the two goals of preserving the free status of all
derivatives of our free software and of promoting the sharing and reuse of
software generally.

NO WARRANTY

11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS
NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE
COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM
"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE,
YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
CORRECTION.

12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED
TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY
WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS
PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM
(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY
OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS
BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

END OF TERMS AND CONDITIONS
</pre>', 'This is the GNU GPL License.', 'text/html');
INSERT INTO content VALUES (30, '.administration/stats-general', 'Statistics Administration', 0, '.admin', 'main', 1, '', '2011-10-12 13:15:11', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
<form method="post" action="<?SPINE_Location?>admin/$type/view/" style="padding: 0; margin: 0; display: inline;"><b>View $label</b><br>
<input type="submit" value="View" class="spine-button">&nbsp;<select name="name" class="spine-general"><option value="">Select one
$list
</select>
</form>
</div>

<div name="adminpanel" class="spine-fullpanel">
<hr width="95%">
</div>

<form method="POST" name="theform" action="<?SPINE_Location?>admin/$type/remove/" style="padding: 0; margin: 0; display: inline;" onSubmit="return confirm(''You are about to delete ''+(document.theform.$type.options[document.theform.$type.selectedIndex].value)+''! Are you sure?'');">
<b>Remove $label</b><br>
<input type="submit" value="Remove" class="spine-button">&nbsp;<select name="name" class="spine-general"><option value="">Select one
$list
</select>
</form></div>

<div name="adminpanel" class="spine-fullpanel">
<hr width="95%">
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%"><a href="<?SPINE_Location?>admin/statistics/?sort=filename$orderf">Page</a></div>
<div class="spine-panelcel" style="width: auto"><a href="<?SPINE_Location?>admin/statistics/?sort=counter$orderc">Requests</a></div>
<div class="spine-spacercel"></div>
</div>
$namelist
', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (28, 'documentation/changelog.html', 'changelog', 0, 'main', 'main', 1, 'changes changelog update code status', '2007-08-28 17:46:44', 'admin', 'users', '1010', '<pre>
ChangeLog
=========
Release - 1.3 beta
- Added to Package : Wizard and style thumbnails
- Added to Package : Advanced caching
- Added to Package : initial code for CGI backport
- Added in Admin : Locked content in Content Administration panel
- Added to Admin : Upload as plugin
- Added to Admin : Attributes in content admin panel
- Added in Admin : binary content body support
- Added in Admin : Addd MIME type detection in content
- Added to Core :  Picasa gallery plugin
- Added to Core : Added plugin: Edit Page
- Added to Core : Added plugin: Tags
- Added to Core : Added plugin: Slideshow
- Added to Core : WizardStyles (for Wizard)
- Added to Core : Messages as RSS plugin
- Added to Core : Configurable images path
- Fixed in Admin : logging bug
- Fixed in Core : small bugs
- Updated in Core : Code cleanup
- Updated in Admin : Administration GUI changes
- Updated in Core : More i18n preparation
- Updated in Database : Mime types and statistics

Release - 1.22 - Fixes
- Fixed in Admin : Referer check
- Fixed in Admin : Arbitrary password 

Release - 1.2 - Stable
- Added in Package : 8 new styles
- Added in Admin : Forced POST access (prevent XSS)
- Added to Core : Code documentation
- Updated in Admin : Cosmetic fixes (Thanks Tielman)
- Updated in Package : New style screenshots
- Updated in Core : Cleaned up code.. ALOT
- Updated in Core : Updated and optimized database handler code
- Fixed in Core : Placeholders in database handler : security fix
- Fixed in Core : Cleaned up Apache 2 handler
- Fixed in Core : True versus Virtual file precedence fix
- Fixed in Core : here-doc quote bug
- Fixed in Core : Apache 2 document root bug
- Fixed in Core : main document bug
- Fixed in Core : Extra trailing separator in Navbar fix (Thanks Tielman)
- Fixed in Admin : Macro admin security bug fix
- Fixed in Admin : Unexisting admin panel fix
- Fixed in Admin : Title bug in admin panel
- Fixed in Admin : Adminaccess save and delete bug
- Fixed in Admin : Small HTTP status fix (Forbidden vs Not Found)
- Fixed in Package : Added (finally) support for logging : enable/disable access logging
- Updated in Documentation : Added Style quickstart

Release - 1.2 beta
- Added in Package : new 4 styles
- Added in Package :  support for mod_perl 2
- Added in Package : initial support to change message order (TODO: Add this to GUI)
- Fixed in Package : Postgres permission issues
- Fixed in Package : document root bug (SF bug ticket 1450821)
- Fixed in Package : File Manager ''delete'' message bug (SF bug ticket 1450814)
- Fixed in Package : File Manager upload filename bug (SF bug ticket 1460304)
- Added in Package : support for native HTTP status for 404 and 403
- Updated in Documentation :  database setup
- Updated in Documentation : example on using Databases in plugin
- Fixed in Admin : Wiki administration and fixed initial bugs
- Fixed in Admin : Radio button bug in IE ; Root path actions
- Added in Admin : basic support for internationalization
- Fixed in Plugins : small bug in ImageGallery plugin

Release - 1.1 - Stable
- Fixed in Package : Updated MANIFEST (some handlers were missing)
- Fixed in Package : Removed deprecated images
- Fixed in Package : Added new buttons & screenshots
- Fixed in Pages : Current page is included in login page (redirect login page after login)
- Fixed in Pages : Added new styles
- Fixed in Plugins : Added support for limited message queries (limit and offset)
- Fixed in Plugins : Fixed filename filter in Image Gallery
- Fixed in Plugins : Fixed zero value of Counter plugin
- Fixed in Plugins : Fixed access control in Search plugin
- Fixed in Plugins : Message handler : Fixed lots of bugs
- Fixed in Plugins : Fixed URI bug in Image Gallery
- Fixed in Handlers : Fixed macro bug in Content handler
- Fixed in Handlers : Optimized visited page statistics
- Fixed in Admin : Fixed sorting of Message, Navbar, Statistics front-end
- Fixed in Admin : Fixed Navbar bug (Navbar button moving failed sometimes after deleting)
- Fixed in Admin : Added Access Control in File Manager
- Fixed in Admin : Added filename filtering in File Manager and fixed chroot bug
- Fixed in Admin : Updated Message admin layout & added reply counter, etc
- Fixed in Admin : Allow HTML tags in Macro keys and values
- Fixed in Admin : Fixed Usergroup bug in Style admin
- Fixed in Admin : Added Message group front end
- Fixed in Admin : Fixed Navbar buttons
- Fixed in Admin : Navbar : Default label is a link
- Fixed in Admin : Updated layout for File Manager
- Fixed in Admin : Users are added to usergroup "users" by default
- Fixed in Admin : Added "Admin Access" front end
- Fixed in Admin : Creating "existing" file returns error message, ditto for deleting "unexisting" file, etc
- Fixed in Core : Small Postgres related bug
- Fixed in Core : Cookie bug

Release - 1.0_05 - Beta Release
- Updated layout
- Added Documentation & Screenshots
- Added extra Message tags & fixed Message bugs
- Fixed some File Manager bugs
- Updated POD
- Fixed bug in multiple setup feature
- Added Apache config include file
- Updated Navbar advanced attributes
- Fixed Access Control bugs in Administration
- Fixed Macro administration bugs
- Added basic Search Engine plugin (beta)
- Added SQL Dump plugin (beta)
- Added Quickstart guide
- Fixed Content tag bugs
- Fixed Content usergroup bug
- Added basic ImageGallery plugin (beta)

Release - 1.0_04 - Beta Release
- Fixed error handling in administration section
- Add documentation
- Fixed Macro administration
- Fixed Navigation Bar Administration
- Fixed Message administration & handler
- Fixed Administration access 
- Database handling optimization
- Dot file support
- Cleaned up styles and content
- Cleaned up error content and 404 handling
- Fixed servername issue (finally)
- Small bugfix in style admin
- Small bugfix in module filename handling
- Fixed User administration (table structure, administration section, access)
- Added basic calendar support
- Added tests
- Fixed Wiki issues
- Cleaned up code
- Fixed small Administration Statistics issue
- Fixed SQL issue (mysql 4 uses keyword "separator")

Release - 1.0_03 - Developer Release
- Delete obsolete files
- Several Navbar fixes
- Added some tests
- Added Wiki plugin
- Fixed issue where <?SPINE_Location?> could only be called from content
- Added Quickstart Guide & How it works documentation
- Several DBI fixes and cleanups
- Fixed statistics handler - included modifier date & Fixed some small bugs
- Fixed Log handler - extra parameters are ignored
- Added file manager
- Included basic struct tests for SQLite
- Fixed virtual file issue (virtual file foo is now actually loaded instead of existing file foo.txt)
- Cleaned up and optimized OO code structure A LOT + Added default value methods
- Added Makefile
- Added Admin access handler (restrict access to specific admin sections per user)
- Fixed some Macro issues
- Cleaned up HTML lots (and added "advanced" sections)

Release - 1.0_02
- Added Postgres support & cleaned up DBI class in the process
- Fixed compliancy to GPL
- Added some POD and general documentation
- Added content type to content
- Added documentation on alternative data types (including examples)
- Added documentation on developing plugins (including examples)
- Minor bug fixes
- Fixed major Message issues (including parent message and messagegroups)
- Fixed major permission issues (including administration access rights)
- Added content attribute in messagegroup (still to integrate in admin)
- Added SPINE::Constant to include general constant
- Implemented default data in content and style
- Cleaned up HTML.. a bit
- Fixed login info issue and integration with sessions and administration
- Added internal comments to content and style
- Added permissions, date, size owner and usergroup in content and style

Release - 1.0_01
- First DB based release
</pre>', '', 'text/html');
INSERT INTO content VALUES (31, '.administration/stats', 'Statistics Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:06:33', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
Statistics for <b>$name</b>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>Referer</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$refererlist
<br>
<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>User Agent</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$useragentlist
<br>
<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>Host / IP</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$remoteaddrlist
<br>
<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>URL parameters</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$querylist
<br>
<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>Month</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$monthlist

<br>
<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>Weekday</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$weekdaylist

<br>
<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 45%"><b>Hour</b></div>
<div class="spine-panelcel" style="width: auto"><b>Requests</b></div>
<div class="spine-spacercel"></div>
</div>
$hourlist', 'This is the template for statistics administration', '');
INSERT INTO content VALUES (32, 'jquery.html', '', 0, 'main-minimal', 'main', 1, '', '2008-03-26 22:04:54', 'admin', 'users', '1010', '<a href="#" onClick="$(''#container'').addClass(''Opaque''); $(''#container'').fade(''slow''); return false;">Click</a>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (91, '.administration/style', 'Style Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:16:21', 'admin', 'admin', '1111', '<script language="javascript" src="jquery.js"></script>


<script type="text/javascript">
$(document).ready(function(){
  $(''#help'').hide();
 });
</script>

<div class="spine-dialog" id="spine-tags" style="width:900px; height:140px">
<img border="0" align="right" valign="top" src="/images/delete.png" onClick="document.getElementById(''tags'').style.display=''none''; return false;"><u>Usable tags:</u><br>&lt;?SPINE_Env?&gt;, &lt;?SPINE_Images?&gt;, &lt;?SPINE_Location?&gt;, &lt;?SPINE_Login?&gt;, &lt;?SPINE_Macro("<i>key</i>")?&gt;, 

&lt;?SPINE_Message("<i>messagegroup</i>"[,"<i>id</i>"])?&gt;, &lt;?SPINE_Message_Body?&gt;, &lt;?SPINE_Message_Comments?&gt;, &lt;?SPINE_Message_Date?&gt;, 
&lt;?SPINE_Message_DateTime?&gt;, &lt;?SPINE_Message_Group?&gt;, &lt;?SPINE_Message_Id?&gt;, &lt;?SPINE_Message_Owner?&gt;, &lt;?SPINE_Message_Parent_Id?&gt;,

&lt;?SPINE_Message_Parent_Subject?&gt;, &lt;?SPINE_Message_Subject?&gt;, &lt;?SPINE_Message_Time?&gt;, &lt;?SPINE_Navbar("<i>navbarname</i>")?&gt;,
&lt;?SPINE_Page?&gt; &lt;?SPINE_Referer?&gt;, &lt;?SPINE_Search?&gt;, &lt;?SPINE_Servername?&gt;, &lt;?SPINE_Stats("hits")?&gt;, &lt;?SPINE_Stats("modified")?&gt;,

&lt;?SPINE_Title?&gt;, &lt;?SPINE_User?&gt;, &lt;?SPINE_Webmaster?&gt;, &lt;?SPINE_XMLChanges?&gt;</div>
<form method="post" action="<?SPINE_Location?>admin/style/save/">

<div name="adminpanel" class="spine-fullpanel" style="position: relative">
<div class="spine-help" id="spine-help">
</div>
$error<b>Style Edit : $filename $lock</b><br>
<input type="submit" value="Save" class="spine-button">
<input type="button" value="Advanced" onClick="o=document.getElementById(''spine-advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="spine-button">
<input type="hidden" name="name" value="$filename">
<a href="#" style="position:absolute; top:5px; right:5px;" onClick="$(''#help'').load(''.help-style'').slideToggle(''slow''); return false;">Help</a>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Size :</div>
 <div class="spine-panelcel" style="width: 25%">$size bytes</div>
 <div class="spine-panelcel" style="width: 15%">Last Modified : </div>
 <div class="spine-panelcel" style="width: 25%">$lastmod</div>
 <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Title :</div>
 <div class="spine-panelcel" style="width: 25%"><input class="spine-input" name="title" value="$title" size="25" type="text"></div>
 <div class="spine-panelcel" style="width: 15%">Macros : </div>
 <div class="spine-panelcel" style="width: 25%"><select name="macros" class="spine-general">
<option value="">none
$macros
</select></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel" id="spine-advanced" style="height: auto ; width: 100%;">
<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Owner :</div>
 <div class="spine-panelcel" style="width: 25%">$owner</div>
 <div class="spine-panelcel" style="width: 15%">Group : </div>
 <div class="spine-panelcel" style="width: 25%"><select name="usergroup" class="spine-general">$group</select>
 </div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
 <div class="spine-panelcel" style="width: 15%">Permissions :</div>
 <div class="spine-panelcel" style="width: 55%">Group : $gpermissions &nbsp;&nbsp;&nbsp;&nbsp; Public : $wpermissions</div>
 <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
Comment :<br>
<textarea cols="150" rows="8" name="icomment" class="spine-input">$icomment</textarea>
</div>

</div>

<div name="adminpanel" class="spine-fullpanel">
Contents :<br>
<textarea cols="150" rows="25" name="body" class="spine-input">$body</textarea>
</div>
</form>
', 'This is the style template', '');
INSERT INTO content VALUES (42, 'documentation/styles.html', 'Included Styles', 0, 'main', 'main', 1, '', '2007-02-22 23:23:26', 'admin', 'users', '1010', 'SPINE includes 17 default styles:<br><center>
<a href="<?SPINE_Images?>spine_style.jpg"><img src="<?SPINE_Images?>spine_style.jpg" width="455" height="526"></a><br>Default SPINE style. Style: main<br><br>
<a href="<?SPINE_Images?>spine2_style.jpg"><img src="<?SPINE_Images?>spine2_style.jpg" width="455" height="526"></a><br>Second SPINE style. Style: main2<br><br>
<a href="<?SPINE_Images?>eidogreen_style.jpg"><img src="<?SPINE_Images?>eidogreen_style.jpg" width="455" height="526"></a><br>Eidogreen style, contributed by jhThorsen. Style: eidogreen<br><br>
<a href="<?SPINE_Images?>eidored_style.jpg"><img src="<?SPINE_Images?>eidored_style.jpg" width="455" height="526"></a><br>Eidored style, contributed by jhThorsen. Style: eidored<br><br>
<a href="<?SPINE_Images?>ruth_style.jpg"><img src="<?SPINE_Images?>ruth_style.jpg" width="455" height="526"></a><br>Public domain style, made available through <a href="http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html">Ruthsarian Layouts</a>. Style: ruth<br>
<hr>New since 1.2 beta<br>

<a href="<?SPINE_Images?>andreas01_style.jpg"><img src="<?SPINE_Images?>andreas01_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/6205">oswd.org</a>. Style: andreas01.
<br><br>
<a href="<?SPINE_Images?>autonomous_style.jpg"><img src="<?SPINE_Images?>autonomous_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/2547">oswd.org</a>. Style: autonomous
<br><br>
<a href="<?SPINE_Images?>dittoditto_style.jpg"><img src="<?SPINE_Images?>dittoditto_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/6329">oswd.org</a>. Style: dittoditto
<br><br>
<a href="<?SPINE_Images?>plain_style.jpg"><img src="<?SPINE_Images?>plain_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/6304">oswd.org</a>. Style: plain<hr>New since 1.2<br>
<br><br>
<a href="<?SPINE_Images?>metro01_style.jpg"><img src="<?SPINE_Images?>metro01_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/12009">oswd.org</a>. Style: metro01
<br><br>
<a href="<?SPINE_Images?>nightcity_style.jpg"><img src="<?SPINE_Images?>nightcity_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/11340">oswd.org</a>. Style: nightcity
<br><br>
<a href="<?SPINE_Images?>bluerain_style.jpg"><img src="<?SPINE_Images?>bluerain_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/11508">oswd.org</a>. Style: bluerain<br><br>
<a href="<?SPINE_Images?>mintchocolate_style.jpg"><img src="<?SPINE_Images?>mintchocolate_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/9633">oswd.org</a>. Style: mintchocolate<br><br>

<a href="<?SPINE_Images?>gscape_style.jpg"><img src="<?SPINE_Images?>gscape_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/7724">oswd.org</a>. Style: gscape<br><br>

<a href="<?SPINE_Images?>neuphoric_style.jpg"><img src="<?SPINE_Images?>neuphoric_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/10055">oswd.org</a>. Style: neuphoric<br><br>

<a href="<?SPINE_Images?>progress_style.jpg"><img src="<?SPINE_Images?>progress_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/8809http://www.oswd.org/user/profile/id/8809">oswd.org</a>. Style: progress<br><br>

<a href="<?SPINE_Images?>littlehome_style.jpg"><img src="<?SPINE_Images?>littlehome_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/9072">oswd.org</a>. Style: littlehome<br><br>

</center>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (43, 'documentation/todo.html', 'To Do', 0, 'main', 'main', 1, 'document doc todo', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<pre>TODO
------
- POD
- HOWTO
- Overview Documentation
- Quickstart (most needed functions)
- Add documentation.. period

TODO - Low Priority (random order)
----------------------------------

- Case insensitive match fix for mysql (foo != FOO.. silly germans) - Fix in dumper, mention in FAQ
- Optimize ! http://dev.mysql.com/doc/mysql/en/Query_Speed.html

Development
- Logging administration
  - sorting
  - link logging to log handler
- Message administration
  - Change Message structure to provide mail possibilities (extra fields - attributes)
- Quickstart (most needed functions)
  -> Documentation
  -> Central admin page : "edit index.html content" "edit main style"
- Limited versioning info (with patch??)
  -> Part of Plugins (SPINE::Wiki)
- Command Line Tool + Plugin : Work in progress
- Virtual Folders (Plugin)

- Add graphical counter example
- Images directory (symlink/per setup or general?)
- onchange in content ("Changed" - "Unchanged") <- javascript
- Wiki Plugin - BETA

</pre>', 'Things that are to do', 'text/html');
INSERT INTO content VALUES (44, 'documentation/tips.html', 'Tips & Tricks', 0, 'main', 'main', 1, 'tips tricks', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Tips &amp; Tricks</h2>
<ol><li><u>Macro values can also contain HTML tags, including SPINE Markers</u>
<br>Example:
Define two Macro sets and include a Navbar as value:<br>
Define Macro set #1 (Old)<br>
Add a macro pair : name navbar ; value &lt;?SPINE_Navbar("old")?&gt;<br>
Define Macro set #2 (New)<br>
Add a macro pair : name navbar ; value &lt;?SPINE_Navbar("new")?&gt;
In the Style, use &lt;?SPINE_Macro("navbar")?&gt;.<br>
In the content where you want to display the ''new'' Navbar, select ''New'' from the Macro list.<br>
In the content where you want to display the ''old'' Navbar, select ''Old'' from the Macro list.<br>
</li>
<li><u>Messages can be used for weblogs</u><br>
SPINE does not include an official Weblog (blog, journal, ..) plugin but the Messages plugin can be used to do it.</li>
<li><u>Dynamic Text Editor in the Administration</u><br>
SPINE is not bundled with a dynamic text editor (WYSIWYG) but there is unofficial support. See <a href="tinymce.html">TinyMCE Installation</a> page.</li>
<li><u>AJAX support</u><br>
None of the plugins does AJAX support out of the box but it is quite simple to include it in your page. See the Messages AJAX example page.</li>
<li><u>True files support</u><br>
SPINE transparently handles displaying virtual files and true files. When a content is created but a true file with that name exists, SPINE will give precedence to that file.</li>
  
<li><u>Dynamic Media type</u><br>Content of any type can be generated
  By setting a custom mime-type for a content, you can display virtually any data type. Make sure to use a style that Two included examples demonstrate this feature.
  <ul><li>XML Changes shows XML data of the most recent changes, using a plugin. </li>
  <li>Pie Chart demonstrates generating dynamic image data transparently.</li></ul>
</li>
 </ol>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (47, 'xmldump.html', '', 0, 'xml', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '<?SPINE_XMLDump?>', 'This is where you put comments about this content', 'text/xml');
INSERT INTO content VALUES (48, 'search.html', '', 0, 'main', 'main', 1, '', '2008-09-30 22:21:38', 'admin', 'users', '1010', '<h2>Search Results</h2>
<?SPINE_Search?>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (49, 'autonomous.css', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'body {font-family:arial;font-size:12px;cursor:default;color:AAAAAA}
td {font-family:arial;font-size:12px;cursor:default;color:AAAAAAA}
a {color:FFBA27;text-decoration:none;font-size:16px}
a:hover {color:FFBA27;text-decoration:underline}
input {border-width:1;font-family:arial;font-size:12px;padding:2px;height:21px;border-color:CCCCCC;border-style:solid;background-color:F9F9F9;color:999999}', 'This CSS is part of the Autonomous design, which was made freely available on Open Source Web Design (http://www.oswd.org) by gymnerd (http://www.oswd.org/user/profile/id/2547).', 'text/css');
INSERT INTO content VALUES (50, '.administration/wiki', 'Wiki Administration', 0, '.admin', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '<table width="1000" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">

<tr width="1000">
<form method="post" action="<?SPINE_Location?>admin/wiki/save/">

<td colspan="5" width="1000">
$error<b>Wiki Edit : $name</b><br>
<input type="submit" value="Save" class="button">
<input type="button" value="Advanced" onclick="o=document.getElementById(''advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="button">
<input type="hidden" name="name" value="$filename">
</td></tr>

<tr width="1000">

<td width="15%">Last Modified <sup>[<a onClick="return false;" class="info">?<span>This is the last modifcation date of the wiki.</span></a>]</sup> : </td><td width="25%">$lastmod</td>
<td width="20%">&nbsp;</td></tr>

<tr width="1000">
<td width="15%">
Owner <sup>[<a class="info" onClick="return false;">?<span>This shows the content owner.</span></a>]</sup> :</td><td width="25%">$owner</td>

<td width="15%">Group <sup>[<a class="info" onClick="return false;">?<span>This shows the content ownergroup.</span></a>]</sup> : </td><td width="25%"><select name="usergroup" class="general">$group</select></td><td width="20%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000">

<td width="15%" valign="top">
Permissions <sup>[<a class="info" onClick="return false;">?<span>These checkboxes set the content access permissions.</span></a>]</sup> :</td>

<td width="25%">Group: $gpermissions</td>
<td width="25%">Public&nbsp;: $wpermissions</td>
<td width="20%">&nbsp;</td>
</tr>

<tr width="1000"><td colspan="4">
<sup>[<a class="info" onClick="return false;">?<span>This is the actual Wiki body.</span></a>]</sup> :
<br><textarea cols="110" rows="18" name="body" class="input">$body</textarea></td>
<td>&nbsp;</td>
</table>', 'I''m not sure what this is...', '');
INSERT INTO content VALUES (51, 'success.html', 'Great Success!', 0, 'blank', '', 1, 'getting started stub intro', '2009-03-13 00:32:52', 'admin', 'users', '1010', '<h2>Yay! It Worked!</h2>
<h3>Huh!?!?</h3>
This is a stub page for your initial Spine website installation. Read on for more information on documentation and getting started.
<h3>Getting Started</h3>
Looks like your installation of Spine <?SPINE_Version?> was successful. To get started, you need to log in first. Click <a href="login.html">here</a> to go to the login page. Did you <a href="#password">set your administrator password</a>? Logged in? Go to the administration panel or use one of the included <a href="site/wizard.html">wizards</a> to create your first page!To change this page, open <i>index.html</i> in the administration panel. <br><br>To learn more, browse through the <a href="documentation/index.html">documentation</a>
<h3>More information on Spine</h3>
There is a lot more information available on Spine. Click <a href="site/index.html">here</a> to see it all.
<a name="password"><h3>Setting the initial Administrator password</h3></a>
Did you remember to create the accounts? If you used Makefile.PL to install all the files, you were asked to create the SQL for the site administrator account. Setting or resetting the administrator password outside the administration panel is not possible.
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (52, 'andreas01.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:30:22', 'admin', 'users', '1010', '/* andreas01 - an open source xhtml/css website layout by Andreas Viklund (http://andreasviklund.com). Made for OSWD.org, free to use as-is for any purpose as long as the proper credits are given for the original design work. For design assistance and support, contact me through my website or through http://oswd.org/email.phtml?user=Andreas

Version: 1.0
(July 25, 2005)

Screen layout: */

body {
margin: 0 auto;
padding: 0;
font: 76% Verdana,Tahoma,Arial,sans-serif;
background: #f4f4f4 url(<?SPINE_Images?>andreas01bg.gif) top center repeat-y;
}

#wrap {
background: #ffffff;
color: #303030;
margin: 0 auto;
width: 760px;
}

#header {
clear: both;
margin: 20px 0 0 0;
padding: 0;
height: 45px;
}

#header h1 {
width: 250px;
margin: 0 0 10px 0;
float: left;
}

#header p {
width: 500px;
float: right;
text-align: center;
color: #a0a0a0;
margin: 0 0 10px 0;
font-size: 0.8em;
line-height: 1.2em;
}

#frontphoto {
margin: 0 0 10px 0;
border: 0;
}

#avmenu {
clear: left;
float: left;
width: 150px;
margin: 0 0 10px 0;
padding: 0;
font-size: 0.9em;
}

#avmenu ul {	
list-style: none;
width: 150px;
margin: 0 0 20px 0;
padding: 0;
font-size: 1.1em;
}	

#avmenu li {
margin-bottom: 4px;
}

#avmenu li a {
font-weight: bold;
height: 20px;
text-decoration: none;
color: #505050;
display: block;
padding: 6px 0 0 10px;
background: #f4f4f4;
border-left: 4px solid #cccccc;
}	
	
#avmenu li a:hover {
background: #eaeaea;
color: #286ea0;
border-left: 4px solid #286ea0;
}

.announce {
margin: 10px 0 10px 0;
padding: 10px;
width: 130px;
color: #505050;
background-color: #f4f4f4;
line-height: 1.3em;
}

#extras {
float: right;
width: 100px;
margin: 0 0 10px 0;
padding: 0;
font-size: 0.9em;
line-height: 1.5em;
}

#extras p {
margin: 0 0 1.5em 0;
}

#content {
margin: 0 110px 20px 160px;
border-left: 1px solid #f0f0f0;
border-right: 1px solid #f0f0f0;
padding: 0 10px 0 10px;
line-height: 1.6em;
text-align: left;
}

#content h2 {
font-size: 1.5em;
margin: 0 0 0.5em 0;
}

#content img {
padding: 1px;
display:inline;
background: #cccccc;
border: 4px solid #f0f0f0;
}

h3 {
font-size: 1.3em;
margin: 0 0 10px 0;
}

a {
text-decoration: none;
color: #286ea0;
}

a:hover {
text-decoration: underline;
color: #286ea0;
}

a img {
border: 0;
}

#footer {
clear: both;
margin: 0 auto;
padding: 10px 0 20px 0;
border-top: 4px solid #f0f0f0;
width: 760px;
text-align: center;
color: #808080;
font-size: 0.9em;
}

#footer a {
color: #808080;
text-decoration: none;
}

#footer a:hover {
text-decoration: underline;
}

.left {
margin: 10px 10px 5px 0;
float: left;
}

.right {
margin: 10px 0 5px 10px;
float: right;
}

.textright {
text-align: right;
}

.center {
text-align: center;
}

.small {
font-size: 0.8em;
}

.bold {
font-weight: bold;
}

.hide {
display: none;
}', 'This CSS is part of the Andreas01 design, which was made freely available on Open Source Web Design (http://www.oswd.org) by Andreas (http://www.oswd.org/user/profile/id/6205).', 'text/css');
INSERT INTO content VALUES (53, 'andreas_spinenews', '', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<h3 class="news"><?SPINE_Message_Subject?></h3>
<div class="newsdate"><?SPINE_Message_Date?></div>
<?SPINE_Message_Body?>
', 'This is how a message will look like', '');
INSERT INTO content VALUES (54, 'plain.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:31:58', 'admin', 'users', '1010', '/* CSS Document */

body {
	margin:0;
	font-family:"Trebuchet MS", Arial, Verdana;
	font-size:0.74em;
	color:#555555;
	background-color:#FFFFFF;
	text-align:left;
}

input {
	background-color:#FFFFFF;
	padding:3px;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:10px;
	color:#ffffff;
	border:1px solid #728c40;
	background-color:#94ae62;
	margin-bottom:2px;
}
input[type=submit] {
	background-color:#FFFFFF;
	padding:3px;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:10px;
	color:#666666;
	border:1px solid #728c40;
	margin-bottom:2px;
}

a {
	color:#4D87CE;
	font-weight:bold;
	text-decoration:none;
}
a:hover {
	color:#2a65ad;
}

ol,ul {

}

li {
	list-style-image:url(<?SPINE_Images?>plainli.gif);
	line-height:20px;
	text-align:left;
}

#menu {
	width:100%;
	padding-top:20px;
	padding-bottom:20px;
	background-color:#94AE62;
	margin-bottom:50px;
	color:#FFFFFF;
	text-align:center;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
	font-variant:small-caps;
	background-image:url(<?SPINE_Images?>plainmenu.jpg);
}
#menu a {
	color:#FFFFFF;
	text-decoration:none;
	padding:10px;
	padding-top:20px;
	padding-bottom:20px;
	
}
#menu a:hover {
	border-bottom:1px solid #ffffff;
	border-left:1px solid #728d40;
	border-right:1px solid #e9ffb7;
	padding-left:9px;
	padding-right:9px;
	color:#000000;
	background-color:#FFFFFF;
	background-image:url(<?SPINE_Images?>plaina_hover.jpg);
}

#header {
	width:750px;
	margin:0 auto 0 auto;
	margin-bottom:40px;
}
#header h1 {
	font-family:"Century Gothic", "Trebuchet MS", "Arial Narrow", Arial, sans-serif;
	font-size:30px;
	text-transform:uppercase;
	font-weight:normal;
	margin:0;
	padding:0;
	padding-top:5px;
	color:#736451;
	margin-bottom:10px;
	text-align:left;
}
#header h2 {
	font-family:"Century Gothic", "Trebuchet MS", "Arial Narrow", Arial, sans-serif;
	font-size:15px;
	text-transform:uppercase;
	text-align:right;
	font-weight:normal;
	margin:0;
	padding:0;
	color:#000000;
	border-bottom:1px solid #eeeeee;
}

#content {
	width:720px;
	margin:0 auto 0 auto;
	text-align:left;
}

.introduction {
	font-family:Helvetica, Arial, sans-serif;
	line-height:20px;
	font-size:12px;
	color:#99B198;
	text-indent:25px;
	background-image:url(<?SPINE_Images?>plaindesc.jpg);
	background-position:bottom left;
	padding-left:0;
	padding-right:200px;
	padding-bottom:35px;
	padding-top:0;
	background-repeat:no-repeat;
	
}
.logo {
	float:right;
	margin-right:30px;
}
.clearer {
	clear:both;
}

#sidebar {
	width:180px;
	float:right;
	font-size:95%;
	color:#6C534A;
	text-align:left;
}
#sidebar h1 {
	font-family:"Century Gothic", "Trebuchet MS", "Arial Narrow", Arial, sans-serif;
	font-size:20px;
	text-transform:uppercase;
	font-weight:normal;
	border-bottom:1px solid #eeeeee;
	color:#728c40;
	text-align:right;
}
.submenu {
}
.submenu a {
	display:block;
	width:100%;
	background-image:url(<?SPINE_Images?>plainsubmenua.gif);
	background-position:right;
	background-repeat:no-repeat;
	padding:5px;
	padding-right:0;
}
.submenu a:hover {
	background-color:#eeeeee;
	background-image:url(<?SPINE_Images?>plainsubmenua_hover.jpg);
	background-repeat:repeat-y;
}
#mainbar {
	margin-right:185px;
	padding-right:35px;
	background-image:url(<?SPINE_Images?>plainmainbar.jpg);
	background-position:top right;
	background-repeat:no-repeat;
}

#mainbar h1 {
	font-family:"Century Gothic", "Trebuchet MS", "Arial Narrow", Arial, sans-serif;
	font-size:25px;
	text-transform:uppercase;
	font-weight:normal;
	border-bottom:1px solid #eeeeee;
	color:#728c40;
}

#mainbar p {
	padding:15px;
	line-height:20px;
}

#mainbar .articleimg {
	float:right;
	padding:5px;
	border:1px solid #eeeeee;
	margin-left:20px;
	margin-top:20px;
	margin-bottom:20px;
}

#footer {
	width:100%;
	background-color:#b6cf84;
	border-top:1px solid #d8efa6;
	border-bottom:5px solid #94ae62;
	padding-top:5px;
	padding-bottom:5px;
	color:#FFFFFF;
}
#footer a {
	color:#006600;
}
#footer a:hover {
	color:#009900;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (55, 'ditto-screen.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:32:42', 'admin', 'users', '1010', 'a {
	color: #666666;
	text-decoration: underline;
}
a:hover {
	color: #888888;
	text-decoration: none;
}
acronym{
	border-bottom: 1px dotted #666666;
	cursor: help;
}
body{
	background-color: #FFFFFF;
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #333333;
	margin: 10px;
	padding: 0px;
}
h1{
	color:#666666;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	font-size: 18px;	
	line-height: 13px;
	margin: 0px 0px 0px 10px;
	padding: 0px;
}
h2{
	color:#666666;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	font-size: 18px;	
	line-height: 13px;
	margin: 0px 10px 0px 0px;
	padding: 0px;
	text-align:right;
}
h3{
	color:#666666;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;	
	line-height: 14px;
	margin: 10px 0px 3px 0px;
	padding: 0px;
	text-align:left;
}
.contentleft{
	width: 77%;
}
.contentmain{
	background-color:#F9F8F7; 
	padding:5px;
}
.contentright{
	width: 23%;
}
.greybox{
	background-color: #DEDEDE;
	color:#666666;
}
.header{
	background-color: #E6E6E6;
	background: url(<?SPINE_Images?>dittoheader.jpg);
	font-size: 36px;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	color: #903326;
	line-height: 24px;
	font-weight: bold;
}
.menubox{
	background-color: #484848;
	color:#F9F8F7;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
}
.menubox a{
	color:#BDBDBD;
	font-size: 18px;
	line-height: 30px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}
.menubox a:hover{
	color:#FFFFFF;
	font-size: 18px;
	line-height: 30px;
	text-decoration: none;
}
.menubox a.selected{
	color:#FFFFFF;
}
.searchbox {
	font-size: 11px;
	padding:1px 2px 1px 2px;
	border:1px solid #999999;
	color:#666666;
	background:#F6F6F6;
	text-align:right;
}
.subheader{
	background-color: #903326; /*D6C43A;*/
}
.whitebox{
	background-color: #FFFFFF;
	color:#666666;
}
.whitebox_topleft{
	background: url(<?SPINE_Images?>ditto1-topleft.gif);
	width:9px;
}
.whitebox_bottomright{
	background: url(<?SPINE_Images?>ditto1-bottomright.gif);
	width:9px;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (56, 'ditto-print.css', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'a {
	color: #000000;
	text-decoration: underline;
}
a:hover {
	color: #000000;
	text-decoration: none;
}
body{
	background-color: #FFFFFF;
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000000;
	margin: 10px;
	padding: 0px;
}
h1{
	color:#000000;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	font-size: 18px;	
	line-height: 13px;
	margin: 0px 0px 0px 10px;
	padding: 0px;
}
h2{
	color:#000000;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	font-size: 18px;	
	line-height: 13px;
	margin: 0px 10px 0px 0px;
	padding: 0px;
	text-align:right;
}
h3{
	color:#000000;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;	
	line-height: 14px;
	margin: 10px 0px 3px 0px;
	padding: 0px;
	text-align:left;
}
.contentleft{
	width: 100%;
}
.contentmain{
	background-color:#FFFFFF; 
	padding:5px;
}
.contentright{
	width: 0%;
   	display: none;
	position: absolute;
}
.greybox{
   	display: none;
	background-color: #DEDEDE;
	color:#666666;
}
.header{
	font-size: 36px;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
	color: #000000;
	font-weight: bold;
	margin-right:4px;
}
.menubox{
	background-color: #484848;
	color:#F9F8F7;
	font-family: Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;
}
.menubox a{
	color:#BDBDBD;
	font-size: 18px;
	line-height: 30px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}
.menubox a:hover{
	color:#FFFFFF;
	font-size: 24px;
	line-height: 30px;
	text-decoration: none;
}
.menubox a.selected{
   	display: none;
	color:#FFFFFF;
}
.searchbox {
	font-size: 11px;
	padding:1px 2px 1px 2px;
	border:1px solid #999999;
	color:#666666;
	background:#F6F6F6;
	text-align:right;
}
.subheader{
}
.whitebox{
	background-color: #FFFFFF;
	color:#000000;
}
.whitebox_topleft{
	width:9px;
	border-left:1px solid #666666;
	border-top:1px solid #666666;
}
.whitebox_bottomright{
	width:9px;
	border-right:1px solid #666666;
	border-bottom:1px solid #666666;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (57, 'documentation/quickstart2.html', 'Getting Started - Styles', 0, 'main', 'main', 1, 'quick start tutorial documentation', '2007-02-22 23:34:01', 'admin', 'users', '1010', '<h2>Getting Started with Spine : Creating Styles</h2>
<u>Step 1: Choose a new style</u><br />
I choose <a href="http://www.oswd.org/design/preview/id/2945">Blue Rain</a> from <a href="http://www.oswd.org">Open Source Web Design</a>. Download the archive. The ZIP file contains a number of files, all located under a directory called <tt>Blue_Rain</tt>. You''ll find 1 HTML file in the main directory and 1 CSS file located in the styles directory. The <tt>images</tt> directory contains 2 PNG files.<br><a href="<?SPINE_Images?>bluerain_style.jpg"><img src="<?SPINE_Images?>bluerain_style.jpg" width="455" height="526" border="1"></a><br><br>

<u>Step 2: Upload the images</u><br>
Make sure that you rename the image files before uploading them. Other designs may have images with the same name already in place. A clean way to keep style images separated is by prefixing them with the style name (e.g. <tt>header_bg.png</tt> becomes <tt>bluerain_header_bg.png</tt>).<br><br>
<u>Step 3: Creating the CSS</u><br>
The design includes a file called <tt>screen.css</tt> in the styles directory. In the Content Administration, create a new <b>content</b>. Enter <tt>bluerain.css</tt> in the text field and click on the <b>Create</b> button. Open the <tt>bluerain.css</tt> file in a text editor (Wordpad will do) and select all the text. Copy/paste the text into the large textarea in the Content Administration. Remember how we renamed the images? We need to update the CSS file to reflect those changes. Look for the following lines and change them:
<br>
<table border="2">
<tr><td><b>From</b></td><td><b>To</b></td></tr>
<tr><td><tt>	background : #2b548c url(''..<?SPINE_Images?>header_bg.png'') repeat-x bottom left;</tt></td><td><tt>	background : #2b548c url(''.<?SPINE_Images?>bluerain_header_bg.png'') repeat-x bottom left;</tt>
</td></tr></table>

<br>
You can leave the most of the Content attribute fields as-is but make sure to change the <strong>style</strong> to <tt>blank</tt>. Set the <strong>Content-type</strong> to <tt>text/css</tt>. You can access the <b>Content-type</b> field by clicking on the <b>Advanced</b> button at the top. Optionally you can define some comments in the <b>Comments</b> field, for instance
<br>
<pre class="block">This CSS is part of the Blue Rain design, which was made freely available on Open Source Web Design (http://www.oswd.org) by Rowan Lewis (http://www.oswd.org/user/profile/id/11508). 
</pre>
<br>
Instead of creating the CSS file as a content, you can also just upload it to your website document root. The downside is that you wont be able to manage the document within Spine.<br><br>
<u>Step 4: Creating the style</u><br>
Open the Style Administration and create a new style called <tt>bluerain</tt>. Enter the style name into the text field and click on the <b>Create</b> button. Open the <tt>index.html</tt> file from the ZIP archive into a text editor (Wordpad will do) and select all the text. Copy/paste the selected text into the large textarea marked <b>Contents</b>. Here comes the tricky part (read all of this before you actually do it). This is where you need to remove the body predefined in the template and replace it with a tag that Spine will transliterate to the Content. In the Style contents, look for <tt>&lt;div id=&#34;content&#34;&gt;</tt>. Remove everything between that <tt>div</tt> tag up until the <tt>&lt;/div&gt;&lt;div id="panel"&gt;</tt> after that. Instead of the text you removed, insert the following string
<br>
<pre class="block">&lt;?SPINE_Content?&gt;
</pre>
<br>
This means that you should end up with something like
<pre class="block">&lt;div id="content"&gt;
&lt;div class="article"&gt;
&lt;h2>&lt;?SPINE_Title?&gt;&lt;/h2&gt;
&lt;?SPINE_Content?&gt;
&lt;/div&gt;
&lt;/div&gt;v
&lt;div id="panel"&gt;
</pre>
<br>
Now look for the HTML Title tag at the top

<tt>&lt;title&gt;Blue Rain&lt;/title&gt;</tt>
Replace it with <tt>&lt;title&gt;&lt;?SPINE_Title?&gt;&lt;/title&gt;</tt>. In the Title attribute field, add whatever you want to be included as part of the page title. The page title is composed from both the title attribute defined in the style as the title attribute defined in the content. Leave the style title attribute empty if you wish to only include the content attribute in the style.<br>Replace the CSS filename in the header with the filename of the CSS file ze created:
<br><pre class="block">&lt;link rel="stylesheet" title="Normal" type="text/css" media="screen" href="./styles/screen.css" /&gt;</pre>to
<pre class="block">&lt;link rel="stylesheet" title="Normal" type="text/css" media="screen" href="bluerain.css" /&gt;</pre>
<br>
<u>Step 5: Creating a new Navbar</u><br>
This section does not cover the details of Navigation Bar management but discusses just enough to integrate a new navigation bar in the style. In the Navbar Administration, select the <tt>main</tt> navbar from the <b>Copy</b> list, enter <tt>bluerain</tt> in the textfield and click on the <b>Copy</b> button. Open the newly copied Navbar by selecting <tt>bluerain</tt> from the <b>Edit</b> list and clicking the <b>Edit</b> button. In the <b>Separator</b> field at the top, enter <tt>&lt;/li&gt;&lt;li&gt;</tt> and click on the <b>Save</b> button.<br><br>

<u>Step 6: Adding the Navigation Bar to the Style</u><br>
Open the Style Administration again and open the <tt>bluerain</tt> style you created earlier. Look for the <tt>menu</tt> div and change it:
<pre class="block">&lt;div id="menu"&gt;
&lt;ul&gt;
&lt;li class="selected"&gt;&lt;a href="./index.html"&gt;Home&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href="./index.html"&gt;Forums&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href="./index.html"&gt;Members&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href="./index.html"&gt;Search&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;
</pre>
to
<pre class="block">&lt;div id="menu"&gt;
&lt;ul&gt;
&lt;li&gt;&lt;?SPINE_Navbar(&#34;bluerain&#34;)?&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;
</pre><br>
<u>Step 7: Wrapping it up</u><br>
The final touches! Look for

<pre class="block">&lt;div id="header"&gt;
&lt;h1&gt;Blue Rain&lt;/h1&gt;
&lt;/div&gt;
</pre>
and change it to something like
<pre class="block">&lt;div id="header"&gt;
&lt;h1&gt;&lt;?SPINE_Sitename?&gt;&lt;/h1&gt;
&lt;/div&gt;
</pre>

<u>Step 8: Test it</u><br>

Open the Content Administration and load the <tt>lorem.html</tt> content. Select <tt>bluerain</tt> from the list and click the <b>Save</b> button. Open <tt>lorem.html</tt> in a second browser window.
', 'This is a very quick way to start editing pages in SPINE.', '');
INSERT INTO content VALUES (58, 'pg_setup.txt', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'Setting up initial user accounts in Postgresql
----------------------------------------------

Although quite trivial, the following might help you setting up the database and user permissions for Spine. 

root@lua:/tmp/Spine-1.1$ su - postgres
postgres@lua:~1$ cd /tmp/Spine-1.1
postgres@lua:/tmp/Spine-1.1$ createdb $database
CREATE DATABASE
postgres@lua:/tmp/Spine-1.1$ psql $database < /tmp/Spine-1.1/psql-struct.sql
...


postgres@lua:/tmp/Spine-1.1$ psql $database < /tmp/Spine-1.1/mysql3-data.sql
...

postgres@lua:/tmp/Spine-1.1$ createuser -D -A -E -P $username
Enter password for new user:
Enter it again:
CREATE USER
postgres@lua:/tmp/Spine-1.1$

postgres@lua:/tmp/Spine-1.1$ perl -e''for(qw(adminaccess attribute content macro message messagegroup navbarbuttons navbars revision session statistics style usergroup users wiki)) { print "GRANT ALL ON $_ to $ARGV[0];
GRANT ALL ON ".$_."_id_seq to $ARGV[0];
" }'' $username | psql $database

The following variables are used: 
 
$database : The database name. This value is used in the httpd.conf ''dbname'' value.  
$username : The username. This value is used in the httpd.conf ''dbuser'' value. 
$password : The password. This value is used in the httpd.conf ''dbpwd'' value. 
', 'This is where you put comments about this content', 'text/plain');
INSERT INTO content VALUES (59, 'apache-conf.incl', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<IfModule mod_perl.c>
 # PerlModule Apache::DBI
 # Remove the # above if you have Apache::DBI installed and you wish to use it

  <Location /spine>
           SetHandler perl-script
           PerlHandler Apache::SPINE::Index
           PerlSetVar dbd mysql
           PerlSetVar dbname spine
           PerlSetVar dbuser user
           PerlSetVar dbpwd password
           PerlSetVar main index.html
           PerlSetVar webmaster ''John Doe''
           PerlSetVar sitename ''SPINE Example site'' 
           PerlSetVar chroot /home/www/html
           PerlLogHandler Apache::SPINE::Log
  </Location>

</IfModule>', 'This is where you put comments about this content', 'text/plain');
INSERT INTO content VALUES (60, 'mintchocolate.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:35:26', 'admin', 'users', '1010', '/* Mint Chocolate Chip - (c) 2006 andrewstrojny.com */
/* You may use this CSS and use its techniques in your own projects, but keep in mind the unique combination of images, colors, sizes, typography, and positioning ("the design") is copyright (c) 2006 Andrew Strojny */ 
/* Enjoy! */
/* ----- Structure and Layout ----- */
body {
	text-align : center;
	background-color: #A9CF9C;
	min-width : 770px ;
	}

#wrapper {
	width : 770px;
	text-align : left ;
	margin-left : auto ;
	margin-right : auto ;
	}

#header {
	padding-top: 10px;
	}

#maincontainer {
	float: left;
	width : 770px;
	background: url(<?SPINE_Images?>mintchocolate_container.png) repeat-y;
	}

#padding {
	clear: both;
	padding: 30px 0 0 0;
	}

#content {
	float: left;
	width: 375px;
	padding: 0 0 10px 40px;
	}

#newsbox {
	float: right;
	padding: 5px 0 0 0;
	}
	
#innernews {
	width: 250px;
	margin: 0 40px 0 0;
	padding: 10px 10px 10px 10px;
	background: #EDF3EB;
	border: 1px solid #DCEAD7;
	}

/* ----- Navigation -----  */

#nav {
	float: left;
	padding: 0 0 2px 13px;
	margin: 0;
	}
	
#navinner {
	float: left;
	width: 743px;
	height: 41px;
	background: #A9CE9B;
	border-top: 2px solid #87BA74;
	border-bottom: 2px solid #87BA74;
	}

#nav ul {
	margin: 0;
	padding: 0 0 0 15px;
	list-style: none;
	}
	
#nav li {
	float: left;
	margin: 0;
	padding: 0 0px 0 0;
	}

#nav li a {
	float: left;
	text-align: center;
	margin: 5px 0 0 0;
	padding: 4px 12px;
	font-weight: bold;
	text-decoration: none;
	color: #F1F7EE;
	border-bottom: 2px solid #A9CE9B;
	border-right: 2px solid #A9CE9B;
	}

#nav li a:hover {
	color: #FFFFFF;
	border-bottom: 2px solid #6CAB54;
	border-right: 2px solid #6CAB54;
	background: #86BA72;
	}

#nav li a.active {
	color: #FFFFFF;
	background: #86BA72;
	border-bottom: 2px solid #6CAB54;
	border-right: 2px solid #6CAB54;
	}

/* ----- Typography ----- */

body {
	font: small Verdana, Sans-serif;
	line-height: 1.6em;
	color: #444444;
	}

h1 {
	padding-top: 10px;
	font-size: 1.2em;
	color:#422100
	}

h2 {
	font-size: 1em;
	font-style:italic;
	color: #422100;
	}

#innernews p {
	margin-left: 10px;
	padding: 0 10px 0 10px;
	border-left: 1px dashed #422100;
	font-size: .8em;
	line-height: 1.2em;
	}

/* ----- Links ----- */

a {
	color: #6CAB54;
	}

a:visited {
	color: #422100;
	}

a:hover {
	color: #422100;
	}

#footer a {
	color: #333333;
	text-decoration: none;
	}

#footer a:visited {
	color: #333333;
	text-decoration: none;
	}

#footer a:hover {
	color: #422100;
	text-decoration: underline;
	}

/* ------ Footer ----- */

#footer {
	text-align: center;
	clear:both;
	font-size: .8em;
	color: #666666;
	}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (61, 'nightcity.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:36:50', 'admin', 'users', '1010', 'body{ font-family: Arial, Helvetica, sans-serif; color: Black; background-color: White; font-size: 10pt; background-image: url(<?SPINE_Images?>nightcity_bg_body.gif); background-repeat: repeat-x; margin: 0;  padding: 0;  }
p{	font-size : 10pt; }
a{	font-family : Arial, Helvetica, sans-serif;	color : #B90000;	font-size : 10pt;}
a:hover{	text-decoration : underline;  color: #FF2424; }
form{	margin: 0px;}
input{ font-family: Tahoma;  font-size: 12px;  }

/* HEADER
-------------------------------------------------------------------------*/
#HEADER{ display: block; height: 117px; padding:0; margin:0;  background-position: top right;  background-repeat: no-repeat;  background-image: url(<?SPINE_Images?>nightcity_bg_header.jpg);   }
	#HEADER h1{ width: 471px; position: absolute;  top: 0;  left: 0;     height: 112px;  background-image: url(<?SPINE_Images?>nightcity_bg_logo_deep.gif); background-repeat: no-repeat; padding: 0 0 0 23px; margin: 0;  display: inline;              }
	#HEADER h1 a{ display: block;  padding: 0 22px 0 22px;  width: 130px;   line-height: 52px; border-top: 3px solid #9E0000; background-color: #CD0000; height: 52px; color: White; font-family: "Times New Roman", Times, serif; font-size: 20px; margin: 0; text-decoration: none;  display: block;  font-weight: normal;    }
	#HEADER h1 a:hover{	background-color: #E60000;}
	#HEADER p.NextPage{ margin: 32px 0 0 0; display: inline; width: 20px; float: right;    }
	#HEADER p.NextPage a{ width: 20px; height: 19px; background-color: #CD0000; background-image: url(<?SPINE_Images?>nightcity_next_page.gif); background-repeat: no-repeat; display: block; color: #CD0000; }
	#HEADER p.NextPage a:hover{ background-color: #E60000; background-image: url(<?SPINE_Images?>nightcity_next_page.gif); background-repeat: no-repeat; color: #E60000; }
	#HEADER ul{ list-style: none; margin: 87px 0 0 0; padding: 0; display: inline; float: right; display: block;  border-bottom: 5px solid #004278;  position: relative;  left: 20px;       }
	#HEADER li{ float:left; margin: 0;  padding: 0 27px 0 5px; list-style: none; display: inline;  background-image: url(<?SPINE_Images?>nightcity_bg_topnav_li.gif);  background-repeat: repeat-y;    height: 25px;  line-height: 7px;      }
	#HEADER li a{  color: White; text-decoration: none;  font-size: 11px;  font-family: Tahoma, Arial, Helvetica, sans-serif;         }
	#HEADER li a:hover{ text-decoration: none; position: relative; top: -1px; }

/* NAV LINE
--------------------------------------------------------------------------*/
#PATH{ display: block; height:48px;  padding-left: 220px; margin:0; }
	#PATH p{ padding: 29px 0 0 0; margin: 0; font-size: 8pt; color: #B90000; font-weight: bold; }
	#PATH a{ text-decoration: none; color: Black; font-size: 8pt;  font-weight: normal;  }
	#PATH a:hover{ text-decoration: none; position: relative; top: -1px; }
	#PATH .Arrow{ color: Black; position: relative; top: -1px;  margin: 0 2px 0 2px;  }
	
/* CONTENT
--------------------------------------------------------------------------*/
#CONTENT{ display: block; margin: 27px 27px 27px 220px; }
	#CONTENT h1{ margin:0 0 0.5em 0; padding:0; line-height: 14pt; font-family: Arial, Helvetica, sans-serif;  font-weight: normal;  font-size: 14pt;  color: #225680;    }
	#CONTENT p{ text-align: justify; text-indent: 25px;  margin: 0 0 10px 0;  padding: 0;  }

#SIDEBAR{ width:151px; display: table-cell; margin-top: 27px; padding: 0px 23px 0 23px;  background-image: url(<?SPINE_Images?>nightcity_bg_vline.gif);  background-repeat: repeat-y;  background-position: right;  float: left;  margin-bottom: 20px;     }
	#SIDEBAR h1{ font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 11px; color: White;  background-color: #004278;  text-align: center;  font-weight: bold;  padding: 3px 0 3px 0;  margin: 0 0 17px 0;         }
	#SIDEBAR p{ text-align: justify;  margin: 0;  font-family: Arial, Helvetica, sans-serif;  font-size: 9pt;  padding-bottom: 3px;     }
	#SIDEBAR p.Date{ text-align: left;  font-size: 8pt; color: #B90000;  font-weight: bold;  line-height: 8pt;  margin: 0 0 3px 0;       }
	#SIDEBAR p.More{ text-align:right;  margin-top: 3px;  margin-bottom: 18px;   }
	#SIDEBAR p.More a{font-size: 8pt; color: #B90000;  text-decoration: none;  font-weight: bold;     }
	#SIDEBAR p.More a:hover{ text-decoration: underline; }

/* FOOTER
--------------------------------------------------------------------------*/
#FOOTER{ display: block; margin: 27px 27px 0 220px; padding: 0 0 20px 0; clear: both;  background-image: url(<?SPINE_Images?>nightcity_bg_footer.gif);  background-repeat: no-repeat;  background-position: right bottom;             }
	#FOOTER ul{  background-image: url(<?SPINE_Images?>nightcity_bg_hline.gif);  background-repeat: repeat-x;  list-style: none; margin: 0; padding: 5px 0 0 0;   display: block;              }
	#FOOTER li{  margin: 0;  padding: 0; list-style: none;  display: inline;                  }
	#FOOTER li a{ color: #004278; text-decoration: none; font-size: 9pt; font-family: "MS Sans Serif", Geneva, sans-serif;  margin-left: 6px;  margin-right: 6px;   }
	#FOOTER li a.First{ margin-left:0;}
	#FOOTER li a:hover{ text-decoration: underline; }
	#FOOTER p{ margin: 5px 0 0 0; font-family: "MS Sans Serif", Geneva, sans-serif; font-size: 9pt; }
	#FOOTER a{font-family: "MS Sans Serif", Geneva, sans-serif;  font-size: 9pt; 		color: Black;  text-decoration: none; 	 }
	#FOOTER a:hover{ text-decoration: underline; }', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (62, 'metro01.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:37:53', 'admin', 'users', '1010', 'body{
	font: 70%/1.4em Verdana,sans-serif;
	color: #333;
	background: #eee url(''<?SPINE_Images?>metro01_body_bg.png'') repeat-x;
}

a:link, a:visited, a:active{
	color:#333;
}
a:hover{
	text-decoration:none;
}

#wrap{
	width:760px;
	margin:0 auto;
}
#wrap_top{
	background:  url(''<?SPINE_Images?>metro01_tab_top_bg.gif'') top center no-repeat;
	height:5px;
}

#main{
	background:#fff;
	margin:0;
	overflow:hidden;
}

#head{
	margin:0;
	padding: 10px 5px 17px 5px;
	background:  url(''<?SPINE_Images?>metro01_title.jpg'') no-repeat;
	background-position: 50% 100%;
	height:140px;
}
#head .navbar{
	padding:0;
	margin:0;
}
#head .navbar li{
	display:inline;
}
#head .navbar li a{
	padding: 0 10px;
	font-weight:bold;
	font-size: 11px;
}
#head h1.title{
	color:#fff;
	font-size: 18px;
	text-transform:uppercase;
	text-align:right;
	margin:0;
	padding: 125px 10px 0 0;
}

#content{
	margin: 5px 0 0 0;
	width: 580px;
	padding: 0 20px 20px 20px;
	float:left;
	background:  url(''<?SPINE_Images?>metro01_content_sep.png'') repeat-y;
	background-position: 98.5% 0;
}
#content .entry{
	border-bottom: #ddd 1px solid;
	text-align:justify;
}
#content .entry p{
	margin: 0.2em 0 1.2em 0;
}
#content .entry h2{
	margin:25px 0 0 0;
}
#content .entry .links{
	margin:-8px 0 2px 0;
	text-align:right;
	letter-spacing:1px;
	font-size: 8px;
	color:#666;
}

#rightbar{
	width: 130px;
	padding: 10px 10px 10px 0;
	float:left;
}
#rightbar .box{
	margin: 5px 0 20px 0;
}
#rightbar .box h2{
	margin:0 0 2px 0;
	padding: 0;
	font-size: 13px;
	letter-spacing:1px;
	font-variant: small-caps;
	border-bottom: #666 1px solid;
}
#rightbar .box ul{
	margin:0;
	padding:0;
	list-style:none;
}
#rightbar .box li{
	padding: 2px 0;
}
#rightbar #desc.box{
	background:#eee;
	padding:10px;
}

#footer{
	clear:both;
	text-align:right;
	background: #ddd;
	padding: 10px;
	font-size:8px;
	color:#333;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (63, 'documentation/sourceforge.html', 'Sourceforge Project Information', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Sourceforge Project Information</h2>
<a href="http://sourceforge.net/tracker/?group_id=5799&atid=105799&_status=100&set=custom">Bugs</a><br>
<a href="http://sourceforge.net/project/stats/?group_id=5799&ugn=spine Activity"> Statistics</a><br>
<a href="http://sourceforge.net/tracker/?atid=305799&group_id=5799&func=browse&set=custom&_status=100"> Patches</a><br>
<a href="http://sourceforge.net/forum/?group_id=5799"> Forums</a><br>
<a href="http://sourceforge.net/docman/index.php?group_id=5799"> Documentation on Sourceforge</a><br>
<a href="http://sourceforge.net/news/?group_id=5799"> News</a>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (64, 'documentation/mysqldb.html', 'Using MySQL with Spine', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Using MySQL with Spine</h2>
Create a Database in mysql, e.g. spine (consult the mysql manpages for extra options):
<pre class="block">
  bash# mysql mysql -p </pre>

in the mysql shell :
<pre class="block">
  mysql>  create database spine;</pre>
Then exit the shell and import the structure:
<pre class="block">
  bash# mysql spine -p &lt;mysql3-struct.sql</pre>
Once the database structure is set-up, insert the data:
<pre class="block">
  bash# mysql spine -p &lt;mysql3-data.sql</pre>

Database permissions <b>might</b> have to be defined. The following SQL statement creates a user in MySQL: 
 
<pre class="block">GRANT ALL PRIVILEGES ON $database.* TO ''$username''@''localhost'' IDENTIFIED BY ''$password''; </pre>
 
The following variables are used: 
 <ul>
<li>$database : The database name. This value is used in the httpd.conf ''dbname'' value.  </li>
<li>$username : The username. This value is used in the httpd.conf ''dbuser'' value.  </li>
<li>$password : The password. This value is used in the httpd.conf ''dbpwd'' value.  </li>
 </ul>
In the MySQL shell, create users as follows: 
 
<pre class="block">root@lua:~ # mysql -p mysql 
Enter password: 
Welcome to the MySQL monitor. Commands end with ; or g. 
Your MySQL connection id is 119 to server version: 4.0.24_Debian-10ubuntu2-log 
 
Type ''help;'' or ''h'' for help. Type ''c'' to clear the buffer. 
 
mysql> GRANT ALL PRIVILEGES ON spine.* TO ''spine''@''localhost'' IDENTIFIED BY ''spine''; 
Query OK, 0 rows affected (0.00 sec) 
 
mysql> 
 </pre>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (65, 'documentation/postgresqldb.html', 'Using Postgresql with Spine', 0, 'main', 'main', 1, '', '2007-08-25 23:24:38', 'admin', 'users', '1010', '<h2>Using Postgresql with Spine</h2>
To set up the necessary accounts, the following steps might be helpful (your mileage may vary). To add the username and password details to your PostgreSQL
server, first use the <a href="http://spine.sourceforge.net/createuser.html">online password generation tool</a> to generate the SQL statement. The statement should be one line and look something like this:
<pre class="block">insert into users (email,fullname,login,password,usergroup) values (''your@mail.address'',''Full Name'',''admin'',''42d8f24f95eca688cbeaa768b8ae61af'',''admin'');
</pre>

Now log into your PostgreSQL server. You woudl normally have to switch to the postgres user:
<pre class="block"># su - postgres
# ENTER THE postgres PASSWORD
</pre>
Once logged in, use the psql command to enter the spine database:
<pre class="block"># psql spine</pre>

Then enter the SQL statement:

<pre class="block">spine=# insert into users (email,fullname,login,password,usergroup) values (''your@mail.address'',''Full Name'',''admin'',''42d8f24f95eca688cbeaa768b8ae61af'',''admin'');</pre>

Now import the
</pre>
<pre class="block"># su - postgres
# createdb $database
CREATE DATABASE
# psql $database &lt; psql-struct.sql
...

# psql $database &lt; mysql3-data.sql
...

# createuser -D -A -E -P $username
Enter password for new user:
Enter it again:
CREATE USER
#

# perl -e''for(qw(adminaccess attribute content macro message messagegroup navbarbuttons navbars revision session statistics style usergroup users wiki)) 
{ print &#34;GRANT ALL ON $_ to $ARGV[0];
GRANT ALL ON &#34;.$_.&#34;_id_seq to $ARGV[0];
&#34; }'' $username | psql $database
</pre>

<p>
The following variables are used: 
 
</p>
<ul><li>$database : The database name. This value is used in the httpd.conf ''dbname'' value.  </li>
<li>$username : The username. This value is used in the httpd.conf ''dbuser'' value. </li>
<li>$password : The password. This value is used in the httpd.conf ''dbpwd'' value. </li>
</ul>
With that done you should be able to log into the Spine administration area.', 'Postgresql Installation steps. Additional information by Rodney Gedda', '');
INSERT INTO content VALUES (66, 'gscape.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:39:22', 'admin', 'users', '1010', '/*Style sheet for GScape must be included to with HTML.*/
/*Styles for body.*/
body
{
	margin:0 auto;
	padding:0;
	font:76% Verdana, Helvetica, Tahoma, Arial, sans-serif;
	background-color:#6B74AE;
	color:#494949;
}

/*Styles for main content which will be wrapped to centere with a black border. */
#MainWrapperBlack
{
	margin:0 auto;
	width:751px;
	background-color:#ffffff;
	border:solid 1px #000000;
}

/*Styles for main content which will be wrapped to centere with a gray border inside balck border. */
#WrapperGray
{
	margin:0 auto;
	padding:5px 5px 5px 5px;
	width:737px;
	background-color:#ffffff;
	border:solid 2px #ACABC4;
}

/*Styles for the main header at the top. */
#Header
{
	margin:0 0 10px 0;
	height:144px;
	background:#6B74AE url(<?SPINE_Images?>gscape_header.jpg) top left no-repeat;
	font-family:Verdana, Helvetica, Arial, sans-serif;
}
#Header h1
{
	margin:0 auto;
	padding:10px 0 0 21px;
	color:#000000;
	font-size:4em;
	font-weight:normal;
	font-family:inherit;
}
#Header h2
{
	margin:0 auto;
	padding:4px 0 0 22px;
	color:#ffffee;
	font-size:1.6em;
	font-weight:normal;
}

/*Styles for the Title of the page with shadow effect. */
#Title
{
	margin:-72px 0 0 0;
	padding:10px 0 0 19px;
	background-color:Transparent;
}
#Title a
{
	color:#ffffff;
	text-decoration:none;
	background-color:inherit;
	font-size:4em;
	font-weight:normal;
	font-family:inherit;
}

/*Styles for the main header menus. */
#HeaderMenus
{
	padding-left:11px;
	height:1.2em;
	line-height:1.2em;
	color:#000000;
}
#HeaderMenus ul
{
	margin:22px 0 0 0;
	padding:0 0 0 0;
	color:#000000;
}
#HeaderMenus li
{
	color:#000000;
	list-style-type:none;
	float:left;
}
#HeaderMenus li a
{
	padding:0 10px 14px;
	display:block;
	text-decoration:none;
	color:#660066;
	font-size:1.5em;
	font-family:Geneva, Arial, Helvetica, sans-serif;
}
#HeaderMenus a:hover
{
	text-decoration:none;
	color:#000000;
}
#HeaderMenus .selected
{
	color:#000000;
}

/*Styles for the right columms. */
#RightColumn
{
	margin:0 auto;
	padding:0 0 0 0;
	width:26%;
	float:right;
}

/*Styles for the Login Button in the right column. */
#LoginSubmit
{
	margin:4px 0;
	border:1px solid #899aba;
	text-align:center;
	font-size:0.9em;
}

/*Styles for the container that wrappas the contents to left side. */
#LeftContainer
{
	margin: 0 186px 0 0;
}

/*Styles for the main contets in the page. */
#LeftContents
{
	padding: 0 20px 0 12px;
	line-height: 1.6em;
}
#LeftContents h2
{
	margin:0 auto;
	padding:4px 0 4px 0;
	background-color:#F2F3F7;
	font-family: "Book Antiqua", Helvetica, Tahoma, Arial, sans-serif;
	border:1px solid #899aba;
	text-align: left;
	color:#000000;
	font-size: 1.6em;
}
#LeftContents p
{
	background-color:inherit;
	text-align: justify;
	color:#494949;
}
#LeftContents a
{
	background-color:inherit;
	text-decoration: none;
	color: #000080;
}
#LeftContents img
{
	background-color:inherit;
	border: 2px solid #79A3C1;
	display:inline;
	color: inherit;
}

/*Styles for the page footer. */
#Footer
{
	margin:6px 0 0 0;
	padding:4px 0 4px 11px;
	background-color:#575F9F;
	border:solid 1px #000000;
	text-align:left;
	color: #ffffff;
}
#Footer a
{
	background-color: inherit;
	text-decoration: underline;
	color:#ffffff;
}

/*The general classes used throughout the page. */
/*Classes for adding the rounded corner images. */
.TopRight
{
	float:right;
	height:11px;
	width:11px;
	background-repeat:no-repeat;
	background-image:url(<?SPINE_Images?>gscape_CrTopRight.gif);
}
.TopLeft
{
	float:left;
	height:11px;
	width:11px;
	background-repeat:no-repeat;
	background-image:url(<?SPINE_Images?>gscape_CrTopLeft.gif);
}
.BottomRight
{
	margin:-11px 0 0 0;
	float:right;
	height:11px;
	width:11px;
	background-repeat:no-repeat;
	background-image:url(<?SPINE_Images?>gscape_CrBottomRight.gif);
}
.BottomLeft
{
	margin:-11px 0 0 0;
	float:left;
	height:11px;
	width:11px;
	background-repeat:no-repeat;
	background-image:url(<?SPINE_Images?>gscape_CrBottomLeft.gif);
}

/*The general class for the contents in the right column. */
.RightContents
{
	margin:0 auto;
	padding:8px 7px 8px 7px;
	background-color:#F2F3F7;
	border:1px solid #899aba;
	line-height:1.4em;
}
.RightContents h3
{
	margin: 5px 0 0 0;
	padding: 0 0 8px 0;
	background-color:inherit;
	color:#575F9F;
	text-align:left;
	font-size: 1.3em;
}
.RightContents h4
{
	font-size: 1em;
	margin: 5px 0 0 0;
	background-color:inherit;
}
.RightContents p
{
	margin: 0 0 14px 0;
	text-align: justify;
	background-color:inherit;
	color: #000000;
	font-size: 90%;
}
.RightContents a
{
	background-color:inherit;
	text-decoration: none;
	color: #000066;
}

/*The class for comments in the main contents. */
.Comments
{
	background:inherit;
	border-top:solid 1px #dcdcdc;
	border-bottom:solid 1px #dcdcdc;
	text-align:right;
	color: #000000;
	font-size:1em;
}

/*Classes for aligning the images in the main conetes. */
.AlignLeft
{
	margin: 10px 10px 5px 0;
	float: left;
}
.AlignRight
{
	margin: 10px 0 0 10px;
	float: right;
}

/*Class filling the left column. */
.Fill
{
	margin:0;
	clear:both;
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (67, 'index.html', 'About', 0, 'main', 'main', 1, 'test', '2008-06-15 18:15:10', 'admin', 'users', '1010', '<h2>SPINE : The backbone for your website</h2><br>
SPINE is a webbased Content Management System, implemented in <a href="http://www.perl.org/">Perl</a> and released under the <a href="http://www.gnu.org/licenses/gpl.html">GPL (GNU Public License)</a>. It requires <a href="http://www.linux.org/">a Unix flavoured webserver</a>, a database (<a href="http://www.postgresql.org/">postgresql</a> or <a href="http://www.mysql.com/">mysql</a>), a default <a href="http://httpd.apache.org/">Apache</a> installation and <a href="http://perl.apache.org/">mod_perl</a>.
It features mixed static/dynamic content, separated template and
content administration, granular privileges, userfriendly URLs,
plugins, ... Check the <a href="features.html">features</a> page.
<h2 class="news">Developers Needed</h2>
<br>
SPINE has been under development for roughly 5 years. The mod_perl version was released 2 years ago. We''re approaching a stable release but we also could use some help. Are you a good copywriter? Are you an aspiring perl developer? Do you have leet designer skills? Your help is appreciated!
<?SPINE_Message("news")?>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (68, 'developers.html', 'Spine Developers', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Spine is developed by:</h2>
<ul>
<li>Hendrik Van Belleghem (<a href="http://sourceforge.net/users/beatnik/">Contact</a>): project leader</li>
<li>Tielman de Villiers: Functionality, patches & bugs, documentation</li>
<li>Jan Henning Thorsen: Documentation, development, functionality, templates</li>
</ul>', 'Listing of the different people involved in this project.', '');
INSERT INTO content VALUES (69, 'bluerain.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:39:52', 'admin', 'users', '1010', '* {
	margin : 0;
	padding : 0;
}

a {
	color : #437fda;
	text-decoration : none;
}
a:visited {
	color : #437fda;
	text-decoration : underline;
}
a:hover {
	color : #ba8f43;
}

h2 {
	color : #343434;
	font : italic 200% sans-serif;
}
h3 {
	color : #343434;
	font : italic 160% sans-serif;
}
h4 {
	color : #343434;
	font : bold italic 110% sans-serif;
	padding : 1em 1em 0 1em;
}

html {
	color : #565656;
	font : 70%/170% sans-serif;
	text-align : justify;
}

img {
	margin : 1em 1em 0 1em;
}
img.left {
	float : left;
	margin : 1em 1em 0 0;
}
img.right {
	float : right;
	margin : 1em 0 0 1em;
}

blockquote {
	font-style : italic;
	margin : 1em 1em 0 1em;
	padding : 0 0 1em 0;
}
blockquote span {
	font-size : 200%;
	line-height : 1%;
	margin : 0 0.15em;
	position : relative;
	top : 0.25em;
}

form button {
	background : #ffffff;
	border : 1px solid #cfcfcf;
	padding : 0.25em;
	margin : 0 0 0 0.75em;
}
form input {
	border : none;
	width : 100%;
}
form textarea {
	border : none;
	width : 100%;
	height : 10em;
}
form p.button {
	text-align : right;
}
form p.input,
form p.text {
	background : #ffffff;
	border : 1px solid #cfcfcf;
	padding : 0.25em;
	margin : 0.25em 1em 0 1em;
}

p {
	padding : 1em 1em 0 1em;
}

ul,
ol {
	padding : 1em 1em 0 3em;
}

#main {
	margin : auto;
	max-width : 65em;
	min-width : 40em;
	width : auto !important;
	width : 65em;
}

#header {
	background : #2b548c url(''<?SPINE_Images?>bluerain_header_bg.png'') repeat-x bottom left;
	padding : 6em 4em 1em 4em;
}
#header h1 {
	color : #ffffff;
	font : italic 200% sans-serif;
}

#menu {
	background : #437fda;
	border-bottom : 1px solid #2b548c;
	font : 100% sans-serif;
}
#menu ul {
	padding : 0.75em 4em;
}
#menu li {
	display : inline;
}
#menu li a {
	color : #ffffff;
	padding : 0.75em 1.5em;
}
#menu li a:hover {
	background : #2b548c;
}
#menu li.selected a {
	background : #ffffff;
	border : 1px solid #2b548c;
	border-bottom : 1px solid #ffffff;
	color : #437fda;
}
#menu li.selected a:hover {
	background : #ffffff;
	color : #ba8f43;
}

#content {
	border-bottom : 1px solid #cfcfcf;
	height : auto !important;
	height : 1%;
	overflow : hidden;
	padding : 2em 0 0 0;
}
#content div {
	padding : 0 4em 2em 4em;
}

#panel {
	background : #efefef;
	border : 1px solid #dfdfdf;
	border-bottom : 1px solid #cfcfcf;
	border-top : none;
	height : auto !important;
	height : 1%;
	overflow : hidden;
	padding : 0 5em 2em 5em;
}
#panel div {
	padding : 2em 0 0 0;
}
div.left {
	left : -1em;
	float : left;
	position : relative;
	width : 50%;
}
div.right {
	left : 1em;
	float : left;
	position : relative;
	width : 50%;
}

#footer {
	font-size : 85%;
	margin : auto;
	padding : 1em 0 3em 0;
	text-align : center;
	width : 65%;
}', 'This CSS is part of the Blue Rain design, which was made freely available on Open Source Web Design (http://www.oswd.org) by Rowan Lewis (http://www.oswd.org/user/profile/id/11508). ', 'text/css');
INSERT INTO content VALUES (70, 'neuphoric.css', '', 0, 'blank', 'main', 1, '', '2007-02-22 23:41:11', 'admin', 'users', '1010', 'body {
	margin: 0 0 1em 0;
	padding: 0;
	color: black;
	background-color: #eee;
	line-height: 130%;
	text-align: center;
}

#wrapper-header { background: #222; }

#header {
	background: #222 url(''<?SPINE_Images?>neuphoric_banner.jpg'') right no-repeat;
	width: 75%;
	height: 125px;
	line-height: 125px;
	margin: 0 auto;
	border-left: 1px solid #707070;
	border-right: 1px solid #707070;
	text-align: left;
}

#header h1 {
	margin: 0;
	padding: 0;
	color: #eee;
	font-size: 220%;
	padding-left: 10px;
	letter-spacing: -1px;
}

#wrapper-menu {
	background: #88ac0b url(''<?SPINE_Images?>neuphoric_menu-background.png'') top left repeat-x;
	float: left;
	width: 100%;
}

#menu {
	width: 75%;
	margin: 0 auto;
	font-size: 95%;
	white-space: nowrap; 
	padding-right: 2px;	
}

* html #menu { padding-right: 0; } 

#menu ul {
	margin: 0;
	padding: 0;
	list-style: none;
	float: left;
	border-left: 1px solid #95bc0e;
	border-right: 1px solid #95bf0f;
	width: 100%;
}

#menu li { display: inline; }

#menu a:link, #menu a:visited {
	padding: 0.25em 1em;
	background: transparent;
	color: #fff;
	text-decoration: none;
	float: left;
	border-right: 1px solid #95bc0e;
}

#menu a:hover {
	background: #b6e41c url(''<?SPINE_Images?>neuphoric_menu-hover.png'') repeat-x;
	color: #485b06;
}

#content {
	width: 73%; /* 73% because it has 1% padding on each side, which brings it to 75% wide */
	margin: 0 auto;
	padding: 3.5em 1% 20px 1%;
	border-left: 1px solid #bbb;
	border-right: 1px solid #bbb;
	background: white;
	font-size: 90%;
	text-align: left;
}

* html #content { padding-top: 1.8em; } /* Set padding top in IE to 20px */

#footer {
	margin: 0 auto;
	padding: 2px 1%;
	width: 73%;
	text-align: right;
	color: white;
	letter-spacing: 0.15em;
	background: #88ac0b url(''<?SPINE_Images?>neuphoric_menu-background.png'') top left repeat-x;
	border: 1px solid #a0c80e;
	font-size: 80%;
}

h2 {
	color: #666;
	padding-bottom: 3px;
	border-bottom: 1px solid #a0c80e;
	font-size: 150%;
	letter-spacing: -1px;
}

a:link, a:visited {
	color: #260;
	text-decoration: none;
}

a:hover {
	color: #000;
	text-decoration: underline;
}

p { margin-left: 1em; }', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (71, 'progress_ie.css', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'html
{
	overflow:hidden}

body
{height:100%; width:100%; overflow:auto;}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (72, 'progress_menu.css', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '.navcontainer { width: 200px; }

.navcontainer ul
{
margin-left: 0;
margin-top: 0;
padding-left: 0;
list-style-type: none;
}

.navcontainer a
{
display: block;
padding: 3px 15px;
width: 170px;
background-color: #555;
border-bottom: 1px dashed #999;
}

.navcontainer a:link, .navlist a:visited
{
color: #EEE;
text-decoration: none;
}

.navcontainer a:hover
{
background-color: #444;
color: #fff;
}

#topmenu
{
	border-top: 1px dashed #999;
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (73, 'progress_style.css', '', 0, 'blank', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'body
{
	margin: 0;
	padding: 0;
	background-color: #FFF;
	font-family: trebuchet ms, verdana, tahoma, arial;
	font-size: 75%;
	line-height: 200%;
}

img
{
	border: 0px;
}

body > #menu
{
	position: fixed;
}

a:active, a:visited, a:link
{
	color: #5E8E3E;
	text-decoration: underline;
}

a:hover
{
	color: #000000;
	text-decoration: none;
}

#menu
{
	position: absolute;
	top: 0;
	left: 0;
	width: 200px;
	height: 100%;
	overflow: auto;
	background-color: #555;
	border-right:1px solid #000;
}

#menutop
{
	width: 200px;
	height: 200px;
	border-bottom:1px solid #808080;
	background-color: #444;
}

#main
{
	width: 540px;
	margin-left: 200px;
	padding: 20px;
}


#main h2
{
	border-bottom: 1px solid #808080;
	font-family: arial;
	font-weight: 100;
	letter-spacing: 8px;
	font-size: 200%;
	text-align: right;
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (74, 'littlehome_style.css', '', 0, 'blank', 'main', 1, '', '2008-04-25 18:50:16', 'admin', 'users', '1010', 'body {
	font-family: Trebuchet MS, Arial, Helvetica;
	font-size: 11px;
	background-color: #80033E;overflow-x:hidden;
}

#content a:link, a:visited, a:active {
	color: #B37894;
	text-decoration: none;
}
a:link, a:visited, a:active {
	color: #B37894;font-size:13px;
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}

#content a:hover {
	text-decoration: underline;
	color: #B37894;
}
#content a {
	text-decoration: none;
	color: #B37894;
}

#thebox {
	width: 50em;
	background-color: white;
	color: #666;
	border: 1px rgb(75,55,52) solid;
	margin: 10px auto 0px auto;
	padding: 0px 20px 0 20px
}

#logo { 
	text-align: center;
	width: 290px;
	margin: 0px 5px 30px -15px;
	padding: 50px 10px 5px 10px;
	color: #000000;
	font-family: Trebuchet MS, Arial, Helvetica;
	font-weight: normal;
	font-size: 19px;
	letter-spacing: 4px;
	
}
#headtag{
	background: url(''<?SPINE_Images?>littlehome_sakura.jpg'') no-repeat;
	height:150px;
}
#logo strong{
	color:#B37894;font-style: italic;letter-spacing: 1px;margin-left:5px;font-size:20px;
}

#nav {	text-align:right;
	width: 455px;
	margin: -65px 0px 50px 100px;
	padding: 0px 0px 0px 0px;
	color: #999;
	font-family: Trebuchet MS, Arial, Helvetica;
	font-weight: normal;
	font-size: 11px;letter-spacing: 2px;
}

#nav li {
	list-style: none;
	display: inline;
	margin-right: 10px;
}

#nav a {
	
	font-size: 15px;
	font-weight: bold;
	color: rgb(128,3,62);
	text-decoration: none;margin-left:10px;
}

#nav a:hover {
	color: rgb(128,3,62);
	text-decoration: underline;
}

#content p{
margin-right:130px;
}

#floatright{font-size:14px;
float:right;
}

#content {
	color: #666;
	font-family:Trebuchet MS, Arial, Helvetica;
	margin: 0px 0px 0px 0px;
	padding: 0px 10px 10px 10px;font-size:13px;
}

#content h1,h2 {

font-size: 15px;
text-decoration: none;
	font-family:Trebuchet MS, Arial, Helvetica;
	color: #B37894;
}

#content h1,h2 a:link, a:visited, a:active {
	color: #80033E;
	font-family:Trebuchet MS, Arial, Helvetica;
	
	font-weight: normal;
}

#content h1,h2 a:hover {
	text-decoration: underline;
	font-family:Trebuchet MS, Arial, Helvetica;
	color: #B37894;
}

#content h3,h4 { 
font-size: 12px;
letter-spacing: 3px;
font-weight: normal;
}

#foot {

text-align: center;
color: #fff;
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (75, 'wizard.js', '', 0, 'blank', 'main', 1, '', '2008-07-16 23:26:04', 'admin', 'users', '1010', 'var tinyMCEmode = false;

function getCookie(c_name)
{ if (document.cookie.length>0)
  { c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1)
    { c_start=c_start + c_name.length+1;
       c_end=document.cookie.indexOf(";",c_start);
       if (c_end==-1) { c_end=document.cookie.length; }
       return unescape(document.cookie.substring(c_start,c_end));
    } 
  }
return ""
}

function toogleEditorMode(sEditorID) {
    try {
        if(tinyMCEmode) {
            tinyMCEmode = false;
            tinyMCE.execCommand("mceRemoveControl",tinyMCEmode,"body");
            $(''#switch'').text(''Text'');
        } else {
           tinyMCEmode = true; 
           tinyMCE.execCommand("mceAddControl", tinyMCEmode, "body");
            $(''#switch'').text(''Visual'');
        }
    } catch(e) {
        //error handling
    }
}
', 'This is where you put comments about this content', 'application/x-javascript');
INSERT INTO content VALUES (76, 'spine.js', '', 0, 'blank', 'main', 1, '', '2008-04-29 23:17:40', 'admin', 'users', '1010', 'function getCookie(c_name)
{ if (document.cookie.length>0)
  { c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1)
    { c_start=c_start + c_name.length+1;
       c_end=document.cookie.indexOf(";",c_start);
       if (c_end==-1) { c_end=document.cookie.length; }
       return unescape(document.cookie.substring(c_start,c_end));
    } 
  }
return ""
}

function setCookie( name, value ) 
{var today = new Date();
  today.setTime( today.getTime() );
  var expires = new Date( today.getTime() + 1000*60*60*24*365 );
  var path = "<?SPINE_Location?>";
  document.cookie = name + "=" +escape( value ) + ";expires=" + expires.toGMTString() + ";path=" + path;
}

function getCheckedValue(radioObj) 
{ if(!radioObj)
  { return ""; }
  var radioLength = radioObj.length;
  if(radioLength == undefined)
  { if(radioObj.checked)
    { return radioObj.value; }
    else
    { return ""; }
  }
  for(var i = 0; i < radioLength; i++) 
  { if(radioObj[i].checked) 
    { return radioObj[i].value; }
  }
  return "";
}', 'This is where you put comments about this content', 'application/x-javascript');
INSERT INTO content VALUES (77, '.administration/action', 'Filetype Administration', 0, '.admin', 'main', 1, '', '2008-04-19 14:28:18', 'admin', 'admin', '0000', '<div name="adminpanel" class="fullpanel">
$error
<div class="panelcel" style="width: 10%"><b>File Extensions</b></div>
<div class="panelcel" style="width: 20%"><b>MIME Type</b></div>
<div class="spacercel"></div></div>
$list', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (78, 'tiny.html', 'Content Wizard', 0, 'main', 'main', 1, '', '2007-04-29 15:41:22', 'admin', 'users', '1010', '<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tinymce_init.js"></script>

<textarea id="body" cols="40" rows="10"></textarea>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (79, 'setstyle.html', '', 0, 'main', 'main', 1, '', '2007-05-04 00:42:42', 'admin', 'users', '1010', '<form name="form"><input type="text" name="style"></form><a href="#" onclick="document.cookie =''style=''+document.form.style.value+''; expires=Thu, 2 Aug 2007 20:47:11 UTC; path=/spine''; return false;">Click</a>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (80, '.admin.js', '', 0, 'blank', 'main', 1, '', '2007-05-06 23:38:05', 'admin', 'users', '1010', 'var http_request = false;
function makeRequest(meth, url, parameters) 
{ http_request = false;
  if (window.XMLHttpRequest) // Mozilla, Safari,...
   { http_request = new XMLHttpRequest();
     if (http_request.overrideMimeType) 
     { // set type accordingly to anticipated content type
       //http_request.overrideMimeType(''text/xml'');
       http_request.overrideMimeType(''text/html'');
     }
   } else 
   if (window.ActiveXObject) // IE
   { try 
     { http_request = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (e) 
     { try 
       { http_request = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (e) 
         {}
     }
   }
   if (!http_request) 
   { alert(''Cannot create XMLHTTP instance'');
     return false;
   }
   if (meth == "POST")
   { http_request.onreadystatechange = alertContents;
     http_request.open(''POST'', url, false);
     http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
     http_request.setRequestHeader("Content-length", parameters.length);
     http_request.setRequestHeader("Connection", "close");
     http_request.send(parameters);
     return http_request.status;
   }
   if (meth == "GET")
   { http_request.onreadystatechange = alertContents;
     http_request.open(''GET'', url, false);
     http_request.send(null);
  }
}
', 'This is where you put comments about this content', 'application/x-javascript');
INSERT INTO content VALUES (81, 'news.rss', '', 0, 'blank', 'main', 1, '', '2008-05-07 00:39:58', 'admin', 'users', '1010', '<?SPINE_RSS2Message("rssnews")?>', 'This is where you put comments about this content', 'text/plain');
INSERT INTO content VALUES (82, 'rss.item', '', 0, 'main', 'main', 1, '', '2008-05-07 00:39:22', 'admin', 'users', '1010', '   <item>
      <title><?SPINE_Message_Subject?></title>
      <link>http://lenore.local/spine/index.html?id=<?SPINE_Message_Id?></link>
      <description><?SPINE_Message_Body?></description>
      <pubDate>Tue, 03 Jun 2003 09:39:21 GMT</pubDate>
    </item>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (83, 'news2.rss', '', 0, 'blank', 'main', 1, '', '2008-05-07 08:31:09', 'admin', 'users', '1010', '<rss version="2.0">
  <channel>
    <title>Lift Off News</title>
    <link>http://liftoff.msfc.nasa.gov/</link>
    <description>Liftoff to Space Exploration.</description>
    <language>en-us</language>
    <pubDate>Tue, 10 Jun 2003 04:00:00 GMT</pubDate>
    <lastBuildDate>Tue, 10 Jun 2003 09:41:01 GMT</lastBuildDate>
    <docs>http://blogs.law.harvard.edu/tech/rss</docs>
    <generator>Weblog Editor 2.0</generator>
    <managingEditor>editor@example.com</managingEditor>
    <webMaster>webmaster@example.com</webMaster>
    <ttl>5</ttl>
<?SPINE_RSS2Message("rssnews")?> 
  </channel>
</rss>
', 'This is where you put comments about this content', 'application/rss+xml');
INSERT INTO content VALUES (84, 'style.css', '', 0, 'blank', 'main', 1, '', '2007-08-06 20:17:49', 'admin', 'users', '1010', 'body {
	background: #CACACA url(/images/background.png) repeat-x;
	font-family: "Trebuchet MS", Verdana, serif
}
#container {
	margin: 0 auto;
	width: 750px
}
#header {
	width: 100%
}
#sub_header {
	text-align: right;
	font-weight: bold;
	font-size: 20px;
	color: #FFFFFF;
	padding-right: 20px;
	padding-bottom: 20px;
}
#main_content {
	margin: 0 auto;
	width: 100%;
	background: #FFFFFF url(''/images/background_content.gif'');
	background-repeat: repeat-y
} 
#main_content_top {
	height: 30px;
	background: #FFFFFF url(''/images/background_top.gif'');
} 
#main_content_bottom {
	height: 30px;
	background: #FFFFFF url(''/images/background_bottom.gif'');
}
#footer {
	text-align: center;
	font-size: 12px;
	margin: 10px auto
}
.content {
	float: left;
	width: 510px;
	text-align: justify;
	padding: 0 30px 0 30px;
	font-size: 12px
}
.menu {
	width: 139px;
	float: right;
	padding: 0 20px 0 20px;
	border-left: #8C8484 1px solid;
	font-size: 12px
}
.menu ul {
	margin: 0;
	padding: 10px 0 10px 15px
}
.menu il {
	list-style-type: disc
}
#header h1 {
	margin-bottom: 0px;
	font-size: 28px;
	font-weight: bold;
	color: #A40008
}
.content h2 {
	margin-top: 0px;
	font-size: 18px;
	font-weight: bold;
	color: #A40008
}
#clear {
	display: block;
	clear: both;
	width: 100%;
	height:1px;
	overflow:hidden;
}
.menu_title {
	font-size: 18px;
	font-weight: bold;
	color: #A40008
}
.menu ul {
	margin: 0;
	padding: 10px 0 20px 15px
}
.menu li {
	padding-top: 2px;
	list-style-type: circle
}
a {
	color: #A40008;
	font-weight: bold;
	text-decoration: none
}
a:hover {
	color: #A40008;
	font-weight: bold;
	text-decoration: underline
}
a.menu_link {
	color: #000000;
	font-weight: bold;
	text-decoration: underline
}
a.menu_link:hover {
	color: #A40008;
	font-weight: bold;
	text-decoration: none
}
.quote {
	margin: 20px;
	text-align: center;
	font-weight: bold;
	font-style: italic
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (85, 'feed.rss2', '', 0, 'blank', 'main', 1, '', '2008-05-07 00:29:04', 'admin', 'users', '1010', '<?xml version="1.0"?>
<rss version="2.0">
  <channel>
    <title>Lift Off News</title>
    <link>http://liftoff.msfc.nasa.gov/</link>
    <description>Liftoff to Space Exploration.</description>
    <language>en-us</language>
    <pubDate>Tue, 10 Jun 2003 04:00:00 GMT</pubDate>
    <lastBuildDate>Tue, 10 Jun 2003 09:41:01 GMT</lastBuildDate>
    <docs>http://blogs.law.harvard.edu/tech/rss</docs>
    <generator>Weblog Editor 2.0</generator>
    <managingEditor>editor@example.com</managingEditor>
    <webMaster>webmaster@example.com</webMaster>
    <ttl>5</ttl>
 
    <item>
      <title>Star City</title>
      <link>http://liftoff.msfc.nasa.gov/news/2003/news-starcity.asp</link>
      <description>How do Americans get ready to work with Russians aboard the
        International Space Station? They take a crash course in culture, language
        and protocol at Russia''s Star City.</description>
      <pubDate>Tue, 03 Jun 2003 09:39:21 GMT</pubDate>
      <guid>http://liftoff.msfc.nasa.gov/2003/06/03.html#item573</guid>
    </item>
 
    <item>
      <title>Space Exploration</title>
      <link>http://liftoff.msfc.nasa.gov/</link>
      <description>Sky watchers in Europe, Asia, and parts of Alaska and Canada
        will experience a partial eclipse of the Sun on Saturday, May 31st.</description>
      <pubDate>Fri, 30 May 2003 11:06:42 GMT</pubDate>
      <guid>http://liftoff.msfc.nasa.gov/2003/05/30.html#item572</guid>
    </item>
 
    <item>
      <title>The Engine That Does More</title>
      <link>http://liftoff.msfc.nasa.gov/news/2003/news-VASIMR.asp</link>
      <description>Before man travels to Mars, NASA hopes to design new engines
        that will let us fly through the Solar System more quickly.  The proposed
        VASIMR engine would do that.</description>
      <pubDate>Tue, 27 May 2003 08:37:32 GMT</pubDate>
      <guid>http://liftoff.msfc.nasa.gov/2003/05/27.html#item571</guid>
    </item>
 
    <item>
      <title>Astronauts'' Dirty Laundry</title>
      <link>http://liftoff.msfc.nasa.gov/news/2003/news-laundry.asp</link>
      <description>Compared to earlier spacecraft, the International Space
        Station has many luxuries, but laundry facilities are not one of them.
        Instead, astronauts have other options.</description>
      <pubDate>Tue, 20 May 2003 08:56:02 GMT</pubDate>
      <guid>http://liftoff.msfc.nasa.gov/2003/05/20.html#item570</guid>
    </item>
  </channel>
</rss>
', 'This is where you put comments about this content', 'application/rss-xml');
INSERT INTO content VALUES (86, 'foo.html', '', 0, 'main', 'main', 1, '', '2008-05-08 11:04:26', 'admin', 'users', '1010', 'Stub content...<br><br> It looks like the author was negligent enough to leave this stub.', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (88, '.help-content', '', 0, 'blank', 'main', 1, '', '2008-05-28 21:21:27', 'admin', 'users', '1010', 'HELP!<br>
I need somebody!<br>
I need somebody!<br>

I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
I need somebody!<br>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (89, '.administration/main', '', 0, '.admin', '', 1, '', '2008-10-15 22:48:54', 'admin', 'users', '1010', '<h2>Spine Administration</h2>
<b>Content</b><br>
Create new web pages &amp; edit existing pages; Select page template; Change access permissions<br>
<b>Style</b><br>
Create new page templates &amp; edit existing templates<br>
<b>NavBar</b><br>
Create new navigation bars &amp; edit existing navigation bars<br>
<b>Messages</b><br>
Manage message and message groups<br>
<b>Macros</b><br>
Assign key/value pairs to macro sets<br>
<b>Users</b><br>
Manage user profiles<br>
<b>Usergroups</b><br>
Manage user groups<br>
<b>Statistics</b><br>
View detailed page visitor statistics.<br>
<b>File Manager</b><br>
Upload, rename, copy and delete files; Create and delete folders<br>
<b>Admin Access</b><br>
Restrict administration panel access based on usergroup roles', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (90, 'createconfig.html', 'Create Configuration File', 0, 'main', '', 1, '', '2008-06-17 21:03:57', 'admin', 'users', '1010', '<script type="text/javascript" language="javascript">
function createconfig() 
{ var config = "";
  config = "<IfModule mod_perl.c>
";
 if ($(''#apachedbi'').attr(''checked'')) 
  { config += "  PerlModule Apache::DBI
"; } else
  { config += "# PerlModule Apache::DBI
"; }
  config += "  <Location "+$(''#location'').val()+">
";
  config +="           SetHandler perl-script
";
  if ($("#apache").val() == "1")
  { config += "           PerlHandler Apache::SPINE::Index
"; }
  if ($("#apache").val() == "2")
  { config += "           PerlResponseHandler Apache2::SPINE::Index
"; }
  config += "           PerlSetVar dbd "+$(''#database'').val()+"
";
  config += "           PerlSetVar dbname "+$(''#dbname'').val()+"
";
  config += "           PerlSetVar dbuser "+$(''#username'').val()+"
";
  config += "           PerlSetVar dbpwd "+$(''#password'').val()+"
";
  config += "           PerlSetVar main "+$(''#indexfile'').val()+"
";
  config += "           PerlSetVar webmaster "+$(''#webmaster'').val()+"
";
  config += "           PerlSetVar servername "+$(''#servername'').val()+"
";
  config += "           PerlSetVar sitename "+$(''#sitename'').val()+"
";
  config += "           PerlSetVar chroot "+$(''#chroot'').val()+"
";
  if ($("#apache").val() == "1")
  { config += "           PerlLogHandler Apache::SPINE::Log
"; }
  if ($("#apache").val() == "2")
  { config += "           PerlLogHandler Apache2::SPINE::Log
"; }
  config += "  </Location>
";
  config += "</IfModule>
";

  $(''#config'').val(config);
}
</script>
<h2>Create Apache Configuration File</h2>
<div name="adminpanel" class="fullpanel" style="position: relative">
<form>
<div class="panelcel" style="width: 90%"><input type="button" class="button" onclick="createconfig();" value="Generate"><br><br></div>
<div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Apache Version:</div>
<div class="panelcel" style="width: 30%"><select id="apache"><option value="1">Apache 1<option value="2">Apache 2</select></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Load Apache::DBI:</div>
<div class="panelcel" style="width: 30%"><input type="checkbox" id="apachedbi"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Location:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="location" size="20" value="/spine" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Database:</div>
<div class="panelcel" style="width: 30%"><select id="database"><option value="mysql">MySQL<option value="Pg">Postgreql</select></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Database name:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="dbname" size="20" value="spine" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Database username:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="username" size="20" value="username" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Database password:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="password" size="20" value="password" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Index file:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="indexfile" size="20" value="index.html" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Webmaster:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="webmaster" size="20" value="webmaster" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Server name:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="servername" size="20" value="" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Site name:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="sitename" size="20" value="Spine Stub Sitename" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 15%">Chroot:</div>
<div class="panelcel" style="width: 30%"><input type="text" id="chroot" size="20" value="/var/www/html" class="input"></div><div class="spacercel"></div>
<div class="panelcel" style="width: 90%">
Output:<br><textarea rows="18" cols="100" id="config" class="input">
</textarea></div>
<div class="spacercel"></div>
</div>
</form>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (95, '.administration/navbar-button', '', 0, '.admin', 'main', 1, '', '2011-10-12 12:08:17', 'admin', 'users', '1111', '<div name="adminpanel" class="spine-fullpanel">
<form method="post" action="<?SPINE_Location?>admin/navbar/editbutton/" style="padding: 0; margin: 0; display: inline;">
 <div class="spine-panelcel" style="width: 18%"><input type="text" size="25" name="link" class="spine-input" value="$link"></div>
 <div class="spine-panelcel" style="width: 18%"><input type="text" size="25" name="image" class="spine-input" value="$image"></div>
 <div class="spine-panelcel" style="width: 18%"><input type="text" size="25" name="label" class="spine-input" value="$label"></div>
 <div class="spine-panelcel" style="width: 18%">
 <input type="image" src="<?SPINE_Images?>save.png" alt="Save" name="save" style="padding: 0px">
<input type="image" name="moveup"  src="<?SPINE_Images?>up.png">
<input type="image" name="movedown"  src="<?SPINE_Images?>down.png">
<input type="image" name="delete" src="<?SPINE_Images?>delete.png">
<img src="<?SPINE_Images?>preferences.png" onClick="o=document.getElementById(''buttonrow$buttonid''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}">&nbsp;
 </div> 
<input type="hidden" name="navbar" value="$id">
<input type="hidden" name="buttonid" value="$buttonid">
<input type="hidden" name="name" value="$name">
<input type="hidden" name="position" value="$position">
<input type="hidden" name="font" value="$font">
<input type="hidden" name="color" value="$color">
<input type="hidden" name="size" value="$size">
<input type="hidden" name="style" value="$style">
 <div class="spine-spacercel"></div>
</div>
 
<div name="adminpanel" class="spine-fullpanel" id="spine-buttonrow$buttonid" style="display:none">
 <div class="spine-panelcel" style="width: auto; height: auto; padding-bottom: 4px">Target: <input type="text" size="25" name="target" class="spine-input" value="$target">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; height: auto; padding-bottom: 4px">Class: <input type="text" size="25" name="class" class="spine-input" value="$class">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; height: auto; padding-bottom: 4px">Border: <input type="text" size="2" name="border" class="spine-input" value="$border">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; height: auto; padding-bottom: 4px">Width: <input type="text" size="3" name="width" class="spine-input" value="$width">&nbsp;&nbsp;</div>
 <div class="spine-panelcel" style="width: auto; height: auto; padding-bottom: 4px">Height: <input type="text" size="3" name="height" class="spine-input" value="$height">&nbsp;&nbsp;</div>
 <div class="spine-spacercel"></div>
</div>
</form>
', 'This content is used for navigation button structure', '');
INSERT INTO content VALUES (94, '.administration/general', 'Content Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:18:38', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
<form method="post" action="<?SPINE_Location?>admin/$type/edit/">
$error<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <b>Edit $label</b><br>
&nbsp;&nbsp;<input type="submit" value="Edit" class="spine-button">&nbsp;
<select name="name" class="spine-general">
<option value="">Select one
$list
</select>
</font>
</form>
</div>

<div name="adminpanel" class="spine-fullpanel">
<hr width="95%">
</div>

<div name="adminpanel" class="spine-fullpanel">
<form method="POST" name="theform" action="<?SPINE_Location?>admin/$type/remove/" onSubmit="return confirm(''You are about to delete ''+(document.theform.name.options[document.theform.name.selectedIndex].value)+''! Are you sure?'');">
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <b>Remove $label</b><br>
&nbsp;&nbsp;<input type="submit" value="Remove" class="spine-button">&nbsp;
<select name="name" class="spine-general">
<option value="">Select one
$list
</select>
</font>
</form>
</div>

<div name="adminpanel" class="spine-fullpanel">
<hr width="95%">
</div>

<div name="adminpanel" class="spine-fullpanel">
<form method="post" action="<?SPINE_Location?>admin/$type/copy/">
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <b>Copy $label</b><br>
&nbsp;&nbsp;<input type="submit" value="Copy" class="spine-button">&nbsp;
<select name="name" class="spine-general">
<option value="">Select one
$list
</select>
to
<input type="text" name="target" class="spine-input" size="23" value="Enter name">
</font>
</form>
</div>
 
<div name="adminpanel" class="spine-fullpanel">
<hr width="95%">
</div>

<div name="adminpanel" class="spine-fullpanel">
<form method="post" action="<?SPINE_Location?>admin/$type/new/">
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <b>New $label</b><br>
&nbsp;&nbsp;<input type="submit" value="Create" class="spine-button">&nbsp;
<input type="text" name="name" class="spine-input" size="23" value="Enter name"><br><br>
</font>
</form>
</div>
', 'This is the general admin template used for content and style (among others)', '');
INSERT INTO content VALUES (100, '.administration/usergroup', 'Usergroup Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:24:07', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
$error<b>Usergroup Management</b>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%"><b>Username</b></div>
<div class="spine-panelcel" style="width: 20%"><b>Usergroup</b></div>
<div class="spine-spacercel"></div>
</div>

$list', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (102, '.administration/filetypes', 'Filetype Administration', 0, '.admin', 'main', 1, '', '2008-04-19 14:28:18', 'admin', 'admin', '0000', '<div name="adminpanel" class="fullpanel">
$error
<div class="panelcel" style="width: 10%"><b>File Extensions</b></div>
<div class="panelcel" style="width: 20%"><b>MIME Type</b></div>
<div class="spacercel"></div></div>
$list', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (103, 'antique_modern_style.css', '', 0, 'blank', 'main', 1, '', '2008-04-22 21:59:25', 'admin', 'users', '1010', 'body
{
  background: #e4e4e4 url(../images/antique_modern_background.gif) repeat-x top left;
	margin: 0px; 
	padding: 0px;
	font-family: "Trebuchet MS", Verdana, sans-serif;
	font-size: 12px;
}

#head
{
  background: #e4e4e4 url(../images/antique_modern_head_empty.gif) no-repeat top left;
	width: 747px;
	height: 117px;
	padding: 0px;
	margin: 0 auto;
}

#head #title
{
	float: left;
 	font-size: 30px;
	color: #F0EBE7;
	padding: 35px 0px 0px 30px;

}

#body_wrapper
{
  background: url(../images/antique_modern_body_cont.jpg) repeat-y top left;
	margin: 0px auto;
	width: 747px;
	display: block;
}


#body
{
  background: url(../images/antique_modern_body_top.jpg) no-repeat top left;
	float: left;
	padding: 10px 20px 0px 20px;
	min-height: 343px;
	display: block;
}

#end_body
{
  background: url(../images/antique_modern_footer.jpg) no-repeat top left;
	margin: 0px auto;
	width: 747px;
	height: 37px;
	display: block;
}

.clearer
{
  clear: both;
	height: 1px;
}

#all
{
  width: 707px;
	float: left;
	padding: 0px;
	background: url(../images/antique_modern_all_middle.gif) repeat-y top left;
}

#all .top
{
  background: url(../images/antique_modern_all_top.gif) no-repeat top left;
	width: 707px;
	height: 18px;
	padding: 0px;
	margin: 0px;
}

#all .bottom
{
  background: url(../images/antique_modern_all_bottom.gif) no-repeat bottom left;
	width: 707px;
	height: 21px;
	padding: 0px;
	margin: 0px;
}

#left
{
  width: 538px;
	float: left;
	padding: 0px;
	margin: 0px;
	background: url(../images/antique_modern_left_middle.gif) repeat-y top left;
}

#left .top
{
  background: url(../images/antique_modern_left_top.gif) no-repeat top left;
	width: 538px;
	height: 18px;
	padding: 0px;
	margin: 0px;
}

#left .bottom
{
  background: url(../images/antique_modern_left_bottom.gif) no-repeat bottom left;
	width: 538px;
	height: 21px;
	padding: 0px;
	margin: 0px;
}

#right
{
  width: 169px;
	float: right;
	padding: 0px;
	margin: 0px;
	background: url(../images/antique_modern_right_middle.gif) repeat-y top left;
}

#right .top
{
  background: url(../images/antique_modern_right_top.gif) no-repeat top left;
	padding: 0px;
	margin: 0px;
	width: 169px;
	height: 18px;
}

#right .bottom
{
  background: url(../images/antique_modern_right_bottom.gif) no-repeat bottom left;
	padding: 0px;
	margin: 0px;
	width: 169px;
	height: 21px;
}

.content 
{
  padding: 0px 15px;
}

#footer
{
  margin: 0 auto; 
	width: 747px;
	text-align: center;
	color: #B05128;
	font-weight: bold;
}

#footer a
{
 color: #B05128;
}

#right ul 
{
	margin: 0px;
	padding: 0px;
	list-style: none;
}

#right ul li 
{
	margin: 0px;
	padding: 0px;
	list-style: none;
	display: block;
}

#right ul a 
{
	display: block;
	width: 125px;
	background: #c7b8a4;
	color: #000;
	padding: 3px;
	padding-left: 10px;
	text-decoration: none;
	margin: 0px;
	border: 0px;
}

#right ul a:hover 
{
	color: #FFFFFF;
	background: #822C0F;
}

/* Navigation */

#menu 
{
  float: right;
	margin: 80px 20px 0px 0px;
}

#menu ul 
{
	margin: 0;
	padding: 0;
	white-space : nowrap;
}

#menu ul li 
{
	margin: 0;
	padding: 0;
	display: block;
	float:left;
	text-align: center;
}

#menu ul li a 
{
	color : #fff;
	background-color: transparent;
	text-decoration : none;
	font-weight: bold;
	display: block;
	border-style:none;
}

#menu ul li a:link, #menu ul li a:visited 
{
	background-image: url(../images/antique_modern_menu_item2.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 94px;
	line-height: 26px;
	padding-top: 7px;
}

#menu ul li a:hover, #menu ul li a:active 
{
	background-image: url(../images/antique_modern_menu_item2.gif);
	background-repeat: no-repeat;
	background-position: 0px -33px;
	height: 29px;
	width: 94px;
	line-height: 29px;
	padding-top: 4px;
}

#menu ul li.active a:hover, #menu ul li.active a:active, #menu ul li.active a:link, #menu ul li.active a:visited 
{
	background-image: url(../images/antique_modern_menu_item2.gif);
	background-repeat: no-repeat;
	background-position: 0px -66px;
	height: 29px;
	width: 94px;
	line-height: 29px;
	padding-top: 4px;
	color: #B05128;
}


/*  Headers  */
h1 
{
	padding: 0px;
	margin: 0px;
	margin-bottom: 5px;
	color: #D96B11;
	background-color: transparent;
	font-size: 1.6em;
	font-weight: bold;
}

h2 
{
	padding: 0px;
	margin: 0px;
	margin-top: 10px;
	margin-bottom: 5px;
	color: #333;
	background-color: transparent;
	font-size: 1.5em;
	font-weight: bold;
}

h3 
{
	padding: 0px;
	margin: 0px;
	margin-bottom: 5px;
	color: #76b7d7;
	background-color: transparent;
	font-size: 1.4em;
	font-weight: bold;
}

h4 
{
	padding: 0px;
	margin: 0px;
	margin-bottom: 5px;
	color: #333;
	background-color: transparent;
	font-size: 1.3em;
	font-weight: bold;
}

h5 
{
	color: #9ad5f3;
	background-color: transparent;
	padding: 0px;
	font-size: 1.2em;
	font-weight: bold;
	margin: 0px;
	padding: 0px;
	margin-bottom: 5px;
}

h6 
{
	padding: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 5px;
	margin-left: 0px;
	color: #D96B11;
	font-size: 1.1em;
	font-weight: normal;
	line-height: 150%;
}

/* HTML Tags */

code
{
  display: block;
	margin: 5px;
	padding: 5px;
	color: #ad4c21;
	border: 1px dashed;
	background: #f0ebe7;
	font-family: Courier, ''Courier New'', ''Andale Mono'', Monaco, monospace;

}

a
{
  color: #AD4C21;
	text-decoration: none;
	border-bottom: 1px dashed;
	padding-bottom: 0px;
}

a:hover
{
	color: #000;
}

hr
{
  border: 0px;
  border-bottom: 1px #F0EBE7 dashed;
	height: 1px;
}

#left hr, #all hr
{
  margin: 10px 0px;
}

form
{
  margin: 0px;
	padding: 0px;
}

form .item
{
  clear: left;
	border-top: 1px solid #EEE;
	margin: 3px;
}

form .label
{
  float: left;
	clear: left;
	width: 150px;
}

input, textarea, select
{
  color: #AD4C21;
	border: 1px solid;
	background: #F0EBE7;
	margin: 3px;
	padding: 2px;
}

blockquote {
	margin: 5px;
  background: transparent url(../images/antique_modern_quotes.gif) left top no-repeat;
	padding-left: 37px;
}

blockquote[cite]:after {
	content: "Quote from: " attr(cite);
	display: block;
	border-top: 1px solid #999;
	color: #999;
	margin: 1em 0 0;
	padding: .5em 0 0;
	font-size: .8em;
	font-weight: bold;
}

del 
{
  color: #800;
	text-decoration: line-through;
}

dt
{
  font-weight: bold;
	font-size: 1.05em;
	color: #ad4c21;
}

dd 
{
  margin-left: 15px;
}

/* adds a space and then a graphic after any external (i.e. off-site) links */
a[target]:after{
	content: " " url(../images/antique_modern_externalpage.gif);
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (104, 'tinytest.html', '', 0, 'blank', 'main', 1, '', '2008-05-23 00:47:17', 'admin', 'users', '1010', '<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript" src="jquery.js"></script>
<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tinymce_init.js"></script>

<script type="text/javascript">
var tinyMCEmode = false;
function toogleEditorMode(sEditorID) {
    try {
        if(tinyMCEmode) {
            tinyMCEmode = false;
            tinyMCE.execCommand("mceRemoveControl",tinyMCEmode,"body");
            $(''#switch'').text(''Text'');
        } else {
           tinyMCEmode = true; 
           tinyMCE.execCommand("mceAddControl", tinyMCEmode, "body");
            $(''#switch'').text(''Visual'');
        }
    } catch(e) {
        //error handling
    }
}
</script>
<a href="#" id="switch" title="hide TinyMCE" onclick="toogleEditorMode(''body''); return false;">Text</a>
<form>
<textarea name="body" id="body" cols="80" rows="40"></textarea>
</form>

', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (101, 'actiontest.html', 'TEST', 0, 'main', '', 1, '', '2011-10-10 14:03:15', 'admin', 'users', '1111', 'This is a test', 'This is where you put comments about this content', 'text/html');
INSERT INTO content VALUES (98, '.administration/user', 'User Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:59:28', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
$error<b>User Management</b>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%"><b>Full Name</b></div>
<div class="spine-panelcel" style="width: 20%"><b>Login</b></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<form method="post" action="<?SPINE_Location?>admin/user/new/" style="padding: 0; margin: 0; display: inline;">
<div class="spine-panelcel" style="width: 20%"><input type="text" name="fullname" class="spine-input" value="Full Name" size="30"></div>
<div class="spine-panelcel" style="width: 20%"><input type="text" name="login" value="Login" class="spine-input" size="30"></div>
<div class="spine-panelcel" style="width: 20%"><input type="submit" value="create" class="spine-button" name="action"></div></form>
 <div class="spine-spacercel"></div>
</div>

$userdata', 'This is the template for user administration', '');
INSERT INTO content VALUES (99, '.administration/user-edit', 'User Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:22:07', 'admin', 'admin', '1111', '<div name="adminpanel" class="spine-fullpanel">
$error<b>User Management : $name</b>
</div>
<form method="post" action="<?SPINE_Location?>admin/user/save/" name="UserEdit$login" style="padding: 0; margin: 0; display: inline;">

<div name="adminpanel" class="spine-fullpanel">
<input type="submit" value="Save" class="spine-button">
<input type="hidden" name="id" value="$id">
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%"><b>Full Name</b></div>
<div class="spine-panelcel" style="width: 20%"><b>Login</b></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%">Full Name [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#fullname'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>]: </div>
<div class="spine-panelcel" style="width: 20%"><input type="text" class="spine-input" name="name" value="$name" size="25"></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%">Login [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#login'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>]:</div>
<div class="spine-panelcel" style="width: 20%"><input type="text" class="spine-input" name="login" value="$login" size="25"></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%">E-Mail [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#email'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>]:</div>
<div class="spine-panelcel" style="width: 20%"><input type="text" class="spine-input" name="email" value="$email" size="25"></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 20%">Password [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#password'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>]:</div>
<div class="spine-panelcel" style="width: 20%"><input type="password" class="spine-input" name="password" value="$password" size="25"></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel" style="height: auto">
<div class="spine-panelcel" style="width: 20%">Groups [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#groups'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>]:</div>
<div class="spine-panelcel" style="width: 20%">$usergroups</div>
<div class="spine-spacercel"></div>
</div>
k', 'This is the admin page for the user profile.', '');
INSERT INTO content VALUES (105, 'coffee_n_cream.css', '', 0, 'blank', 'main', 1, '', '2008-04-22 22:48:07', 'admin', 'users', '1010', '/*#############################################################
Name: Coffee N Cream
Date: 2006-08-24
Description: A smooth coffee style template.
Author: Viktor Persson
URL: http://templates.arcsin.se

Feel free to use and modify but please provide credits.
#############################################################*/

/* standard elements */
* {
	margin: 0;
	padding: 0;
}
a {
	color: #963;
}
a:hover {
	color: #C60;
}
body {
	background: #655A46 url(/images/coffee_n_cream_bg.gif);
	color: #543;
	font: normal 62.5% "Lucida Sans Unicode",sans-serif;
}
input {
	color: #555;
	font: normal 1.1em "Lucida Sans Unicode",sans-serif;
}
p,cite,code,ul {
	font-size: 1.2em;
	padding-bottom: 1.2em;
}
h1 {
	font-size: 1.4em;
	margin-bottom: 4px;
}
code {
	background: #FFE;
	border: 1px solid #EED;
	border-left: 6px solid #938262;
	color: #554;
	display: block;
	font: normal 1.1em "Lucida Sans Unicode",serif;
	margin-bottom: 12px;
	padding: 8px 10px;
	white-space: pre;
}
blockquote {
	background: url(/images/coffee_n_cream_quote.gif) no-repeat;
	color: #666;
	display: block;
	font: normal 1.3em "Lucida Sans Unicode",serif;
	padding-left: 28px;
}
h1,h2,h3 {
	color: #654;
	padding-top: 6px;
}

/* misc */
.clearer {
	clear: both;
}

/* structure */
.container {
	background: url(/images/coffee_n_cream_bgcontainer.gif) repeat-y;
	margin: 0 auto;
	width: 780px;
}

/* header */
.header {
	background: url(/images/coffee_n_cream_bgheader.gif) repeat-x;
	height: 120px;
	margin: 0 auto;
	width: 760px;
}

/* title */
.title {
	padding: 32px;
}
.title h1 {
	color: #E4DBCF;
	font: normal 3.4em "Lucida Sans Unicode","Trebuchet MS",sans-serif;
}

/* navigation */
.navigation {
	background: #FFF url(/images/coffee_n_cream_bgnavigation.gif) repeat-x;
	font: bold 1.2em Verdana,sans-serif;
	height: 44px;
	margin: 0 auto;
	padding: 0 18px;
	width: 725px;
}
.navigation a {
	color: #543;
	text-decoration: none;
	padding: 3px 4px;
	margin-right: 12px;
	line-height: 44px;
}
.navigation a:hover {
	background: #CEBDA1;
	color: #420;
}

/* main */
.main {
	clear: both;
	padding: 0 10px 12px 28px;
}

/* sub navigation */
.sidenav {
	float: right;
	width: 218px;
}
.sidenav h1 {
	background: #BCB39F url(/images/coffee_n_cream_sidenavh1.gif) repeat-x;
	border-bottom: 1px solid #999;
	border-top: 1px solid #CCC;
	color: #4A4A44;
	font-size: 1.2em;
	height: 22px;
	margin: 0;
	padding-left: 12px;
}
.sidenav ul {
	margin: 0;
	padding: 0;
}
.sidenav li {
	border-bottom: 1px solid #A98;
	border-top: 1px solid #DDC;
	list-style: none;
}
.sidenav li a {
	background: #CCC3AF;
	color: #554;
	display: block;
	padding: 8px 4px 8px 12px;
	text-decoration: none;
}
.sidenav li a:hover {
	background: #D6CCB9;
	color: #654;
}

/* content */
.content {
	padding-top: 12px;
	float: left;
	width: 68%;
}
.content .descr {
	color: #987E57;
	font-size: 1.1em;
	margin-bottom: 6px;
}
.content li {
	list-style: url(/images/coffee_n_cream_li.gif);
	margin-left: 18px;
}

/* footer */
.footer {
	background: #958463 url(/images/coffee_n_cream_bgfooter.gif) repeat-x;
	color: #FED;
	font-size: 1.1em;
	line-height: 40px;
	margin: 0 auto;
	text-align: center;
	width: 760px;
}
.footer a {
	color: #FFD;
	text-decoration: none;
}
.footer a:hover {
	color: #FFF;
	text-decoration: underline;
}', 'This template is licensed under a Creative Commons Attribution 2.5 License.
This means that you are free to use and modify it for any purpose, but you must include the provided link back to our website (http://arcsin.se).', 'text/css');
INSERT INTO content VALUES (106, 'naturalist.css', '', 0, 'blank', 'main', 1, '', '2008-04-22 23:22:03', 'admin', 'users', '1010', '/*
Copyright: Darren Hester 2006, http://www.designsbydarren.com
License: Released Under the "Creative Commons License", 
http://creativecommons.org/licenses/by-nc/2.5/
*/

body {
  text-align: center;
  background: #656868 url(''/images/naturalist_bg.jpg'') top center no-repeat fixed;
  margin-top:30px;
  margin-bottom:30px;
  color:#333333;
}

A:link {
	COLOR: #000000; text-decoration: underline
}
A:visited {
	COLOR: #000000; text-decoration: underline
}
A:active {
	COLOR: #000000; text-decoration: underline
}
A:hover {
	COLOR: #000000; text-decoration: none
}

#page_wrapper {
  background: #F3E7A9 url(''/images/naturalist_page_bg.jpg'') top left;
  margin-left: auto; 
  margin-right: auto;
  width: 640px;
  text-align: left;
  border: 4px solid #F4F4EE;
}

#page_header {
  height: 140px;
  background: #515230 url(''/images/naturalist_header.jpg'') top left no-repeat;
}  

#page_header h1 {
  padding-top:30px;
  padding-left: 20px;
  font-family: verdana, helvetica, sans-serif;
  font-size:26px;
  font-weight:bold;  
  color: #FCF8E3;
  letter-spacing: -1px;
  margin:0px;
}
#page_header h2 {
  padding-top:0px;
  padding-left: 20px;
  font-family: verdana, helvetica, sans-serif;
  font-size:14px;
  font-weight:bold;  
  color: #E2D179;
  margin:0px;  
}

#menu_bar {
  height:30px;
  background: #A5A162 url(''/images/naturalist_menu_bg.jpg'') top left no-repeat;
}

#navcontainer ul
{
padding-left: 0;
margin-left: 0;
margin-top:5px;
background-color: transparent;
color: #F3E7A9;
float: left;
width: 100%;
font-family: verdana, helvetica, sans-serif;
font-size:12px;
font-weight:bold;
}

#navcontainer ul li { display: inline; }

#navcontainer ul li a
{
padding: 0.2em 1em;
background-color: transparent;
color: #F3E7A9;
text-decoration: none;
float: left;
border-right: 1px solid #BBB774;
}

#navcontainer ul li a:hover
{
background-color: transparent;
color: #fff;
}

#content_wrapper {
  background: transparent url(''/images/naturalist_content_bg.jpg'') top left no-repeat;
}

#left_side {
  float:left;
  width:480px;
}
  
#left_side h3 {
  margin:10px;
  margin-right:15px;
  font-family: verdana;
  font-size:14px;
  font-weight: bold;
  line-height:18px;
  color: #A0410D;
}
  
#left_side p {
  margin:10px;
  margin-right:15px;
  font-family: verdana;
  font-size:12px;
  line-height:18px;
  color: #333333;
}

#right_side {
  float:right;
  width:150px;
}
  
#right_side h3 {
  margin-right:10px;
  margin-bottom: 5px;
  font-family: verdana;
  font-size:12px;
  font-weight: bold;
  line-height:16px;
  color: #FCF8E3;
  background: #595A38;
  padding:4px;
  border:1px solid #3A3B22;
}
  
#right_side p {
  margin:5px;
  margin-bottom:15px;
  padding-right:10px;
  font-family: verdana;
  font-size:11px;
  line-height:16px;
  color: #333333;
}

#page_footer {
  height: 70px;
  background: #515230 url(''/images/naturalist_footer.jpg'') top left no-repeat;
}  

#page_footer A:link {
	COLOR: #F2C968; text-decoration: underline
}
#page_footer A:visited {
	COLOR: #F2C968; text-decoration: underline
}
#page_footer A:active {
	COLOR: #F2C968; text-decoration: underline
}
#page_footer A:hover {
	COLOR: #F2C968; text-decoration: none
}

#page_footer p {
  text-align:center;
  padding-top:20px;
  font-family: verdana;
  font-size:11px;
  line-height:16px;
  color: #FCF8E3;
}

.spacer {
  margin:0px;padding:0px;height:10px;clear:both;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (107, 'naturalistnews', '', 0, 'main', 'main', 1, '', '2008-04-22 23:34:06', 'admin', 'admin', '0010', '<h3 class="news"><?SPINE_Message_Subject?></h3>
<div class="newsdate"><?SPINE_Message_Date?></div>
<p><?SPINE_Message_Body?></p>
', 'This is how a message will look like', '');
INSERT INTO content VALUES (108, 'nonzero_blue.css', '', 0, 'blank', 'main', 1, '', '2008-04-23 23:52:41', 'admin', 'users', '1010', '/*

	Nonzero1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	missing in a maze

*/

/* This controls the width of the fluid width layouts */

div.fluid
{
width: 90% !important;
}

/* This controls the width of the fixed width layouts */

div.fixed
{
width: 950px !important;
}

/* Basic Stuff */

*
{
margin: 0em;
padding: 0em;
}

body
{
background-color: #fff;
color: #585858;
font-size: 9pt;
font-family: "trebuchet ms", helvetica, sans-serif;
}

h1,h2,h3,h4,h5,h6
{
font-weight: normal;
letter-spacing: -1px;
text-transform: lowercase;
}

h3,h4,h5,h6
{
color: #184366;
}

h1 span
{
font-weight: bold;
}

h3 span
{
font-weight: bold;
}

h4 span
{
font-weight: bold;
}

br.clear
{
clear: both;
}

img
{
padding: 3px;
border: solid 1px #e1e1e1;
}

img.floatTL
{
float: left;
margin-right: 1.5em;
margin-bottom: 1.5em;
margin-top: 0.5em;
}

a
{
text-decoration: underline;
color: #F16C00;
}

a:hover
{
text-decoration: none;
}

ul.links
{
list-style: none;
}

ul.links li
{
line-height: 2em;
}

ul.links li.first
{
}

p
{
line-height: 1.8em;
}

/* Header */

#header
{
width:100%;
height:122px;
background: #440000 url(''/images/nonzero_blue_n1.gif'') repeat-x;
}

#header_inner
{
position: relative;
width: 950px;
height:122px;
margin: 0 auto;
}

/* Logo */

#logo
{
position: absolute;
bottom: 0.6em;
}

#logo h1
{
display: inline;
color: #fff;
font-size: 2.6em;
}

#logo h2
{
display: inline;
padding-left: 0.5em;
color: #D2DCE5;
font-size: 1.0em;
}

/* Menu */

#menu
{
position: absolute;
right: 0em;
bottom: 0em;
}

#menu ul
{
list-style: none;
}

#menu li
{
float: left;
}

#menu li a
{
margin-left: 0.5em;
display: block;
padding: 1.1em 1.4em 1.0em 1.4em;
background: #fff url(''/images/nonzero_blue_n4.gif'') repeat-x;
border: solid 1px #fff;
color: #616161;
font-weight: bold;
font-size: 1.0em;
text-transform: lowercase;
text-decoration: none;
}

#menu li a.active
{
background: #FF790B url(''/images/nonzero_blue_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #DB7623;
}

/* Main */

#main
{
background: #fff url(''/images/nonzero_blue_n2.gif'') 0px 1px repeat-x;
}

#main_inner p
{
text-align: justify;
margin-bottom: 2.0em;
}

#main_inner ul
{
margin-bottom: 2.0em;
}

#main_inner
{
position: relative;
width: 950px;
margin: 0 auto;
padding-top: 3.5em;
}

#main_inner h3,h4
{
border-bottom: dotted 1px #E1E1E1;
position: relative;
}

#main_inner h3
{
font-size: 2.1em;
padding-bottom: 0.1em;
margin-bottom: 0.8em;
}

#main_inner h4
{
font-size: 1.2em;
padding-bottom: 0.175em;
margin-bottom: 1.4em;
margin-top: 0.95em;
}

#main_inner .post
{
position: relative;
}

#main_inner .post h3
{
position: relative;
font-size: 1.7em;
padding-bottom: 1.2em;
}

#main_inner .post ul.post_info
{
list-style: none;
position: absolute;
top: 3em;
font-size: 0.8em;
}

#main_inner .post ul.post_info li
{
background-position: 0em 0.2em;
background-repeat: no-repeat;
display: inline;
padding-left: 18px;
}

#main_inner .post ul.post_info li.date
{
background-image: url(''/images/nonzero_blue_n5.gif'');
}

#main_inner .post ul.post_info li.comments
{
background-image: url(''/images/nonzero_blue_n6.gif'');
margin-left: 1.1em;
}

/* Footer */

#footer
{
width: 950px;
margin: 0 auto;
text-align: center;
clear: both;
border-top: dotted 1px #E1E1E1;
margin-top: 1.0em;
margin-bottom: 1.0em;
padding-top: 1.0em;
text-transform: lowercase;
}

/* Search */

input.button
{
background: #FF790B url(''/images/nonzero_blue_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #DB7623;
font-weight: bold;
text-transform: lowercase;
font-size: 0.8em;
height: 2.0em;
}

input.text
{
border: solid 1px #F1F1F1;
font-size: 1.0em;
padding: 0.25em 0.25em 0.25em 0.25em;
}

#search
{
position: relative;
width: 100%;
margin-bottom: 2.0em;
}

#search input.text
{
position: absolute;
top: 0em;
left: 0em;
width: 9.5em;
}

#search input.button
{
position: absolute;
top: 0em;
right: 0em;
min-width: 2.0em;
max-width: 2.5em;
}

/* LAYOUT - 3 COLUMNS */

	/* Primary content */
	
	#primaryContent_3columns
	{
	position: relative;
	margin-right: 34em;
	}
	
	#columnA_3columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -34em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_3columns
	{
	float: right;
	}
	
	#columnB_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 2em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
	#columnC_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
/* LAYOUT - 2 COLUMNS */

	/* Primary content */
	
	#primaryContent_2columns
	{
	position: relative;
	margin-right: 17em;
	}
	
	#columnA_2columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -17em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_2columns
	{
	float: right;
	}
	
	#columnC_2columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}

/* LAYOUT - COLUMNLESS */

	/* Primary content */
	
	#primaryContent_columnless
	{
	position: relative;
	}
	
	#columnA_columnless
	{
	position: relative;
	width: 100%;
	}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (109, 'nonzero_brown.css', '', 0, 'blank', 'main', 1, '', '2008-04-23 23:52:57', 'admin', 'users', '1010', '/*

	Nonzero1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	missing in a maze

*/

/* This controls the width of the fluid width layouts */

div.fluid
{
width: 90% !important;
}

/* This controls the width of the fixed width layouts */

div.fixed
{
width: 950px !important;
}

/* Basic Stuff */

*
{
margin: 0em;
padding: 0em;
}

body
{
background-color: #fff;
color: #585858;
font-size: 9pt;
font-family: "trebuchet ms", helvetica, sans-serif;
}

h1,h2,h3,h4,h5,h6
{
font-weight: normal;
letter-spacing: -1px;
text-transform: lowercase;
}

h3,h4,h5,h6
{
color: #562F00;
}

h1 span
{
font-weight: bold;
}

h3 span
{
font-weight: bold;
}

h4 span
{
font-weight: bold;
}

br.clear
{
clear: both;
}

img
{
padding: 3px;
border: solid 1px #e1e1e1;
}

img.floatTL
{
float: left;
margin-right: 1.5em;
margin-bottom: 1.5em;
margin-top: 0.5em;
}

a
{
text-decoration: underline;
color: #AB5500;
}

a:hover
{
text-decoration: none;
}

ul.links
{
list-style: none;
}

ul.links li
{
line-height: 2em;
}

ul.links li.first
{
}

p
{
line-height: 1.8em;
}

/* Header */

#header
{
width:100%;
height:122px;
background: #440000 url(''/images/nonzero_brown_n1.gif'') repeat-x;
}

#header_inner
{
position: relative;
width: 950px;
height:122px;
margin: 0 auto;
}

/* Logo */

#logo
{
position: absolute;
bottom: 0.6em;
}

#logo h1
{
display: inline;
color: #fff;
font-size: 2.6em;
}

#logo h2
{
display: inline;
padding-left: 0.5em;
color: #E0D7CC;
font-size: 1.0em;
}

/* Menu */

#menu
{
position: absolute;
right: 0em;
bottom: 0em;
}

#menu ul
{
list-style: none;
}

#menu li
{
float: left;
}

#menu li a
{
margin-left: 0.5em;
display: block;
padding: 1.1em 1.4em 1.0em 1.4em;
background: #fff url(''/images/nonzero_brown_n4.gif'') repeat-x;
border: solid 1px #fff;
color: #616161;
font-weight: bold;
font-size: 1.0em;
text-transform: lowercase;
text-decoration: none;
}

#menu li a.active
{
background: #CC6C0C url(''/images/nonzero_brown_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #AA7036;
}

/* Main */

#main
{
background: #fff url(''/images/nonzero_brown_n2.gif'') 0px 1px repeat-x;
}

#main_inner p
{
text-align: justify;
margin-bottom: 2.0em;
}

#main_inner ul
{
margin-bottom: 2.0em;
}

#main_inner
{
position: relative;
width: 950px;
margin: 0 auto;
padding-top: 3.5em;
}

#main_inner h3,h4
{
border-bottom: dotted 1px #E1E1E1;
position: relative;
}

#main_inner h3
{
font-size: 2.1em;
padding-bottom: 0.1em;
margin-bottom: 0.8em;
}

#main_inner h4
{
font-size: 1.2em;
padding-bottom: 0.175em;
margin-bottom: 1.4em;
margin-top: 0.95em;
}

#main_inner .post
{
position: relative;
}

#main_inner .post h3
{
position: relative;
font-size: 1.7em;
padding-bottom: 1.2em;
}

#main_inner .post ul.post_info
{
list-style: none;
position: absolute;
top: 3em;
font-size: 0.8em;
}

#main_inner .post ul.post_info li
{
background-position: 0em 0.2em;
background-repeat: no-repeat;
display: inline;
padding-left: 18px;
}

#main_inner .post ul.post_info li.date
{
background-image: url(''/images/nonzero_brown_n5.gif'');
}

#main_inner .post ul.post_info li.comments
{
background-image: url(''/images/nonzero_brown_n6.gif'');
margin-left: 1.1em;
}

/* Footer */

#footer
{
width: 950px;
margin: 0 auto;
text-align: center;
clear: both;
border-top: dotted 1px #E1E1E1;
margin-top: 1.0em;
margin-bottom: 1.0em;
padding-top: 1.0em;
text-transform: lowercase;
}

/* Search */

input.button
{
background: #CC6C0C url(''/images/nonzero_brown_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #AA7036;
font-weight: bold;
text-transform: lowercase;
font-size: 0.8em;
height: 2.0em;
}

input.text
{
border: solid 1px #F1F1F1;
font-size: 1.0em;
padding: 0.25em 0.25em 0.25em 0.25em;
}

#search
{
position: relative;
width: 100%;
margin-bottom: 2.0em;
}

#search input.text
{
position: absolute;
top: 0em;
left: 0em;
width: 9.5em;
}

#search input.button
{
position: absolute;
top: 0em;
right: 0em;
min-width: 2.0em;
max-width: 2.5em;
}

/* LAYOUT - 3 COLUMNS */

	/* Primary content */
	
	#primaryContent_3columns
	{
	position: relative;
	margin-right: 34em;
	}
	
	#columnA_3columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -34em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_3columns
	{
	float: right;
	}
	
	#columnB_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 2em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
	#columnC_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
/* LAYOUT - 2 COLUMNS */

	/* Primary content */
	
	#primaryContent_2columns
	{
	position: relative;
	margin-right: 17em;
	}
	
	#columnA_2columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -17em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_2columns
	{
	float: right;
	}
	
	#columnC_2columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}

/* LAYOUT - COLUMNLESS */

	/* Primary content */
	
	#primaryContent_columnless
	{
	position: relative;
	}
	
	#columnA_columnless
	{
	position: relative;
	width: 100%;
	}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (110, 'nonzero_green.css', '', 0, 'blank', 'main', 1, '', '2008-04-23 23:53:11', 'admin', 'users', '1010', '/*

	Nonzero1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	missing in a maze

*/

/* This controls the width of the fluid width layouts */

div.fluid
{
width: 90% !important;
}

/* This controls the width of the fixed width layouts */

div.fixed
{
width: 950px !important;
}

/* Basic Stuff */

*
{
margin: 0em;
padding: 0em;
}

body
{
background-color: #fff;
color: #585858;
font-size: 9pt;
font-family: "trebuchet ms", helvetica, sans-serif;
}

h1,h2,h3,h4,h5,h6
{
font-weight: normal;
letter-spacing: -1px;
text-transform: lowercase;
}

h3,h4,h5,h6
{
color: #334D00;
}

h1 span
{
font-weight: bold;
}

h3 span
{
font-weight: bold;
}

h4 span
{
font-weight: bold;
}

br.clear
{
clear: both;
}

img
{
padding: 3px;
border: solid 1px #e1e1e1;
}

img.floatTL
{
float: left;
margin-right: 1.5em;
margin-bottom: 1.5em;
margin-top: 0.5em;
}

a
{
text-decoration: underline;
color: #008FD9;
}

a:hover
{
text-decoration: none;
}

ul.links
{
list-style: none;
}

ul.links li
{
line-height: 2em;
}

ul.links li.first
{
}

p
{
line-height: 1.8em;
}

/* Header */

#header
{
width:100%;
height:122px;
background: #440000 url(''/images/nonzero_green_n1.gif'') repeat-x;
}

#header_inner
{
position: relative;
width: 950px;
height:122px;
margin: 0 auto;
}

/* Logo */

#logo
{
position: absolute;
bottom: 0.6em;
}

#logo h1
{
display: inline;
color: #fff;
font-size: 2.6em;
}

#logo h2
{
display: inline;
padding-left: 0.5em;
color: #D9E2C7;
font-size: 1.0em;
}

/* Menu */

#menu
{
position: absolute;
right: 0em;
bottom: 0em;
}

#menu ul
{
list-style: none;
}

#menu li
{
float: left;
}

#menu li a
{
margin-left: 0.5em;
display: block;
padding: 1.1em 1.4em 1.0em 1.4em;
background: #fff url(''/images/nonzero_green_n4.gif'') repeat-x;
border: solid 1px #fff;
color: #616161;
font-weight: bold;
font-size: 1.0em;
text-transform: lowercase;
text-decoration: none;
}

#menu li a.active
{
background: #2798D2 url(''/images/nonzero_green_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #468BAE;
}

/* Main */

#main
{
background: #fff url(''/images/nonzero_green_n2.gif'') 0px 1px repeat-x;
}

#main_inner p
{
text-align: justify;
margin-bottom: 2.0em;
}

#main_inner ul
{
margin-bottom: 2.0em;
}

#main_inner
{
position: relative;
width: 950px;
margin: 0 auto;
padding-top: 3.5em;
}

#main_inner h3,h4
{
border-bottom: dotted 1px #E1E1E1;
position: relative;
}

#main_inner h3
{
font-size: 2.1em;
padding-bottom: 0.1em;
margin-bottom: 0.8em;
}

#main_inner h4
{
font-size: 1.2em;
padding-bottom: 0.175em;
margin-bottom: 1.4em;
margin-top: 0.95em;
}

#main_inner .post
{
position: relative;
}

#main_inner .post h3
{
position: relative;
font-size: 1.7em;
padding-bottom: 1.2em;
}

#main_inner .post ul.post_info
{
list-style: none;
position: absolute;
top: 3em;
font-size: 0.8em;
}

#main_inner .post ul.post_info li
{
background-position: 0em 0.2em;
background-repeat: no-repeat;
display: inline;
padding-left: 18px;
}

#main_inner .post ul.post_info li.date
{
background-image: url(''/images/nonzero_green_n5.gif'');
}

#main_inner .post ul.post_info li.comments
{
background-image: url(''/images/nonzero_green_n6.gif'');
margin-left: 1.1em;
}

/* Footer */

#footer
{
width: 950px;
margin: 0 auto;
text-align: center;
clear: both;
border-top: dotted 1px #E1E1E1;
margin-top: 1.0em;
margin-bottom: 1.0em;
padding-top: 1.0em;
text-transform: lowercase;
}

/* Search */

input.button
{
background: #2798D2 url(''/images/nonzero_green_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #468BAE;
font-weight: bold;
text-transform: lowercase;
font-size: 0.8em;
height: 2.0em;
}

input.text
{
border: solid 1px #F1F1F1;
font-size: 1.0em;
padding: 0.25em 0.25em 0.25em 0.25em;
}

#search
{
position: relative;
width: 100%;
margin-bottom: 2.0em;
}

#search input.text
{
position: absolute;
top: 0em;
left: 0em;
width: 9.5em;
}

#search input.button
{
position: absolute;
top: 0em;
right: 0em;
min-width: 2.0em;
max-width: 2.5em;
}

/* LAYOUT - 3 COLUMNS */

	/* Primary content */
	
	#primaryContent_3columns
	{
	position: relative;
	margin-right: 34em;
	}
	
	#columnA_3columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -34em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_3columns
	{
	float: right;
	}
	
	#columnB_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 2em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
	#columnC_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
/* LAYOUT - 2 COLUMNS */

	/* Primary content */
	
	#primaryContent_2columns
	{
	position: relative;
	margin-right: 17em;
	}
	
	#columnA_2columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -17em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_2columns
	{
	float: right;
	}
	
	#columnC_2columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}

/* LAYOUT - COLUMNLESS */

	/* Primary content */
	
	#primaryContent_columnless
	{
	position: relative;
	}
	
	#columnA_columnless
	{
	position: relative;
	width: 100%;
	}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (111, 'nonzero_magenta.css', '', 0, 'blank', 'main', 1, '', '2008-04-23 23:53:28', 'admin', 'users', '1010', '/*

	Nonzero1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	missing in a maze

*/

/* This controls the width of the fluid width layouts */

div.fluid
{
width: 90% !important;
}

/* This controls the width of the fixed width layouts */

div.fixed
{
width: 950px !important;
}

/* Basic Stuff */

*
{
margin: 0em;
padding: 0em;
}

body
{
background-color: #fff;
color: #585858;
font-size: 9pt;
font-family: "trebuchet ms", helvetica, sans-serif;
}

h1,h2,h3,h4,h5,h6
{
font-weight: normal;
letter-spacing: -1px;
text-transform: lowercase;
}

h3,h4,h5,h6
{
color: #601B66;
}

h1 span
{
font-weight: bold;
}

h3 span
{
font-weight: bold;
}

h4 span
{
font-weight: bold;
}

br.clear
{
clear: both;
}

img
{
padding: 3px;
border: solid 1px #e1e1e1;
}

img.floatTL
{
float: left;
margin-right: 1.5em;
margin-bottom: 1.5em;
margin-top: 0.5em;
}

a
{
text-decoration: underline;
color: #D900B0;
}

a:hover
{
text-decoration: none;
}

ul.links
{
list-style: none;
}

ul.links li
{
line-height: 2em;
}

ul.links li.first
{
}

p
{
line-height: 1.8em;
}

/* Header */

#header
{
width:100%;
height:122px;
background: #440000 url(''/images/nonzero_magenta_n1.gif'') repeat-x;
}

#header_inner
{
position: relative;
width: 950px;
height:122px;
margin: 0 auto;
}

/* Logo */

#logo
{
position: absolute;
bottom: 0.6em;
}

#logo h1
{
display: inline;
color: #fff;
font-size: 2.6em;
}

#logo h2
{
display: inline;
padding-left: 0.5em;
color: #E2D2E4;
font-size: 1.0em;
}

/* Menu */

#menu
{
position: absolute;
right: 0em;
bottom: 0em;
}

#menu ul
{
list-style: none;
}

#menu li
{
float: left;
}

#menu li a
{
margin-left: 0.5em;
display: block;
padding: 1.1em 1.4em 1.0em 1.4em;
background: #fff url(''/images/nonzero_magenta_n4.gif'') repeat-x;
border: solid 1px #fff;
color: #616161;
font-weight: bold;
font-size: 1.0em;
text-transform: lowercase;
text-decoration: none;
}

#menu li a.active
{
background: #CA2FAD url(''/images/nonzero_magenta_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #A94B97;
}

/* Main */

#main
{
background: #fff url(''/images/nonzero_magenta_n2.gif'') 0px 1px repeat-x;
}

#main_inner p
{
text-align: justify;
margin-bottom: 2.0em;
}

#main_inner ul
{
margin-bottom: 2.0em;
}

#main_inner
{
position: relative;
width: 950px;
margin: 0 auto;
padding-top: 3.5em;
}

#main_inner h3,h4
{
border-bottom: dotted 1px #E1E1E1;
position: relative;
}

#main_inner h3
{
font-size: 2.1em;
padding-bottom: 0.1em;
margin-bottom: 0.8em;
}

#main_inner h4
{
font-size: 1.2em;
padding-bottom: 0.175em;
margin-bottom: 1.4em;
margin-top: 0.95em;
}

#main_inner .post
{
position: relative;
}

#main_inner .post h3
{
position: relative;
font-size: 1.7em;
padding-bottom: 1.2em;
}

#main_inner .post ul.post_info
{
list-style: none;
position: absolute;
top: 3em;
font-size: 0.8em;
}

#main_inner .post ul.post_info li
{
background-position: 0em 0.2em;
background-repeat: no-repeat;
display: inline;
padding-left: 18px;
}

#main_inner .post ul.post_info li.date
{
background-image: url(''/images/nonzero_magenta_n5.gif'');
}

#main_inner .post ul.post_info li.comments
{
background-image: url(''/images/nonzero_magenta_n6.gif'');
margin-left: 1.1em;
}

/* Footer */

#footer
{
width: 950px;
margin: 0 auto;
text-align: center;
clear: both;
border-top: dotted 1px #E1E1E1;
margin-top: 1.0em;
margin-bottom: 1.0em;
padding-top: 1.0em;
text-transform: lowercase;
}

/* Search */

input.button
{
background: #CA2FAD url(''/images/nonzero_magenta_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #A94B97;
font-weight: bold;
text-transform: lowercase;
font-size: 0.8em;
height: 2.0em;
}

input.text
{
border: solid 1px #F1F1F1;
font-size: 1.0em;
padding: 0.25em 0.25em 0.25em 0.25em;
}

#search
{
position: relative;
width: 100%;
margin-bottom: 2.0em;
}

#search input.text
{
position: absolute;
top: 0em;
left: 0em;
width: 9.5em;
}

#search input.button
{
position: absolute;
top: 0em;
right: 0em;
min-width: 2.0em;
max-width: 2.5em;
}

/* LAYOUT - 3 COLUMNS */

	/* Primary content */
	
	#primaryContent_3columns
	{
	position: relative;
	margin-right: 34em;
	}
	
	#columnA_3columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -34em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_3columns
	{
	float: right;
	}
	
	#columnB_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 2em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
	#columnC_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
/* LAYOUT - 2 COLUMNS */

	/* Primary content */
	
	#primaryContent_2columns
	{
	position: relative;
	margin-right: 17em;
	}
	
	#columnA_2columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -17em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_2columns
	{
	float: right;
	}
	
	#columnC_2columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}

/* LAYOUT - COLUMNLESS */

	/* Primary content */
	
	#primaryContent_columnless
	{
	position: relative;
	}
	
	#columnA_columnless
	{
	position: relative;
	width: 100%;
	}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (112, 'nonzero_red.css', '', 0, 'blank', 'main', 1, '', '2008-04-23 23:53:45', 'admin', 'users', '1010', '/*

	Nonzero1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	missing in a maze

*/

/* This controls the width of the fluid width layouts */

div.fluid
{
width: 90% !important;
}

/* This controls the width of the fixed width layouts */

div.fixed
{
width: 950px !important;
}

/* Basic Stuff */

*
{
margin: 0em;
padding: 0em;
}

body
{
background-color: #fff;
color: #585858;
font-size: 9pt;
font-family: "trebuchet ms", helvetica, sans-serif;
}

h1,h2,h3,h4,h5,h6
{
font-weight: normal;
letter-spacing: -1px;
text-transform: lowercase;
}

h3,h4,h5,h6
{
color: #66000F;
}

h1 span
{
font-weight: bold;
}

h3 span
{
font-weight: bold;
}

h4 span
{
font-weight: bold;
}

br.clear
{
clear: both;
}

img
{
padding: 3px;
border: solid 1px #e1e1e1;
}

img.floatTL
{
float: left;
margin-right: 1.5em;
margin-bottom: 1.5em;
margin-top: 0.5em;
}

a
{
text-decoration: underline;
color: #D90000;
}

a:hover
{
text-decoration: none;
}

ul.links
{
list-style: none;
}

ul.links li
{
line-height: 2em;
}

ul.links li.first
{
}

p
{
line-height: 1.8em;
}

/* Header */

#header
{
width:100%;
height:122px;
background: #440000 url(''/images/nonzero_red_n1.gif'') repeat-x;
}

#header_inner
{
position: relative;
width: 950px;
height:122px;
margin: 0 auto;
}

/* Logo */

#logo
{
position: absolute;
bottom: 0.6em;
}

#logo h1
{
display: inline;
color: #fff;
font-size: 2.6em;
}

#logo h2
{
display: inline;
padding-left: 0.5em;
color: #E5CCD0;
font-size: 1.0em;
}

/* Menu */

#menu
{
position: absolute;
right: 0em;
bottom: 0em;
}

#menu ul
{
list-style: none;
}

#menu li
{
float: left;
}

#menu li a
{
margin-left: 0.5em;
display: block;
padding: 1.1em 1.4em 1.0em 1.4em;
background: #fff url(''/images/nonzero_red_n4.gif'') repeat-x;
border: solid 1px #fff;
color: #616161;
font-weight: bold;
font-size: 1.0em;
text-transform: lowercase;
text-decoration: none;
}

#menu li a.active
{
background: #CA2F2F url(''/images/nonzero_red_n3.gif'') repeat-x;
color: #fff;
border: solid 1px #A94B4B;
}

/* Main */

#main
{
background: #fff url(''/images/nonzero_red_n2.gif'') 0px 1px repeat-x;
}

#main_inner p
{
text-align: justify;
margin-bottom: 2.0em;
}

#main_inner ul
{
margin-bottom: 2.0em;
}

#main_inner
{
position: relative;
width: 950px;
margin: 0 auto;
padding-top: 3.5em;
}

#main_inner h3,h4
{
border-bottom: dotted 1px #E1E1E1;
position: relative;
}

#main_inner h3
{
font-size: 2.1em;
padding-bottom: 0.1em;
margin-bottom: 0.8em;
}

#main_inner h4
{
font-size: 1.2em;
padding-bottom: 0.175em;
margin-bottom: 1.4em;
margin-top: 0.95em;
}

#main_inner .post
{
position: relative;
}

#main_inner .post h3
{
position: relative;
font-size: 1.7em;
padding-bottom: 1.2em;
}

#main_inner .post ul.post_info
{
list-style: none;
position: absolute;
top: 3em;
font-size: 0.8em;
}

#main_inner .post ul.post_info li
{
background-position: 0em 0.2em;
background-repeat: no-repeat;
display: inline;
padding-left: 18px;
}

#main_inner .post ul.post_info li.date
{
background-image: url(''/images/nonzero_red_n5.gif'');
}

#main_inner .post ul.post_info li.comments
{
background-image: url(''/images/nonzero_red_/n6.gif'');
margin-left: 1.1em;
}

/* Footer */

#footer
{
width: 950px;
margin: 0 auto;
text-align: center;
clear: both;
border-top: dotted 1px #E1E1E1;
margin-top: 1.0em;
margin-bottom: 1.0em;
padding-top: 1.0em;
text-transform: lowercase;
}

/* Search */

input.button
{
background: #CA2F2F url(''/images/nonzero_red_/n3.gif'') repeat-x;
color: #fff;
border: solid 1px #A94B4B;
font-weight: bold;
text-transform: lowercase;
font-size: 0.8em;
height: 2.0em;
}

input.text
{
border: solid 1px #F1F1F1;
font-size: 1.0em;
padding: 0.25em 0.25em 0.25em 0.25em;
}

#search
{
position: relative;
width: 100%;
margin-bottom: 2.0em;
}

#search input.text
{
position: absolute;
top: 0em;
left: 0em;
width: 9.5em;
}

#search input.button
{
position: absolute;
top: 0em;
right: 0em;
min-width: 2.0em;
max-width: 2.5em;
}

/* LAYOUT - 3 COLUMNS */

	/* Primary content */
	
	#primaryContent_3columns
	{
	position: relative;
	margin-right: 34em;
	}
	
	#columnA_3columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -34em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_3columns
	{
	float: right;
	}
	
	#columnB_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 2em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
	#columnC_3columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}
	
/* LAYOUT - 2 COLUMNS */

	/* Primary content */
	
	#primaryContent_2columns
	{
	position: relative;
	margin-right: 17em;
	}
	
	#columnA_2columns
	{
	position: relative;
	float: left;
	width: 100%;
	margin-right: -17em;
	padding-right: 2em;
	}
	
	/* Secondary Content */
	
	#secondaryContent_2columns
	{
	float: right;
	}
	
	#columnC_2columns
	{
	width: 13.0em;
	float: left;
	padding: 0em 0em 0.5em 2em;
	border-left: dotted 1px #E1E1E1;
	}

/* LAYOUT - COLUMNLESS */

	/* Primary content */
	
	#primaryContent_columnless
	{
	position: relative;
	}
	
	#columnA_columnless
	{
	position: relative;
	width: 100%;
	}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (113, 'nonzero.html', '', 0, 'nonzero', 'main', 1, '', '2008-04-24 00:11:32', 'admin', 'users', '1010', '<h2>Make changes to this text in content <i>nonzero.html</i>. Make changes to this layout in style <i>nonzero</i></h2>
<h3>A free design by NodeThirtyThree</h3>
				<img src="images/pic.gif" class="floatTL" alt="Something scenic" />

				<p>
					Nonzero<sup>1.0</sup> is a free, lightweight, tableless, fluid/fixed W3C-valid 
					website design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a>. 
					The scenic photo to the left is from <a href="http://www.pdphoto.org/">PDPhoto</a>. 
					You''re free to dissect, manipulate and use this design to your heart''s content. We only ask 
					that you link back to <a href="http://www.nodethirtythree.com/">our site</a> in some 
					way. If you find this design useful, feel free to let us know :)
				</p>
				
				<p>
					You can find more of our free work at this site or <a href="http://www.nodethirtythree.com/">our site</a>,
					or some of our commercial work on <a href="http://www.4templates.com/?aff=n33">4Templates.com</a>,
					a commercial website template site.
				</p>
				
				
				<br class="clear" />
			
				<div class="post">
				
					<h3>Specifics about Nonzero1.0</h3>
					<ul class="post_info">
						<li class="date">Posted by <a href="#">enks</a> on 11.14.2006</li>
						<li class="comments"><a href="#">44 comments</a></li>
					</ul>					
					<p>
						This design comes in the following low-sodium flavors: <a href="javascript:chooseStyle(''Red'');">red</a>, <a href="javascript:chooseStyle(''Green'');">green</a>, <a href="javascript:chooseStyle(''Blue'');">blue</a>, <a href="javascript:chooseStyle(''Magenta'');">magenta</a>, and <a href="javascript:chooseStyle(''Brown'');">brown</a>. Click on a color to see it in action (requires JavaScript).
					</p>
					<p>
						It also includes several alternate page layouts:
						<a href="index.html">three column (fixed width)</a>,
						<a href="index_2column.html">two column (fixed width)</a>,
						<a href="index_columnless.html">columnless (fixed width)</a>, 
						<a href="index_fluid.html">three column (fluid width)</a>,
						<a href="index_fluid_2column.html">two column (fluid width)</a>,
						and <a href="index_fluid_columnless.html">columnless (fluid width)</a>.
						You can also change the width of the fixed width layouts if needed. See the <em>style.css</em>
						file for more thought-provoking details.
					</p>
					<p>
						And now for a profound quote by the great philosopher, <a href="http://www.lipsum.com/">Lorem Ipsum</a>:
						Mauris neque adipiscing lacus, ac hendrerit	augue odio in mi. In ultrices enim. Curabitur a massa sed risus 
						viverra mollis. Proin dapibus mi porttitor nisi. Donec eget nibh dictum magna iaculis pharetra.
						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas at ligula. Donec tellus. Etiam sem.
						Sed quis urna. Duis tempor elit ac nulla. And don''t you forget it.
					</p>

				</div>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (114, 'naturalist.html', '', 0, 'naturalist', 'main', 1, '', '2008-04-24 00:17:54', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>naturalist.html</i>. Make changes to this layout in style <i>naturalist</i></h3>
<h3>Left Side</h3>
<p>
<a href=''#''>Lorem ipsum</a> ferri volumus et his. Pri vitae tritani corrumpit 
an. In fabulas adipisci accommodare quo, tibique epicurei cu 
mel, habeo adhuc <a href=''#''>scripta</a> nam at. <a href=''#''>Aliquam dissentias</a> 
te nec, his ei rebum prodesset. Eam cibo tation ceteros ut, cum solet accumsan 
ad. An per commune posidonium, ea est populo dicunt.
Mei tantas ceteros expetendis ex, mea ut quot repudiare. Recusabo argumentum 
pri ei, in justo mediocritatem sea, cu dolore albucius vel. Nam at docendi 
molestiae, cu eum quod diam omnium. Te accusata sapientem cum, falli petentium 
mnesarchum ei est, cu pro wisi mentitum ocurreret. Inani prompta numquam cu 
vim, ius et nisl aliquyam.
</p>

<h3>Second Paragraph</h3>
<p>
Ea vis verear omittam appetere. <a href=''#''>Laudem accusam takimata</a> ea est, 
eu delenit eligendi mediocrem mei. Mea at <a href=''#''>malorum</a> invenire 
urbanitas. Ei sea novum petentium deseruisse. Vero delectus efficiantur ei nec, 
amet tollit consetetur eos ut. Ea vis verear omittam appetere. <a href=''#''>
Laudem accusam takimata</a> ea est, eu delenit eligendi mediocrem mei. Mea at 
<a href=''#''>malorum</a> invenire urbanitas. Ei sea novum petentium deseruisse. 
Vero delectus efficiantur ei nec, amet tollit consetetur eos ut.
</p>

<h3>Third Paragraph</h3>
<p>
Eu iudico virtute per, eu facilis imperdiet pro. Et inani aeterno sed. Ius 
tempor eripuit voluptatibus ex. Eu vim virtute consequat, iuvaret aliquyam 
voluptaria ea per. No vide eloquentiam quo, eos soleat nusquam te. Mazim homero 
cotidieque ei eum, vim alia autem et.
Id principes constituam sed, eruditi disputationi at est. Mea audiam 
efficiantur no, aperiam viderer an vel, per alia volutpat cu. Ad usu ridens 
possim invenire, fastidii oporteat ei usu. Ne nisl inermis dissentiet nam. Eu 
per munere altera oporteat, at aperiri luptatum evertitur usu. Est quaeque 
delectus id, est quas eruditi comprehensam id.
</p>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (115, 'coffee_n_cream.html', '', 0, 'coffee_n_cream', 'main', 1, '', '2008-04-24 00:20:33', 'admin', 'users', '1010', '<h1>Make changes to this text in <i>content coffee_n_cream.html</i>. Make changes to this layout in style <i>coffee_n_cream</i></h1>
			<h1>Porttitor posuere</h1>
			<div class="descr">Jun 13, 2006 by Vulputate</div>

			<p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Nullam posuere tristique tortor. In bibendum. Aenean ornare, <a href="index.html">nunc eget pretium</a> porttitor, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est.</p>

			<blockquote><p>Sed sodales nisl sit amet augue. Donec ultrices, augue ullamcorper posuere laoreet, turpis massa tristique justo, sed egestas metus magna sed purus.</p></blockquote>
			
			<p>Aliquam risus justo, mollis in, laoreet a, consectetuer nec, risus. Nunc blandit sodales lacus. Nam luctus semper mi. In eu diam.</p>

			<p>Fusce porta pede nec eros. Maecenas ipsum sem, interdum non, aliquam vitae, interdum nec, metus. Maecenas ornare lobortis risus. Etiam placerat varius mauris. Maecenas viverra. Sed feugiat. Donec mattis <a href="index.html">quam aliquam</a> risus. Nulla non felis sollicitudin urna blandit egestas. Integer et libero varius pede tristique ultricies. Cras nisl. Proin quis massa semper felis euismod ultricies.
			</p>

			<h1>Adipiscing</h1>
			<div class="descr">Jun 11, 2006 by Laoreet</div>

			<p>Aliquam risus justo, mollis in, laoreet a, consectetuer nec, risus. Nunc blandit sodales lacus. Nam luctus semper mi. In eu diam. Phasellus rutrum elit vel nisi. Cras mauris nulla, egestas quis, cursus at, venenatis ac, ante. Fusce accumsan enim et arcu. Duis sagittis libero at lacus. Suspendisse lacinia nulla eget urna.</p>

			<ul>
				<li>Tristique</li>
				<li>Aenean</li>
				<li>Pretium</li>
			</ul>

			<p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Nullam posuere tristique tortor. In bibendum. Aenean ornare, nunc eget pretium porttitor, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est. Sed sodales nisl sit amet augue. Donec ultrices, augue ullamcorper posuere laoreet, turpis massa tristique justo, sed egestas metus magna sed purus. Fusce eleifend, dui ut posuere auctor, justo elit posuere sapien, at blandit enim quam fringilla mi.</p>

			<h1>Interdum</h1>
			<div class="descr">May 24, 2006 by Lectus</div>

			<p>Praesent nisi sem, bibendum in, ultrices sit amet, euismod sit amet, dui. Donec varius tincidunt nisi. Ut ut sapien. Integer porta. Fusce nibh. Curabitur pellentesque, lectus at <a href="index.html">volutpat interdum</a>, sem justo placerat elit, eget feugiat est leo tempor quam. Ut quis neque convallis magna consequat molestie. Nullam semper massa eget ligula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque a nibh quis nunc volutpat aliquam</p>

			<code>margin-bottom: 12px;
font: normal 1.1em "Lucida Sans Unicode",serif;
background: url(img/quote.gif) no-repeat;
padding-left: 28px;
color: #555;</code>

			<p>Eget feugiat est leo tempor quam. Ut quis neque convallis magna consequat molestie.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (116, 'antique_modern.html', '', 0, 'antique_modern', 'main', 1, '', '2008-04-24 00:23:28', 'admin', 'users', '1010', '    						<h1>Make changes to this text in content <i>antique_modern.html</i>. Make changes to this layout in style <i>antique_modern</i></h1>
    						<h1>News</h1>
    						<h2>March 9, 2006</h2>
								<p>
								  I extended the modified tags on the <a href="tags.html">tags</a>
									page.  Enjoy the vast amount of customization for this template!
								</p>
    						<h2>March 8, 2006</h2>
    						<p>
    							 The new design seems to be up and running.  I have been pondering
    							 what to name this template while putting it up as an Open Source
    							 design.  Well, I couldn''t think of anything creative, so I went
    							 with Antique_Modern.  There is a <a href="index.html">2 column
									 layout</a> for most pages and a 1 column layout (which you see
    							 here) for alternate pages.  Take a look
    							 <a href="tags.html">around</a>, and enjoy!
    						</p>
    						<h2>March 7, 2006</h2>
    						<p>
    							 Decided to stop mooching on other people''s designs and started
    							 making my own.  I took some concepts of design from <a href="http://www.oswd.org/design/preview/id/2740" target="_blank">Nautica02</a>
    							 (the dropshadow/background idea) which was too wide for a
    							 standard 800x600, and also the tabs come from many influence,
    							 though is reasonably attributed to the <a href="http://www.mozilla.org/" target="_blank">Mozilla Foundation</a> where
    							 the tabCSS/position trick was popularized.
    						</p>
								', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (117, 'andreas01.html', '', 0, 'andreas01', 'main', 1, '', '2008-05-29 23:08:57', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>andreas01.html</i>. Make changes to this layout in style <i>andreas01</i></h3>
<h2>Welcome to andreas01!</h2>

<p>This is a very simple (but also very useful) standard web layout: a fixed-width 3-column page with header and footer. There are thousands of variations of this layout, and this is no perfect solution. But it should be a great starting layout that you can customize in many ways and easily give a unique touch to. The layout is made of valid XHTML 1.0 Strict and CSS only, and it has no tables. If you remove all CSS, the page still works great in text mode (I''ve tested it on my old mobile phone, and it works like a charm).</p>

<p><img src="<?SPINE_Images?>andreas01_test.jpg" height="100" width="125" class="left" alt="" />The layout features one big image (front.jpg) which you can easily replace with your own header. The default image shows a snowy street in Porjus (northern Sweden), where I come from. The haiku can easily be replaced with an ad banner. There are also CSS classes for aligning text paragraphs and images.</p>

<p>This layout also has a print stylesheet, that you can customize in any way you want to. Per default, navigation menus and images are removed, and only the main content text is printed. <a href="index2.html">Look here</a> for an example of how the print layout looks, or print this page to see it in reality.</p>

<h3>The menubar</h3><p>The main navigation menu is an unsorted list, where each list item has been styled to be a button. There are lots of ways to style lists for navigation, but I''ve kept things simple for this layout. Adding "that little extra" is up to you! <img src="test.jpg" class="right" height="100" width="125"  alt="" /></p>

<p>If you like this layout and would like to use it in any way, you are free to do so. This is an <a href="http://oswd.org">open source web design</a>, and all I ask for is that you leave the "Design by Andreas Viklund" link in the footer of the site. If you would like to remove that line, or if you would like professional help with anything related to this layout (such as custom design, branding, scripting or programming), please contact me <a href="http://oswd.org/email.phtml?user=Andreas">through OSWD.org</a> or through my website for more information.</p>

<p>Good luck with your new website!</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (118, 'autonomous.html', '', 0, 'autonomous', 'main', 1, '', '2008-04-24 21:54:55', 'admin', 'users', '1010', '<div align="center">
<h3>Make changes to this text in content <i>autonomous.html</i>. Make changes to this layout in style <i>autonomous</i></h3>
   <table width="549" border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td colspan="4" height="1" bgcolor="AAAAAA"></td>
     <td width="5" height="1" bgcolor="FFFFFF"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>

     <td rowspan="2" colspan="2" width="542" height="27" bgcolor="F9F9F9" style="color:FFBA27;font-size:15px">&nbsp;&nbsp;introduction</td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" height="4" bgcolor="FFFFFF"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0" height="23"></td>

    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td colspan="2" height="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>

     <td colspan="2" bgcolor="FFFFFF">
      <table width="542" border="0" cellpadding="17" cellspacing="0">
       <tr>
        <td style="color:999999;line-height:1.6em">
        <div align="justify">
        Hello, and welcome to autonomous, my 4th design for <a href="http://www.oswd.org" style="font-size:12px">OSWD</a>. First, I''d like to tell a little about myself and who I am. I own my own web design company, <a href="http://www.principleofdesign.com" style="font-size:12px">Principle of Design</a>, but have been designing for 5 years. It may be a little surprising but I''m only 15 years old and am a sophomore in high school. I stay basically inside on my computer all day except for school and gym practice.
        </div>

        </td>
       </tr>
      </table>
     </td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>

     <td colspan="2" height="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>
    <tr>
     <td width="1" height="5" bgcolor="FFFFFF"></td>
     <td width="4" height="5" bgcolor="FFFFFF"></td>
     <td width="538" height="5" bgcolor="F0F0F0"></td>
     <td width="1" height="5" bgcolor="F0F0F0"></td>

     <td width="5" height="5" bgcolor="F0F0F0"></td>
    </tr>
   </table>
  <br>
   <table width="549" border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td colspan="4" height="1" bgcolor="AAAAAA"></td>
     <td width="5" height="1" bgcolor="FFFFFF"></td>
    </tr>

    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td rowspan="2" colspan="2" width="542" height="27" bgcolor="F9F9F9" style="color:FFBA27;font-size:15px">&nbsp;&nbsp;thoughts on this design</td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" height="4" bgcolor="FFFFFF"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>

     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0" height="23"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td colspan="2" height="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>

    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td colspan="2" bgcolor="FFFFFF">
      <table width="542" border="0" cellpadding="17" cellspacing="0">
       <tr>
        <td style="color:999999;line-height:1.6em">
        <div align="justify">
        After <a href="http://www.oswd.org/design/1529/orangray/" style="font-size:12px">orangray</a>, I wasn''t happy with what I had made, so I decided to make another orange and gray design. This one I like much better and everything doesn''t feel so cramped.
        </div>

        </td>
       </tr>
      </table>
     </td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>

     <td colspan="2" height="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>
    <tr>
     <td width="1" height="5" bgcolor="FFFFFF"></td>
     <td width="4" height="5" bgcolor="FFFFFF"></td>
     <td width="538" height="5" bgcolor="F0F0F0"></td>
     <td width="1" height="5" bgcolor="F0F0F0"></td>

     <td width="5" height="5" bgcolor="F0F0F0"></td>
    </tr>
   </table>
  <br>
   <table width="549" border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td colspan="4" height="1" bgcolor="AAAAAA"></td>
     <td width="5" height="1" bgcolor="FFFFFF"></td>
    </tr>

    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td rowspan="2" colspan="2" width="542" height="27" bgcolor="F9F9F9" style="color:FFBA27;font-size:15px">&nbsp;&nbsp;design usage</td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" height="4" bgcolor="FFFFFF"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>

     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0" height="23"></td>
    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td colspan="2" height="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>

    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td colspan="2" bgcolor="FFFFFF">
      <table width="542" border="0" cellpadding="17" cellspacing="0">
       <tr>
        <td style="color:999999;line-height:1.6em">
        <div align="justify">
        This design was made to be full screen on a 800 x 600, but works with any other resolution.
        <br>

        Anyone is free to use this design, but if you do, <a href="mailto:webmaster@principleofdesign.com" style="font-size:12px">email me</a> please. Thanks! 
        </div>
        </td>
       </tr>
      </table>
     </td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>

    </tr>
    <tr>
     <td width="1" bgcolor="AAAAAA"></td>
     <td colspan="2" height="1" bgcolor="AAAAAA"></td>
     <td width="1" bgcolor="AAAAAA"></td>
     <td width="5" bgcolor="F0F0F0"></td>
    </tr>
    <tr>
     <td width="1" height="5" bgcolor="FFFFFF"></td>

     <td width="4" height="5" bgcolor="FFFFFF"></td>
     <td width="538" height="5" bgcolor="F0F0F0"></td>
     <td width="1" height="5" bgcolor="F0F0F0"></td>
     <td width="5" height="5" bgcolor="F0F0F0"></td>
    </tr>
   </table>
  <span style="font-size:6px"><br></span>
</div>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (119, 'dittoditto.html', '', 0, 'dittoditto', 'main', 1, '', '2008-04-24 22:04:45', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>dittoditto.html</i>. Make changes to this layout in style <i>dittoditto</i></h3>
<p>This template uses tables, for most layout features. This content box, and the one adjacent to the right, are easily removed by deleting everything between the comment labeled "Begin Bottom Content Boxes" and the comment labeled "End Bottom Content Boxes."</p>

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (120, 'plain.html', '', 0, 'plain', 'main', 1, '', '2008-04-24 22:19:11', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>plain.html</i>. Make changes to this layout in style <i>plain</i>.</h3>
<a name="intro" id="intro"></a>Introduction
						
						<img src="images/backgrounds/menu.jpg" alt="AN EXAMPLE IMAGE" title="AN EXAMPLE IMAGE" class="articleimg" />
						
						<p>
								Hello and welcome to Plain 1.0 by me, <a href="http://www.oswd.org/userinfo.phtml?user=JayKay">JayKay</a>. As mentioned earlier this is a fairly simple template, powered entirely by css and xhtml. I am also trying to make as much use of whitespace as possible. Whitespace helps keep the page looking clean and easy on the eye, whilst improving readability also. As with all my templates, a limited number of images have been used, and when they have, they''ve been to aid the design. This results in an easily customisable template that can be used to an array of different sites.
						</p>
						
						<h1><a name="css" id="css"></a>CSS &amp; XHTML</h1>

												
						<p>
								As anyone looking for a website template to use would expect - this
								template is of course, both <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> and <a href="http://validator.w3.org/check?uri=referer">XHTML</a> valid according to the w3c.
								The benfits of this include; 
						</p>
						
						<ul>
								<li>The website rendering correctly in a wide range of browser platforms</li>
								<li>Since CSS is used to maximise the aesthetics of the website the load times are extremely low making for an extremely accessable website.</li>

								<li>Low use of images saves bandwidth and improves load times</li>
						</ul>

						<p>
								For more information regarding this, and lots of other usefull web design related stuff, follow this <a href="http://www.w3.org/MarkUp/2004/xhtml-faq" target="_blank">link</a>.
						</p>
						
						<h1><a name="about" id="about"></a>About the Author</h1>
						
						<p>

							Hi there. My names Jay and I''m an 18 Year old web designer from the United Kingdom. My company; <a href="http://www.sixshootermedia.com" target="_blank">Six Shooter Media</a>

							provides a wide range of web design possibilities to a wide range of
							clients. I specialise in CSS and XHTML coding but can also install and
							modify PHP scripts such as Counters and Content Management Systems. 
						</p>
						
						<p>
								I also run my own personal <a href="http://www.jameskoster.co.uk">website</a>,
								which I use as a blog, a place to upload my photographs/drawings, do a
								bit of writing, and post news about my web design capers now and again.
								Along side this website, I''ve just opened another website which I use
								to host my templates and write tutorials for web design beginners. This
								can be found <a href="http://xij.p0wned.org/prettyasapicture/">here</a>.
						</p>

						
						<p>
								I make these web templates in my spare time as a kind of hobby, plus I
								like ''giving something back'' to the web design community. Feel free to
								download and use this template as you wish - for you site or just for
								education purposes, but please leave the link to my website in at the
								bottom of the page, thanks.
						</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (121, 'metro01.html', '', 0, 'metro01', 'main', 1, '', '2008-04-24 22:35:14', 'admin', 'users', '1010', '				<h3>Make changes to this text in content <i>metro01.html</i>. Make changes to this layout in style <i>metro01</i>.</h3>
			<div class="entry">
				<h2>Lorem Ipsum</h2>
				<p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, 
				totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 
				Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, 
				sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. 
				Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, 
				sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 
				Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, 
				nisi ut aliquid ex ea commodi consequatur? 
				Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, 
				vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?" </p>
				<div class="links">submitted by <a href="#">Drugo</a> in <a href="#">Section1</a></div>

			</div>
			
			<div class="entry">
				<h2>Lorem Ipsum 2</h2>
				<p>"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, 
				and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. 
				No one rejects, dislikes, or avoids pleasure itself, because it is pleasure,
				but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.
				Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, 
				but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. 
				To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? 
				But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, 
				or one who avoids a pain that produces no resultant pleasure?"  </p>
				<div class="links">submitted by <a href="#">Drugo</a> in <a href="#">Section1</a></div>

			</div>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (122, 'nightcity.html', '', 0, 'nightcity', 'main', 1, '', '2008-04-24 22:40:05', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>nightcity.html</i>. Make changes to this layout in style <i>nightcity</i>.</h3>
<h1>Text Header</h1>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor semper libero. Vestibulum at erat eget arcu sagittis adipiscing. Vestibulum odio nisi, scelerisque et, tempus et, adipiscing vitae, augue. Fusce consectetuer, elit sit amet viverra ornare, odio eros luctus nisl, vel tempus felis quam et arcu. Proin id elit. Fusce rutrum mauris sit amet nibh viverra porttitor. Phasellus eu lorem vitae augue aliquet aliquam. Integer vestibulum viverra tellus. Aliquam est arcu, ullamcorper nec, molestie vitae, rutrum vitae, ligula. Vivamus vitae augue at dui consequat tempor.</p>
<p>Ut porttitor aliquam ligula. Quisque ultrices. Proin massa lectus, molestie sed, porta consequat, ornare ac, leo. Etiam pellentesque, nibh at interdum interdum, mauris nisl aliquet lorem, at sodales elit dolor id velit. Phasellus iaculis velit viverra magna. Nullam tincidunt molestie erat. Pellentesque justo. Ut elementum auctor dolor. Nam sagittis tempor purus. Morbi a sem non mi tempus feugiat. Integer tempor dolor non tortor. Ut ullamcorper sapien ut quam. Fusce posuere porttitor felis. Cras volutpat dignissim massa.</p>
<p>Aliquam sit amet augue in dui porttitor consectetuer. Nulla facilisi. Nunc suscipit, diam et dignissim consequat, sapien ante sodales orci, et lobortis tellus tortor imperdiet dui. Donec volutpat nonummy dui. In hac habitasse platea dictumst. Suspendisse potenti. Vestibulum ultrices pharetra ligula. Nulla facilisi. In accumsan congue turpis. <a href="#">Integer lorem</a>. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas dui. Etiam sit amet dolor vitae nunc fermentum blandit. Donec tincidunt. Suspendisse odio diam, sagittis vitae, consectetuer vel, cursus sed, enim. Phasellus ac lacus. Ut luctus, sapien ut sagittis cursus, tellus justo aliquam purus, vel consequat massa ligula sit amet magna.</p>
<h1>Second Header</h1>
<p>In velit. In convallis, libero at suscipit tempus, nunc tortor tempus augue, in tincidunt urna dui eget purus. Nunc leo sem, pulvinar non, euismod eu, condimentum sed, massa. Vivamus lorem arcu, consequat nec, ornare id, porttitor non, felis. Nullam nec dolor. Quisque sed urna. Nam libero. Praesent vel orci non nulla adipiscing aliquam. Sed enim dolor, hendrerit quis, rutrum sed, tincidunt a, mi. Donec fermentum metus vel ligula tempor condimentum. Aliquam erat volutpat. Cras fringilla faucibus erat. Aenean congue.</p>
<p>Curabitur arcu tellus, suscipit in, aliquam eget, ultricies id, sapien. Nam est. Donec neque risus, tempor vitae, blandit in, porttitor a, sapien. Fusce sollicitudin quam ac neque. Proin ac nulla id nisi dapibus commodo. Cras nulla purus, malesuada eu, pretium id, imperdiet vitae, odio. Phasellus congue ultrices lorem. Quisque sodales. Aliquam erat volutpat. Donec at mauris ut nisl aliquet convallis. Vivamus quam urna, suscipit at, porttitor sed, cursus quis, lorem.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (123, 'bluerain.html', '', 0, 'bluerain', 'main', 1, '', '2008-04-24 22:44:54', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>bluerain.html</i>. Make changes to this layout in style <i>bluerain</i>.</h3>
				<div class="article">
					<h2>Cras rhoncus facilisis odio</h2>
					<p>
						Donec euismod vehicula lacus. Suspendisse vitae leo. Nunc at arcu quis felis faucibus pretium. Morbi vehicula lacus adipiscing tellus. Praesent et diam. Sed sed orci a magna dapibus hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Phasellus non arcu. Sed dolor diam, cursus ac, iaculis quis, gravida quis, urna. Nam vel dui in erat eleifend dapibus. In suscipit orci sit amet arcu. Vivamus hendrerit nulla quis lectus. Quisque eros est, volutpat eu, elementum quis, lacinia ac, orci. Donec ac tortor.
					</p>
					<p>
						Quisque in est ut augue sollicitudin porta. Fusce blandit. Pellentesque porttitor feugiat erat. Quisque mi. Duis quis nunc id arcu rutrum lacinia. Vivamus auctor hendrerit neque. Sed viverra, enim a rutrum tempus, erat erat luctus ante, varius pretium ante pede ac lorem. Fusce vestibulum libero a wisi. Suspendisse potenti. Morbi vulputate dignissim magna. Nunc sollicitudin. Sed ligula felis, eleifend sed, feugiat a, rutrum ut, risus. Aliquam augue felis, scelerisque non, nonummy nec, aliquam convallis, nibh. Cras rhoncus facilisis odio.
					</p>
				</div>

				<div class="article">
					<h3>Donec euismod vehicula lacus</h3>
					<p>
						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent id justo a libero vehicula posuere. Praesent placerat est ut ligula. Nunc ut erat. Donec at metus eu ante dictum commodo. Curabitur felis. Integer sit amet dui. Nam at arcu nec libero nonummy fermentum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent ac nibh eget dolor sagittis fringilla. Sed odio. Integer a urna et enim convallis congue. Aenean vehicula.
					</p>
				</div>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (124, 'mintchocolate.html', '', 0, 'mintchocolate', 'main', 1, '', '2008-04-24 22:50:55', 'admin', 'users', '1010', '<h2>Make changes to this text in content <i>mintchocolate.html</i>. Make changes to this layout in style <i>mintchocolate</i>.</h2>
<h1>Welcome To MCC</h1>

				<p>Welcome to Mint Chocolate Chip, named after my girlfriend''s favorite ice cream. It is a clean, tableless, minty design. I stumbled upon this color scheme by accident, but I am happy I did. The design was coded completely in Notepad, my favorite HTML editor.</p>

				<h1>Some Details...</h1>

				<p>It is actually a <strong>very</strong> lightweight design, weighing less than 50KB, and only using four images (including the header and the photo). The menu is built with 100% CSS, no images.</p>

				<p>The layout is valid <a href="http://validator.w3.org/check?uri=referer">XHTML 1.0 Transitional</a>. I have tested it in IE 6 and Firefox, it looks good in both. I haven''t tested it in Opera or Safari, just let me know if it is breaking in any browsers and I will try to fix it up.</p>

				<p>The font used in the header is <a href="http://simplythebest.net/fonts/fonts/ghostwriter.html"> Ghostwriter</a>. The photo above added some much needed character to the design. It can be found over at <a href="http://www.sxc.hu/photo/494899">stock.xchnge</a>, and has no usage restrictions.</p>

				<h1>Design Usage</h1>

				<p>Feel free to use this design wherever, whenever, and however you wish. The <strong>only thing I ask of you</strong> is to leave the &quot;design by andrewstrojny&quot; link in the footer. If you would like to remove that line, or if you would like professional help with anything related to this design (such as custom design or branding) please drop me an <a href="http://www.andrewstrojny.com/contact.htm">e-mail</a> or just head over to my <a href="http://www.andrewstrojny.com">website</a>.</p>

', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (125, 'gscape.html', '', 0, 'gscape', 'main', 1, '', '2008-04-24 23:06:17', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>gscape.html</i>. Make changes to this layout in style <i>gscape</i>.</h3>
						<p>Hi, Thanks for your interest in this web template. This is my second design 
						as open web template. I am from Bangalore [India] and by profession I am a developer 
						and have great interest in web design. I have learned a lot about web design 
						HTML and CSS form OSWD and OWD and I am great full these two great sites for doing such a noble job.
						The tools that were used to do the template are GIMP, HTML-Kit, Pixie and Color Schemer Studio.</p>
						
						<p>This is a simple template with two columns and one header, a menu and contents with two images, 
						it also has a text based shadow effect (which behaves undesirably for different text size) which 
						provides some extra attraction for the header. The header image, rounded corners were created using 
						GIMP, the best free image manipulation program. This template uses very limited images, a main header 
						image and other set (4) for rounded corners which can be removed with no affect to basic functionality 
						and appearance, in fact it transforms into a new template without the images. The side column can be 
						used add favorite links, Google ads etc. I have tested this template in Firefox 1.5, Opera 8.5, 
						Netscape 8.0.4 and IE 6.0 and it works fine in all these browsers. This is a valid 
						<a href="http://validator.w3.org/check?uri=referer">XHTML</a> and
						<a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> and it is also very easy to customize. 
						You can use this template with no restrictions, a simple notification email to either 
						<a href="http://oswd.org/user/contact/id/7724">OSWD</a>

						or <a href="http://openwebdesign.org/email.phtml?user=kpgururaja">OWD</a>
						would be encouraging. Thank you very much for your support.</p>
						<p class="Comments">Posted by Guru | General | 19 comments</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (126, 'neuphoric.html', '', 0, 'neuphoric', 'main', 1, '', '2008-04-24 23:09:53', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>neuphoric.html</i>. Make changes to this layout in style <i>neuphoric</i>.</h3>
<strong>This template is a modified version of <a href="http://www.oswd.org/user/profile/id/8809" title="Go to tristar&rsquo;s OSWD user page">tristar&rsquo;s</a> <a href="http://www.oswd.org/design/preview/id/2755" title="Go to the original template">original</a></strong>

	<h2>changes.</h2>
	<ul>

		<li>Page hyperlinks are a bit easier to notice</li>
		<li>Made the green menu slightly darker so that the white links are easier to see</li>
		<li>Fluid design</li>
		<li>Code redone (not that I am saying mine is better, I just like coding my own way.)</li>
		<li>Gradients resize with font</li>
		<li>More user friendly</li>

		<li>Different banner to accomodate for the fluid layout (original wasn''t wide enough)</li>
	</ul>
	
	<p>To view the source of this banner, see picture <a href="http://www.sxc.hu/browse.phtml?f=view&amp;id=485493">485493</a> at <a href="http://www.sxc.hu">sxc.hu</a></p>
	
	<p>If anyone can give me links etc on how to improve accesability, I would be very happy to read them. Please use the
	email option on my <a href="http://www.openwebdesign.org/userinfo.phtml?user=mejobloggs" title="contact me through my OWD user page">OWD user page.</a></p>
	
	<h2>design.notes</h2>

	<ul>
		<li>800x600 and up (Can stretch to 2000px wide without the banner running out)</li>
		<li>valid xhtml/css</li>
		<li>looks great! (not open to subjective dispute)</li>
		<li>Tested and ok in IE5.5, IE6, Firefox 1.51, Opera 8.53 (although IE5.5 has a small bug, but it still looks fine)</li>
	</ul>
	<p>I have heard a few people complaining about the lack of fluid designs. With the increase
	of larger screens and higher resolutions, some people are getting sick of looking at a small thing
	in the middle of the screen</p>

	<p>A problem with fluid designs is that once the content stretches wide, the line lengths become
	rather long, and are harder to read. Hopefully because the content on this is 75% wide, the line lengths
	do not become too wide.</p>
	<h2>header.one.</h2>
	
	<p>this site has been created for personal use only - please do not sell on this 
	template it has been created by
	<a title="derby web design" href="http://www.tristarwebdesign.co.uk">tri-star 
	web design</a> free of charge.</p>
	<p><strong>please note:</strong> as this is a free template the only thing i ask in return 
	is you leave the bottom link to
	<a title="derby web design" href="http://www.tristarwebdesign.co.uk">tri-star 
	web design</a> as it is, anything else you can chop and change to your hearts 
	content. thank you for downloading this template, i hope it comes in handy.</p>

	
	<h2>header.two.</h2>
	
	<p>tri-star web design is devoted to helping you/your company maximise its 
	potential through the internet. are you after web presence at an affordable 
	price? is your current website not generating the interest you think it 
	deserves? tri-star web design can design or help in the development of a new 
	website, giving potential customers a true impression of your business. as i am 
	a freelance web designer i can focus my full attention on each customer to 
	giving that personal touch that i believe is so important.</p>
	
	<h2>header.three.</h2>
	
	<p>i work with clients in the derby (derbyshire), nottingham (nottinghamshire), 
	leicester (leicestershire) and throughout the united kingdom. if you are from 
	outside the uk please feel free to get in touch for a quote as i am more than 
	happy to expand my services beyond the uk.for a one-off fee with no hidden 
	charges, i can design you a website to your exact specifications. just tell me 
	what you want to say to your customers, send any pictures you would like to show 
	them, and i will turn this basic information into a sleek professional yet 
	effective website.</p>
	
	<p>i don&#39;t only deal with businesses, maybe your after a website for a hobby? or 
	a family website? whatever it is you are after i can help you.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (127, 'progress.html', '', 0, 'progress', 'main', 1, '', '2008-04-25 18:41:07', 'admin', 'users', '1010', '<h3>Make changes to this text in content <i>progress.html</i>. Make changes to this layout in style <i>progress</i>.</h3>
	<h2>.page.title.one</h2>
	
	<p>for this template i''ve taken the idea of the scrollable page from 
	&quot;andreas07&quot; so firstly thank you to andreas for that (http://www.andreasviklund.com). <b>no tables or 
	frames have been used to make this template, its all css and xhtml.</b></p>
	<p>this site has been created for personal use only - please do not sell on this 
	template it has been created by
	<a title="tri-star web design" href="http://www.tristarwebdesign.co.uk">tri-star 
	web design</a> free of charge.</p>

	<p><b>please note:</b> as this is a free template the only thing i ask in return 
	is you leave the bottom link to
	<a title="tri-star web design" href="http://www.tristarwebdesign.co.uk">tri-star 
	web design</a> as it is, anything else you can chop and change to your hearts 
	content. thank you for downloading this template, i hope it comes in handy.</p>
	<p>this page is created with frontpage but you can edit it with dreamweaver - it 
	utilises CSS and is vaild XHTML STRICT 1.0. it has also been tested in microsoft 
	explorer, mozilla firefox and netscape 8.0 - fingers crossed everything 
	looks ok! if this is not enough it also works in 800x600 screen resolution, 
	but is mainly for 1024x768.</p>
	
	<br />
	
	<h2>.page.title.two</h2>
	
	<p>tri-star web design is devoted to helping you/your company maximise its 
	potential through the internet. are you after web presence at an affordable 
	price? is your current website not generating the interest you think it 
	deserves? tri-star web design can design or help in the development of a new 
	website, giving potential customers a true impression of your business. as i am 
	a freelance web designer i can focus my full attention on each customer to 
	giving that personal touch that i believe is so important.</p>

	
	<br />
	
	<h2>.page.title.three</h2>
	
	<p>i work with clients in the derby (derbyshire), nottingham (nottinghamshire), 
	leicester (leicestershire) and throughout the united kingdom. if you are from 
	outside the uk please feel free to get in touch for a quote as i am more than 
	happy to expand my services beyond the uk.for a one-off fee with no hidden 
	charges, i can design you a website to your exact specifications. just tell me 
	what you want to say to your customers, send any pictures you would like to show 
	them, and i will turn this basic information into a sleek professional yet 
	effective website.</p>
	
	<p>i don&#39;t only deal with businesses, maybe your after a website for a hobby? or 
	a family website? whatever it is you are after i can help you.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (128, 'littlehome.html', '', 0, 'littlehome', 'main', 1, '', '2008-04-25 18:49:57', 'admin', 'users', '1010', '<h2>Make changes to this text in content <i>littlehome.html</i>. Make changes to this layout in style <i>littlehome</i>.</h2>
<h2>Welcome to little home</h2><h4>30 January 06</h4>
<p>
<a href="#">little home</a> is a simple design that has been coded entirely in XHTML 1.0 &amp; CSS.
<br/>
The template can be used in personal websites and also in blogs.
<br/>
There are no tables in the html code and the presentation is clear :)

</p>

<h2>Lorem ipsum dolor sit</h2><h4>30 January 06</h4>
<p>
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
<br/><br/>
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
</p>

<h2>The author</h2><h4>30 January 06</h4>
<p>
I am Kumiko, a Java programmer and pianist from Japan. If you like this template, you may drop me a mail from my <a href="http://www.kumi.co.nr">my website</a>
</p>


<p><img src="/images/littlehome_cherry.jpg" alt=""/></p> ', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (129, 'redbusiness.css', '', 0, 'blank', 'main', 1, '', '2008-04-25 19:06:37', 'admin', 'users', '1010', '/*
	StyleSheet by David Herreman
	http://www.free-css-templates.com
		
*/

body { 
	padding: 0; 
	margin: 0; 
	font: .74em Arial, sans-serif; 
	line-height: 1.5em; 
	background: #fff url(/images/redbusiness_top.jpg) repeat-x top; 
	color: #454545; 
	}
	
a { color: #DA3B3B; background: inherit; }
a:hover { color: #DA3B3B; background: inherit; text-decoration: underline}
p {	margin: 5px 0; }
h1 {	font: bold 1.8em Arial, Sans-Serif; padding: 8px 0 4px 0; margin: 0; letter-spacing: -1px; }
h2 { font: bold 1.6em Arial, Sans-Serif; letter-spacing: -1px; }
h3 { padding: 4px 0; margin:  0; }
ul { margin: 0; padding : 0; list-style: none; }
img { border: 0; }
hr { height: 1px; border-style: none; color: #d0d0d0; background-color: #C0C0C0; margin: 10px 0; }


.content { margin: 0px auto; width: 800px; }

/* Top part */
#top { padding-top: 20px; background: transparent; height: 101px; }
	#top h1 { font: bold 1.8em Arial, Sans-Serif; padding: 8px 0 4px 0; margin: 0; letter-spacing: 1px; color: #FFF }
	#top h2 { font: 1.0em Arial, Sans-Serif; letter-spacing: 0px; color: #868686; margin:0; padding: 0 }
	#top #icons { float: right; margin:20px 0; padding:0 }
	#top #icons img { padding-right: 2px; border: 0 }

/* Second part */
#prec { 	height: 220px; 	margin:0; padding: 0; background: #F6F6F6; border-bottom: 1px solid #DCDCDC; overflow: hidden; margin-bottom: 15px }
	#wrap { margin: 0 auto; width: 800px; }
		#wrap #pic { float: right; background: #FF0000 url(/images/redbusiness_mainimg.jpg) no-repeat; height: 199px; width: 589px; overflow: hidden}
			#wrap #pic #slogan { float: right; padding: 25px 30px 10px 30px; text-align: right }
			#wrap #pic #slogan h1 { font: bold 1.4em Arial, Sans-Serif; color: #FFF; letter-spacing: 1px; margin:0 }
			#wrap #pic #slogan h2 { font:  1.0em Arial, Sans-Serif; color: #FFF; letter-spacing: 0px; margin:0; padding: 10px 0}
			#wrap #pic #slogan a { color: #FFF; }
			
		#wrap #menu { padding: 0; margin:0; background: inherit; }
		#wrap #menu a { padding-left: 25px; font:  0.9em Arial, Sans-Serif; text-decoration: none; background: #F6F6F6 url(/images/redbusiness_lm-li.gif) no-repeat left;  }
		#wrap #menu ul { padding: 10px 0 }
		#wrap #menu li { line-height: 26px; background: #F6F6F6 url(/images/redbusiness_li-line.gif) no-repeat bottom left; list-style: none }
		

/*  Advertising */
#ad { background: #FFF url(/images/redbusiness_download.jpg) no-repeat left; padding-left: 95px; min-height: 80px; margin-bottom: 15px;}
#ad a, #left_side a { background: #FFF; text-decoration: none }
#ad a:hover, #left_side a:hover { text-decoration: underline }
		
/* main area */
#main { }
	#right_side { float: right; width: 212px; background: #F6F6F6; padding: 5px 10px 5px 10px; margin-bottom: 10px }
		#right_side ul { padding: 3px 0 8px 0 } 
		#right_side li { line-height: 18px; background: #F6F6F6 url(/images/redbusiness_cat-li.gif) no-repeat left; list-style: none; padding-left: 20px; }
		#right_side a { background: #F6F6F6; text-decoration:  none }
		#right_side h3 { color: #404040; font:  bold 1.2em Arial, Sans-Serif; }
	
	#left_side { background: #FFF; margin-bottom: 10px; width: 560px;  }
		#left_side h3 { background: #FFF url(/images/redbusiness_hbg.gif) repeat-x; height:30px; padding: 5px 0 0 0px; margin: 0; font:  bold 1.2em Arial, Sans-Serif; }
		#left_side h3 span { background: url(/images/redbusiness_h-art.gif) no-repeat left; padding: 1px 10px 0 23px;  line-height: 22px; margin: 0}
		#left_side p { color: #454545; padding: 0 5px 0 5px; text-align: justify }
		#left_side img { float: left; padding: 0 10px 5px 0 }
		#left_side blockquote { padding-left: 10px; border-left: 2px solid #DA4040; margin: 10px 0 10px 25px; }
		.date { border-top: 1px dotted #ccc; padding: 5px 0; margin: 10px 0 25px 0; text-align: right }		
		#left_side .rs { float: right; margin: 0 10px; border: 1px solid #ddd; padding: 5px; background: #f5f5f5  }
		#left_side ul { list-style-position: inside; margin-left: 2px }
		#left_side ul li { list-style-type: square; margin-left: 15px;  }
		#left_side ul ul li { list-style: none; margin-left: 10px; list-style-type: lower-alpha; list-style-position: inside }
	
/* The footer */
#footer { clear: both; border-top: 1px solid #DCDCDC; margin: 0 0 3em 0; color: #777;  background: #fff }
#footer .right  { float: right; text-align: right; background: #FFF; }
#footer a { text-decoration: none; background: #FFF }
	
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (130, 'redbusiness.html', '', 0, 'redbusiness', 'main', 1, '', '2008-04-25 19:19:10', 'admin', 'users', '1010', '	<div id="ad">
		sNews is a completly free <a href="http://www.php.net/" title="php">PHP </a>and <a href="http://www.mysql.com/" title="mysql">MySQL </a>driven tool for publishing and maintaining news articles on a website. Integrating sNews into your existing design is simple, but you could also use sNews on it''s own, as a simple Content Management System. Consisting of only one file, sNews is extremely lightweight, very easy to install, and easy to use via a simple web interface.<br />
		<a href="http://www.solucija.com/home/snews/" title="Download sNews"><b>Download sNews Now!</b></a>

	</div>
	
	<div id="main">
		<div id="right_side">
			<h3>Categories</h3>
			<ul>	
							<li><?SPINE_Navbar("dittoditto")?></li>
						
			</ul>
			
			<h3>Directory</h3>
			<p><a href="http://www.links4se.com" title="SEO friendly directory">Links4se.com</a> is a seo-friendly and human-edited general directory. Featured links need to be paid only $4.95 for unlimited time and regular links only $1.95!</p>
			<h3>Latest Articles</h3>
			<ul>	
							<li><a href="#" title="#">I would like to send big thanks to...</a></li>
							<li><a href="#" title="#">This simple tutorial will show you...</a></li>
							<li><a href="#" title="#">To make this nice fade effect I...</a></li>
							<li><a href="#" title="#">If you want to advertise your...</a></li>
							<li><a href="#" title="#">This has to be one of the better...</a></li>
							<li><a href="#" title="#">This day I would like to share...</a></li>
						
			</ul>
		</div>
		
		<div id="left_side">
			<h3><span>Download this template for free!</span></h3>
			<p>
			<img src="images/img.jpg" alt="img" />
			Phasellus quis est eget metus blandit lacinia. Quisque molestie, diam a dignissim mattis, lectus felis placerat lectus, eget sollicitudin neque nunc eleifend metus. <a href="#" title="">Curabitur ullamcorper</a> sem ac pede gravida sagittis. Sed et felis. Vestibulum placerat, ipsum nec congue auctor, ante massa placerat felis, sit amet <strong>consectetuer</strong> elit arcu vitae metus. In commodo, risus sed tristique luctus, ipsum diam dapibus eros, et vehicula dui augue tempus quam. In laoreet. Suspendisse et pede volutpat lacus interdum consequat. Cras dui. Quisque ac turpis nec ligula rutrum pulvinar. Quisque lectus ligula, vehicula nec, fringilla eu, dignissim ut, nisl. Vestibulum non turpis. Maecenas urna.
			</p>
			<blockquote>
			<p>Sed et felis. Vestibulum placerat, ipsum nec congue auctor, ante massa placerat felis, sit amet consectetuer elit arcu vitae metus. </p>
			</blockquote>
			<div class="date"><a href="#" title="#">Comments (5)</a> . 05 Jan 2007 . 10:37</div>
			<h3><span>Lorem Ipsum</span></h3>
			
			<div class="rs">
				<strong>List example</strong>:
					<ul>
						<li>list line 1</li>
						<li>list line 2
							<ul>
								<li>sublist line a</li>
								<li>sublist line b</li>
							</ul>
						</li>
					</ul>
			</div>
			<p>
			Sed odio tortor, rhoncus ac, auctor a, volutpat sed, diam. Quisque imperdiet. Maecenas quis nisl. Fusce sed nibh eget odio faucibus lobortis. Fusce sagittis est sed elit. Sed venenatis elit ut urna. Etiam varius imperdiet leo. Integer rhoncus venenatis arcu. Donec sollicitudin lectus. Cras ac est. Fusce odio. Donec posuere fermentum dolor. Sed a lacus tristique tellus ultrices mattis. Sed adipiscing urna a orci. Maecenas pharetra volutpat sem.
			</p>
			
			<div class="date"><a href="#" title="#">Comments (11)</a> . 07 Jan 2007 . 02:56</div>
		</div>
		
	</div>
	<div id="footer">
	<div class="right">&copy; Copyright 2006, Your Website - <a href="/rss/">RSS Feed</a><br />Design: <a href="http://www.free-css-templates.com">David Herreman</a></div>
	<a href="http://validator.w3.org/check?uri=referer" title="Validate">XHTML</a> - <a href="http://jigsaw.w3.org/css-validator/check/referer" title="Validate">CSS</a>
	</div>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (131, 'softgreen.html', '', 0, 'softgreen', 'main', 1, '', '2008-04-25 19:30:22', 'admin', 'users', '1010', '<h2>Make changes to this text in content <i>softgreen.html</i>. Make changes to this layout in style <i>softgreen</i>.</h2>
			<h1>Welcome on my soft green design</h1>
			<h2>Respect the standards</h2>
 			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean tellus libero, suscipit at, tincidunt eget, aliquam vitae, arcu. Nunc quam dolor, facilisis hendrerit, <a href="">ultricies</a> id, <a href="">imperdiet</a> id, libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Suspendisse potenti. Cras sit amet felis eu leo placerat scelerisque. Cras orci pede, eleifend nec, iaculis blandit, ullamcorper congue, odio. Quisque laoreet urna nec urna. Nunc sit amet purus sit amet felis rutrum hendrerit. Aliquam fermentum molestie eros. Cras nec elit varius augue eleifend sagittis.</p>
			<p>In sodales ultrices enim. Mauris nisl. Fusce vel urna nec magna hendrerit auctor. Nulla euismod. Nulla bibendum. In mattis, sem nec eleifend pellentesque, mi massa ornare tortor, ac fringilla augue augue nec mi. Quisque viverra quam consectetuer leo. Ut leo augue, aliquam non, vestibulum non, dignissim nec, sapien. Proin sodales. Quisque in orci. Sed erat est, lacinia ut, varius sit amet, ullamcorper vitae, dui. Nullam malesuada risus ac <a href="">lacus</a>. Suspendisse hendrerit. Integer placerat interdum nulla. Pellentesque vel tellus eget turpis scelerisque venenatis. Nullam adipiscing risus at massa.</p>
			<h2>Free design</h2>
			<p>Nunc bibendum sapien. Ut ligula sapien, dignissim vitae, sollicitudin quis, egestas scelerisque, risus. Vestibulum aliquam pretium ante. Nunc sem mi, gravida in, sagittis quis, ullamcorper accumsan, ligula. Aliquam convallis, nibh at tristique tempor, velit orci sollicitudin tellus, in hendrerit purus nibh eu eros. Nam luctus turpis ac tortor. <a href="">Proin</a> et <a href="">elit</a>. Etiam varius eleifend velit. Morbi convallis semper orci.</p>
			<blockquote>Suspendisse leo mi, convallis ac, euismod ut, malesuada in, nisl. Vivamus eu arcu in diam sodales pretium.</blockquote>
			<p> Curabitur cursus consectetuer felis.</p>
		</div>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (132, 'terrafirma.html', '', 0, 'terrafirma', 'main', 1, '', '2008-04-25 19:49:04', 'admin', 'users', '1010', '			<!-- primary content start -->
			<h3>Make changes to this text in content <i>terrafirma.html</i>. Make changes to this layout in style <i>terrafirma</i></h3>
			<div class="post">
				<div class="header">
					<h3>TerraFirma<sup>1.0</sup> by NodeThirtyThree</h3>
					<div class="date">August 1, 2006</div>
				</div>
				<div class="content">
					<img src="/images/terrafirma_pic1.jpg" class="picA floatleft" alt="" />
					<p><strong>TerraFirma</strong><sup>1.0</sup> is a free, lightweight, tableless, W3C-compliant website design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a>. You''re free to dissect, manipulate and use it to your heart''s content. We only ask that you link back to our site in some way. If you find this design useful, feel free to let us know :)</p>
					<p>You can find more of our free work at this site or <a href="http://www.nodethirtythree.com/">our site</a>, or some of our commercial work on <a href="http://www.4templates.com/?aff=n33">4Templates.com</a>, a commercial website template site.</p>
				</div>			
				<div class="footer">
					<ul>
						<li class="printerfriendly"><a href="#">Printer Friendly</a></li>
						<li class="comments"><a href="#">Comments (18)</a></li>
						<li class="readmore"><a href="#">Read more</a></li>
					</ul>
				</div>
			</div>
		
			<div class="post">
				<div class="header">
					<h3>Vivamus tortor sed aenean</h3>
					<div class="date">July 31, 2006</div>
				</div>
				<div class="content">
					<p>Volutpat at varius sed sollicitudin et, arcu. Vivamus viverra. Nullam turpis. Vestibulum sed etiam. Lorem ipsum sit amet dolore. Nulla facilisi. Sed tortor. Aenean felis. Quisque eros. Cras lobortis commodo metus. Vestibulum vel purus. In eget odio in sapien adipiscing blandit. Quisque augue tortor, facilisis sit amet, aliquam, suscipit vitae, cursus sed, arcu lorem ipsum dolor sit amet.</p>
					<p>Fermentum at, varius pretium, elit. Mauris egestas scelerisque nunc. Mauris non ligula quis wisi laoreet malesuada. In commodo. Maecenas lobortis cursus dolor.</p>
				</div>			
				<div class="footer">
					<ul>
						<li class="printerfriendly"><a href="#">Printer Friendly</a></li>
						<li class="comments"><a href="#">Comments (18)</a></li>
						<li class="readmore"><a href="#">Read more</a></li>
					</ul>
				</div>
			</div>

			<div class="post">
				<div class="header">
					<h3>Vivamus tortor sed aenean</h3>
					<div class="date">July 31, 2006</div>
				</div>
				<div class="content">
					<p>Volutpat at varius sed sollicitudin et, arcu. Vivamus viverra. Nullam turpis. Vestibulum sed etiam. Lorem ipsum sit amet dolore. Nulla facilisi. Sed tortor. Aenean felis. Quisque eros. Cras lobortis commodo metus. Vestibulum vel purus. In eget odio in sapien adipiscing blandit. Quisque augue tortor, facilisis sit amet, aliquam, suscipit vitae, cursus sed, arcu lorem ipsum dolor sit amet.</p>
					<p>Fermentum at, varius pretium, elit. Mauris egestas scelerisque nunc. Mauris non ligula quis wisi laoreet malesuada. In commodo. Maecenas lobortis cursus dolor.</p>
				</div>			
				<div class="footer">
					<ul>
						<li class="printerfriendly"><a href="#">Printer Friendly</a></li>
						<li class="comments"><a href="#">Comments (18)</a></li>
						<li class="readmore"><a href="#">Read more</a></li>
					</ul>
				</div>
			</div>

			<!-- primary content end -->
	', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (133, 'softgreen.css', '', 0, 'blank', 'main', 1, '', '2008-04-25 19:26:33', 'admin', 'users', '1010', 'body {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size: 0.8em;
	margin: 0;
	padding: 0;
	background-color:#182801;
}

.conteneur {
	margin-top: 10px;
	position: absolute;
	width: 740px;
	left: 50%;
	margin-left: -370px;
	border:0px solid #182801;
	color: #182801;
	background-color:#7A9431;
}


.header {
	background-image: url(/images/softgreen_header.jpg);
	background-repeat: no-repeat;
	height:160px;
	padding-left:50px;
	padding-top:40px;
	max-width:490px;
	border-bottom:1px solid #182801;
	color: #F5F8EF;
}

.menu {
	float:right;
	margin: 0px;
	padding:0px;
	margin-left:20px;
	border-left:1px solid #182801;
}


* html .menu {
	margin-left: -3px;
}

.centre {
	padding:20px;
	padding-left:40px;
}

.pied {
	height: 25px;
	text-align:right;
	padding-right:10px;
}

.menu-list {
	list-style-type: none;
	margin:0px 0px 0px 0px;
	padding:0px;
}

* html .menu li{
	margin-bottom:-3px;
}

.menu li {
	margin:0px;
	border-bottom:1px solid #182801;
	color: #D9CEB8;
	font-size: 1.1em;
	text-decoration: none;
	background-color:#748F02;
	padding:0px;
	width:199px;
}

.menu li a {
	margin:0px;
	display: block;
	color: #F5F8EF;
	font-size: 1.1em;
	text-decoration: none;
	border-left:5px solid #F5F8EF;
	padding:5px;
}

.menu li a:hover {
	text-decoration: none;
	background-color:#90A000;
}

.p{
	
}

h2{
	margin-left:-20px;
	margin-top:15px;
	padding-left:5px;
	font-size: 1.3em;
	color: #F5F8EF;
	font-weight:normal;
}

h1{
	margin-left:-30px;
	margin-top:5px;
	padding-left:5px;
	font-size: 1.6em;
	color: #F5F8EF;
	font-weight:normal;
}

.header-title {
	font-size:2.3em;
	border-top:2px solid #F5F8EF;
}

.header-title-two {
	font-size:1.1em;
	padding-bottom:3px;
	border-bottom:1px solid #F5F8EF;
}

a{
	color:#F5F8EF;
	text-decoration:none;
}

a:hover{
	text-decoration:underline;
}

blockquote{
	background-color:rgb(142, 168, 69);
	padding : 3px;
	border-left:2px solid #F5F8EF;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (134, 'transparentia.css', '', 0, 'blank', 'main', 1, '', '2008-04-25 19:57:56', 'admin', 'users', '1010', '/*#############################################################
Name: Transparentia
Date: 2006-08-20
Description: Simple, lightweight and slightly blue.
Author: Viktor Persson
URL: http://templates.arcsin.se

Feel free to use and modify but please provide credits.
#############################################################*/

/* standard elements */
* {
	margin: 0;
	padding: 0;
}
a {
	color: #36C;
}
a:hover {
	color: #06F;
}
body {
	background: #EEE url(/images/transparentia_bg.gif);
	color: #444;
	font: normal 62.5% "Lucida Sans Unicode",sans-serif;
	margin: 0;
}
input {
	color: #555;
	font: normal 1.1em "Lucida Sans Unicode",sans-serif;
}
p,cite,code,ul {
	font-size: 1.2em;
	padding-bottom: 1.2em;
}
h1 {
	font-size: 1.4em;
	margin-bottom: 4px;
}
code {
	background: url(/images/transparentia_bgcode.gif);
	border: 1px solid #F0F0F0;
	border-left: 6px solid #39F;
	color: #555;
	display: block;
	font: normal 1.1em "Lucida Sans Unicode",serif;
	margin-bottom: 12px;
	padding: 8px 10px;
	white-space: pre;
}
cite {
	background: url(/images/transparentia_quote.gif) no-repeat;
	color: #666;
	display: block;
	font: normal 1.3em "Lucida Sans Unicode",serif;
	padding-left: 28px;
}
h1,h2,h3 {
	color: #367EA6;
	padding-top: 6px;
}

/* misc */
.clearer {
	clear: both;
}

/* structure */
.container {
	background: url(/images/transparentia_bgcontainer.gif) repeat-y;
	margin: 0 auto;
	padding-bottom: 6px;
	width: 767px;
}
.header {
	background: url(/images/transparentia_header.gif) repeat-x;
}

/* title */
.title h1 {
	color: #FFF;
	font: normal 3em Verdana,sans-serif;
	height: 150px;
	line-height: 150px;
	margin-bottom: 8px;
	text-align: center;
}

/* navigation */
.navigation {
	margin-bottom: 4px;
}
.navigation a {
	background-color: #4A91C3;
	color: #FFF;
	float: left;
	font: bold 1.2em "Trebuchet MS",sans-serif;
	padding: 8px 0;
	width: 19%;
	border-right: 1px solid #FFF;
	text-align: center;
	text-decoration: none;
}
.navigation a:hover {
	background-color: #000;
	color: #FFF;
}

/* main */
.main {
	clear: both;
	padding: 8px 18px;
}

/* main left */
.sidenav h1,.sidenav ul {
	padding-left: 12px;
}
.sidenav {
	background: #EEE;
	border: 1px solid #E5E5E5;
	float: left;
	width: 200px;
}
.sidenav h1 {
	color: #666;
	font-size: 1.2em;
	height: 20px;
	margin-top: 1.2em;
}
.sidenav ul {
	border-top: 1px solid #FAFAFA;
	background: url(/images/transparentia_bgul.gif) repeat-x;
	margin: 0;
	padding: 0;
}
.sidenav li {
	border: 1px solid #FAFAFA;
	border-top: none;
	list-style: none;
	margin: 0;
}
.sidenav li a {
	color: #777;
	display: block;
	font-size: 0.9em;
	padding: 3px 6px 3px 14px;
	text-decoration: none;
}
.sidenav li a:hover {
	color: #111;
}

/* content */
.content {
	float: right;
	width: 520px;
}
.content .item {
	padding: 6px 12px;
	border: 1px solid #EEE;
	background: #FFF;
	margin-bottom: 8px;
}
.content .descr {
	color: #333;
	margin-bottom: 6px;
}
.content li {
	list-style: url(/images/transparentia_li.gif);
	margin-left: 18px;
}

/* search form */
form {
	padding: 0 0 6px 8px;
}
.styled {
	border: 1px solid #DDD;
	padding: 4px;
}
.button {
	background: url(/images/transparentia_search.gif) no-repeat left bottom;
	border: none;
	height: 27px;
	width: 27px;
}

/* footer */
.footer {
	background: #FFF;
	border: 1px solid #EEE;
	color: #666;
	font-size: 1.1em;
	margin: 0 auto;
	text-align: center;
	padding: 6px;
	width: 720px;
}
.footer a {
	color: #36C;
	text-decoration: none;
}
.footer a:hover {
	color: #06F;
	text-decoration: underline;
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (135, 'terrafirma.css', '', 0, 'blank', 'main', 1, '', '2008-04-25 19:40:59', 'admin', 'users', '1010', '/*

	terrafirma1.0 by nodethirtythree design
	http://www.nodethirtythree.com

*/

*
{
padding: 0px;
margin: 0px;
}

body
{
background: #F9F9F7 url(''/images/terrafirma_a1.gif'') repeat-x;
font-size: 11px;
font-family: "trebuchet ms", helvetica, sans-serif;
color: #8C8C73;
line-height: 18px;
}

a
{
color: #FF7800;
text-decoration: underline;
}

a:hover
{
text-decoration: none;
}

sup
{
font-size: 0.5em;
}


p
{
margin-bottom: 14px;
text-align: justify;
}

img.picA
{
position: relative;
top: -2px;
background: url(''/images/terrafirma_a47.gif'') no-repeat;
width: 76px;
height: 74px;
padding: 8px;
}

img.picB
{
position: relative;
top: -2px;
background: url(''/images/terrafirma_a26.gif'') no-repeat;
width: 146px;
height: 75px;
padding: 7px;
}

img.floatleft
{
float: left;
margin: 0px 14px 3px 0px;
}


ul.linklist
{
list-style: none;
}

ul.linklist li
{
border-top: solid 1px #EEEEEE;
padding-top: 5px;
margin: 5px 0px 0px 0px;
}

ul.linklist li.first
{
border-top: 0px;
margin-top: 0px;
padding-top: 0px;
}

#upbg
{
position: absolute;
top: 0px;
left: 0px;
background: #fff url(''/images/terrafirma_upbg.gif'') no-repeat;
width: 747px;
height: 264px;
z-index: 1;
}

#outer
{
position: relative;
width: 747px;
margin: 0 auto;
background: #fff url(''/images/terrafirma_abg.gif'') repeat-y;
}

#inner
{
position: relative;
padding: 13px 30px 13px 30px;
z-index: 2;
}

#header
{
position: absolute;
background: #FF7800 url(''/images/terrafirma_a8.gif'') repeat-x;
width: 202px;
height: 92px;
color: #fff;
padding-left: 20px;
}

#header span
{
font-weight: normal;
}

#header h1
{
position: absolute;
font-size: 23px;
letter-spacing: -1px;
top: 30px;
height: 92px;
}

#header h2
{
position: absolute;
font-size: 10px;
font-weight: normal;
color: #FCE2CA;
top: 51px;
}

#header sup
{
color: #FCE2CA;
}

#splash
{
position: absolute;
right: 30px;
background: #EAEAE2 url(''/images/terrafirma_a10.jpg'') no-repeat;
width: 458px;
height: 92px;
}

#menu
{
position: relative;
background: #46461F url(''/images/terrafirma_a16.gif'') repeat-x;
height: 67px;
padding: 0px 20px 0px 5px;
margin: 98px 0px 20px 0px;
}

#menu ul
{
}

#menu ul li
{
display: inline;
line-height: 52px;
padding-left: 3px;
}

#menu ul li.first
{
border-left: 0px;
}

#menu ul li a
{
background-color: transparent;
background-repeat: repeat-x;
padding: 8px 12px 8px 12px;
font-size: 12px;
color: #fff;
font-weight: bold;
}

#menu ul li a:hover
{
background: #fff url(''/images/terrafirma_a18.gif'') repeat-x top;
color: #4A4A24;
text-decoration: none;
}

#date
{
position: absolute;
top: 0px;
line-height: 52px;
color: #BDBDA2;
right: 30px;
font-weight: bold;
font-size: 12px;
letter-spacing: -1px;
}

#secondarycontent
{
position: relative;
width: 180px;
float: right;
}

#secondarycontent h3
{
position: relative;
top: 4px;
font-size: 16px;
line-height: 25px;
color: #656551;
letter-spacing: -1px;
background: url(''/images/terrafirma_a22.gif'') bottom repeat-x;
padding: 0px 0px 10px 10px;
margin-bottom: 20px;
}

#secondarycontent .content
{
padding: 0px 10px 0px 10px;
margin-bottom: 20px;
}

#primarycontent
{
position: relative;
width: 480px;
float: left;
}

#primarycontent h3
{
position: relative;
top: 4px;
font-size: 18px;
line-height: 25px;
color: #656551;
letter-spacing: -1px;
background: url(''/images/terrafirma_a22.gif'') bottom repeat-x;
padding: 0px 0px 10px 15px;
margin-bottom: 20px;
}

#primarycontent .content
{
padding: 0px 15px 0px 15px;
margin-bottom: 20px;
}

#primarycontent .post
{
margin-bottom: 30px;
}

#primarycontent .post .header
{
position: relative;
}

#primarycontent .post .date
{
position: absolute;
right: 15px;
top: 0px;
line-height: 35px;
color: #AFAFA4;
font-weight: bold;
}

#primarycontent .post .content
{
margin-bottom: 0px;
}

#primarycontent .post .footer
{
position: relative;
top: -10px;
background: url(''/images/terrafirma_a33.gif'') repeat-x;
height: 64px;
}

#primarycontent .post .footer ul
{
list-style: none;
position: absolute;
right: 15px;
bottom: 15px;
}

#primarycontent .post .footer ul li
{
display: inline;
line-height: 14px;
padding-left: 17px;
margin-left: 25px;
background-repeat: no-repeat;
background-position: 0px 2px;
}

#primarycontent .post .footer ul li.printerfriendly
{
background-image: url(''/images/terrafirma_a41.gif'');
}

#primarycontent .post .footer ul li.comments
{
background-image: url(''/images/terrafirma_a36.gif'');
}

#primarycontent .post .footer ul li.readmore
{
background-image: url(''/images/terrafirma_a38.gif'');
}

#footer
{
position: relative;
clear: both;
height: 66px;
text-align: center;
line-height: 66px;
background-image: url(''/images/terrafirma_a50.gif'');
color: #A8A88D;
}

#footer a
{
color: #8C8C73;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (137, 'zenlike.html', '', 0, 'zenlike', 'main', 1, '', '2008-04-28 07:36:57', 'admin', 'users', '1010', '	<div id="content">
<h2>Make changes to this text in content <i>zenlike.html</i>. Make changes to this layout in style <i>zenlike</i></h2>
		<div class="divider1"></div>

		<!-- Normal content: Stuff that''s not going to be put in the left or right column. -->
		<div id="normalcontent">
			<h3><strong>Zenlike</strong><sup>1.0</sup> <span>by NodeThirtyThree</span></h3>
			<div class="contentarea">
				<!-- Normal content area start -->

				<img src="/images/zenlike_pic1.jpg" class="left" alt="A chinese lion statue" />
				<p>Zenlike<sup>1.0</sup> is a free, lightweight, tableless, fluid W3C-compliant website design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a>. All photos came from <a href="http://www.pdphoto.org/">PDPhoto</a> and the background texture is from <a href="http://www.mayang.com/textures/">Mayang''s texture site</a>. You''re free to dissect, manipulate and use it to your heart''s content. We only ask that you link back to <a href="http://www.nodethirtythree.com/">our site</a> in some way. If you find this design useful, feel free to let us know :)</p>
				<p>You can find more of our free work at this site or <a href="http://www.nodethirtythree.com/">our site</a>, or some of our commercial work on <a href="http://www.4templates.com/?aff=n33">4Templates.com</a>, a commercial website template site.</p>

				<!-- Normal content area end -->
			</div>
		</div>

	
		<div class="divider1"></div>


		<!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->
		<div id="primarycontainer">
			<div id="primarycontent">
				<!-- Primary content area start -->
		
				<div class="post">
					<h4>Lorem Ipsum Veroeros</h4>
					<div class="contentarea">
						<div class="details">Posted by <a href="#">Jane Doe</a> on September 25, 2006</div>	
						<p>Volutpat at varius sed sollicitudin et, arcu. Vivamus viverra. Nullam turpis. Vestibulum sed etiam. Lorem ipsum sit amet dolore. Nulla facilisi. Sed tortor. Aenean felis. Quisque eros. Cras lobortis commodo metus. Vestibulum vel purus. In eget odio in sapien adipiscing blandit. Quisque augue tortor, facilisis sit amet, aliquam, suscipit vitae, cursus sed, arcu lorem ipsum dolor sit amet.</p>
						<ul class="controls">
							<li><a href="#" class="printerfriendly">Printer Friendly</a></li>
							<li><a href="#" class="comments">Comments (18)</a></li>
							<li><a href="#" class="more">Read More</a></li>				
						</ul>
					</div>
				</div>
		
				<div class="divider2"></div>
		
				<div class="post">
					<h4>Consequat Odio Vestibulum</h4>
					<div class="contentarea">
						<div class="details">Posted by <a href="#">Jane Doe</a> on September 25, 2006</div>	
						<img src="/images/zenlike_pic3.jpg" class="left" alt="A chinese dragon" />
						<p>Aenean felis quisque eros. Cras lobortis commodo lorem ipsum dolor. Vestibulum vel purus. In eget odio in sapien adipiscing blandit. Lorem ipsum dolor sit amet consequat etiam sed dolore.</p>
						<ul class="controls">
							<li><a href="#" class="printerfriendly">Printer Friendly</a></li>
							<li><a href="#" class="comments">Comments (18)</a></li>
							<li><a href="#" class="more">Read More</a></li>				
						</ul>
					</div>
				</div>
	
				<div class="divider2"></div>
		
				<div class="post">
					<h4>Adipiscing Nullam</h4>
					<div class="contentarea">
						<div class="details">Posted by <a href="#">Jane Doe</a> on September 25, 2006</div>	
						<p>Eget odio in sapien adipiscing blandit. Quisque augue tortor, facilisis sit amet, aliquam, suscipit vitae, cursus sed, arcu lorem ipsum dolor sit amet felis quisque eros. Cras lobortis commodo lorem ipsum dolor. Vestibulum vel purus. In eget odio in sapien adipiscing blandit. Quisque augue tortor, facilisis sit amet, aliquam, suscipit lorem ipsum dolor.</p>
						<ul class="controls">
							<li><a href="#" class="printerfriendly">Printer Friendly</a></li>
							<li><a href="#" class="comments">Comments (18)</a></li>
							<li><a href="#" class="more">Read More</a></li>				
						</ul>
					</div>
				</div>

				<!-- Primary content area end -->
			</div>
		</div>

		
		<!-- Secondary content: Stuff that goes in the secondary content column (by default, the narrower right column) -->
		<div id="secondarycontent">
			<!-- Secondary content area start -->
			
			<!-- HINT: Set any div''s class to "box" to encapsulate it in (you guessed it) a box -->
			<div class="box">
				<h4>Blandit Veroeros</h4>
				<div class="contentarea">
					<img src="/images/zenlike_pic2.jpg" class="left" alt="Random foliage" />
					<p>Sed etiam et lorem ipsum nulla vero et lobortis felis sed etiam. Lorem ipsum sit amet dolore. Nulla facilisi. Sed tortor. Aenean felis. Quisque eros etiam <a href="#">sed commodo</a>.</p>
				</div>
			</div>
		
			<div>
				<h4>Nullam Dolore</h4>
				<div class="contentarea">
					<ul class="linklist">
						<li><a href="#">Volutpat at varius sed</a></li>
						<li><a href="#">Sollicitudin et arcu</a></li>
						<li><a href="#">Vivamus viverra nullam</a></li>
						<li><a href="#">Turpis vestibulum</a></li>
						<li><a href="#">Sed etiam lorem ipsum</a></li>
						<li><a href="#">Sit amet dolore nulla</a></li>
						<li><a href="#">Facilisi sed tortor</a></li>
						<li><a href="#">Aenean felis quisque</a></li>
						<li><a href="#">Eros cras lobortis vel</a></li>
						<li><a href="#">Purus in eget odio sapien</a></li>
						<li><a href="#">Adipiscing blandit</a></li>
					</ul>
				</div>
			</div>

			<!-- Secondary content area end -->
		</div>
	</div>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (138, 'jquery.js', 'STUB Content', 0, 'blank', '', 1, '', '2011-09-10 13:37:53', 'admin', 'users', '1111', '/*!
 * jQuery JavaScript Library v1.6.2
 * http://jquery.com/
 *
 * Copyright 2011, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Includes Sizzle.js
 * http://sizzlejs.com/
 * Copyright 2011, The Dojo Foundation
 * Released under the MIT, BSD, and GPL Licenses.
 *
 * Date: Thu Jun 30 14:16:56 2011 -0400
 */
(function( window, undefined ) {

// Use the correct document accordingly with window argument (sandbox)
var document = window.document,
	navigator = window.navigator,
	location = window.location;
var jQuery = (function() {

// Define a local copy of jQuery
var jQuery = function( selector, context ) {
		// The jQuery object is actually just the init constructor ''enhanced''
		return new jQuery.fn.init( selector, context, rootjQuery );
	},

	// Map over jQuery in case of overwrite
	_jQuery = window.jQuery,

	// Map over the $ in case of overwrite
	_$ = window.$,

	// A central reference to the root jQuery(document)
	rootjQuery,

	// A simple way to check for HTML strings or ID strings
	// (both of which we optimize for)
	quickExpr = /^(?:[^<]*(<[\\w\\W]+>)[^>]*$|#([\\w\\-]*)$)/,

	// Check if a string has a non-whitespace character in it
	rnotwhite = /\\S/,

	// Used for trimming whitespace
	trimLeft = /^\\s+/,
	trimRight = /\\s+$/,

	// Check for digits
	rdigit = /\\d/,

	// Match a standalone tag
	rsingleTag = /^<(\\w+)\\s*\\/?>(?:<\\/\\1>)?$/,

	// JSON RegExp
	rvalidchars = /^[\\],:{}\\s]*$/,
	rvalidescape = /\\\\(?:["\\\\\\/bfnrt]|u[0-9a-fA-F]{4})/g,
	rvalidtokens = /"[^"\\\\\\n\\r]*"|true|false|null|-?\\d+(?:\\.\\d*)?(?:[eE][+\\-]?\\d+)?/g,
	rvalidbraces = /(?:^|:|,)(?:\\s*\\[)+/g,

	// Useragent RegExp
	rwebkit = /(webkit)[ \\/]([\\w.]+)/,
	ropera = /(opera)(?:.*version)?[ \\/]([\\w.]+)/,
	rmsie = /(msie) ([\\w.]+)/,
	rmozilla = /(mozilla)(?:.*? rv:([\\w.]+))?/,

	// Matches dashed string for camelizing
	rdashAlpha = /-([a-z])/ig,

	// Used by jQuery.camelCase as callback to replace()
	fcamelCase = function( all, letter ) {
		return letter.toUpperCase();
	},

	// Keep a UserAgent string for use with jQuery.browser
	userAgent = navigator.userAgent,

	// For matching the engine and version of the browser
	browserMatch,

	// The deferred used on DOM ready
	readyList,

	// The ready event handler
	DOMContentLoaded,

	// Save a reference to some core methods
	toString = Object.prototype.toString,
	hasOwn = Object.prototype.hasOwnProperty,
	push = Array.prototype.push,
	slice = Array.prototype.slice,
	trim = String.prototype.trim,
	indexOf = Array.prototype.indexOf,

	// [[Class]] -> type pairs
	class2type = {};

jQuery.fn = jQuery.prototype = {
	constructor: jQuery,
	init: function( selector, context, rootjQuery ) {
		var match, elem, ret, doc;

		// Handle $(""), $(null), or $(undefined)
		if ( !selector ) {
			return this;
		}

		// Handle $(DOMElement)
		if ( selector.nodeType ) {
			this.context = this[0] = selector;
			this.length = 1;
			return this;
		}

		// The body element only exists once, optimize finding it
		if ( selector === "body" && !context && document.body ) {
			this.context = document;
			this[0] = document.body;
			this.selector = selector;
			this.length = 1;
			return this;
		}

		// Handle HTML strings
		if ( typeof selector === "string" ) {
			// Are we dealing with HTML string or an ID?
			if ( selector.charAt(0) === "<" && selector.charAt( selector.length - 1 ) === ">" && selector.length >= 3 ) {
				// Assume that strings that start and end with <> are HTML and skip the regex check
				match = [ null, selector, null ];

			} else {
				match = quickExpr.exec( selector );
			}

			// Verify a match, and that no context was specified for #id
			if ( match && (match[1] || !context) ) {

				// HANDLE: $(html) -> $(array)
				if ( match[1] ) {
					context = context instanceof jQuery ? context[0] : context;
					doc = (context ? context.ownerDocument || context : document);

					// If a single string is passed in and it''s a single tag
					// just do a createElement and skip the rest
					ret = rsingleTag.exec( selector );

					if ( ret ) {
						if ( jQuery.isPlainObject( context ) ) {
							selector = [ document.createElement( ret[1] ) ];
							jQuery.fn.attr.call( selector, context, true );

						} else {
							selector = [ doc.createElement( ret[1] ) ];
						}

					} else {
						ret = jQuery.buildFragment( [ match[1] ], [ doc ] );
						selector = (ret.cacheable ? jQuery.clone(ret.fragment) : ret.fragment).childNodes;
					}

					return jQuery.merge( this, selector );

				// HANDLE: $("#id")
				} else {
					elem = document.getElementById( match[2] );

					// Check parentNode to catch when Blackberry 4.6 returns
					// nodes that are no longer in the document #6963
					if ( elem && elem.parentNode ) {
						// Handle the case where IE and Opera return items
						// by name instead of ID
						if ( elem.id !== match[2] ) {
							return rootjQuery.find( selector );
						}

						// Otherwise, we inject the element directly into the jQuery object
						this.length = 1;
						this[0] = elem;
					}

					this.context = document;
					this.selector = selector;
					return this;
				}

			// HANDLE: $(expr, $(...))
			} else if ( !context || context.jquery ) {
				return (context || rootjQuery).find( selector );

			// HANDLE: $(expr, context)
			// (which is just equivalent to: $(context).find(expr)
			} else {
				return this.constructor( context ).find( selector );
			}

		// HANDLE: $(function)
		// Shortcut for document ready
		} else if ( jQuery.isFunction( selector ) ) {
			return rootjQuery.ready( selector );
		}

		if (selector.selector !== undefined) {
			this.selector = selector.selector;
			this.context = selector.context;
		}

		return jQuery.makeArray( selector, this );
	},

	// Start with an empty selector
	selector: "",

	// The current version of jQuery being used
	jquery: "1.6.2",

	// The default length of a jQuery object is 0
	length: 0,

	// The number of elements contained in the matched element set
	size: function() {
		return this.length;
	},

	toArray: function() {
		return slice.call( this, 0 );
	},

	// Get the Nth element in the matched element set OR
	// Get the whole matched element set as a clean array
	get: function( num ) {
		return num == null ?

			// Return a ''clean'' array
			this.toArray() :

			// Return just the object
			( num < 0 ? this[ this.length + num ] : this[ num ] );
	},

	// Take an array of elements and push it onto the stack
	// (returning the new matched element set)
	pushStack: function( elems, name, selector ) {
		// Build a new jQuery matched element set
		var ret = this.constructor();

		if ( jQuery.isArray( elems ) ) {
			push.apply( ret, elems );

		} else {
			jQuery.merge( ret, elems );
		}

		// Add the old object onto the stack (as a reference)
		ret.prevObject = this;

		ret.context = this.context;

		if ( name === "find" ) {
			ret.selector = this.selector + (this.selector ? " " : "") + selector;
		} else if ( name ) {
			ret.selector = this.selector + "." + name + "(" + selector + ")";
		}

		// Return the newly-formed element set
		return ret;
	},

	// Execute a callback for every element in the matched set.
	// (You can seed the arguments with an array of args, but this is
	// only used internally.)
	each: function( callback, args ) {
		return jQuery.each( this, callback, args );
	},

	ready: function( fn ) {
		// Attach the listeners
		jQuery.bindReady();

		// Add the callback
		readyList.done( fn );

		return this;
	},

	eq: function( i ) {
		return i === -1 ?
			this.slice( i ) :
			this.slice( i, +i + 1 );
	},

	first: function() {
		return this.eq( 0 );
	},

	last: function() {
		return this.eq( -1 );
	},

	slice: function() {
		return this.pushStack( slice.apply( this, arguments ),
			"slice", slice.call(arguments).join(",") );
	},

	map: function( callback ) {
		return this.pushStack( jQuery.map(this, function( elem, i ) {
			return callback.call( elem, i, elem );
		}));
	},

	end: function() {
		return this.prevObject || this.constructor(null);
	},

	// For internal use only.
	// Behaves like an Array''s method, not like a jQuery method.
	push: push,
	sort: [].sort,
	splice: [].splice
};

// Give the init function the jQuery prototype for later instantiation
jQuery.fn.init.prototype = jQuery.fn;

jQuery.extend = jQuery.fn.extend = function() {
	var options, name, src, copy, copyIsArray, clone,
		target = arguments[0] || {},
		i = 1,
		length = arguments.length,
		deep = false;

	// Handle a deep copy situation
	if ( typeof target === "boolean" ) {
		deep = target;
		target = arguments[1] || {};
		// skip the boolean and the target
		i = 2;
	}

	// Handle case when target is a string or something (possible in deep copy)
	if ( typeof target !== "object" && !jQuery.isFunction(target) ) {
		target = {};
	}

	// extend jQuery itself if only one argument is passed
	if ( length === i ) {
		target = this;
		--i;
	}

	for ( ; i < length; i++ ) {
		// Only deal with non-null/undefined values
		if ( (options = arguments[ i ]) != null ) {
			// Extend the base object
			for ( name in options ) {
				src = target[ name ];
				copy = options[ name ];

				// Prevent never-ending loop
				if ( target === copy ) {
					continue;
				}

				// Recurse if we''re merging plain objects or arrays
				if ( deep && copy && ( jQuery.isPlainObject(copy) || (copyIsArray = jQuery.isArray(copy)) ) ) {
					if ( copyIsArray ) {
						copyIsArray = false;
						clone = src && jQuery.isArray(src) ? src : [];

					} else {
						clone = src && jQuery.isPlainObject(src) ? src : {};
					}

					// Never move original objects, clone them
					target[ name ] = jQuery.extend( deep, clone, copy );

				// Don''t bring in undefined values
				} else if ( copy !== undefined ) {
					target[ name ] = copy;
				}
			}
		}
	}

	// Return the modified object
	return target;
};

jQuery.extend({
	noConflict: function( deep ) {
		if ( window.$ === jQuery ) {
			window.$ = _$;
		}

		if ( deep && window.jQuery === jQuery ) {
			window.jQuery = _jQuery;
		}

		return jQuery;
	},

	// Is the DOM ready to be used? Set to true once it occurs.
	isReady: false,

	// A counter to track how many items to wait for before
	// the ready event fires. See #6781
	readyWait: 1,

	// Hold (or release) the ready event
	holdReady: function( hold ) {
		if ( hold ) {
			jQuery.readyWait++;
		} else {
			jQuery.ready( true );
		}
	},

	// Handle when the DOM is ready
	ready: function( wait ) {
		// Either a released hold or an DOMready/load event and not yet ready
		if ( (wait === true && !--jQuery.readyWait) || (wait !== true && !jQuery.isReady) ) {
			// Make sure body exists, at least, in case IE gets a little overzealous (ticket #5443).
			if ( !document.body ) {
				return setTimeout( jQuery.ready, 1 );
			}

			// Remember that the DOM is ready
			jQuery.isReady = true;

			// If a normal DOM Ready event fired, decrement, and wait if need be
			if ( wait !== true && --jQuery.readyWait > 0 ) {
				return;
			}

			// If there are functions bound, to execute
			readyList.resolveWith( document, [ jQuery ] );

			// Trigger any bound ready events
			if ( jQuery.fn.trigger ) {
				jQuery( document ).trigger( "ready" ).unbind( "ready" );
			}
		}
	},

	bindReady: function() {
		if ( readyList ) {
			return;
		}

		readyList = jQuery._Deferred();

		// Catch cases where $(document).ready() is called after the
		// browser event has already occurred.
		if ( document.readyState === "complete" ) {
			// Handle it asynchronously to allow scripts the opportunity to delay ready
			return setTimeout( jQuery.ready, 1 );
		}

		// Mozilla, Opera and webkit nightlies currently support this event
		if ( document.addEventListener ) {
			// Use the handy event callback
			document.addEventListener( "DOMContentLoaded", DOMContentLoaded, false );

			// A fallback to window.onload, that will always work
			window.addEventListener( "load", jQuery.ready, false );

		// If IE event model is used
		} else if ( document.attachEvent ) {
			// ensure firing before onload,
			// maybe late but safe also for iframes
			document.attachEvent( "onreadystatechange", DOMContentLoaded );

			// A fallback to window.onload, that will always work
			window.attachEvent( "onload", jQuery.ready );

			// If IE and not a frame
			// continually check to see if the document is ready
			var toplevel = false;

			try {
				toplevel = window.frameElement == null;
			} catch(e) {}

			if ( document.documentElement.doScroll && toplevel ) {
				doScrollCheck();
			}
		}
	},

	// See test/unit/core.js for details concerning isFunction.
	// Since version 1.3, DOM methods and functions like alert
	// aren''t supported. They return false on IE (#2968).
	isFunction: function( obj ) {
		return jQuery.type(obj) === "function";
	},

	isArray: Array.isArray || function( obj ) {
		return jQuery.type(obj) === "array";
	},

	// A crude way of determining if an object is a window
	isWindow: function( obj ) {
		return obj && typeof obj === "object" && "setInterval" in obj;
	},

	isNaN: function( obj ) {
		return obj == null || !rdigit.test( obj ) || isNaN( obj );
	},

	type: function( obj ) {
		return obj == null ?
			String( obj ) :
			class2type[ toString.call(obj) ] || "object";
	},

	isPlainObject: function( obj ) {
		// Must be an Object.
		// Because of IE, we also have to check the presence of the constructor property.
		// Make sure that DOM nodes and window objects don''t pass through, as well
		if ( !obj || jQuery.type(obj) !== "object" || obj.nodeType || jQuery.isWindow( obj ) ) {
			return false;
		}

		// Not own constructor property must be Object
		if ( obj.constructor &&
			!hasOwn.call(obj, "constructor") &&
			!hasOwn.call(obj.constructor.prototype, "isPrototypeOf") ) {
			return false;
		}

		// Own properties are enumerated firstly, so to speed up,
		// if last one is own, then all properties are own.

		var key;
		for ( key in obj ) {}

		return key === undefined || hasOwn.call( obj, key );
	},

	isEmptyObject: function( obj ) {
		for ( var name in obj ) {
			return false;
		}
		return true;
	},

	error: function( msg ) {
		throw msg;
	},

	parseJSON: function( data ) {
		if ( typeof data !== "string" || !data ) {
			return null;
		}

		// Make sure leading/trailing whitespace is removed (IE can''t handle it)
		data = jQuery.trim( data );

		// Attempt to parse using the native JSON parser first
		if ( window.JSON && window.JSON.parse ) {
			return window.JSON.parse( data );
		}

		// Make sure the incoming data is actual JSON
		// Logic borrowed from http://json.org/json2.js
		if ( rvalidchars.test( data.replace( rvalidescape, "@" )
			.replace( rvalidtokens, "]" )
			.replace( rvalidbraces, "")) ) {

			return (new Function( "return " + data ))();

		}
		jQuery.error( "Invalid JSON: " + data );
	},

	// Cross-browser xml parsing
	// (xml & tmp used internally)
	parseXML: function( data , xml , tmp ) {

		if ( window.DOMParser ) { // Standard
			tmp = new DOMParser();
			xml = tmp.parseFromString( data , "text/xml" );
		} else { // IE
			xml = new ActiveXObject( "Microsoft.XMLDOM" );
			xml.async = "false";
			xml.loadXML( data );
		}

		tmp = xml.documentElement;

		if ( ! tmp || ! tmp.nodeName || tmp.nodeName === "parsererror" ) {
			jQuery.error( "Invalid XML: " + data );
		}

		return xml;
	},

	noop: function() {},

	// Evaluates a script in a global context
	// Workarounds based on findings by Jim Driscoll
	// http://weblogs.java.net/blog/driscoll/archive/2009/09/08/eval-javascript-global-context
	globalEval: function( data ) {
		if ( data && rnotwhite.test( data ) ) {
			// We use execScript on Internet Explorer
			// We use an anonymous function so that context is window
			// rather than jQuery in Firefox
			( window.execScript || function( data ) {
				window[ "eval" ].call( window, data );
			} )( data );
		}
	},

	// Converts a dashed string to camelCased string;
	// Used by both the css and data modules
	camelCase: function( string ) {
		return string.replace( rdashAlpha, fcamelCase );
	},

	nodeName: function( elem, name ) {
		return elem.nodeName && elem.nodeName.toUpperCase() === name.toUpperCase();
	},

	// args is for internal usage only
	each: function( object, callback, args ) {
		var name, i = 0,
			length = object.length,
			isObj = length === undefined || jQuery.isFunction( object );

		if ( args ) {
			if ( isObj ) {
				for ( name in object ) {
					if ( callback.apply( object[ name ], args ) === false ) {
						break;
					}
				}
			} else {
				for ( ; i < length; ) {
					if ( callback.apply( object[ i++ ], args ) === false ) {
						break;
					}
				}
			}

		// A special, fast, case for the most common use of each
		} else {
			if ( isObj ) {
				for ( name in object ) {
					if ( callback.call( object[ name ], name, object[ name ] ) === false ) {
						break;
					}
				}
			} else {
				for ( ; i < length; ) {
					if ( callback.call( object[ i ], i, object[ i++ ] ) === false ) {
						break;
					}
				}
			}
		}

		return object;
	},

	// Use native String.trim function wherever possible
	trim: trim ?
		function( text ) {
			return text == null ?
				"" :
				trim.call( text );
		} :

		// Otherwise use our own trimming functionality
		function( text ) {
			return text == null ?
				"" :
				text.toString().replace( trimLeft, "" ).replace( trimRight, "" );
		},

	// results is for internal usage only
	makeArray: function( array, results ) {
		var ret = results || [];

		if ( array != null ) {
			// The window, strings (and functions) also have ''length''
			// The extra typeof function check is to prevent crashes
			// in Safari 2 (See: #3039)
			// Tweaked logic slightly to handle Blackberry 4.7 RegExp issues #6930
			var type = jQuery.type( array );

			if ( array.length == null || type === "string" || type === "function" || type === "regexp" || jQuery.isWindow( array ) ) {
				push.call( ret, array );
			} else {
				jQuery.merge( ret, array );
			}
		}

		return ret;
	},

	inArray: function( elem, array ) {

		if ( indexOf ) {
			return indexOf.call( array, elem );
		}

		for ( var i = 0, length = array.length; i < length; i++ ) {
			if ( array[ i ] === elem ) {
				return i;
			}
		}

		return -1;
	},

	merge: function( first, second ) {
		var i = first.length,
			j = 0;

		if ( typeof second.length === "number" ) {
			for ( var l = second.length; j < l; j++ ) {
				first[ i++ ] = second[ j ];
			}

		} else {
			while ( second[j] !== undefined ) {
				first[ i++ ] = second[ j++ ];
			}
		}

		first.length = i;

		return first;
	},

	grep: function( elems, callback, inv ) {
		var ret = [], retVal;
		inv = !!inv;

		// Go through the array, only saving the items
		// that pass the validator function
		for ( var i = 0, length = elems.length; i < length; i++ ) {
			retVal = !!callback( elems[ i ], i );
			if ( inv !== retVal ) {
				ret.push( elems[ i ] );
			}
		}

		return ret;
	},

	// arg is for internal usage only
	map: function( elems, callback, arg ) {
		var value, key, ret = [],
			i = 0,
			length = elems.length,
			// jquery objects are treated as arrays
			isArray = elems instanceof jQuery || length !== undefined && typeof length === "number" && ( ( length > 0 && elems[ 0 ] && elems[ length -1 ] ) || length === 0 || jQuery.isArray( elems ) ) ;

		// Go through the array, translating each of the items to their
		if ( isArray ) {
			for ( ; i < length; i++ ) {
				value = callback( elems[ i ], i, arg );

				if ( value != null ) {
					ret[ ret.length ] = value;
				}
			}

		// Go through every key on the object,
		} else {
			for ( key in elems ) {
				value = callback( elems[ key ], key, arg );

				if ( value != null ) {
					ret[ ret.length ] = value;
				}
			}
		}

		// Flatten any nested arrays
		return ret.concat.apply( [], ret );
	},

	// A global GUID counter for objects
	guid: 1,

	// Bind a function to a context, optionally partially applying any
	// arguments.
	proxy: function( fn, context ) {
		if ( typeof context === "string" ) {
			var tmp = fn[ context ];
			context = fn;
			fn = tmp;
		}

		// Quick check to determine if target is callable, in the spec
		// this throws a TypeError, but we will just return undefined.
		if ( !jQuery.isFunction( fn ) ) {
			return undefined;
		}

		// Simulated bind
		var args = slice.call( arguments, 2 ),
			proxy = function() {
				return fn.apply( context, args.concat( slice.call( arguments ) ) );
			};

		// Set the guid of unique handler to the same of original handler, so it can be removed
		proxy.guid = fn.guid = fn.guid || proxy.guid || jQuery.guid++;

		return proxy;
	},

	// Mutifunctional method to get and set values to a collection
	// The value/s can optionally be executed if it''s a function
	access: function( elems, key, value, exec, fn, pass ) {
		var length = elems.length;

		// Setting many attributes
		if ( typeof key === "object" ) {
			for ( var k in key ) {
				jQuery.access( elems, k, key[k], exec, fn, value );
			}
			return elems;
		}

		// Setting one attribute
		if ( value !== undefined ) {
			// Optionally, function values get executed if exec is true
			exec = !pass && exec && jQuery.isFunction(value);

			for ( var i = 0; i < length; i++ ) {
				fn( elems[i], key, exec ? value.call( elems[i], i, fn( elems[i], key ) ) : value, pass );
			}

			return elems;
		}

		// Getting an attribute
		return length ? fn( elems[0], key ) : undefined;
	},

	now: function() {
		return (new Date()).getTime();
	},

	// Use of jQuery.browser is frowned upon.
	// More details: http://docs.jquery.com/Utilities/jQuery.browser
	uaMatch: function( ua ) {
		ua = ua.toLowerCase();

		var match = rwebkit.exec( ua ) ||
			ropera.exec( ua ) ||
			rmsie.exec( ua ) ||
			ua.indexOf("compatible") < 0 && rmozilla.exec( ua ) ||
			[];

		return { browser: match[1] || "", version: match[2] || "0" };
	},

	sub: function() {
		function jQuerySub( selector, context ) {
			return new jQuerySub.fn.init( selector, context );
		}
		jQuery.extend( true, jQuerySub, this );
		jQuerySub.superclass = this;
		jQuerySub.fn = jQuerySub.prototype = this();
		jQuerySub.fn.constructor = jQuerySub;
		jQuerySub.sub = this.sub;
		jQuerySub.fn.init = function init( selector, context ) {
			if ( context && context instanceof jQuery && !(context instanceof jQuerySub) ) {
				context = jQuerySub( context );
			}

			return jQuery.fn.init.call( this, selector, context, rootjQuerySub );
		};
		jQuerySub.fn.init.prototype = jQuerySub.fn;
		var rootjQuerySub = jQuerySub(document);
		return jQuerySub;
	},

	browser: {}
});

// Populate the class2type map
jQuery.each("Boolean Number String Function Array Date RegExp Object".split(" "), function(i, name) {
	class2type[ "[object " + name + "]" ] = name.toLowerCase();
});

browserMatch = jQuery.uaMatch( userAgent );
if ( browserMatch.browser ) {
	jQuery.browser[ browserMatch.browser ] = true;
	jQuery.browser.version = browserMatch.version;
}

// Deprecated, use jQuery.browser.webkit instead
if ( jQuery.browser.webkit ) {
	jQuery.browser.safari = true;
}

// IE doesn''t match non-breaking spaces with \\s
if ( rnotwhite.test( "\\xA0" ) ) {
	trimLeft = /^[\\s\\xA0]+/;
	trimRight = /[\\s\\xA0]+$/;
}

// All jQuery objects should point back to these
rootjQuery = jQuery(document);

// Cleanup functions for the document ready method
if ( document.addEventListener ) {
	DOMContentLoaded = function() {
		document.removeEventListener( "DOMContentLoaded", DOMContentLoaded, false );
		jQuery.ready();
	};

} else if ( document.attachEvent ) {
	DOMContentLoaded = function() {
		// Make sure body exists, at least, in case IE gets a little overzealous (ticket #5443).
		if ( document.readyState === "complete" ) {
			document.detachEvent( "onreadystatechange", DOMContentLoaded );
			jQuery.ready();
		}
	};
}

// The DOM ready check for Internet Explorer
function doScrollCheck() {
	if ( jQuery.isReady ) {
		return;
	}

	try {
		// If IE is used, use the trick by Diego Perini
		// http://javascript.nwbox.com/IEContentLoaded/
		document.documentElement.doScroll("left");
	} catch(e) {
		setTimeout( doScrollCheck, 1 );
		return;
	}

	// and execute any waiting functions
	jQuery.ready();
}

return jQuery;

})();


var // Promise methods
	promiseMethods = "done fail isResolved isRejected promise then always pipe".split( " " ),
	// Static reference to slice
	sliceDeferred = [].slice;

jQuery.extend({
	// Create a simple deferred (one callbacks list)
	_Deferred: function() {
		var // callbacks list
			callbacks = [],
			// stored [ context , args ]
			fired,
			// to avoid firing when already doing so
			firing,
			// flag to know if the deferred has been cancelled
			cancelled,
			// the deferred itself
			deferred  = {

				// done( f1, f2, ...)
				done: function() {
					if ( !cancelled ) {
						var args = arguments,
							i,
							length,
							elem,
							type,
							_fired;
						if ( fired ) {
							_fired = fired;
							fired = 0;
						}
						for ( i = 0, length = args.length; i < length; i++ ) {
							elem = args[ i ];
							type = jQuery.type( elem );
							if ( type === "array" ) {
								deferred.done.apply( deferred, elem );
							} else if ( type === "function" ) {
								callbacks.push( elem );
							}
						}
						if ( _fired ) {
							deferred.resolveWith( _fired[ 0 ], _fired[ 1 ] );
						}
					}
					return this;
				},

				// resolve with given context and args
				resolveWith: function( context, args ) {
					if ( !cancelled && !fired && !firing ) {
						// make sure args are available (#8421)
						args = args || [];
						firing = 1;
						try {
							while( callbacks[ 0 ] ) {
								callbacks.shift().apply( context, args );
							}
						}
						finally {
							fired = [ context, args ];
							firing = 0;
						}
					}
					return this;
				},

				// resolve with this as context and given arguments
				resolve: function() {
					deferred.resolveWith( this, arguments );
					return this;
				},

				// Has this deferred been resolved?
				isResolved: function() {
					return !!( firing || fired );
				},

				// Cancel
				cancel: function() {
					cancelled = 1;
					callbacks = [];
					return this;
				}
			};

		return deferred;
	},

	// Full fledged deferred (two callbacks list)
	Deferred: function( func ) {
		var deferred = jQuery._Deferred(),
			failDeferred = jQuery._Deferred(),
			promise;
		// Add errorDeferred methods, then and promise
		jQuery.extend( deferred, {
			then: function( doneCallbacks, failCallbacks ) {
				deferred.done( doneCallbacks ).fail( failCallbacks );
				return this;
			},
			always: function() {
				return deferred.done.apply( deferred, arguments ).fail.apply( this, arguments );
			},
			fail: failDeferred.done,
			rejectWith: failDeferred.resolveWith,
			reject: failDeferred.resolve,
			isRejected: failDeferred.isResolved,
			pipe: function( fnDone, fnFail ) {
				return jQuery.Deferred(function( newDefer ) {
					jQuery.each( {
						done: [ fnDone, "resolve" ],
						fail: [ fnFail, "reject" ]
					}, function( handler, data ) {
						var fn = data[ 0 ],
							action = data[ 1 ],
							returned;
						if ( jQuery.isFunction( fn ) ) {
							deferred[ handler ](function() {
								returned = fn.apply( this, arguments );
								if ( returned && jQuery.isFunction( returned.promise ) ) {
									returned.promise().then( newDefer.resolve, newDefer.reject );
								} else {
									newDefer[ action ]( returned );
								}
							});
						} else {
							deferred[ handler ]( newDefer[ action ] );
						}
					});
				}).promise();
			},
			// Get a promise for this deferred
			// If obj is provided, the promise aspect is added to the object
			promise: function( obj ) {
				if ( obj == null ) {
					if ( promise ) {
						return promise;
					}
					promise = obj = {};
				}
				var i = promiseMethods.length;
				while( i-- ) {
					obj[ promiseMethods[i] ] = deferred[ promiseMethods[i] ];
				}
				return obj;
			}
		});
		// Make sure only one callback list will be used
		deferred.done( failDeferred.cancel ).fail( deferred.cancel );
		// Unexpose cancel
		delete deferred.cancel;
		// Call given func if any
		if ( func ) {
			func.call( deferred, deferred );
		}
		return deferred;
	},

	// Deferred helper
	when: function( firstParam ) {
		var args = arguments,
			i = 0,
			length = args.length,
			count = length,
			deferred = length <= 1 && firstParam && jQuery.isFunction( firstParam.promise ) ?
				firstParam :
				jQuery.Deferred();
		function resolveFunc( i ) {
			return function( value ) {
				args[ i ] = arguments.length > 1 ? sliceDeferred.call( arguments, 0 ) : value;
				if ( !( --count ) ) {
					// Strange bug in FF4:
					// Values changed onto the arguments object sometimes end up as undefined values
					// outside the $.when method. Cloning the object into a fresh array solves the issue
					deferred.resolveWith( deferred, sliceDeferred.call( args, 0 ) );
				}
			};
		}
		if ( length > 1 ) {
			for( ; i < length; i++ ) {
				if ( args[ i ] && jQuery.isFunction( args[ i ].promise ) ) {
					args[ i ].promise().then( resolveFunc(i), deferred.reject );
				} else {
					--count;
				}
			}
			if ( !count ) {
				deferred.resolveWith( deferred, args );
			}
		} else if ( deferred !== firstParam ) {
			deferred.resolveWith( deferred, length ? [ firstParam ] : [] );
		}
		return deferred.promise();
	}
});



jQuery.support = (function() {

	var div = document.createElement( "div" ),
		documentElement = document.documentElement,
		all,
		a,
		select,
		opt,
		input,
		marginDiv,
		support,
		fragment,
		body,
		testElementParent,
		testElement,
		testElementStyle,
		tds,
		events,
		eventName,
		i,
		isSupported;

	// Preliminary tests
	div.setAttribute("className", "t");
	div.innerHTML = "   <link/><table></table><a href=''/a'' style=''top:1px;float:left;opacity:.55;''>a</a><input type=''checkbox''/>";

	all = div.getElementsByTagName( "*" );
	a = div.getElementsByTagName( "a" )[ 0 ];

	// Can''t get basic test support
	if ( !all || !all.length || !a ) {
		return {};
	}

	// First batch of supports tests
	select = document.createElement( "select" );
	opt = select.appendChild( document.createElement("option") );
	input = div.getElementsByTagName( "input" )[ 0 ];

	support = {
		// IE strips leading whitespace when .innerHTML is used
		leadingWhitespace: ( div.firstChild.nodeType === 3 ),

		// Make sure that tbody elements aren''t automatically inserted
		// IE will insert them into empty tables
		tbody: !div.getElementsByTagName( "tbody" ).length,

		// Make sure that link elements get serialized correctly by innerHTML
		// This requires a wrapper element in IE
		htmlSerialize: !!div.getElementsByTagName( "link" ).length,

		// Get the style information from getAttribute
		// (IE uses .cssText instead)
		style: /top/.test( a.getAttribute("style") ),

		// Make sure that URLs aren''t manipulated
		// (IE normalizes it by default)
		hrefNormalized: ( a.getAttribute( "href" ) === "/a" ),

		// Make sure that element opacity exists
		// (IE uses filter instead)
		// Use a regex to work around a WebKit issue. See #5145
		opacity: /^0.55$/.test( a.style.opacity ),

		// Verify style float existence
		// (IE uses styleFloat instead of cssFloat)
		cssFloat: !!a.style.cssFloat,

		// Make sure that if no value is specified for a checkbox
		// that it defaults to "on".
		// (WebKit defaults to "" instead)
		checkOn: ( input.value === "on" ),

		// Make sure that a selected-by-default option has a working selected property.
		// (WebKit defaults to false instead of true, IE too, if it''s in an optgroup)
		optSelected: opt.selected,

		// Test setAttribute on camelCase class. If it works, we need attrFixes when doing get/setAttribute (ie6/7)
		getSetAttribute: div.className !== "t",

		// Will be defined later
		submitBubbles: true,
		changeBubbles: true,
		focusinBubbles: false,
		deleteExpando: true,
		noCloneEvent: true,
		inlineBlockNeedsLayout: false,
		shrinkWrapBlocks: false,
		reliableMarginRight: true
	};

	// Make sure checked status is properly cloned
	input.checked = true;
	support.noCloneChecked = input.cloneNode( true ).checked;

	// Make sure that the options inside disabled selects aren''t marked as disabled
	// (WebKit marks them as disabled)
	select.disabled = true;
	support.optDisabled = !opt.disabled;

	// Test to see if it''s possible to delete an expando from an element
	// Fails in Internet Explorer
	try {
		delete div.test;
	} catch( e ) {
		support.deleteExpando = false;
	}

	if ( !div.addEventListener && div.attachEvent && div.fireEvent ) {
		div.attachEvent( "onclick", function() {
			// Cloning a node shouldn''t copy over any
			// bound event handlers (IE does this)
			support.noCloneEvent = false;
		});
		div.cloneNode( true ).fireEvent( "onclick" );
	}

	// Check if a radio maintains it''s value
	// after being appended to the DOM
	input = document.createElement("input");
	input.value = "t";
	input.setAttribute("type", "radio");
	support.radioValue = input.value === "t";

	input.setAttribute("checked", "checked");
	div.appendChild( input );
	fragment = document.createDocumentFragment();
	fragment.appendChild( div.firstChild );

	// WebKit doesn''t clone checked state correctly in fragments
	support.checkClone = fragment.cloneNode( true ).cloneNode( true ).lastChild.checked;

	div.innerHTML = "";

	// Figure out if the W3C box model works as expected
	div.style.width = div.style.paddingLeft = "1px";

	body = document.getElementsByTagName( "body" )[ 0 ];
	// We use our own, invisible, body unless the body is already present
	// in which case we use a div (#9239)
	testElement = document.createElement( body ? "div" : "body" );
	testElementStyle = {
		visibility: "hidden",
		width: 0,
		height: 0,
		border: 0,
		margin: 0
	};
	if ( body ) {
		jQuery.extend( testElementStyle, {
			position: "absolute",
			left: -1000,
			top: -1000
		});
	}
	for ( i in testElementStyle ) {
		testElement.style[ i ] = testElementStyle[ i ];
	}
	testElement.appendChild( div );
	testElementParent = body || documentElement;
	testElementParent.insertBefore( testElement, testElementParent.firstChild );

	// Check if a disconnected checkbox will retain its checked
	// value of true after appended to the DOM (IE6/7)
	support.appendChecked = input.checked;

	support.boxModel = div.offsetWidth === 2;

	if ( "zoom" in div.style ) {
		// Check if natively block-level elements act like inline-block
		// elements when setting their display to ''inline'' and giving
		// them layout
		// (IE < 8 does this)
		div.style.display = "inline";
		div.style.zoom = 1;
		support.inlineBlockNeedsLayout = ( div.offsetWidth === 2 );

		// Check if elements with layout shrink-wrap their children
		// (IE 6 does this)
		div.style.display = "";
		div.innerHTML = "<div style=''width:4px;''></div>";
		support.shrinkWrapBlocks = ( div.offsetWidth !== 2 );
	}

	div.innerHTML = "<table><tr><td style=''padding:0;border:0;display:none''></td><td>t</td></tr></table>";
	tds = div.getElementsByTagName( "td" );

	// Check if table cells still have offsetWidth/Height when they are set
	// to display:none and there are still other visible table cells in a
	// table row; if so, offsetWidth/Height are not reliable for use when
	// determining if an element has been hidden directly using
	// display:none (it is still safe to use offsets if a parent element is
	// hidden; don safety goggles and see bug #4512 for more information).
	// (only IE 8 fails this test)
	isSupported = ( tds[ 0 ].offsetHeight === 0 );

	tds[ 0 ].style.display = "";
	tds[ 1 ].style.display = "none";

	// Check if empty table cells still have offsetWidth/Height
	// (IE < 8 fail this test)
	support.reliableHiddenOffsets = isSupported && ( tds[ 0 ].offsetHeight === 0 );
	div.innerHTML = "";

	// Check if div with explicit width and no margin-right incorrectly
	// gets computed margin-right based on width of container. For more
	// info see bug #3333
	// Fails in WebKit before Feb 2011 nightlies
	// WebKit Bug 13343 - getComputedStyle returns wrong value for margin-right
	if ( document.defaultView && document.defaultView.getComputedStyle ) {
		marginDiv = document.createElement( "div" );
		marginDiv.style.width = "0";
		marginDiv.style.marginRight = "0";
		div.appendChild( marginDiv );
		support.reliableMarginRight =
			( parseInt( ( document.defaultView.getComputedStyle( marginDiv, null ) || { marginRight: 0 } ).marginRight, 10 ) || 0 ) === 0;
	}

	// Remove the body element we added
	testElement.innerHTML = "";
	testElementParent.removeChild( testElement );

	// Technique from Juriy Zaytsev
	// http://thinkweb2.com/projects/prototype/detecting-event-support-without-browser-sniffing/
	// We only care about the case where non-standard event systems
	// are used, namely in IE. Short-circuiting here helps us to
	// avoid an eval call (in setAttribute) which can cause CSP
	// to go haywire. See: https://developer.mozilla.org/en/Security/CSP
	if ( div.attachEvent ) {
		for( i in {
			submit: 1,
			change: 1,
			focusin: 1
		} ) {
			eventName = "on" + i;
			isSupported = ( eventName in div );
			if ( !isSupported ) {
				div.setAttribute( eventName, "return;" );
				isSupported = ( typeof div[ eventName ] === "function" );
			}
			support[ i + "Bubbles" ] = isSupported;
		}
	}

	// Null connected elements to avoid leaks in IE
	testElement = fragment = select = opt = body = marginDiv = div = input = null;

	return support;
})();

// Keep track of boxModel
jQuery.boxModel = jQuery.support.boxModel;




var rbrace = /^(?:\\{.*\\}|\\[.*\\])$/,
	rmultiDash = /([a-z])([A-Z])/g;

jQuery.extend({
	cache: {},

	// Please use with caution
	uuid: 0,

	// Unique for each copy of jQuery on the page
	// Non-digits removed to match rinlinejQuery
	expando: "jQuery" + ( jQuery.fn.jquery + Math.random() ).replace( /\\D/g, "" ),

	// The following elements throw uncatchable exceptions if you
	// attempt to add expando properties to them.
	noData: {
		"embed": true,
		// Ban all objects except for Flash (which handle expandos)
		"object": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",
		"applet": true
	},

	hasData: function( elem ) {
		elem = elem.nodeType ? jQuery.cache[ elem[jQuery.expando] ] : elem[ jQuery.expando ];

		return !!elem && !isEmptyDataObject( elem );
	},

	data: function( elem, name, data, pvt /* Internal Use Only */ ) {
		if ( !jQuery.acceptData( elem ) ) {
			return;
		}

		var internalKey = jQuery.expando, getByName = typeof name === "string", thisCache,

			// We have to handle DOM nodes and JS objects differently because IE6-7
			// can''t GC object references properly across the DOM-JS boundary
			isNode = elem.nodeType,

			// Only DOM nodes need the global jQuery cache; JS object data is
			// attached directly to the object so GC can occur automatically
			cache = isNode ? jQuery.cache : elem,

			// Only defining an ID for JS objects if its cache already exists allows
			// the code to shortcut on the same path as a DOM node with no cache
			id = isNode ? elem[ jQuery.expando ] : elem[ jQuery.expando ] && jQuery.expando;

		// Avoid doing any more work than we need to when trying to get data on an
		// object that has no data at all
		if ( (!id || (pvt && id && !cache[ id ][ internalKey ])) && getByName && data === undefined ) {
			return;
		}

		if ( !id ) {
			// Only DOM nodes need a new unique ID for each element since their data
			// ends up in the global cache
			if ( isNode ) {
				elem[ jQuery.expando ] = id = ++jQuery.uuid;
			} else {
				id = jQuery.expando;
			}
		}

		if ( !cache[ id ] ) {
			cache[ id ] = {};

			// TODO: This is a hack for 1.5 ONLY. Avoids exposing jQuery
			// metadata on plain JS objects when the object is serialized using
			// JSON.stringify
			if ( !isNode ) {
				cache[ id ].toJSON = jQuery.noop;
			}
		}

		// An object can be passed to jQuery.data instead of a key/value pair; this gets
		// shallow copied over onto the existing cache
		if ( typeof name === "object" || typeof name === "function" ) {
			if ( pvt ) {
				cache[ id ][ internalKey ] = jQuery.extend(cache[ id ][ internalKey ], name);
			} else {
				cache[ id ] = jQuery.extend(cache[ id ], name);
			}
		}

		thisCache = cache[ id ];

		// Internal jQuery data is stored in a separate object inside the object''s data
		// cache in order to avoid key collisions between internal data and user-defined
		// data
		if ( pvt ) {
			if ( !thisCache[ internalKey ] ) {
				thisCache[ internalKey ] = {};
			}

			thisCache = thisCache[ internalKey ];
		}

		if ( data !== undefined ) {
			thisCache[ jQuery.camelCase( name ) ] = data;
		}

		// TODO: This is a hack for 1.5 ONLY. It will be removed in 1.6. Users should
		// not attempt to inspect the internal events object using jQuery.data, as this
		// internal data object is undocumented and subject to change.
		if ( name === "events" && !thisCache[name] ) {
			return thisCache[ internalKey ] && thisCache[ internalKey ].events;
		}

		return getByName ? 
			// Check for both converted-to-camel and non-converted data property names
			thisCache[ jQuery.camelCase( name ) ] || thisCache[ name ] :
			thisCache;
	},

	removeData: function( elem, name, pvt /* Internal Use Only */ ) {
		if ( !jQuery.acceptData( elem ) ) {
			return;
		}

		var internalKey = jQuery.expando, isNode = elem.nodeType,

			// See jQuery.data for more information
			cache = isNode ? jQuery.cache : elem,

			// See jQuery.data for more information
			id = isNode ? elem[ jQuery.expando ] : jQuery.expando;

		// If there is already no cache entry for this object, there is no
		// purpose in continuing
		if ( !cache[ id ] ) {
			return;
		}

		if ( name ) {
			var thisCache = pvt ? cache[ id ][ internalKey ] : cache[ id ];

			if ( thisCache ) {
				delete thisCache[ name ];

				// If there is no data left in the cache, we want to continue
				// and let the cache object itself get destroyed
				if ( !isEmptyDataObject(thisCache) ) {
					return;
				}
			}
		}

		// See jQuery.data for more information
		if ( pvt ) {
			delete cache[ id ][ internalKey ];

			// Don''t destroy the parent cache unless the internal data object
			// had been the only thing left in it
			if ( !isEmptyDataObject(cache[ id ]) ) {
				return;
			}
		}

		var internalCache = cache[ id ][ internalKey ];

		// Browsers that fail expando deletion also refuse to delete expandos on
		// the window, but it will allow it on all other JS objects; other browsers
		// don''t care
		if ( jQuery.support.deleteExpando || cache != window ) {
			delete cache[ id ];
		} else {
			cache[ id ] = null;
		}

		// We destroyed the entire user cache at once because it''s faster than
		// iterating through each key, but we need to continue to persist internal
		// data if it existed
		if ( internalCache ) {
			cache[ id ] = {};
			// TODO: This is a hack for 1.5 ONLY. Avoids exposing jQuery
			// metadata on plain JS objects when the object is serialized using
			// JSON.stringify
			if ( !isNode ) {
				cache[ id ].toJSON = jQuery.noop;
			}

			cache[ id ][ internalKey ] = internalCache;

		// Otherwise, we need to eliminate the expando on the node to avoid
		// false lookups in the cache for entries that no longer exist
		} else if ( isNode ) {
			// IE does not allow us to delete expando properties from nodes,
			// nor does it have a removeAttribute function on Document nodes;
			// we must handle all of these cases
			if ( jQuery.support.deleteExpando ) {
				delete elem[ jQuery.expando ];
			} else if ( elem.removeAttribute ) {
				elem.removeAttribute( jQuery.expando );
			} else {
				elem[ jQuery.expando ] = null;
			}
		}
	},

	// For internal use only.
	_data: function( elem, name, data ) {
		return jQuery.data( elem, name, data, true );
	},

	// A method for determining if a DOM node can handle the data expando
	acceptData: function( elem ) {
		if ( elem.nodeName ) {
			var match = jQuery.noData[ elem.nodeName.toLowerCase() ];

			if ( match ) {
				return !(match === true || elem.getAttribute("classid") !== match);
			}
		}

		return true;
	}
});

jQuery.fn.extend({
	data: function( key, value ) {
		var data = null;

		if ( typeof key === "undefined" ) {
			if ( this.length ) {
				data = jQuery.data( this[0] );

				if ( this[0].nodeType === 1 ) {
			    var attr = this[0].attributes, name;
					for ( var i = 0, l = attr.length; i < l; i++ ) {
						name = attr[i].name;

						if ( name.indexOf( "data-" ) === 0 ) {
							name = jQuery.camelCase( name.substring(5) );

							dataAttr( this[0], name, data[ name ] );
						}
					}
				}
			}

			return data;

		} else if ( typeof key === "object" ) {
			return this.each(function() {
				jQuery.data( this, key );
			});
		}

		var parts = key.split(".");
		parts[1] = parts[1] ? "." + parts[1] : "";

		if ( value === undefined ) {
			data = this.triggerHandler("getData" + parts[1] + "!", [parts[0]]);

			// Try to fetch any internally stored data first
			if ( data === undefined && this.length ) {
				data = jQuery.data( this[0], key );
				data = dataAttr( this[0], key, data );
			}

			return data === undefined && parts[1] ?
				this.data( parts[0] ) :
				data;

		} else {
			return this.each(function() {
				var $this = jQuery( this ),
					args = [ parts[0], value ];

				$this.triggerHandler( "setData" + parts[1] + "!", args );
				jQuery.data( this, key, value );
				$this.triggerHandler( "changeData" + parts[1] + "!", args );
			});
		}
	},

	removeData: function( key ) {
		return this.each(function() {
			jQuery.removeData( this, key );
		});
	}
});

function dataAttr( elem, key, data ) {
	// If nothing was found internally, try to fetch any
	// data from the HTML5 data-* attribute
	if ( data === undefined && elem.nodeType === 1 ) {
		var name = "data-" + key.replace( rmultiDash, "$1-$2" ).toLowerCase();

		data = elem.getAttribute( name );

		if ( typeof data === "string" ) {
			try {
				data = data === "true" ? true :
				data === "false" ? false :
				data === "null" ? null :
				!jQuery.isNaN( data ) ? parseFloat( data ) :
					rbrace.test( data ) ? jQuery.parseJSON( data ) :
					data;
			} catch( e ) {}

			// Make sure we set the data so it isn''t changed later
			jQuery.data( elem, key, data );

		} else {
			data = undefined;
		}
	}

	return data;
}

// TODO: This is a hack for 1.5 ONLY to allow objects with a single toJSON
// property to be considered empty objects; this property always exists in
// order to make sure JSON.stringify does not expose internal metadata
function isEmptyDataObject( obj ) {
	for ( var name in obj ) {
		if ( name !== "toJSON" ) {
			return false;
		}
	}

	return true;
}




function handleQueueMarkDefer( elem, type, src ) {
	var deferDataKey = type + "defer",
		queueDataKey = type + "queue",
		markDataKey = type + "mark",
		defer = jQuery.data( elem, deferDataKey, undefined, true );
	if ( defer &&
		( src === "queue" || !jQuery.data( elem, queueDataKey, undefined, true ) ) &&
		( src === "mark" || !jQuery.data( elem, markDataKey, undefined, true ) ) ) {
		// Give room for hard-coded callbacks to fire first
		// and eventually mark/queue something else on the element
		setTimeout( function() {
			if ( !jQuery.data( elem, queueDataKey, undefined, true ) &&
				!jQuery.data( elem, markDataKey, undefined, true ) ) {
				jQuery.removeData( elem, deferDataKey, true );
				defer.resolve();
			}
		}, 0 );
	}
}

jQuery.extend({

	_mark: function( elem, type ) {
		if ( elem ) {
			type = (type || "fx") + "mark";
			jQuery.data( elem, type, (jQuery.data(elem,type,undefined,true) || 0) + 1, true );
		}
	},

	_unmark: function( force, elem, type ) {
		if ( force !== true ) {
			type = elem;
			elem = force;
			force = false;
		}
		if ( elem ) {
			type = type || "fx";
			var key = type + "mark",
				count = force ? 0 : ( (jQuery.data( elem, key, undefined, true) || 1 ) - 1 );
			if ( count ) {
				jQuery.data( elem, key, count, true );
			} else {
				jQuery.removeData( elem, key, true );
				handleQueueMarkDefer( elem, type, "mark" );
			}
		}
	},

	queue: function( elem, type, data ) {
		if ( elem ) {
			type = (type || "fx") + "queue";
			var q = jQuery.data( elem, type, undefined, true );
			// Speed up dequeue by getting out quickly if this is just a lookup
			if ( data ) {
				if ( !q || jQuery.isArray(data) ) {
					q = jQuery.data( elem, type, jQuery.makeArray(data), true );
				} else {
					q.push( data );
				}
			}
			return q || [];
		}
	},

	dequeue: function( elem, type ) {
		type = type || "fx";

		var queue = jQuery.queue( elem, type ),
			fn = queue.shift(),
			defer;

		// If the fx queue is dequeued, always remove the progress sentinel
		if ( fn === "inprogress" ) {
			fn = queue.shift();
		}

		if ( fn ) {
			// Add a progress sentinel to prevent the fx queue from being
			// automatically dequeued
			if ( type === "fx" ) {
				queue.unshift("inprogress");
			}

			fn.call(elem, function() {
				jQuery.dequeue(elem, type);
			});
		}

		if ( !queue.length ) {
			jQuery.removeData( elem, type + "queue", true );
			handleQueueMarkDefer( elem, type, "queue" );
		}
	}
});

jQuery.fn.extend({
	queue: function( type, data ) {
		if ( typeof type !== "string" ) {
			data = type;
			type = "fx";
		}

		if ( data === undefined ) {
			return jQuery.queue( this[0], type );
		}
		return this.each(function() {
			var queue = jQuery.queue( this, type, data );

			if ( type === "fx" && queue[0] !== "inprogress" ) {
				jQuery.dequeue( this, type );
			}
		});
	},
	dequeue: function( type ) {
		return this.each(function() {
			jQuery.dequeue( this, type );
		});
	},
	// Based off of the plugin by Clint Helfers, with permission.
	// http://blindsignals.com/index.php/2009/07/jquery-delay/
	delay: function( time, type ) {
		time = jQuery.fx ? jQuery.fx.speeds[time] || time : time;
		type = type || "fx";

		return this.queue( type, function() {
			var elem = this;
			setTimeout(function() {
				jQuery.dequeue( elem, type );
			}, time );
		});
	},
	clearQueue: function( type ) {
		return this.queue( type || "fx", [] );
	},
	// Get a promise resolved when queues of a certain type
	// are emptied (fx is the type by default)
	promise: function( type, object ) {
		if ( typeof type !== "string" ) {
			object = type;
			type = undefined;
		}
		type = type || "fx";
		var defer = jQuery.Deferred(),
			elements = this,
			i = elements.length,
			count = 1,
			deferDataKey = type + "defer",
			queueDataKey = type + "queue",
			markDataKey = type + "mark",
			tmp;
		function resolve() {
			if ( !( --count ) ) {
				defer.resolveWith( elements, [ elements ] );
			}
		}
		while( i-- ) {
			if (( tmp = jQuery.data( elements[ i ], deferDataKey, undefined, true ) ||
					( jQuery.data( elements[ i ], queueDataKey, undefined, true ) ||
						jQuery.data( elements[ i ], markDataKey, undefined, true ) ) &&
					jQuery.data( elements[ i ], deferDataKey, jQuery._Deferred(), true ) )) {
				count++;
				tmp.done( resolve );
			}
		}
		resolve();
		return defer.promise();
	}
});




var rclass = /[\\n\\t\\r]/g,
	rspace = /\\s+/,
	rreturn = /\\r/g,
	rtype = /^(?:button|input)$/i,
	rfocusable = /^(?:button|input|object|select|textarea)$/i,
	rclickable = /^a(?:rea)?$/i,
	rboolean = /^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,
	rinvalidChar = /\\:|^on/,
	formHook, boolHook;

jQuery.fn.extend({
	attr: function( name, value ) {
		return jQuery.access( this, name, value, true, jQuery.attr );
	},

	removeAttr: function( name ) {
		return this.each(function() {
			jQuery.removeAttr( this, name );
		});
	},
	
	prop: function( name, value ) {
		return jQuery.access( this, name, value, true, jQuery.prop );
	},
	
	removeProp: function( name ) {
		name = jQuery.propFix[ name ] || name;
		return this.each(function() {
			// try/catch handles cases where IE balks (such as removing a property on window)
			try {
				this[ name ] = undefined;
				delete this[ name ];
			} catch( e ) {}
		});
	},

	addClass: function( value ) {
		var classNames, i, l, elem,
			setClass, c, cl;

		if ( jQuery.isFunction( value ) ) {
			return this.each(function( j ) {
				jQuery( this ).addClass( value.call(this, j, this.className) );
			});
		}

		if ( value && typeof value === "string" ) {
			classNames = value.split( rspace );

			for ( i = 0, l = this.length; i < l; i++ ) {
				elem = this[ i ];

				if ( elem.nodeType === 1 ) {
					if ( !elem.className && classNames.length === 1 ) {
						elem.className = value;

					} else {
						setClass = " " + elem.className + " ";

						for ( c = 0, cl = classNames.length; c < cl; c++ ) {
							if ( !~setClass.indexOf( " " + classNames[ c ] + " " ) ) {
								setClass += classNames[ c ] + " ";
							}
						}
						elem.className = jQuery.trim( setClass );
					}
				}
			}
		}

		return this;
	},

	removeClass: function( value ) {
		var classNames, i, l, elem, className, c, cl;

		if ( jQuery.isFunction( value ) ) {
			return this.each(function( j ) {
				jQuery( this ).removeClass( value.call(this, j, this.className) );
			});
		}

		if ( (value && typeof value === "string") || value === undefined ) {
			classNames = (value || "").split( rspace );

			for ( i = 0, l = this.length; i < l; i++ ) {
				elem = this[ i ];

				if ( elem.nodeType === 1 && elem.className ) {
					if ( value ) {
						className = (" " + elem.className + " ").replace( rclass, " " );
						for ( c = 0, cl = classNames.length; c < cl; c++ ) {
							className = className.replace(" " + classNames[ c ] + " ", " ");
						}
						elem.className = jQuery.trim( className );

					} else {
						elem.className = "";
					}
				}
			}
		}

		return this;
	},

	toggleClass: function( value, stateVal ) {
		var type = typeof value,
			isBool = typeof stateVal === "boolean";

		if ( jQuery.isFunction( value ) ) {
			return this.each(function( i ) {
				jQuery( this ).toggleClass( value.call(this, i, this.className, stateVal), stateVal );
			});
		}

		return this.each(function() {
			if ( type === "string" ) {
				// toggle individual class names
				var className,
					i = 0,
					self = jQuery( this ),
					state = stateVal,
					classNames = value.split( rspace );

				while ( (className = classNames[ i++ ]) ) {
					// check each className given, space seperated list
					state = isBool ? state : !self.hasClass( className );
					self[ state ? "addClass" : "removeClass" ]( className );
				}

			} else if ( type === "undefined" || type === "boolean" ) {
				if ( this.className ) {
					// store className if set
					jQuery._data( this, "__className__", this.className );
				}

				// toggle whole className
				this.className = this.className || value === false ? "" : jQuery._data( this, "__className__" ) || "";
			}
		});
	},

	hasClass: function( selector ) {
		var className = " " + selector + " ";
		for ( var i = 0, l = this.length; i < l; i++ ) {
			if ( (" " + this[i].className + " ").replace(rclass, " ").indexOf( className ) > -1 ) {
				return true;
			}
		}

		return false;
	},

	val: function( value ) {
		var hooks, ret,
			elem = this[0];
		
		if ( !arguments.length ) {
			if ( elem ) {
				hooks = jQuery.valHooks[ elem.nodeName.toLowerCase() ] || jQuery.valHooks[ elem.type ];

				if ( hooks && "get" in hooks && (ret = hooks.get( elem, "value" )) !== undefined ) {
					return ret;
				}

				ret = elem.value;

				return typeof ret === "string" ? 
					// handle most common string cases
					ret.replace(rreturn, "") : 
					// handle cases where value is null/undef or number
					ret == null ? "" : ret;
			}

			return undefined;
		}

		var isFunction = jQuery.isFunction( value );

		return this.each(function( i ) {
			var self = jQuery(this), val;

			if ( this.nodeType !== 1 ) {
				return;
			}

			if ( isFunction ) {
				val = value.call( this, i, self.val() );
			} else {
				val = value;
			}

			// Treat null/undefined as ""; convert numbers to string
			if ( val == null ) {
				val = "";
			} else if ( typeof val === "number" ) {
				val += "";
			} else if ( jQuery.isArray( val ) ) {
				val = jQuery.map(val, function ( value ) {
					return value == null ? "" : value + "";
				});
			}

			hooks = jQuery.valHooks[ this.nodeName.toLowerCase() ] || jQuery.valHooks[ this.type ];

			// If set returns undefined, fall back to normal setting
			if ( !hooks || !("set" in hooks) || hooks.set( this, val, "value" ) === undefined ) {
				this.value = val;
			}
		});
	}
});

jQuery.extend({
	valHooks: {
		option: {
			get: function( elem ) {
				// attributes.value is undefined in Blackberry 4.7 but
				// uses .value. See #6932
				var val = elem.attributes.value;
				return !val || val.specified ? elem.value : elem.text;
			}
		},
		select: {
			get: function( elem ) {
				var value,
					index = elem.selectedIndex,
					values = [],
					options = elem.options,
					one = elem.type === "select-one";

				// Nothing was selected
				if ( index < 0 ) {
					return null;
				}

				// Loop through all the selected options
				for ( var i = one ? index : 0, max = one ? index + 1 : options.length; i < max; i++ ) {
					var option = options[ i ];

					// Don''t return options that are disabled or in a disabled optgroup
					if ( option.selected && (jQuery.support.optDisabled ? !option.disabled : option.getAttribute("disabled") === null) &&
							(!option.parentNode.disabled || !jQuery.nodeName( option.parentNode, "optgroup" )) ) {

						// Get the specific value for the option
						value = jQuery( option ).val();

						// We don''t need an array for one selects
						if ( one ) {
							return value;
						}

						// Multi-Selects return an array
						values.push( value );
					}
				}

				// Fixes Bug #2551 -- select.val() broken in IE after form.reset()
				if ( one && !values.length && options.length ) {
					return jQuery( options[ index ] ).val();
				}

				return values;
			},

			set: function( elem, value ) {
				var values = jQuery.makeArray( value );

				jQuery(elem).find("option").each(function() {
					this.selected = jQuery.inArray( jQuery(this).val(), values ) >= 0;
				});

				if ( !values.length ) {
					elem.selectedIndex = -1;
				}
				return values;
			}
		}
	},

	attrFn: {
		val: true,
		css: true,
		html: true,
		text: true,
		data: true,
		width: true,
		height: true,
		offset: true
	},
	
	attrFix: {
		// Always normalize to ensure hook usage
		tabindex: "tabIndex"
	},
	
	attr: function( elem, name, value, pass ) {
		var nType = elem.nodeType;
		
		// don''t get/set attributes on text, comment and attribute nodes
		if ( !elem || nType === 3 || nType === 8 || nType === 2 ) {
			return undefined;
		}

		if ( pass && name in jQuery.attrFn ) {
			return jQuery( elem )[ name ]( value );
		}

		// Fallback to prop when attributes are not supported
		if ( !("getAttribute" in elem) ) {
			return jQuery.prop( elem, name, value );
		}

		var ret, hooks,
			notxml = nType !== 1 || !jQuery.isXMLDoc( elem );

		// Normalize the name if needed
		if ( notxml ) {
			name = jQuery.attrFix[ name ] || name;

			hooks = jQuery.attrHooks[ name ];

			if ( !hooks ) {
				// Use boolHook for boolean attributes
				if ( rboolean.test( name ) ) {

					hooks = boolHook;

				// Use formHook for forms and if the name contains certain characters
				} else if ( formHook && name !== "className" &&
					(jQuery.nodeName( elem, "form" ) || rinvalidChar.test( name )) ) {

					hooks = formHook;
				}
			}
		}

		if ( value !== undefined ) {

			if ( value === null ) {
				jQuery.removeAttr( elem, name );
				return undefined;

			} else if ( hooks && "set" in hooks && notxml && (ret = hooks.set( elem, value, name )) !== undefined ) {
				return ret;

			} else {
				elem.setAttribute( name, "" + value );
				return value;
			}

		} else if ( hooks && "get" in hooks && notxml && (ret = hooks.get( elem, name )) !== null ) {
			return ret;

		} else {

			ret = elem.getAttribute( name );

			// Non-existent attributes return null, we normalize to undefined
			return ret === null ?
				undefined :
				ret;
		}
	},

	removeAttr: function( elem, name ) {
		var propName;
		if ( elem.nodeType === 1 ) {
			name = jQuery.attrFix[ name ] || name;
		
			if ( jQuery.support.getSetAttribute ) {
				// Use removeAttribute in browsers that support it
				elem.removeAttribute( name );
			} else {
				jQuery.attr( elem, name, "" );
				elem.removeAttributeNode( elem.getAttributeNode( name ) );
			}

			// Set corresponding property to false for boolean attributes
			if ( rboolean.test( name ) && (propName = jQuery.propFix[ name ] || name) in elem ) {
				elem[ propName ] = false;
			}
		}
	},

	attrHooks: {
		type: {
			set: function( elem, value ) {
				// We can''t allow the type property to be changed (since it causes problems in IE)
				if ( rtype.test( elem.nodeName ) && elem.parentNode ) {
					jQuery.error( "type property can''t be changed" );
				} else if ( !jQuery.support.radioValue && value === "radio" && jQuery.nodeName(elem, "input") ) {
					// Setting the type on a radio button after the value resets the value in IE6-9
					// Reset value to it''s default in case type is set after value
					// This is for element creation
					var val = elem.value;
					elem.setAttribute( "type", value );
					if ( val ) {
						elem.value = val;
					}
					return value;
				}
			}
		},
		tabIndex: {
			get: function( elem ) {
				// elem.tabIndex doesn''t always return the correct value when it hasn''t been explicitly set
				// http://fluidproject.org/blog/2008/01/09/getting-setting-and-removing-tabindex-values-with-javascript/
				var attributeNode = elem.getAttributeNode("tabIndex");

				return attributeNode && attributeNode.specified ?
					parseInt( attributeNode.value, 10 ) :
					rfocusable.test( elem.nodeName ) || rclickable.test( elem.nodeName ) && elem.href ?
						0 :
						undefined;
			}
		},
		// Use the value property for back compat
		// Use the formHook for button elements in IE6/7 (#1954)
		value: {
			get: function( elem, name ) {
				if ( formHook && jQuery.nodeName( elem, "button" ) ) {
					return formHook.get( elem, name );
				}
				return name in elem ?
					elem.value :
					null;
			},
			set: function( elem, value, name ) {
				if ( formHook && jQuery.nodeName( elem, "button" ) ) {
					return formHook.set( elem, value, name );
				}
				// Does not return so that setAttribute is also used
				elem.value = value;
			}
		}
	},

	propFix: {
		tabindex: "tabIndex",
		readonly: "readOnly",
		"for": "htmlFor",
		"class": "className",
		maxlength: "maxLength",
		cellspacing: "cellSpacing",
		cellpadding: "cellPadding",
		rowspan: "rowSpan",
		colspan: "colSpan",
		usemap: "useMap",
		frameborder: "frameBorder",
		contenteditable: "contentEditable"
	},
	
	prop: function( elem, name, value ) {
		var nType = elem.nodeType;

		// don''t get/set properties on text, comment and attribute nodes
		if ( !elem || nType === 3 || nType === 8 || nType === 2 ) {
			return undefined;
		}

		var ret, hooks,
			notxml = nType !== 1 || !jQuery.isXMLDoc( elem );

		if ( notxml ) {
			// Fix name and attach hooks
			name = jQuery.propFix[ name ] || name;
			hooks = jQuery.propHooks[ name ];
		}

		if ( value !== undefined ) {
			if ( hooks && "set" in hooks && (ret = hooks.set( elem, value, name )) !== undefined ) {
				return ret;

			} else {
				return (elem[ name ] = value);
			}

		} else {
			if ( hooks && "get" in hooks && (ret = hooks.get( elem, name )) !== undefined ) {
				return ret;

			} else {
				return elem[ name ];
			}
		}
	},
	
	propHooks: {}
});

// Hook for boolean attributes
boolHook = {
	get: function( elem, name ) {
		// Align boolean attributes with corresponding properties
		return jQuery.prop( elem, name ) ?
			name.toLowerCase() :
			undefined;
	},
	set: function( elem, value, name ) {
		var propName;
		if ( value === false ) {
			// Remove boolean attributes when set to false
			jQuery.removeAttr( elem, name );
		} else {
			// value is true since we know at this point it''s type boolean and not false
			// Set boolean attributes to the same name and set the DOM property
			propName = jQuery.propFix[ name ] || name;
			if ( propName in elem ) {
				// Only set the IDL specifically if it already exists on the element
				elem[ propName ] = true;
			}

			elem.setAttribute( name, name.toLowerCase() );
		}
		return name;
	}
};

// IE6/7 do not support getting/setting some attributes with get/setAttribute
if ( !jQuery.support.getSetAttribute ) {

	// propFix is more comprehensive and contains all fixes
	jQuery.attrFix = jQuery.propFix;
	
	// Use this for any attribute on a form in IE6/7
	formHook = jQuery.attrHooks.name = jQuery.attrHooks.title = jQuery.valHooks.button = {
		get: function( elem, name ) {
			var ret;
			ret = elem.getAttributeNode( name );
			// Return undefined if nodeValue is empty string
			return ret && ret.nodeValue !== "" ?
				ret.nodeValue :
				undefined;
		},
		set: function( elem, value, name ) {
			// Check form objects in IE (multiple bugs related)
			// Only use nodeValue if the attribute node exists on the form
			var ret = elem.getAttributeNode( name );
			if ( ret ) {
				ret.nodeValue = value;
				return value;
			}
		}
	};

	// Set width and height to auto instead of 0 on empty string( Bug #8150 )
	// This is for removals
	jQuery.each([ "width", "height" ], function( i, name ) {
		jQuery.attrHooks[ name ] = jQuery.extend( jQuery.attrHooks[ name ], {
			set: function( elem, value ) {
				if ( value === "" ) {
					elem.setAttribute( name, "auto" );
					return value;
				}
			}
		});
	});
}


// Some attributes require a special call on IE
if ( !jQuery.support.hrefNormalized ) {
	jQuery.each([ "href", "src", "width", "height" ], function( i, name ) {
		jQuery.attrHooks[ name ] = jQuery.extend( jQuery.attrHooks[ name ], {
			get: function( elem ) {
				var ret = elem.getAttribute( name, 2 );
				return ret === null ? undefined : ret;
			}
		});
	});
}

if ( !jQuery.support.style ) {
	jQuery.attrHooks.style = {
		get: function( elem ) {
			// Return undefined in the case of empty string
			// Normalize to lowercase since IE uppercases css property names
			return elem.style.cssText.toLowerCase() || undefined;
		},
		set: function( elem, value ) {
			return (elem.style.cssText = "" + value);
		}
	};
}

// Safari mis-reports the default selected property of an option
// Accessing the parent''s selectedIndex property fixes it
if ( !jQuery.support.optSelected ) {
	jQuery.propHooks.selected = jQuery.extend( jQuery.propHooks.selected, {
		get: function( elem ) {
			var parent = elem.parentNode;

			if ( parent ) {
				parent.selectedIndex;

				// Make sure that it also works with optgroups, see #5701
				if ( parent.parentNode ) {
					parent.parentNode.selectedIndex;
				}
			}
		}
	});
}

// Radios and checkboxes getter/setter
if ( !jQuery.support.checkOn ) {
	jQuery.each([ "radio", "checkbox" ], function() {
		jQuery.valHooks[ this ] = {
			get: function( elem ) {
				// Handle the case where in Webkit "" is returned instead of "on" if a value isn''t specified
				return elem.getAttribute("value") === null ? "on" : elem.value;
			}
		};
	});
}
jQuery.each([ "radio", "checkbox" ], function() {
	jQuery.valHooks[ this ] = jQuery.extend( jQuery.valHooks[ this ], {
		set: function( elem, value ) {
			if ( jQuery.isArray( value ) ) {
				return (elem.checked = jQuery.inArray( jQuery(elem).val(), value ) >= 0);
			}
		}
	});
});




var rnamespaces = /\\.(.*)$/,
	rformElems = /^(?:textarea|input|select)$/i,
	rperiod = /\\./g,
	rspaces = / /g,
	rescape = /[^\\w\\s.|`]/g,
	fcleanup = function( nm ) {
		return nm.replace(rescape, "\\\\$&");
	};

/*
 * A number of helper functions used for managing events.
 * Many of the ideas behind this code originated from
 * Dean Edwards'' addEvent library.
 */
jQuery.event = {

	// Bind an event to an element
	// Original by Dean Edwards
	add: function( elem, types, handler, data ) {
		if ( elem.nodeType === 3 || elem.nodeType === 8 ) {
			return;
		}

		if ( handler === false ) {
			handler = returnFalse;
		} else if ( !handler ) {
			// Fixes bug #7229. Fix recommended by jdalton
			return;
		}

		var handleObjIn, handleObj;

		if ( handler.handler ) {
			handleObjIn = handler;
			handler = handleObjIn.handler;
		}

		// Make sure that the function being executed has a unique ID
		if ( !handler.guid ) {
			handler.guid = jQuery.guid++;
		}

		// Init the element''s event structure
		var elemData = jQuery._data( elem );

		// If no elemData is found then we must be trying to bind to one of the
		// banned noData elements
		if ( !elemData ) {
			return;
		}

		var events = elemData.events,
			eventHandle = elemData.handle;

		if ( !events ) {
			elemData.events = events = {};
		}

		if ( !eventHandle ) {
			elemData.handle = eventHandle = function( e ) {
				// Discard the second event of a jQuery.event.trigger() and
				// when an event is called after a page has unloaded
				return typeof jQuery !== "undefined" && (!e || jQuery.event.triggered !== e.type) ?
					jQuery.event.handle.apply( eventHandle.elem, arguments ) :
					undefined;
			};
		}

		// Add elem as a property of the handle function
		// This is to prevent a memory leak with non-native events in IE.
		eventHandle.elem = elem;

		// Handle multiple events separated by a space
		// jQuery(...).bind("mouseover mouseout", fn);
		types = types.split(" ");

		var type, i = 0, namespaces;

		while ( (type = types[ i++ ]) ) {
			handleObj = handleObjIn ?
				jQuery.extend({}, handleObjIn) :
				{ handler: handler, data: data };

			// Namespaced event handlers
			if ( type.indexOf(".") > -1 ) {
				namespaces = type.split(".");
				type = namespaces.shift();
				handleObj.namespace = namespaces.slice(0).sort().join(".");

			} else {
				namespaces = [];
				handleObj.namespace = "";
			}

			handleObj.type = type;
			if ( !handleObj.guid ) {
				handleObj.guid = handler.guid;
			}

			// Get the current list of functions bound to this event
			var handlers = events[ type ],
				special = jQuery.event.special[ type ] || {};

			// Init the event handler queue
			if ( !handlers ) {
				handlers = events[ type ] = [];

				// Check for a special event handler
				// Only use addEventListener/attachEvent if the special
				// events handler returns false
				if ( !special.setup || special.setup.call( elem, data, namespaces, eventHandle ) === false ) {
					// Bind the global event handler to the element
					if ( elem.addEventListener ) {
						elem.addEventListener( type, eventHandle, false );

					} else if ( elem.attachEvent ) {
						elem.attachEvent( "on" + type, eventHandle );
					}
				}
			}

			if ( special.add ) {
				special.add.call( elem, handleObj );

				if ( !handleObj.handler.guid ) {
					handleObj.handler.guid = handler.guid;
				}
			}

			// Add the function to the element''s handler list
			handlers.push( handleObj );

			// Keep track of which events have been used, for event optimization
			jQuery.event.global[ type ] = true;
		}

		// Nullify elem to prevent memory leaks in IE
		elem = null;
	},

	global: {},

	// Detach an event or set of events from an element
	remove: function( elem, types, handler, pos ) {
		// don''t do events on text and comment nodes
		if ( elem.nodeType === 3 || elem.nodeType === 8 ) {
			return;
		}

		if ( handler === false ) {
			handler = returnFalse;
		}

		var ret, type, fn, j, i = 0, all, namespaces, namespace, special, eventType, handleObj, origType,
			elemData = jQuery.hasData( elem ) && jQuery._data( elem ),
			events = elemData && elemData.events;

		if ( !elemData || !events ) {
			return;
		}

		// types is actually an event object here
		if ( types && types.type ) {
			handler = types.handler;
			types = types.type;
		}

		// Unbind all events for the element
		if ( !types || typeof types === "string" && types.charAt(0) === "." ) {
			types = types || "";

			for ( type in events ) {
				jQuery.event.remove( elem, type + types );
			}

			return;
		}

		// Handle multiple events separated by a space
		// jQuery(...).unbind("mouseover mouseout", fn);
		types = types.split(" ");

		while ( (type = types[ i++ ]) ) {
			origType = type;
			handleObj = null;
			all = type.indexOf(".") < 0;
			namespaces = [];

			if ( !all ) {
				// Namespaced event handlers
				namespaces = type.split(".");
				type = namespaces.shift();

				namespace = new RegExp("(^|\\\\.)" +
					jQuery.map( namespaces.slice(0).sort(), fcleanup ).join("\\\\.(?:.*\\\\.)?") + "(\\\\.|$)");
			}

			eventType = events[ type ];

			if ( !eventType ) {
				continue;
			}

			if ( !handler ) {
				for ( j = 0; j < eventType.length; j++ ) {
					handleObj = eventType[ j ];

					if ( all || namespace.test( handleObj.namespace ) ) {
						jQuery.event.remove( elem, origType, handleObj.handler, j );
						eventType.splice( j--, 1 );
					}
				}

				continue;
			}

			special = jQuery.event.special[ type ] || {};

			for ( j = pos || 0; j < eventType.length; j++ ) {
				handleObj = eventType[ j ];

				if ( handler.guid === handleObj.guid ) {
					// remove the given handler for the given type
					if ( all || namespace.test( handleObj.namespace ) ) {
						if ( pos == null ) {
							eventType.splice( j--, 1 );
						}

						if ( special.remove ) {
							special.remove.call( elem, handleObj );
						}
					}

					if ( pos != null ) {
						break;
					}
				}
			}

			// remove generic event handler if no more handlers exist
			if ( eventType.length === 0 || pos != null && eventType.length === 1 ) {
				if ( !special.teardown || special.teardown.call( elem, namespaces ) === false ) {
					jQuery.removeEvent( elem, type, elemData.handle );
				}

				ret = null;
				delete events[ type ];
			}
		}

		// Remove the expando if it''s no longer used
		if ( jQuery.isEmptyObject( events ) ) {
			var handle = elemData.handle;
			if ( handle ) {
				handle.elem = null;
			}

			delete elemData.events;
			delete elemData.handle;

			if ( jQuery.isEmptyObject( elemData ) ) {
				jQuery.removeData( elem, undefined, true );
			}
		}
	},
	
	// Events that are safe to short-circuit if no handlers are attached.
	// Native DOM events should not be added, they may have inline handlers.
	customEvent: {
		"getData": true,
		"setData": true,
		"changeData": true
	},

	trigger: function( event, data, elem, onlyHandlers ) {
		// Event object or event type
		var type = event.type || event,
			namespaces = [],
			exclusive;

		if ( type.indexOf("!") >= 0 ) {
			// Exclusive events trigger only for the exact event (no namespaces)
			type = type.slice(0, -1);
			exclusive = true;
		}

		if ( type.indexOf(".") >= 0 ) {
			// Namespaced trigger; create a regexp to match event type in handle()
			namespaces = type.split(".");
			type = namespaces.shift();
			namespaces.sort();
		}

		if ( (!elem || jQuery.event.customEvent[ type ]) && !jQuery.event.global[ type ] ) {
			// No jQuery handlers for this event type, and it can''t have inline handlers
			return;
		}

		// Caller can pass in an Event, Object, or just an event type string
		event = typeof event === "object" ?
			// jQuery.Event object
			event[ jQuery.expando ] ? event :
			// Object literal
			new jQuery.Event( type, event ) :
			// Just the event type (string)
			new jQuery.Event( type );

		event.type = type;
		event.exclusive = exclusive;
		event.namespace = namespaces.join(".");
		event.namespace_re = new RegExp("(^|\\\\.)" + namespaces.join("\\\\.(?:.*\\\\.)?") + "(\\\\.|$)");
		
		// triggerHandler() and global events don''t bubble or run the default action
		if ( onlyHandlers || !elem ) {
			event.preventDefault();
			event.stopPropagation();
		}

		// Handle a global trigger
		if ( !elem ) {
			// TODO: Stop taunting the data cache; remove global events and always attach to document
			jQuery.each( jQuery.cache, function() {
				// internalKey variable is just used to make it easier to find
				// and potentially change this stuff later; currently it just
				// points to jQuery.expando
				var internalKey = jQuery.expando,
					internalCache = this[ internalKey ];
				if ( internalCache && internalCache.events && internalCache.events[ type ] ) {
					jQuery.event.trigger( event, data, internalCache.handle.elem );
				}
			});
			return;
		}

		// Don''t do events on text and comment nodes
		if ( elem.nodeType === 3 || elem.nodeType === 8 ) {
			return;
		}

		// Clean up the event in case it is being reused
		event.result = undefined;
		event.target = elem;

		// Clone any incoming data and prepend the event, creating the handler arg list
		data = data != null ? jQuery.makeArray( data ) : [];
		data.unshift( event );

		var cur = elem,
			// IE doesn''t like method names with a colon (#3533, #8272)
			ontype = type.indexOf(":") < 0 ? "on" + type : "";

		// Fire event on the current element, then bubble up the DOM tree
		do {
			var handle = jQuery._data( cur, "handle" );

			event.currentTarget = cur;
			if ( handle ) {
				handle.apply( cur, data );
			}

			// Trigger an inline bound script
			if ( ontype && jQuery.acceptData( cur ) && cur[ ontype ] && cur[ ontype ].apply( cur, data ) === false ) {
				event.result = false;
				event.preventDefault();
			}

			// Bubble up to document, then to window
			cur = cur.parentNode || cur.ownerDocument || cur === event.target.ownerDocument && window;
		} while ( cur && !event.isPropagationStopped() );

		// If nobody prevented the default action, do it now
		if ( !event.isDefaultPrevented() ) {
			var old,
				special = jQuery.event.special[ type ] || {};

			if ( (!special._default || special._default.call( elem.ownerDocument, event ) === false) &&
				!(type === "click" && jQuery.nodeName( elem, "a" )) && jQuery.acceptData( elem ) ) {

				// Call a native DOM method on the target with the same name name as the event.
				// Can''t use an .isFunction)() check here because IE6/7 fails that test.
				// IE<9 dies on focus to hidden element (#1486), may want to revisit a try/catch.
				try {
					if ( ontype && elem[ type ] ) {
						// Don''t re-trigger an onFOO event when we call its FOO() method
						old = elem[ ontype ];

						if ( old ) {
							elem[ ontype ] = null;
						}

						jQuery.event.triggered = type;
						elem[ type ]();
					}
				} catch ( ieError ) {}

				if ( old ) {
					elem[ ontype ] = old;
				}

				jQuery.event.triggered = undefined;
			}
		}
		
		return event.result;
	},

	handle: function( event ) {
		event = jQuery.event.fix( event || window.event );
		// Snapshot the handlers list since a called handler may add/remove events.
		var handlers = ((jQuery._data( this, "events" ) || {})[ event.type ] || []).slice(0),
			run_all = !event.exclusive && !event.namespace,
			args = Array.prototype.slice.call( arguments, 0 );

		// Use the fix-ed Event rather than the (read-only) native event
		args[0] = event;
		event.currentTarget = this;

		for ( var j = 0, l = handlers.length; j < l; j++ ) {
			var handleObj = handlers[ j ];

			// Triggered event must 1) be non-exclusive and have no namespace, or
			// 2) have namespace(s) a subset or equal to those in the bound event.
			if ( run_all || event.namespace_re.test( handleObj.namespace ) ) {
				// Pass in a reference to the handler function itself
				// So that we can later remove it
				event.handler = handleObj.handler;
				event.data = handleObj.data;
				event.handleObj = handleObj;

				var ret = handleObj.handler.apply( this, args );

				if ( ret !== undefined ) {
					event.result = ret;
					if ( ret === false ) {
						event.preventDefault();
						event.stopPropagation();
					}
				}

				if ( event.isImmediatePropagationStopped() ) {
					break;
				}
			}
		}
		return event.result;
	},

	props: "altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode layerX layerY metaKey newValue offsetX offsetY pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" "),

	fix: function( event ) {
		if ( event[ jQuery.expando ] ) {
			return event;
		}

		// store a copy of the original event object
		// and "clone" to set read-only properties
		var originalEvent = event;
		event = jQuery.Event( originalEvent );

		for ( var i = this.props.length, prop; i; ) {
			prop = this.props[ --i ];
			event[ prop ] = originalEvent[ prop ];
		}

		// Fix target property, if necessary
		if ( !event.target ) {
			// Fixes #1925 where srcElement might not be defined either
			event.target = event.srcElement || document;
		}

		// check if target is a textnode (safari)
		if ( event.target.nodeType === 3 ) {
			event.target = event.target.parentNode;
		}

		// Add relatedTarget, if necessary
		if ( !event.relatedTarget && event.fromElement ) {
			event.relatedTarget = event.fromElement === event.target ? event.toElement : event.fromElement;
		}

		// Calculate pageX/Y if missing and clientX/Y available
		if ( event.pageX == null && event.clientX != null ) {
			var eventDocument = event.target.ownerDocument || document,
				doc = eventDocument.documentElement,
				body = eventDocument.body;

			event.pageX = event.clientX + (doc && doc.scrollLeft || body && body.scrollLeft || 0) - (doc && doc.clientLeft || body && body.clientLeft || 0);
			event.pageY = event.clientY + (doc && doc.scrollTop  || body && body.scrollTop  || 0) - (doc && doc.clientTop  || body && body.clientTop  || 0);
		}

		// Add which for key events
		if ( event.which == null && (event.charCode != null || event.keyCode != null) ) {
			event.which = event.charCode != null ? event.charCode : event.keyCode;
		}

		// Add metaKey to non-Mac browsers (use ctrl for PC''s and Meta for Macs)
		if ( !event.metaKey && event.ctrlKey ) {
			event.metaKey = event.ctrlKey;
		}

		// Add which for click: 1 === left; 2 === middle; 3 === right
		// Note: button is not normalized, so don''t use it
		if ( !event.which && event.button !== undefined ) {
			event.which = (event.button & 1 ? 1 : ( event.button & 2 ? 3 : ( event.button & 4 ? 2 : 0 ) ));
		}

		return event;
	},

	// Deprecated, use jQuery.guid instead
	guid: 1E8,

	// Deprecated, use jQuery.proxy instead
	proxy: jQuery.proxy,

	special: {
		ready: {
			// Make sure the ready event is setup
			setup: jQuery.bindReady,
			teardown: jQuery.noop
		},

		live: {
			add: function( handleObj ) {
				jQuery.event.add( this,
					liveConvert( handleObj.origType, handleObj.selector ),
					jQuery.extend({}, handleObj, {handler: liveHandler, guid: handleObj.handler.guid}) );
			},

			remove: function( handleObj ) {
				jQuery.event.remove( this, liveConvert( handleObj.origType, handleObj.selector ), handleObj );
			}
		},

		beforeunload: {
			setup: function( data, namespaces, eventHandle ) {
				// We only want to do this special case on windows
				if ( jQuery.isWindow( this ) ) {
					this.onbeforeunload = eventHandle;
				}
			},

			teardown: function( namespaces, eventHandle ) {
				if ( this.onbeforeunload === eventHandle ) {
					this.onbeforeunload = null;
				}
			}
		}
	}
};

jQuery.removeEvent = document.removeEventListener ?
	function( elem, type, handle ) {
		if ( elem.removeEventListener ) {
			elem.removeEventListener( type, handle, false );
		}
	} :
	function( elem, type, handle ) {
		if ( elem.detachEvent ) {
			elem.detachEvent( "on" + type, handle );
		}
	};

jQuery.Event = function( src, props ) {
	// Allow instantiation without the ''new'' keyword
	if ( !this.preventDefault ) {
		return new jQuery.Event( src, props );
	}

	// Event object
	if ( src && src.type ) {
		this.originalEvent = src;
		this.type = src.type;

		// Events bubbling up the document may have been marked as prevented
		// by a handler lower down the tree; reflect the correct value.
		this.isDefaultPrevented = (src.defaultPrevented || src.returnValue === false ||
			src.getPreventDefault && src.getPreventDefault()) ? returnTrue : returnFalse;

	// Event type
	} else {
		this.type = src;
	}

	// Put explicitly provided properties onto the event object
	if ( props ) {
		jQuery.extend( this, props );
	}

	// timeStamp is buggy for some events on Firefox(#3843)
	// So we won''t rely on the native value
	this.timeStamp = jQuery.now();

	// Mark it as fixed
	this[ jQuery.expando ] = true;
};

function returnFalse() {
	return false;
}
function returnTrue() {
	return true;
}

// jQuery.Event is based on DOM3 Events as specified by the ECMAScript Language Binding
// http://www.w3.org/TR/2003/WD-DOM-Level-3-Events-20030331/ecma-script-binding.html
jQuery.Event.prototype = {
	preventDefault: function() {
		this.isDefaultPrevented = returnTrue;

		var e = this.originalEvent;
		if ( !e ) {
			return;
		}

		// if preventDefault exists run it on the original event
		if ( e.preventDefault ) {
			e.preventDefault();

		// otherwise set the returnValue property of the original event to false (IE)
		} else {
			e.returnValue = false;
		}
	},
	stopPropagation: function() {
		this.isPropagationStopped = returnTrue;

		var e = this.originalEvent;
		if ( !e ) {
			return;
		}
		// if stopPropagation exists run it on the original event
		if ( e.stopPropagation ) {
			e.stopPropagation();
		}
		// otherwise set the cancelBubble property of the original event to true (IE)
		e.cancelBubble = true;
	},
	stopImmediatePropagation: function() {
		this.isImmediatePropagationStopped = returnTrue;
		this.stopPropagation();
	},
	isDefaultPrevented: returnFalse,
	isPropagationStopped: returnFalse,
	isImmediatePropagationStopped: returnFalse
};

// Checks if an event happened on an element within another element
// Used in jQuery.event.special.mouseenter and mouseleave handlers
var withinElement = function( event ) {

	// Check if mouse(over|out) are still within the same parent element
	var related = event.relatedTarget,
		inside = false,
		eventType = event.type;

	event.type = event.data;

	if ( related !== this ) {

		if ( related ) {
			inside = jQuery.contains( this, related );
		}

		if ( !inside ) {

			jQuery.event.handle.apply( this, arguments );

			event.type = eventType;
		}
	}
},

// In case of event delegation, we only need to rename the event.type,
// liveHandler will take care of the rest.
delegate = function( event ) {
	event.type = event.data;
	jQuery.event.handle.apply( this, arguments );
};

// Create mouseenter and mouseleave events
jQuery.each({
	mouseenter: "mouseover",
	mouseleave: "mouseout"
}, function( orig, fix ) {
	jQuery.event.special[ orig ] = {
		setup: function( data ) {
			jQuery.event.add( this, fix, data && data.selector ? delegate : withinElement, orig );
		},
		teardown: function( data ) {
			jQuery.event.remove( this, fix, data && data.selector ? delegate : withinElement );
		}
	};
});

// submit delegation
if ( !jQuery.support.submitBubbles ) {

	jQuery.event.special.submit = {
		setup: function( data, namespaces ) {
			if ( !jQuery.nodeName( this, "form" ) ) {
				jQuery.event.add(this, "click.specialSubmit", function( e ) {
					var elem = e.target,
						type = elem.type;

					if ( (type === "submit" || type === "image") && jQuery( elem ).closest("form").length ) {
						trigger( "submit", this, arguments );
					}
				});

				jQuery.event.add(this, "keypress.specialSubmit", function( e ) {
					var elem = e.target,
						type = elem.type;

					if ( (type === "text" || type === "password") && jQuery( elem ).closest("form").length && e.keyCode === 13 ) {
						trigger( "submit", this, arguments );
					}
				});

			} else {
				return false;
			}
		},

		teardown: function( namespaces ) {
			jQuery.event.remove( this, ".specialSubmit" );
		}
	};

}

// change delegation, happens here so we have bind.
if ( !jQuery.support.changeBubbles ) {

	var changeFilters,

	getVal = function( elem ) {
		var type = elem.type, val = elem.value;

		if ( type === "radio" || type === "checkbox" ) {
			val = elem.checked;

		} else if ( type === "select-multiple" ) {
			val = elem.selectedIndex > -1 ?
				jQuery.map( elem.options, function( elem ) {
					return elem.selected;
				}).join("-") :
				"";

		} else if ( jQuery.nodeName( elem, "select" ) ) {
			val = elem.selectedIndex;
		}

		return val;
	},

	testChange = function testChange( e ) {
		var elem = e.target, data, val;

		if ( !rformElems.test( elem.nodeName ) || elem.readOnly ) {
			return;
		}

		data = jQuery._data( elem, "_change_data" );
		val = getVal(elem);

		// the current data will be also retrieved by beforeactivate
		if ( e.type !== "focusout" || elem.type !== "radio" ) {
			jQuery._data( elem, "_change_data", val );
		}

		if ( data === undefined || val === data ) {
			return;
		}

		if ( data != null || val ) {
			e.type = "change";
			e.liveFired = undefined;
			jQuery.event.trigger( e, arguments[1], elem );
		}
	};

	jQuery.event.special.change = {
		filters: {
			focusout: testChange,

			beforedeactivate: testChange,

			click: function( e ) {
				var elem = e.target, type = jQuery.nodeName( elem, "input" ) ? elem.type : "";

				if ( type === "radio" || type === "checkbox" || jQuery.nodeName( elem, "select" ) ) {
					testChange.call( this, e );
				}
			},

			// Change has to be called before submit
			// Keydown will be called before keypress, which is used in submit-event delegation
			keydown: function( e ) {
				var elem = e.target, type = jQuery.nodeName( elem, "input" ) ? elem.type : "";

				if ( (e.keyCode === 13 && !jQuery.nodeName( elem, "textarea" ) ) ||
					(e.keyCode === 32 && (type === "checkbox" || type === "radio")) ||
					type === "select-multiple" ) {
					testChange.call( this, e );
				}
			},

			// Beforeactivate happens also before the previous element is blurred
			// with this event you can''t trigger a change event, but you can store
			// information
			beforeactivate: function( e ) {
				var elem = e.target;
				jQuery._data( elem, "_change_data", getVal(elem) );
			}
		},

		setup: function( data, namespaces ) {
			if ( this.type === "file" ) {
				return false;
			}

			for ( var type in changeFilters ) {
				jQuery.event.add( this, type + ".specialChange", changeFilters[type] );
			}

			return rformElems.test( this.nodeName );
		},

		teardown: function( namespaces ) {
			jQuery.event.remove( this, ".specialChange" );

			return rformElems.test( this.nodeName );
		}
	};

	changeFilters = jQuery.event.special.change.filters;

	// Handle when the input is .focus()''d
	changeFilters.focus = changeFilters.beforeactivate;
}

function trigger( type, elem, args ) {
	// Piggyback on a donor event to simulate a different one.
	// Fake originalEvent to avoid donor''s stopPropagation, but if the
	// simulated event prevents default then we do the same on the donor.
	// Don''t pass args or remember liveFired; they apply to the donor event.
	var event = jQuery.extend( {}, args[ 0 ] );
	event.type = type;
	event.originalEvent = {};
	event.liveFired = undefined;
	jQuery.event.handle.call( elem, event );
	if ( event.isDefaultPrevented() ) {
		args[ 0 ].preventDefault();
	}
}

// Create "bubbling" focus and blur events
if ( !jQuery.support.focusinBubbles ) {
	jQuery.each({ focus: "focusin", blur: "focusout" }, function( orig, fix ) {

		// Attach a single capturing handler while someone wants focusin/focusout
		var attaches = 0;

		jQuery.event.special[ fix ] = {
			setup: function() {
				if ( attaches++ === 0 ) {
					document.addEventListener( orig, handler, true );
				}
			},
			teardown: function() {
				if ( --attaches === 0 ) {
					document.removeEventListener( orig, handler, true );
				}
			}
		};

		function handler( donor ) {
			// Donor event is always a native one; fix it and switch its type.
			// Let focusin/out handler cancel the donor focus/blur event.
			var e = jQuery.event.fix( donor );
			e.type = fix;
			e.originalEvent = {};
			jQuery.event.trigger( e, null, e.target );
			if ( e.isDefaultPrevented() ) {
				donor.preventDefault();
			}
		}
	});
}

jQuery.each(["bind", "one"], function( i, name ) {
	jQuery.fn[ name ] = function( type, data, fn ) {
		var handler;

		// Handle object literals
		if ( typeof type === "object" ) {
			for ( var key in type ) {
				this[ name ](key, data, type[key], fn);
			}
			return this;
		}

		if ( arguments.length === 2 || data === false ) {
			fn = data;
			data = undefined;
		}

		if ( name === "one" ) {
			handler = function( event ) {
				jQuery( this ).unbind( event, handler );
				return fn.apply( this, arguments );
			};
			handler.guid = fn.guid || jQuery.guid++;
		} else {
			handler = fn;
		}

		if ( type === "unload" && name !== "one" ) {
			this.one( type, data, fn );

		} else {
			for ( var i = 0, l = this.length; i < l; i++ ) {
				jQuery.event.add( this[i], type, handler, data );
			}
		}

		return this;
	};
});

jQuery.fn.extend({
	unbind: function( type, fn ) {
		// Handle object literals
		if ( typeof type === "object" && !type.preventDefault ) {
			for ( var key in type ) {
				this.unbind(key, type[key]);
			}

		} else {
			for ( var i = 0, l = this.length; i < l; i++ ) {
				jQuery.event.remove( this[i], type, fn );
			}
		}

		return this;
	},

	delegate: function( selector, types, data, fn ) {
		return this.live( types, data, fn, selector );
	},

	undelegate: function( selector, types, fn ) {
		if ( arguments.length === 0 ) {
			return this.unbind( "live" );

		} else {
			return this.die( types, null, fn, selector );
		}
	},

	trigger: function( type, data ) {
		return this.each(function() {
			jQuery.event.trigger( type, data, this );
		});
	},

	triggerHandler: function( type, data ) {
		if ( this[0] ) {
			return jQuery.event.trigger( type, data, this[0], true );
		}
	},

	toggle: function( fn ) {
		// Save reference to arguments for access in closure
		var args = arguments,
			guid = fn.guid || jQuery.guid++,
			i = 0,
			toggler = function( event ) {
				// Figure out which function to execute
				var lastToggle = ( jQuery.data( this, "lastToggle" + fn.guid ) || 0 ) % i;
				jQuery.data( this, "lastToggle" + fn.guid, lastToggle + 1 );

				// Make sure that clicks stop
				event.preventDefault();

				// and execute the function
				return args[ lastToggle ].apply( this, arguments ) || false;
			};

		// link all the functions, so any of them can unbind this click handler
		toggler.guid = guid;
		while ( i < args.length ) {
			args[ i++ ].guid = guid;
		}

		return this.click( toggler );
	},

	hover: function( fnOver, fnOut ) {
		return this.mouseenter( fnOver ).mouseleave( fnOut || fnOver );
	}
});

var liveMap = {
	focus: "focusin",
	blur: "focusout",
	mouseenter: "mouseover",
	mouseleave: "mouseout"
};

jQuery.each(["live", "die"], function( i, name ) {
	jQuery.fn[ name ] = function( types, data, fn, origSelector /* Internal Use Only */ ) {
		var type, i = 0, match, namespaces, preType,
			selector = origSelector || this.selector,
			context = origSelector ? this : jQuery( this.context );

		if ( typeof types === "object" && !types.preventDefault ) {
			for ( var key in types ) {
				context[ name ]( key, data, types[key], selector );
			}

			return this;
		}

		if ( name === "die" && !types &&
					origSelector && origSelector.charAt(0) === "." ) {

			context.unbind( origSelector );

			return this;
		}

		if ( data === false || jQuery.isFunction( data ) ) {
			fn = data || returnFalse;
			data = undefined;
		}

		types = (types || "").split(" ");

		while ( (type = types[ i++ ]) != null ) {
			match = rnamespaces.exec( type );
			namespaces = "";

			if ( match )  {
				namespaces = match[0];
				type = type.replace( rnamespaces, "" );
			}

			if ( type === "hover" ) {
				types.push( "mouseenter" + namespaces, "mouseleave" + namespaces );
				continue;
			}

			preType = type;

			if ( liveMap[ type ] ) {
				types.push( liveMap[ type ] + namespaces );
				type = type + namespaces;

			} else {
				type = (liveMap[ type ] || type) + namespaces;
			}

			if ( name === "live" ) {
				// bind live handler
				for ( var j = 0, l = context.length; j < l; j++ ) {
					jQuery.event.add( context[j], "live." + liveConvert( type, selector ),
						{ data: data, selector: selector, handler: fn, origType: type, origHandler: fn, preType: preType } );
				}

			} else {
				// unbind live handler
				context.unbind( "live." + liveConvert( type, selector ), fn );
			}
		}

		return this;
	};
});

function liveHandler( event ) {
	var stop, maxLevel, related, match, handleObj, elem, j, i, l, data, close, namespace, ret,
		elems = [],
		selectors = [],
		events = jQuery._data( this, "events" );

	// Make sure we avoid non-left-click bubbling in Firefox (#3861) and disabled elements in IE (#6911)
	if ( event.liveFired === this || !events || !events.live || event.target.disabled || event.button && event.type === "click" ) {
		return;
	}

	if ( event.namespace ) {
		namespace = new RegExp("(^|\\\\.)" + event.namespace.split(".").join("\\\\.(?:.*\\\\.)?") + "(\\\\.|$)");
	}

	event.liveFired = this;

	var live = events.live.slice(0);

	for ( j = 0; j < live.length; j++ ) {
		handleObj = live[j];

		if ( handleObj.origType.replace( rnamespaces, "" ) === event.type ) {
			selectors.push( handleObj.selector );

		} else {
			live.splice( j--, 1 );
		}
	}

	match = jQuery( event.target ).closest( selectors, event.currentTarget );

	for ( i = 0, l = match.length; i < l; i++ ) {
		close = match[i];

		for ( j = 0; j < live.length; j++ ) {
			handleObj = live[j];

			if ( close.selector === handleObj.selector && (!namespace || namespace.test( handleObj.namespace )) && !close.elem.disabled ) {
				elem = close.elem;
				related = null;

				// Those two events require additional checking
				if ( handleObj.preType === "mouseenter" || handleObj.preType === "mouseleave" ) {
					event.type = handleObj.preType;
					related = jQuery( event.relatedTarget ).closest( handleObj.selector )[0];

					// Make sure not to accidentally match a child element with the same selector
					if ( related && jQuery.contains( elem, related ) ) {
						related = elem;
					}
				}

				if ( !related || related !== elem ) {
					elems.push({ elem: elem, handleObj: handleObj, level: close.level });
				}
			}
		}
	}

	for ( i = 0, l = elems.length; i < l; i++ ) {
		match = elems[i];

		if ( maxLevel && match.level > maxLevel ) {
			break;
		}

		event.currentTarget = match.elem;
		event.data = match.handleObj.data;
		event.handleObj = match.handleObj;

		ret = match.handleObj.origHandler.apply( match.elem, arguments );

		if ( ret === false || event.isPropagationStopped() ) {
			maxLevel = match.level;

			if ( ret === false ) {
				stop = false;
			}
			if ( event.isImmediatePropagationStopped() ) {
				break;
			}
		}
	}

	return stop;
}

function liveConvert( type, selector ) {
	return (type && type !== "*" ? type + "." : "") + selector.replace(rperiod, "`").replace(rspaces, "&");
}

jQuery.each( ("blur focus focusin focusout load resize scroll unload click dblclick " +
	"mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave " +
	"change select submit keydown keypress keyup error").split(" "), function( i, name ) {

	// Handle event binding
	jQuery.fn[ name ] = function( data, fn ) {
		if ( fn == null ) {
			fn = data;
			data = null;
		}

		return arguments.length > 0 ?
			this.bind( name, data, fn ) :
			this.trigger( name );
	};

	if ( jQuery.attrFn ) {
		jQuery.attrFn[ name ] = true;
	}
});



/*!
 * Sizzle CSS Selector Engine
 *  Copyright 2011, The Dojo Foundation
 *  Released under the MIT, BSD, and GPL Licenses.
 *  More information: http://sizzlejs.com/
 */
(function(){

var chunker = /((?:\\((?:\\([^()]+\\)|[^()]+)+\\)|\\[(?:\\[[^\\[\\]]*\\]|[''"][^''"]*[''"]|[^\\[\\]''"]+)+\\]|\\\\.|[^ >+~,(\\[\\\\]+)+|[>+~])(\\s*,\\s*)?((?:.|\\r|\\n)*)/g,
	done = 0,
	toString = Object.prototype.toString,
	hasDuplicate = false,
	baseHasDuplicate = true,
	rBackslash = /\\\\/g,
	rNonWord = /\\W/;

// Here we check if the JavaScript engine is using some sort of
// optimization where it does not always call our comparision
// function. If that is the case, discard the hasDuplicate value.
//   Thus far that includes Google Chrome.
[0, 0].sort(function() {
	baseHasDuplicate = false;
	return 0;
});

var Sizzle = function( selector, context, results, seed ) {
	results = results || [];
	context = context || document;

	var origContext = context;

	if ( context.nodeType !== 1 && context.nodeType !== 9 ) {
		return [];
	}
	
	if ( !selector || typeof selector !== "string" ) {
		return results;
	}

	var m, set, checkSet, extra, ret, cur, pop, i,
		prune = true,
		contextXML = Sizzle.isXML( context ),
		parts = [],
		soFar = selector;
	
	// Reset the position of the chunker regexp (start from head)
	do {
		chunker.exec( "" );
		m = chunker.exec( soFar );

		if ( m ) {
			soFar = m[3];
		
			parts.push( m[1] );
		
			if ( m[2] ) {
				extra = m[3];
				break;
			}
		}
	} while ( m );

	if ( parts.length > 1 && origPOS.exec( selector ) ) {

		if ( parts.length === 2 && Expr.relative[ parts[0] ] ) {
			set = posProcess( parts[0] + parts[1], context );

		} else {
			set = Expr.relative[ parts[0] ] ?
				[ context ] :
				Sizzle( parts.shift(), context );

			while ( parts.length ) {
				selector = parts.shift();

				if ( Expr.relative[ selector ] ) {
					selector += parts.shift();
				}
				
				set = posProcess( selector, set );
			}
		}

	} else {
		// Take a shortcut and set the context if the root selector is an ID
		// (but not if it''ll be faster if the inner selector is an ID)
		if ( !seed && parts.length > 1 && context.nodeType === 9 && !contextXML &&
				Expr.match.ID.test(parts[0]) && !Expr.match.ID.test(parts[parts.length - 1]) ) {

			ret = Sizzle.find( parts.shift(), context, contextXML );
			context = ret.expr ?
				Sizzle.filter( ret.expr, ret.set )[0] :
				ret.set[0];
		}

		if ( context ) {
			ret = seed ?
				{ expr: parts.pop(), set: makeArray(seed) } :
				Sizzle.find( parts.pop(), parts.length === 1 && (parts[0] === "~" || parts[0] === "+") && context.parentNode ? context.parentNode : context, contextXML );

			set = ret.expr ?
				Sizzle.filter( ret.expr, ret.set ) :
				ret.set;

			if ( parts.length > 0 ) {
				checkSet = makeArray( set );

			} else {
				prune = false;
			}

			while ( parts.length ) {
				cur = parts.pop();
				pop = cur;

				if ( !Expr.relative[ cur ] ) {
					cur = "";
				} else {
					pop = parts.pop();
				}

				if ( pop == null ) {
					pop = context;
				}

				Expr.relative[ cur ]( checkSet, pop, contextXML );
			}

		} else {
			checkSet = parts = [];
		}
	}

	if ( !checkSet ) {
		checkSet = set;
	}

	if ( !checkSet ) {
		Sizzle.error( cur || selector );
	}

	if ( toString.call(checkSet) === "[object Array]" ) {
		if ( !prune ) {
			results.push.apply( results, checkSet );

		} else if ( context && context.nodeType === 1 ) {
			for ( i = 0; checkSet[i] != null; i++ ) {
				if ( checkSet[i] && (checkSet[i] === true || checkSet[i].nodeType === 1 && Sizzle.contains(context, checkSet[i])) ) {
					results.push( set[i] );
				}
			}

		} else {
			for ( i = 0; checkSet[i] != null; i++ ) {
				if ( checkSet[i] && checkSet[i].nodeType === 1 ) {
					results.push( set[i] );
				}
			}
		}

	} else {
		makeArray( checkSet, results );
	}

	if ( extra ) {
		Sizzle( extra, origContext, results, seed );
		Sizzle.uniqueSort( results );
	}

	return results;
};

Sizzle.uniqueSort = function( results ) {
	if ( sortOrder ) {
		hasDuplicate = baseHasDuplicate;
		results.sort( sortOrder );

		if ( hasDuplicate ) {
			for ( var i = 1; i < results.length; i++ ) {
				if ( results[i] === results[ i - 1 ] ) {
					results.splice( i--, 1 );
				}
			}
		}
	}

	return results;
};

Sizzle.matches = function( expr, set ) {
	return Sizzle( expr, null, null, set );
};

Sizzle.matchesSelector = function( node, expr ) {
	return Sizzle( expr, null, null, [node] ).length > 0;
};

Sizzle.find = function( expr, context, isXML ) {
	var set;

	if ( !expr ) {
		return [];
	}

	for ( var i = 0, l = Expr.order.length; i < l; i++ ) {
		var match,
			type = Expr.order[i];
		
		if ( (match = Expr.leftMatch[ type ].exec( expr )) ) {
			var left = match[1];
			match.splice( 1, 1 );

			if ( left.substr( left.length - 1 ) !== "\\\\" ) {
				match[1] = (match[1] || "").replace( rBackslash, "" );
				set = Expr.find[ type ]( match, context, isXML );

				if ( set != null ) {
					expr = expr.replace( Expr.match[ type ], "" );
					break;
				}
			}
		}
	}

	if ( !set ) {
		set = typeof context.getElementsByTagName !== "undefined" ?
			context.getElementsByTagName( "*" ) :
			[];
	}

	return { set: set, expr: expr };
};

Sizzle.filter = function( expr, set, inplace, not ) {
	var match, anyFound,
		old = expr,
		result = [],
		curLoop = set,
		isXMLFilter = set && set[0] && Sizzle.isXML( set[0] );

	while ( expr && set.length ) {
		for ( var type in Expr.filter ) {
			if ( (match = Expr.leftMatch[ type ].exec( expr )) != null && match[2] ) {
				var found, item,
					filter = Expr.filter[ type ],
					left = match[1];

				anyFound = false;

				match.splice(1,1);

				if ( left.substr( left.length - 1 ) === "\\\\" ) {
					continue;
				}

				if ( curLoop === result ) {
					result = [];
				}

				if ( Expr.preFilter[ type ] ) {
					match = Expr.preFilter[ type ]( match, curLoop, inplace, result, not, isXMLFilter );

					if ( !match ) {
						anyFound = found = true;

					} else if ( match === true ) {
						continue;
					}
				}

				if ( match ) {
					for ( var i = 0; (item = curLoop[i]) != null; i++ ) {
						if ( item ) {
							found = filter( item, match, i, curLoop );
							var pass = not ^ !!found;

							if ( inplace && found != null ) {
								if ( pass ) {
									anyFound = true;

								} else {
									curLoop[i] = false;
								}

							} else if ( pass ) {
								result.push( item );
								anyFound = true;
							}
						}
					}
				}

				if ( found !== undefined ) {
					if ( !inplace ) {
						curLoop = result;
					}

					expr = expr.replace( Expr.match[ type ], "" );

					if ( !anyFound ) {
						return [];
					}

					break;
				}
			}
		}

		// Improper expression
		if ( expr === old ) {
			if ( anyFound == null ) {
				Sizzle.error( expr );

			} else {
				break;
			}
		}

		old = expr;
	}

	return curLoop;
};

Sizzle.error = function( msg ) {
	throw "Syntax error, unrecognized expression: " + msg;
};

var Expr = Sizzle.selectors = {
	order: [ "ID", "NAME", "TAG" ],

	match: {
		ID: /#((?:[\\w\\u00c0-\\uFFFF\\-]|\\\\.)+)/,
		CLASS: /\\.((?:[\\w\\u00c0-\\uFFFF\\-]|\\\\.)+)/,
		NAME: /\\[name=[''"]*((?:[\\w\\u00c0-\\uFFFF\\-]|\\\\.)+)[''"]*\\]/,
		ATTR: /\\[\\s*((?:[\\w\\u00c0-\\uFFFF\\-]|\\\\.)+)\\s*(?:(\\S?=)\\s*(?:([''"])(.*?)\\3|(#?(?:[\\w\\u00c0-\\uFFFF\\-]|\\\\.)*)|)|)\\s*\\]/,
		TAG: /^((?:[\\w\\u00c0-\\uFFFF\\*\\-]|\\\\.)+)/,
		CHILD: /:(only|nth|last|first)-child(?:\\(\\s*(even|odd|(?:[+\\-]?\\d+|(?:[+\\-]?\\d*)?n\\s*(?:[+\\-]\\s*\\d+)?))\\s*\\))?/,
		POS: /:(nth|eq|gt|lt|first|last|even|odd)(?:\\((\\d*)\\))?(?=[^\\-]|$)/,
		PSEUDO: /:((?:[\\w\\u00c0-\\uFFFF\\-]|\\\\.)+)(?:\\(([''"]?)((?:\\([^\\)]+\\)|[^\\(\\)]*)+)\\2\\))?/
	},

	leftMatch: {},

	attrMap: {
		"class": "className",
		"for": "htmlFor"
	},

	attrHandle: {
		href: function( elem ) {
			return elem.getAttribute( "href" );
		},
		type: function( elem ) {
			return elem.getAttribute( "type" );
		}
	},

	relative: {
		"+": function(checkSet, part){
			var isPartStr = typeof part === "string",
				isTag = isPartStr && !rNonWord.test( part ),
				isPartStrNotTag = isPartStr && !isTag;

			if ( isTag ) {
				part = part.toLowerCase();
			}

			for ( var i = 0, l = checkSet.length, elem; i < l; i++ ) {
				if ( (elem = checkSet[i]) ) {
					while ( (elem = elem.previousSibling) && elem.nodeType !== 1 ) {}

					checkSet[i] = isPartStrNotTag || elem && elem.nodeName.toLowerCase() === part ?
						elem || false :
						elem === part;
				}
			}

			if ( isPartStrNotTag ) {
				Sizzle.filter( part, checkSet, true );
			}
		},

		">": function( checkSet, part ) {
			var elem,
				isPartStr = typeof part === "string",
				i = 0,
				l = checkSet.length;

			if ( isPartStr && !rNonWord.test( part ) ) {
				part = part.toLowerCase();

				for ( ; i < l; i++ ) {
					elem = checkSet[i];

					if ( elem ) {
						var parent = elem.parentNode;
						checkSet[i] = parent.nodeName.toLowerCase() === part ? parent : false;
					}
				}

			} else {
				for ( ; i < l; i++ ) {
					elem = checkSet[i];

					if ( elem ) {
						checkSet[i] = isPartStr ?
							elem.parentNode :
							elem.parentNode === part;
					}
				}

				if ( isPartStr ) {
					Sizzle.filter( part, checkSet, true );
				}
			}
		},

		"": function(checkSet, part, isXML){
			var nodeCheck,
				doneName = done++,
				checkFn = dirCheck;

			if ( typeof part === "string" && !rNonWord.test( part ) ) {
				part = part.toLowerCase();
				nodeCheck = part;
				checkFn = dirNodeCheck;
			}

			checkFn( "parentNode", part, doneName, checkSet, nodeCheck, isXML );
		},

		"~": function( checkSet, part, isXML ) {
			var nodeCheck,
				doneName = done++,
				checkFn = dirCheck;

			if ( typeof part === "string" && !rNonWord.test( part ) ) {
				part = part.toLowerCase();
				nodeCheck = part;
				checkFn = dirNodeCheck;
			}

			checkFn( "previousSibling", part, doneName, checkSet, nodeCheck, isXML );
		}
	},

	find: {
		ID: function( match, context, isXML ) {
			if ( typeof context.getElementById !== "undefined" && !isXML ) {
				var m = context.getElementById(match[1]);
				// Check parentNode to catch when Blackberry 4.6 returns
				// nodes that are no longer in the document #6963
				return m && m.parentNode ? [m] : [];
			}
		},

		NAME: function( match, context ) {
			if ( typeof context.getElementsByName !== "undefined" ) {
				var ret = [],
					results = context.getElementsByName( match[1] );

				for ( var i = 0, l = results.length; i < l; i++ ) {
					if ( results[i].getAttribute("name") === match[1] ) {
						ret.push( results[i] );
					}
				}

				return ret.length === 0 ? null : ret;
			}
		},

		TAG: function( match, context ) {
			if ( typeof context.getElementsByTagName !== "undefined" ) {
				return context.getElementsByTagName( match[1] );
			}
		}
	},
	preFilter: {
		CLASS: function( match, curLoop, inplace, result, not, isXML ) {
			match = " " + match[1].replace( rBackslash, "" ) + " ";

			if ( isXML ) {
				return match;
			}

			for ( var i = 0, elem; (elem = curLoop[i]) != null; i++ ) {
				if ( elem ) {
					if ( not ^ (elem.className && (" " + elem.className + " ").replace(/[\\t\\n\\r]/g, " ").indexOf(match) >= 0) ) {
						if ( !inplace ) {
							result.push( elem );
						}

					} else if ( inplace ) {
						curLoop[i] = false;
					}
				}
			}

			return false;
		},

		ID: function( match ) {
			return match[1].replace( rBackslash, "" );
		},

		TAG: function( match, curLoop ) {
			return match[1].replace( rBackslash, "" ).toLowerCase();
		},

		CHILD: function( match ) {
			if ( match[1] === "nth" ) {
				if ( !match[2] ) {
					Sizzle.error( match[0] );
				}

				match[2] = match[2].replace(/^\\+|\\s*/g, '''');

				// parse equations like ''even'', ''odd'', ''5'', ''2n'', ''3n+2'', ''4n-1'', ''-n+6''
				var test = /(-?)(\\d*)(?:n([+\\-]?\\d*))?/.exec(
					match[2] === "even" && "2n" || match[2] === "odd" && "2n+1" ||
					!/\\D/.test( match[2] ) && "0n+" + match[2] || match[2]);

				// calculate the numbers (first)n+(last) including if they are negative
				match[2] = (test[1] + (test[2] || 1)) - 0;
				match[3] = test[3] - 0;
			}
			else if ( match[2] ) {
				Sizzle.error( match[0] );
			}

			// TODO: Move to normal caching system
			match[0] = done++;

			return match;
		},

		ATTR: function( match, curLoop, inplace, result, not, isXML ) {
			var name = match[1] = match[1].replace( rBackslash, "" );
			
			if ( !isXML && Expr.attrMap[name] ) {
				match[1] = Expr.attrMap[name];
			}

			// Handle if an un-quoted value was used
			match[4] = ( match[4] || match[5] || "" ).replace( rBackslash, "" );

			if ( match[2] === "~=" ) {
				match[4] = " " + match[4] + " ";
			}

			return match;
		},

		PSEUDO: function( match, curLoop, inplace, result, not ) {
			if ( match[1] === "not" ) {
				// If we''re dealing with a complex expression, or a simple one
				if ( ( chunker.exec(match[3]) || "" ).length > 1 || /^\\w/.test(match[3]) ) {
					match[3] = Sizzle(match[3], null, null, curLoop);

				} else {
					var ret = Sizzle.filter(match[3], curLoop, inplace, true ^ not);

					if ( !inplace ) {
						result.push.apply( result, ret );
					}

					return false;
				}

			} else if ( Expr.match.POS.test( match[0] ) || Expr.match.CHILD.test( match[0] ) ) {
				return true;
			}
			
			return match;
		},

		POS: function( match ) {
			match.unshift( true );

			return match;
		}
	},
	
	filters: {
		enabled: function( elem ) {
			return elem.disabled === false && elem.type !== "hidden";
		},

		disabled: function( elem ) {
			return elem.disabled === true;
		},

		checked: function( elem ) {
			return elem.checked === true;
		},
		
		selected: function( elem ) {
			// Accessing this property makes selected-by-default
			// options in Safari work properly
			if ( elem.parentNode ) {
				elem.parentNode.selectedIndex;
			}
			
			return elem.selected === true;
		},

		parent: function( elem ) {
			return !!elem.firstChild;
		},

		empty: function( elem ) {
			return !elem.firstChild;
		},

		has: function( elem, i, match ) {
			return !!Sizzle( match[3], elem ).length;
		},

		header: function( elem ) {
			return (/h\\d/i).test( elem.nodeName );
		},

		text: function( elem ) {
			var attr = elem.getAttribute( "type" ), type = elem.type;
			// IE6 and 7 will map elem.type to ''text'' for new HTML5 types (search, etc) 
			// use getAttribute instead to test this case
			return elem.nodeName.toLowerCase() === "input" && "text" === type && ( attr === type || attr === null );
		},

		radio: function( elem ) {
			return elem.nodeName.toLowerCase() === "input" && "radio" === elem.type;
		},

		checkbox: function( elem ) {
			return elem.nodeName.toLowerCase() === "input" && "checkbox" === elem.type;
		},

		file: function( elem ) {
			return elem.nodeName.toLowerCase() === "input" && "file" === elem.type;
		},

		password: function( elem ) {
			return elem.nodeName.toLowerCase() === "input" && "password" === elem.type;
		},

		submit: function( elem ) {
			var name = elem.nodeName.toLowerCase();
			return (name === "input" || name === "button") && "submit" === elem.type;
		},

		image: function( elem ) {
			return elem.nodeName.toLowerCase() === "input" && "image" === elem.type;
		},

		reset: function( elem ) {
			var name = elem.nodeName.toLowerCase();
			return (name === "input" || name === "button") && "reset" === elem.type;
		},

		button: function( elem ) {
			var name = elem.nodeName.toLowerCase();
			return name === "input" && "button" === elem.type || name === "button";
		},

		input: function( elem ) {
			return (/input|select|textarea|button/i).test( elem.nodeName );
		},

		focus: function( elem ) {
			return elem === elem.ownerDocument.activeElement;
		}
	},
	setFilters: {
		first: function( elem, i ) {
			return i === 0;
		},

		last: function( elem, i, match, array ) {
			return i === array.length - 1;
		},

		even: function( elem, i ) {
			return i % 2 === 0;
		},

		odd: function( elem, i ) {
			return i % 2 === 1;
		},

		lt: function( elem, i, match ) {
			return i < match[3] - 0;
		},

		gt: function( elem, i, match ) {
			return i > match[3] - 0;
		},

		nth: function( elem, i, match ) {
			return match[3] - 0 === i;
		},

		eq: function( elem, i, match ) {
			return match[3] - 0 === i;
		}
	},
	filter: {
		PSEUDO: function( elem, match, i, array ) {
			var name = match[1],
				filter = Expr.filters[ name ];

			if ( filter ) {
				return filter( elem, i, match, array );

			} else if ( name === "contains" ) {
				return (elem.textContent || elem.innerText || Sizzle.getText([ elem ]) || "").indexOf(match[3]) >= 0;

			} else if ( name === "not" ) {
				var not = match[3];

				for ( var j = 0, l = not.length; j < l; j++ ) {
					if ( not[j] === elem ) {
						return false;
					}
				}

				return true;

			} else {
				Sizzle.error( name );
			}
		},

		CHILD: function( elem, match ) {
			var type = match[1],
				node = elem;

			switch ( type ) {
				case "only":
				case "first":
					while ( (node = node.previousSibling) )	 {
						if ( node.nodeType === 1 ) { 
							return false; 
						}
					}

					if ( type === "first" ) { 
						return true; 
					}

					node = elem;

				case "last":
					while ( (node = node.nextSibling) )	 {
						if ( node.nodeType === 1 ) { 
							return false; 
						}
					}

					return true;

				case "nth":
					var first = match[2],
						last = match[3];

					if ( first === 1 && last === 0 ) {
						return true;
					}
					
					var doneName = match[0],
						parent = elem.parentNode;
	
					if ( parent && (parent.sizcache !== doneName || !elem.nodeIndex) ) {
						var count = 0;
						
						for ( node = parent.firstChild; node; node = node.nextSibling ) {
							if ( node.nodeType === 1 ) {
								node.nodeIndex = ++count;
							}
						} 

						parent.sizcache = doneName;
					}
					
					var diff = elem.nodeIndex - last;

					if ( first === 0 ) {
						return diff === 0;

					} else {
						return ( diff % first === 0 && diff / first >= 0 );
					}
			}
		},

		ID: function( elem, match ) {
			return elem.nodeType === 1 && elem.getAttribute("id") === match;
		},

		TAG: function( elem, match ) {
			return (match === "*" && elem.nodeType === 1) || elem.nodeName.toLowerCase() === match;
		},
		
		CLASS: function( elem, match ) {
			return (" " + (elem.className || elem.getAttribute("class")) + " ")
				.indexOf( match ) > -1;
		},

		ATTR: function( elem, match ) {
			var name = match[1],
				result = Expr.attrHandle[ name ] ?
					Expr.attrHandle[ name ]( elem ) :
					elem[ name ] != null ?
						elem[ name ] :
						elem.getAttribute( name ),
				value = result + "",
				type = match[2],
				check = match[4];

			return result == null ?
				type === "!=" :
				type === "=" ?
				value === check :
				type === "*=" ?
				value.indexOf(check) >= 0 :
				type === "~=" ?
				(" " + value + " ").indexOf(check) >= 0 :
				!check ?
				value && result !== false :
				type === "!=" ?
				value !== check :
				type === "^=" ?
				value.indexOf(check) === 0 :
				type === "$=" ?
				value.substr(value.length - check.length) === check :
				type === "|=" ?
				value === check || value.substr(0, check.length + 1) === check + "-" :
				false;
		},

		POS: function( elem, match, i, array ) {
			var name = match[2],
				filter = Expr.setFilters[ name ];

			if ( filter ) {
				return filter( elem, i, match, array );
			}
		}
	}
};

var origPOS = Expr.match.POS,
	fescape = function(all, num){
		return "\\\\" + (num - 0 + 1);
	};

for ( var type in Expr.match ) {
	Expr.match[ type ] = new RegExp( Expr.match[ type ].source + (/(?![^\\[]*\\])(?![^\\(]*\\))/.source) );
	Expr.leftMatch[ type ] = new RegExp( /(^(?:.|\\r|\\n)*?)/.source + Expr.match[ type ].source.replace(/\\\\(\\d+)/g, fescape) );
}

var makeArray = function( array, results ) {
	array = Array.prototype.slice.call( array, 0 );

	if ( results ) {
		results.push.apply( results, array );
		return results;
	}
	
	return array;
};

// Perform a simple check to determine if the browser is capable of
// converting a NodeList to an array using builtin methods.
// Also verifies that the returned array holds DOM nodes
// (which is not the case in the Blackberry browser)
try {
	Array.prototype.slice.call( document.documentElement.childNodes, 0 )[0].nodeType;

// Provide a fallback method if it does not work
} catch( e ) {
	makeArray = function( array, results ) {
		var i = 0,
			ret = results || [];

		if ( toString.call(array) === "[object Array]" ) {
			Array.prototype.push.apply( ret, array );

		} else {
			if ( typeof array.length === "number" ) {
				for ( var l = array.length; i < l; i++ ) {
					ret.push( array[i] );
				}

			} else {
				for ( ; array[i]; i++ ) {
					ret.push( array[i] );
				}
			}
		}

		return ret;
	};
}

var sortOrder, siblingCheck;

if ( document.documentElement.compareDocumentPosition ) {
	sortOrder = function( a, b ) {
		if ( a === b ) {
			hasDuplicate = true;
			return 0;
		}

		if ( !a.compareDocumentPosition || !b.compareDocumentPosition ) {
			return a.compareDocumentPosition ? -1 : 1;
		}

		return a.compareDocumentPosition(b) & 4 ? -1 : 1;
	};

} else {
	sortOrder = function( a, b ) {
		// The nodes are identical, we can exit early
		if ( a === b ) {
			hasDuplicate = true;
			return 0;

		// Fallback to using sourceIndex (in IE) if it''s available on both nodes
		} else if ( a.sourceIndex && b.sourceIndex ) {
			return a.sourceIndex - b.sourceIndex;
		}

		var al, bl,
			ap = [],
			bp = [],
			aup = a.parentNode,
			bup = b.parentNode,
			cur = aup;

		// If the nodes are siblings (or identical) we can do a quick check
		if ( aup === bup ) {
			return siblingCheck( a, b );

		// If no parents were found then the nodes are disconnected
		} else if ( !aup ) {
			return -1;

		} else if ( !bup ) {
			return 1;
		}

		// Otherwise they''re somewhere else in the tree so we need
		// to build up a full list of the parentNodes for comparison
		while ( cur ) {
			ap.unshift( cur );
			cur = cur.parentNode;
		}

		cur = bup;

		while ( cur ) {
			bp.unshift( cur );
			cur = cur.parentNode;
		}

		al = ap.length;
		bl = bp.length;

		// Start walking down the tree looking for a discrepancy
		for ( var i = 0; i < al && i < bl; i++ ) {
			if ( ap[i] !== bp[i] ) {
				return siblingCheck( ap[i], bp[i] );
			}
		}

		// We ended someplace up the tree so do a sibling check
		return i === al ?
			siblingCheck( a, bp[i], -1 ) :
			siblingCheck( ap[i], b, 1 );
	};

	siblingCheck = function( a, b, ret ) {
		if ( a === b ) {
			return ret;
		}

		var cur = a.nextSibling;

		while ( cur ) {
			if ( cur === b ) {
				return -1;
			}

			cur = cur.nextSibling;
		}

		return 1;
	};
}

// Utility function for retreiving the text value of an array of DOM nodes
Sizzle.getText = function( elems ) {
	var ret = "", elem;

	for ( var i = 0; elems[i]; i++ ) {
		elem = elems[i];

		// Get the text from text nodes and CDATA nodes
		if ( elem.nodeType === 3 || elem.nodeType === 4 ) {
			ret += elem.nodeValue;

		// Traverse everything else, except comment nodes
		} else if ( elem.nodeType !== 8 ) {
			ret += Sizzle.getText( elem.childNodes );
		}
	}

	return ret;
};

// Check to see if the browser returns elements by name when
// querying by getElementById (and provide a workaround)
(function(){
	// We''re going to inject a fake input element with a specified name
	var form = document.createElement("div"),
		id = "script" + (new Date()).getTime(),
		root = document.documentElement;

	form.innerHTML = "<a name=''" + id + "''/>";

	// Inject it into the root element, check its status, and remove it quickly
	root.insertBefore( form, root.firstChild );

	// The workaround has to do additional checks after a getElementById
	// Which slows things down for other browsers (hence the branching)
	if ( document.getElementById( id ) ) {
		Expr.find.ID = function( match, context, isXML ) {
			if ( typeof context.getElementById !== "undefined" && !isXML ) {
				var m = context.getElementById(match[1]);

				return m ?
					m.id === match[1] || typeof m.getAttributeNode !== "undefined" && m.getAttributeNode("id").nodeValue === match[1] ?
						[m] :
						undefined :
					[];
			}
		};

		Expr.filter.ID = function( elem, match ) {
			var node = typeof elem.getAttributeNode !== "undefined" && elem.getAttributeNode("id");

			return elem.nodeType === 1 && node && node.nodeValue === match;
		};
	}

	root.removeChild( form );

	// release memory in IE
	root = form = null;
})();

(function(){
	// Check to see if the browser returns only elements
	// when doing getElementsByTagName("*")

	// Create a fake element
	var div = document.createElement("div");
	div.appendChild( document.createComment("") );

	// Make sure no comments are found
	if ( div.getElementsByTagName("*").length > 0 ) {
		Expr.find.TAG = function( match, context ) {
			var results = context.getElementsByTagName( match[1] );

			// Filter out possible comments
			if ( match[1] === "*" ) {
				var tmp = [];

				for ( var i = 0; results[i]; i++ ) {
					if ( results[i].nodeType === 1 ) {
						tmp.push( results[i] );
					}
				}

				results = tmp;
			}

			return results;
		};
	}

	// Check to see if an attribute returns normalized href attributes
	div.innerHTML = "<a href=''#''></a>";

	if ( div.firstChild && typeof div.firstChild.getAttribute !== "undefined" &&
			div.firstChild.getAttribute("href") !== "#" ) {

		Expr.attrHandle.href = function( elem ) {
			return elem.getAttribute( "href", 2 );
		};
	}

	// release memory in IE
	div = null;
})();

if ( document.querySelectorAll ) {
	(function(){
		var oldSizzle = Sizzle,
			div = document.createElement("div"),
			id = "__sizzle__";

		div.innerHTML = "<p class=''TEST''></p>";

		// Safari can''t handle uppercase or unicode characters when
		// in quirks mode.
		if ( div.querySelectorAll && div.querySelectorAll(".TEST").length === 0 ) {
			return;
		}
	
		Sizzle = function( query, context, extra, seed ) {
			context = context || document;

			// Only use querySelectorAll on non-XML documents
			// (ID selectors don''t work in non-HTML documents)
			if ( !seed && !Sizzle.isXML(context) ) {
				// See if we find a selector to speed up
				var match = /^(\\w+$)|^\\.([\\w\\-]+$)|^#([\\w\\-]+$)/.exec( query );
				
				if ( match && (context.nodeType === 1 || context.nodeType === 9) ) {
					// Speed-up: Sizzle("TAG")
					if ( match[1] ) {
						return makeArray( context.getElementsByTagName( query ), extra );
					
					// Speed-up: Sizzle(".CLASS")
					} else if ( match[2] && Expr.find.CLASS && context.getElementsByClassName ) {
						return makeArray( context.getElementsByClassName( match[2] ), extra );
					}
				}
				
				if ( context.nodeType === 9 ) {
					// Speed-up: Sizzle("body")
					// The body element only exists once, optimize finding it
					if ( query === "body" && context.body ) {
						return makeArray( [ context.body ], extra );
						
					// Speed-up: Sizzle("#ID")
					} else if ( match && match[3] ) {
						var elem = context.getElementById( match[3] );

						// Check parentNode to catch when Blackberry 4.6 returns
						// nodes that are no longer in the document #6963
						if ( elem && elem.parentNode ) {
							// Handle the case where IE and Opera return items
							// by name instead of ID
							if ( elem.id === match[3] ) {
								return makeArray( [ elem ], extra );
							}
							
						} else {
							return makeArray( [], extra );
						}
					}
					
					try {
						return makeArray( context.querySelectorAll(query), extra );
					} catch(qsaError) {}

				// qSA works strangely on Element-rooted queries
				// We can work around this by specifying an extra ID on the root
				// and working up from there (Thanks to Andrew Dupont for the technique)
				// IE 8 doesn''t work on object elements
				} else if ( context.nodeType === 1 && context.nodeName.toLowerCase() !== "object" ) {
					var oldContext = context,
						old = context.getAttribute( "id" ),
						nid = old || id,
						hasParent = context.parentNode,
						relativeHierarchySelector = /^\\s*[+~]/.test( query );

					if ( !old ) {
						context.setAttribute( "id", nid );
					} else {
						nid = nid.replace( /''/g, "\\\\$&" );
					}
					if ( relativeHierarchySelector && hasParent ) {
						context = context.parentNode;
					}

					try {
						if ( !relativeHierarchySelector || hasParent ) {
							return makeArray( context.querySelectorAll( "[id=''" + nid + "''] " + query ), extra );
						}

					} catch(pseudoError) {
					} finally {
						if ( !old ) {
							oldContext.removeAttribute( "id" );
						}
					}
				}
			}
		
			return oldSizzle(query, context, extra, seed);
		};

		for ( var prop in oldSizzle ) {
			Sizzle[ prop ] = oldSizzle[ prop ];
		}

		// release memory in IE
		div = null;
	})();
}

(function(){
	var html = document.documentElement,
		matches = html.matchesSelector || html.mozMatchesSelector || html.webkitMatchesSelector || html.msMatchesSelector;

	if ( matches ) {
		// Check to see if it''s possible to do matchesSelector
		// on a disconnected node (IE 9 fails this)
		var disconnectedMatch = !matches.call( document.createElement( "div" ), "div" ),
			pseudoWorks = false;

		try {
			// This should fail with an exception
			// Gecko does not error, returns false instead
			matches.call( document.documentElement, "[test!='''']:sizzle" );
	
		} catch( pseudoError ) {
			pseudoWorks = true;
		}

		Sizzle.matchesSelector = function( node, expr ) {
			// Make sure that attribute selectors are quoted
			expr = expr.replace(/\\=\\s*([^''"\\]]*)\\s*\\]/g, "=''$1'']");

			if ( !Sizzle.isXML( node ) ) {
				try { 
					if ( pseudoWorks || !Expr.match.PSEUDO.test( expr ) && !/!=/.test( expr ) ) {
						var ret = matches.call( node, expr );

						// IE 9''s matchesSelector returns false on disconnected nodes
						if ( ret || !disconnectedMatch ||
								// As well, disconnected nodes are said to be in a document
								// fragment in IE 9, so check for that
								node.document && node.document.nodeType !== 11 ) {
							return ret;
						}
					}
				} catch(e) {}
			}

			return Sizzle(expr, null, null, [node]).length > 0;
		};
	}
})();

(function(){
	var div = document.createElement("div");

	div.innerHTML = "<div class=''test e''></div><div class=''test''></div>";

	// Opera can''t find a second classname (in 9.6)
	// Also, make sure that getElementsByClassName actually exists
	if ( !div.getElementsByClassName || div.getElementsByClassName("e").length === 0 ) {
		return;
	}

	// Safari caches class attributes, doesn''t catch changes (in 3.2)
	div.lastChild.className = "e";

	if ( div.getElementsByClassName("e").length === 1 ) {
		return;
	}
	
	Expr.order.splice(1, 0, "CLASS");
	Expr.find.CLASS = function( match, context, isXML ) {
		if ( typeof context.getElementsByClassName !== "undefined" && !isXML ) {
			return context.getElementsByClassName(match[1]);
		}
	};

	// release memory in IE
	div = null;
})();

function dirNodeCheck( dir, cur, doneName, checkSet, nodeCheck, isXML ) {
	for ( var i = 0, l = checkSet.length; i < l; i++ ) {
		var elem = checkSet[i];

		if ( elem ) {
			var match = false;

			elem = elem[dir];

			while ( elem ) {
				if ( elem.sizcache === doneName ) {
					match = checkSet[elem.sizset];
					break;
				}

				if ( elem.nodeType === 1 && !isXML ){
					elem.sizcache = doneName;
					elem.sizset = i;
				}

				if ( elem.nodeName.toLowerCase() === cur ) {
					match = elem;
					break;
				}

				elem = elem[dir];
			}

			checkSet[i] = match;
		}
	}
}

function dirCheck( dir, cur, doneName, checkSet, nodeCheck, isXML ) {
	for ( var i = 0, l = checkSet.length; i < l; i++ ) {
		var elem = checkSet[i];

		if ( elem ) {
			var match = false;
			
			elem = elem[dir];

			while ( elem ) {
				if ( elem.sizcache === doneName ) {
					match = checkSet[elem.sizset];
					break;
				}

				if ( elem.nodeType === 1 ) {
					if ( !isXML ) {
						elem.sizcache = doneName;
						elem.sizset = i;
					}

					if ( typeof cur !== "string" ) {
						if ( elem === cur ) {
							match = true;
							break;
						}

					} else if ( Sizzle.filter( cur, [elem] ).length > 0 ) {
						match = elem;
						break;
					}
				}

				elem = elem[dir];
			}

			checkSet[i] = match;
		}
	}
}

if ( document.documentElement.contains ) {
	Sizzle.contains = function( a, b ) {
		return a !== b && (a.contains ? a.contains(b) : true);
	};

} else if ( document.documentElement.compareDocumentPosition ) {
	Sizzle.contains = function( a, b ) {
		return !!(a.compareDocumentPosition(b) & 16);
	};

} else {
	Sizzle.contains = function() {
		return false;
	};
}

Sizzle.isXML = function( elem ) {
	// documentElement is verified for cases where it doesn''t yet exist
	// (such as loading iframes in IE - #4833) 
	var documentElement = (elem ? elem.ownerDocument || elem : 0).documentElement;

	return documentElement ? documentElement.nodeName !== "HTML" : false;
};

var posProcess = function( selector, context ) {
	var match,
		tmpSet = [],
		later = "",
		root = context.nodeType ? [context] : context;

	// Position selectors must be done after the filter
	// And so must :not(positional) so we move all PSEUDOs to the end
	while ( (match = Expr.match.PSEUDO.exec( selector )) ) {
		later += match[0];
		selector = selector.replace( Expr.match.PSEUDO, "" );
	}

	selector = Expr.relative[selector] ? selector + "*" : selector;

	for ( var i = 0, l = root.length; i < l; i++ ) {
		Sizzle( selector, root[i], tmpSet );
	}

	return Sizzle.filter( later, tmpSet );
};

// EXPOSE
jQuery.find = Sizzle;
jQuery.expr = Sizzle.selectors;
jQuery.expr[":"] = jQuery.expr.filters;
jQuery.unique = Sizzle.uniqueSort;
jQuery.text = Sizzle.getText;
jQuery.isXMLDoc = Sizzle.isXML;
jQuery.contains = Sizzle.contains;


})();


var runtil = /Until$/,
	rparentsprev = /^(?:parents|prevUntil|prevAll)/,
	// Note: This RegExp should be improved, or likely pulled from Sizzle
	rmultiselector = /,/,
	isSimple = /^.[^:#\\[\\.,]*$/,
	slice = Array.prototype.slice,
	POS = jQuery.expr.match.POS,
	// methods guaranteed to produce a unique set when starting from a unique set
	guaranteedUnique = {
		children: true,
		contents: true,
		next: true,
		prev: true
	};

jQuery.fn.extend({
	find: function( selector ) {
		var self = this,
			i, l;

		if ( typeof selector !== "string" ) {
			return jQuery( selector ).filter(function() {
				for ( i = 0, l = self.length; i < l; i++ ) {
					if ( jQuery.contains( self[ i ], this ) ) {
						return true;
					}
				}
			});
		}

		var ret = this.pushStack( "", "find", selector ),
			length, n, r;

		for ( i = 0, l = this.length; i < l; i++ ) {
			length = ret.length;
			jQuery.find( selector, this[i], ret );

			if ( i > 0 ) {
				// Make sure that the results are unique
				for ( n = length; n < ret.length; n++ ) {
					for ( r = 0; r < length; r++ ) {
						if ( ret[r] === ret[n] ) {
							ret.splice(n--, 1);
							break;
						}
					}
				}
			}
		}

		return ret;
	},

	has: function( target ) {
		var targets = jQuery( target );
		return this.filter(function() {
			for ( var i = 0, l = targets.length; i < l; i++ ) {
				if ( jQuery.contains( this, targets[i] ) ) {
					return true;
				}
			}
		});
	},

	not: function( selector ) {
		return this.pushStack( winnow(this, selector, false), "not", selector);
	},

	filter: function( selector ) {
		return this.pushStack( winnow(this, selector, true), "filter", selector );
	},

	is: function( selector ) {
		return !!selector && ( typeof selector === "string" ?
			jQuery.filter( selector, this ).length > 0 :
			this.filter( selector ).length > 0 );
	},

	closest: function( selectors, context ) {
		var ret = [], i, l, cur = this[0];
		
		// Array
		if ( jQuery.isArray( selectors ) ) {
			var match, selector,
				matches = {},
				level = 1;

			if ( cur && selectors.length ) {
				for ( i = 0, l = selectors.length; i < l; i++ ) {
					selector = selectors[i];

					if ( !matches[ selector ] ) {
						matches[ selector ] = POS.test( selector ) ?
							jQuery( selector, context || this.context ) :
							selector;
					}
				}

				while ( cur && cur.ownerDocument && cur !== context ) {
					for ( selector in matches ) {
						match = matches[ selector ];

						if ( match.jquery ? match.index( cur ) > -1 : jQuery( cur ).is( match ) ) {
							ret.push({ selector: selector, elem: cur, level: level });
						}
					}

					cur = cur.parentNode;
					level++;
				}
			}

			return ret;
		}

		// String
		var pos = POS.test( selectors ) || typeof selectors !== "string" ?
				jQuery( selectors, context || this.context ) :
				0;

		for ( i = 0, l = this.length; i < l; i++ ) {
			cur = this[i];

			while ( cur ) {
				if ( pos ? pos.index(cur) > -1 : jQuery.find.matchesSelector(cur, selectors) ) {
					ret.push( cur );
					break;

				} else {
					cur = cur.parentNode;
					if ( !cur || !cur.ownerDocument || cur === context || cur.nodeType === 11 ) {
						break;
					}
				}
			}
		}

		ret = ret.length > 1 ? jQuery.unique( ret ) : ret;

		return this.pushStack( ret, "closest", selectors );
	},

	// Determine the position of an element within
	// the matched set of elements
	index: function( elem ) {
		if ( !elem || typeof elem === "string" ) {
			return jQuery.inArray( this[0],
				// If it receives a string, the selector is used
				// If it receives nothing, the siblings are used
				elem ? jQuery( elem ) : this.parent().children() );
		}
		// Locate the position of the desired element
		return jQuery.inArray(
			// If it receives a jQuery object, the first element is used
			elem.jquery ? elem[0] : elem, this );
	},

	add: function( selector, context ) {
		var set = typeof selector === "string" ?
				jQuery( selector, context ) :
				jQuery.makeArray( selector && selector.nodeType ? [ selector ] : selector ),
			all = jQuery.merge( this.get(), set );

		return this.pushStack( isDisconnected( set[0] ) || isDisconnected( all[0] ) ?
			all :
			jQuery.unique( all ) );
	},

	andSelf: function() {
		return this.add( this.prevObject );
	}
});

// A painfully simple check to see if an element is disconnected
// from a document (should be improved, where feasible).
function isDisconnected( node ) {
	return !node || !node.parentNode || node.parentNode.nodeType === 11;
}

jQuery.each({
	parent: function( elem ) {
		var parent = elem.parentNode;
		return parent && parent.nodeType !== 11 ? parent : null;
	},
	parents: function( elem ) {
		return jQuery.dir( elem, "parentNode" );
	},
	parentsUntil: function( elem, i, until ) {
		return jQuery.dir( elem, "parentNode", until );
	},
	next: function( elem ) {
		return jQuery.nth( elem, 2, "nextSibling" );
	},
	prev: function( elem ) {
		return jQuery.nth( elem, 2, "previousSibling" );
	},
	nextAll: function( elem ) {
		return jQuery.dir( elem, "nextSibling" );
	},
	prevAll: function( elem ) {
		return jQuery.dir( elem, "previousSibling" );
	},
	nextUntil: function( elem, i, until ) {
		return jQuery.dir( elem, "nextSibling", until );
	},
	prevUntil: function( elem, i, until ) {
		return jQuery.dir( elem, "previousSibling", until );
	},
	siblings: function( elem ) {
		return jQuery.sibling( elem.parentNode.firstChild, elem );
	},
	children: function( elem ) {
		return jQuery.sibling( elem.firstChild );
	},
	contents: function( elem ) {
		return jQuery.nodeName( elem, "iframe" ) ?
			elem.contentDocument || elem.contentWindow.document :
			jQuery.makeArray( elem.childNodes );
	}
}, function( name, fn ) {
	jQuery.fn[ name ] = function( until, selector ) {
		var ret = jQuery.map( this, fn, until ),
			// The variable ''args'' was introduced in
			// https://github.com/jquery/jquery/commit/52a0238
			// to work around a bug in Chrome 10 (Dev) and should be removed when the bug is fixed.
			// http://code.google.com/p/v8/issues/detail?id=1050
			args = slice.call(arguments);

		if ( !runtil.test( name ) ) {
			selector = until;
		}

		if ( selector && typeof selector === "string" ) {
			ret = jQuery.filter( selector, ret );
		}

		ret = this.length > 1 && !guaranteedUnique[ name ] ? jQuery.unique( ret ) : ret;

		if ( (this.length > 1 || rmultiselector.test( selector )) && rparentsprev.test( name ) ) {
			ret = ret.reverse();
		}

		return this.pushStack( ret, name, args.join(",") );
	};
});

jQuery.extend({
	filter: function( expr, elems, not ) {
		if ( not ) {
			expr = ":not(" + expr + ")";
		}

		return elems.length === 1 ?
			jQuery.find.matchesSelector(elems[0], expr) ? [ elems[0] ] : [] :
			jQuery.find.matches(expr, elems);
	},

	dir: function( elem, dir, until ) {
		var matched = [],
			cur = elem[ dir ];

		while ( cur && cur.nodeType !== 9 && (until === undefined || cur.nodeType !== 1 || !jQuery( cur ).is( until )) ) {
			if ( cur.nodeType === 1 ) {
				matched.push( cur );
			}
			cur = cur[dir];
		}
		return matched;
	},

	nth: function( cur, result, dir, elem ) {
		result = result || 1;
		var num = 0;

		for ( ; cur; cur = cur[dir] ) {
			if ( cur.nodeType === 1 && ++num === result ) {
				break;
			}
		}

		return cur;
	},

	sibling: function( n, elem ) {
		var r = [];

		for ( ; n; n = n.nextSibling ) {
			if ( n.nodeType === 1 && n !== elem ) {
				r.push( n );
			}
		}

		return r;
	}
});

// Implement the identical functionality for filter and not
function winnow( elements, qualifier, keep ) {

	// Can''t pass null or undefined to indexOf in Firefox 4
	// Set to 0 to skip string check
	qualifier = qualifier || 0;

	if ( jQuery.isFunction( qualifier ) ) {
		return jQuery.grep(elements, function( elem, i ) {
			var retVal = !!qualifier.call( elem, i, elem );
			return retVal === keep;
		});

	} else if ( qualifier.nodeType ) {
		return jQuery.grep(elements, function( elem, i ) {
			return (elem === qualifier) === keep;
		});

	} else if ( typeof qualifier === "string" ) {
		var filtered = jQuery.grep(elements, function( elem ) {
			return elem.nodeType === 1;
		});

		if ( isSimple.test( qualifier ) ) {
			return jQuery.filter(qualifier, filtered, !keep);
		} else {
			qualifier = jQuery.filter( qualifier, filtered );
		}
	}

	return jQuery.grep(elements, function( elem, i ) {
		return (jQuery.inArray( elem, qualifier ) >= 0) === keep;
	});
}




var rinlinejQuery = / jQuery\\d+="(?:\\d+|null)"/g,
	rleadingWhitespace = /^\\s+/,
	rxhtmlTag = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\\w:]+)[^>]*)\\/>/ig,
	rtagName = /<([\\w:]+)/,
	rtbody = /<tbody/i,
	rhtml = /<|&#?\\w+;/,
	rnocache = /<(?:script|object|embed|option|style)/i,
	// checked="checked" or checked
	rchecked = /checked\\s*(?:[^=]|=\\s*.checked.)/i,
	rscriptType = /\\/(java|ecma)script/i,
	rcleanScript = /^\\s*<!(?:\\[CDATA\\[|\\-\\-)/,
	wrapMap = {
		option: [ 1, "<select multiple=''multiple''>", "</select>" ],
		legend: [ 1, "<fieldset>", "</fieldset>" ],
		thead: [ 1, "<table>", "</table>" ],
		tr: [ 2, "<table><tbody>", "</tbody></table>" ],
		td: [ 3, "<table><tbody><tr>", "</tr></tbody></table>" ],
		col: [ 2, "<table><tbody></tbody><colgroup>", "</colgroup></table>" ],
		area: [ 1, "<map>", "</map>" ],
		_default: [ 0, "", "" ]
	};

wrapMap.optgroup = wrapMap.option;
wrapMap.tbody = wrapMap.tfoot = wrapMap.colgroup = wrapMap.caption = wrapMap.thead;
wrapMap.th = wrapMap.td;

// IE can''t serialize <link> and <script> tags normally
if ( !jQuery.support.htmlSerialize ) {
	wrapMap._default = [ 1, "div<div>", "</div>" ];
}

jQuery.fn.extend({
	text: function( text ) {
		if ( jQuery.isFunction(text) ) {
			return this.each(function(i) {
				var self = jQuery( this );

				self.text( text.call(this, i, self.text()) );
			});
		}

		if ( typeof text !== "object" && text !== undefined ) {
			return this.empty().append( (this[0] && this[0].ownerDocument || document).createTextNode( text ) );
		}

		return jQuery.text( this );
	},

	wrapAll: function( html ) {
		if ( jQuery.isFunction( html ) ) {
			return this.each(function(i) {
				jQuery(this).wrapAll( html.call(this, i) );
			});
		}

		if ( this[0] ) {
			// The elements to wrap the target around
			var wrap = jQuery( html, this[0].ownerDocument ).eq(0).clone(true);

			if ( this[0].parentNode ) {
				wrap.insertBefore( this[0] );
			}

			wrap.map(function() {
				var elem = this;

				while ( elem.firstChild && elem.firstChild.nodeType === 1 ) {
					elem = elem.firstChild;
				}

				return elem;
			}).append( this );
		}

		return this;
	},

	wrapInner: function( html ) {
		if ( jQuery.isFunction( html ) ) {
			return this.each(function(i) {
				jQuery(this).wrapInner( html.call(this, i) );
			});
		}

		return this.each(function() {
			var self = jQuery( this ),
				contents = self.contents();

			if ( contents.length ) {
				contents.wrapAll( html );

			} else {
				self.append( html );
			}
		});
	},

	wrap: function( html ) {
		return this.each(function() {
			jQuery( this ).wrapAll( html );
		});
	},

	unwrap: function() {
		return this.parent().each(function() {
			if ( !jQuery.nodeName( this, "body" ) ) {
				jQuery( this ).replaceWith( this.childNodes );
			}
		}).end();
	},

	append: function() {
		return this.domManip(arguments, true, function( elem ) {
			if ( this.nodeType === 1 ) {
				this.appendChild( elem );
			}
		});
	},

	prepend: function() {
		return this.domManip(arguments, true, function( elem ) {
			if ( this.nodeType === 1 ) {
				this.insertBefore( elem, this.firstChild );
			}
		});
	},

	before: function() {
		if ( this[0] && this[0].parentNode ) {
			return this.domManip(arguments, false, function( elem ) {
				this.parentNode.insertBefore( elem, this );
			});
		} else if ( arguments.length ) {
			var set = jQuery(arguments[0]);
			set.push.apply( set, this.toArray() );
			return this.pushStack( set, "before", arguments );
		}
	},

	after: function() {
		if ( this[0] && this[0].parentNode ) {
			return this.domManip(arguments, false, function( elem ) {
				this.parentNode.insertBefore( elem, this.nextSibling );
			});
		} else if ( arguments.length ) {
			var set = this.pushStack( this, "after", arguments );
			set.push.apply( set, jQuery(arguments[0]).toArray() );
			return set;
		}
	},

	// keepData is for internal use only--do not document
	remove: function( selector, keepData ) {
		for ( var i = 0, elem; (elem = this[i]) != null; i++ ) {
			if ( !selector || jQuery.filter( selector, [ elem ] ).length ) {
				if ( !keepData && elem.nodeType === 1 ) {
					jQuery.cleanData( elem.getElementsByTagName("*") );
					jQuery.cleanData( [ elem ] );
				}

				if ( elem.parentNode ) {
					elem.parentNode.removeChild( elem );
				}
			}
		}

		return this;
	},

	empty: function() {
		for ( var i = 0, elem; (elem = this[i]) != null; i++ ) {
			// Remove element nodes and prevent memory leaks
			if ( elem.nodeType === 1 ) {
				jQuery.cleanData( elem.getElementsByTagName("*") );
			}

			// Remove any remaining nodes
			while ( elem.firstChild ) {
				elem.removeChild( elem.firstChild );
			}
		}

		return this;
	},

	clone: function( dataAndEvents, deepDataAndEvents ) {
		dataAndEvents = dataAndEvents == null ? false : dataAndEvents;
		deepDataAndEvents = deepDataAndEvents == null ? dataAndEvents : deepDataAndEvents;

		return this.map( function () {
			return jQuery.clone( this, dataAndEvents, deepDataAndEvents );
		});
	},

	html: function( value ) {
		if ( value === undefined ) {
			return this[0] && this[0].nodeType === 1 ?
				this[0].innerHTML.replace(rinlinejQuery, "") :
				null;

		// See if we can take a shortcut and just use innerHTML
		} else if ( typeof value === "string" && !rnocache.test( value ) &&
			(jQuery.support.leadingWhitespace || !rleadingWhitespace.test( value )) &&
			!wrapMap[ (rtagName.exec( value ) || ["", ""])[1].toLowerCase() ] ) {

			value = value.replace(rxhtmlTag, "<$1></$2>");

			try {
				for ( var i = 0, l = this.length; i < l; i++ ) {
					// Remove element nodes and prevent memory leaks
					if ( this[i].nodeType === 1 ) {
						jQuery.cleanData( this[i].getElementsByTagName("*") );
						this[i].innerHTML = value;
					}
				}

			// If using innerHTML throws an exception, use the fallback method
			} catch(e) {
				this.empty().append( value );
			}

		} else if ( jQuery.isFunction( value ) ) {
			this.each(function(i){
				var self = jQuery( this );

				self.html( value.call(this, i, self.html()) );
			});

		} else {
			this.empty().append( value );
		}

		return this;
	},

	replaceWith: function( value ) {
		if ( this[0] && this[0].parentNode ) {
			// Make sure that the elements are removed from the DOM before they are inserted
			// this can help fix replacing a parent with child elements
			if ( jQuery.isFunction( value ) ) {
				return this.each(function(i) {
					var self = jQuery(this), old = self.html();
					self.replaceWith( value.call( this, i, old ) );
				});
			}

			if ( typeof value !== "string" ) {
				value = jQuery( value ).detach();
			}

			return this.each(function() {
				var next = this.nextSibling,
					parent = this.parentNode;

				jQuery( this ).remove();

				if ( next ) {
					jQuery(next).before( value );
				} else {
					jQuery(parent).append( value );
				}
			});
		} else {
			return this.length ?
				this.pushStack( jQuery(jQuery.isFunction(value) ? value() : value), "replaceWith", value ) :
				this;
		}
	},

	detach: function( selector ) {
		return this.remove( selector, true );
	},

	domManip: function( args, table, callback ) {
		var results, first, fragment, parent,
			value = args[0],
			scripts = [];

		// We can''t cloneNode fragments that contain checked, in WebKit
		if ( !jQuery.support.checkClone && arguments.length === 3 && typeof value === "string" && rchecked.test( value ) ) {
			return this.each(function() {
				jQuery(this).domManip( args, table, callback, true );
			});
		}

		if ( jQuery.isFunction(value) ) {
			return this.each(function(i) {
				var self = jQuery(this);
				args[0] = value.call(this, i, table ? self.html() : undefined);
				self.domManip( args, table, callback );
			});
		}

		if ( this[0] ) {
			parent = value && value.parentNode;

			// If we''re in a fragment, just use that instead of building a new one
			if ( jQuery.support.parentNode && parent && parent.nodeType === 11 && parent.childNodes.length === this.length ) {
				results = { fragment: parent };

			} else {
				results = jQuery.buildFragment( args, this, scripts );
			}

			fragment = results.fragment;

			if ( fragment.childNodes.length === 1 ) {
				first = fragment = fragment.firstChild;
			} else {
				first = fragment.firstChild;
			}

			if ( first ) {
				table = table && jQuery.nodeName( first, "tr" );

				for ( var i = 0, l = this.length, lastIndex = l - 1; i < l; i++ ) {
					callback.call(
						table ?
							root(this[i], first) :
							this[i],
						// Make sure that we do not leak memory by inadvertently discarding
						// the original fragment (which might have attached data) instead of
						// using it; in addition, use the original fragment object for the last
						// item instead of first because it can end up being emptied incorrectly
						// in certain situations (Bug #8070).
						// Fragments from the fragment cache must always be cloned and never used
						// in place.
						results.cacheable || (l > 1 && i < lastIndex) ?
							jQuery.clone( fragment, true, true ) :
							fragment
					);
				}
			}

			if ( scripts.length ) {
				jQuery.each( scripts, evalScript );
			}
		}

		return this;
	}
});

function root( elem, cur ) {
	return jQuery.nodeName(elem, "table") ?
		(elem.getElementsByTagName("tbody")[0] ||
		elem.appendChild(elem.ownerDocument.createElement("tbody"))) :
		elem;
}

function cloneCopyEvent( src, dest ) {

	if ( dest.nodeType !== 1 || !jQuery.hasData( src ) ) {
		return;
	}

	var internalKey = jQuery.expando,
		oldData = jQuery.data( src ),
		curData = jQuery.data( dest, oldData );

	// Switch to use the internal data object, if it exists, for the next
	// stage of data copying
	if ( (oldData = oldData[ internalKey ]) ) {
		var events = oldData.events;
				curData = curData[ internalKey ] = jQuery.extend({}, oldData);

		if ( events ) {
			delete curData.handle;
			curData.events = {};

			for ( var type in events ) {
				for ( var i = 0, l = events[ type ].length; i < l; i++ ) {
					jQuery.event.add( dest, type + ( events[ type ][ i ].namespace ? "." : "" ) + events[ type ][ i ].namespace, events[ type ][ i ], events[ type ][ i ].data );
				}
			}
		}
	}
}

function cloneFixAttributes( src, dest ) {
	var nodeName;

	// We do not need to do anything for non-Elements
	if ( dest.nodeType !== 1 ) {
		return;
	}

	// clearAttributes removes the attributes, which we don''t want,
	// but also removes the attachEvent events, which we *do* want
	if ( dest.clearAttributes ) {
		dest.clearAttributes();
	}

	// mergeAttributes, in contrast, only merges back on the
	// original attributes, not the events
	if ( dest.mergeAttributes ) {
		dest.mergeAttributes( src );
	}

	nodeName = dest.nodeName.toLowerCase();

	// IE6-8 fail to clone children inside object elements that use
	// the proprietary classid attribute value (rather than the type
	// attribute) to identify the type of content to display
	if ( nodeName === "object" ) {
		dest.outerHTML = src.outerHTML;

	} else if ( nodeName === "input" && (src.type === "checkbox" || src.type === "radio") ) {
		// IE6-8 fails to persist the checked state of a cloned checkbox
		// or radio button. Worse, IE6-7 fail to give the cloned element
		// a checked appearance if the defaultChecked value isn''t also set
		if ( src.checked ) {
			dest.defaultChecked = dest.checked = src.checked;
		}

		// IE6-7 get confused and end up setting the value of a cloned
		// checkbox/radio button to an empty string instead of "on"
		if ( dest.value !== src.value ) {
			dest.value = src.value;
		}

	// IE6-8 fails to return the selected option to the default selected
	// state when cloning options
	} else if ( nodeName === "option" ) {
		dest.selected = src.defaultSelected;

	// IE6-8 fails to set the defaultValue to the correct value when
	// cloning other types of input fields
	} else if ( nodeName === "input" || nodeName === "textarea" ) {
		dest.defaultValue = src.defaultValue;
	}

	// Event data gets referenced instead of copied if the expando
	// gets copied too
	dest.removeAttribute( jQuery.expando );
}

jQuery.buildFragment = function( args, nodes, scripts ) {
	var fragment, cacheable, cacheresults, doc;

  // nodes may contain either an explicit document object,
  // a jQuery collection or context object.
  // If nodes[0] contains a valid object to assign to doc
  if ( nodes && nodes[0] ) {
    doc = nodes[0].ownerDocument || nodes[0];
  }

  // Ensure that an attr object doesn''t incorrectly stand in as a document object
	// Chrome and Firefox seem to allow this to occur and will throw exception
	// Fixes #8950
	if ( !doc.createDocumentFragment ) {
		doc = document;
	}

	// Only cache "small" (1/2 KB) HTML strings that are associated with the main document
	// Cloning options loses the selected state, so don''t cache them
	// IE 6 doesn''t like it when you put <object> or <embed> elements in a fragment
	// Also, WebKit does not clone ''checked'' attributes on cloneNode, so don''t cache
	if ( args.length === 1 && typeof args[0] === "string" && args[0].length < 512 && doc === document &&
		args[0].charAt(0) === "<" && !rnocache.test( args[0] ) && (jQuery.support.checkClone || !rchecked.test( args[0] )) ) {

		cacheable = true;

		cacheresults = jQuery.fragments[ args[0] ];
		if ( cacheresults && cacheresults !== 1 ) {
			fragment = cacheresults;
		}
	}

	if ( !fragment ) {
		fragment = doc.createDocumentFragment();
		jQuery.clean( args, doc, fragment, scripts );
	}

	if ( cacheable ) {
		jQuery.fragments[ args[0] ] = cacheresults ? fragment : 1;
	}

	return { fragment: fragment, cacheable: cacheable };
};

jQuery.fragments = {};

jQuery.each({
	appendTo: "append",
	prependTo: "prepend",
	insertBefore: "before",
	insertAfter: "after",
	replaceAll: "replaceWith"
}, function( name, original ) {
	jQuery.fn[ name ] = function( selector ) {
		var ret = [],
			insert = jQuery( selector ),
			parent = this.length === 1 && this[0].parentNode;

		if ( parent && parent.nodeType === 11 && parent.childNodes.length === 1 && insert.length === 1 ) {
			insert[ original ]( this[0] );
			return this;

		} else {
			for ( var i = 0, l = insert.length; i < l; i++ ) {
				var elems = (i > 0 ? this.clone(true) : this).get();
				jQuery( insert[i] )[ original ]( elems );
				ret = ret.concat( elems );
			}

			return this.pushStack( ret, name, insert.selector );
		}
	};
});

function getAll( elem ) {
	if ( "getElementsByTagName" in elem ) {
		return elem.getElementsByTagName( "*" );

	} else if ( "querySelectorAll" in elem ) {
		return elem.querySelectorAll( "*" );

	} else {
		return [];
	}
}

// Used in clean, fixes the defaultChecked property
function fixDefaultChecked( elem ) {
	if ( elem.type === "checkbox" || elem.type === "radio" ) {
		elem.defaultChecked = elem.checked;
	}
}
// Finds all inputs and passes them to fixDefaultChecked
function findInputs( elem ) {
	if ( jQuery.nodeName( elem, "input" ) ) {
		fixDefaultChecked( elem );
	} else if ( "getElementsByTagName" in elem ) {
		jQuery.grep( elem.getElementsByTagName("input"), fixDefaultChecked );
	}
}

jQuery.extend({
	clone: function( elem, dataAndEvents, deepDataAndEvents ) {
		var clone = elem.cloneNode(true),
				srcElements,
				destElements,
				i;

		if ( (!jQuery.support.noCloneEvent || !jQuery.support.noCloneChecked) &&
				(elem.nodeType === 1 || elem.nodeType === 11) && !jQuery.isXMLDoc(elem) ) {
			// IE copies events bound via attachEvent when using cloneNode.
			// Calling detachEvent on the clone will also remove the events
			// from the original. In order to get around this, we use some
			// proprietary methods to clear the events. Thanks to MooTools
			// guys for this hotness.

			cloneFixAttributes( elem, clone );

			// Using Sizzle here is crazy slow, so we use getElementsByTagName
			// instead
			srcElements = getAll( elem );
			destElements = getAll( clone );

			// Weird iteration because IE will replace the length property
			// with an element if you are cloning the body and one of the
			// elements on the page has a name or id of "length"
			for ( i = 0; srcElements[i]; ++i ) {
				cloneFixAttributes( srcElements[i], destElements[i] );
			}
		}

		// Copy the events from the original to the clone
		if ( dataAndEvents ) {
			cloneCopyEvent( elem, clone );

			if ( deepDataAndEvents ) {
				srcElements = getAll( elem );
				destElements = getAll( clone );

				for ( i = 0; srcElements[i]; ++i ) {
					cloneCopyEvent( srcElements[i], destElements[i] );
				}
			}
		}

		srcElements = destElements = null;

		// Return the cloned set
		return clone;
	},

	clean: function( elems, context, fragment, scripts ) {
		var checkScriptType;

		context = context || document;

		// !context.createElement fails in IE with an error but returns typeof ''object''
		if ( typeof context.createElement === "undefined" ) {
			context = context.ownerDocument || context[0] && context[0].ownerDocument || document;
		}

		var ret = [], j;

		for ( var i = 0, elem; (elem = elems[i]) != null; i++ ) {
			if ( typeof elem === "number" ) {
				elem += "";
			}

			if ( !elem ) {
				continue;
			}

			// Convert html string into DOM nodes
			if ( typeof elem === "string" ) {
				if ( !rhtml.test( elem ) ) {
					elem = context.createTextNode( elem );
				} else {
					// Fix "XHTML"-style tags in all browsers
					elem = elem.replace(rxhtmlTag, "<$1></$2>");

					// Trim whitespace, otherwise indexOf won''t work as expected
					var tag = (rtagName.exec( elem ) || ["", ""])[1].toLowerCase(),
						wrap = wrapMap[ tag ] || wrapMap._default,
						depth = wrap[0],
						div = context.createElement("div");

					// Go to html and back, then peel off extra wrappers
					div.innerHTML = wrap[1] + elem + wrap[2];

					// Move to the right depth
					while ( depth-- ) {
						div = div.lastChild;
					}

					// Remove IE''s autoinserted <tbody> from table fragments
					if ( !jQuery.support.tbody ) {

						// String was a <table>, *may* have spurious <tbody>
						var hasBody = rtbody.test(elem),
							tbody = tag === "table" && !hasBody ?
								div.firstChild && div.firstChild.childNodes :

								// String was a bare <thead> or <tfoot>
								wrap[1] === "<table>" && !hasBody ?
									div.childNodes :
									[];

						for ( j = tbody.length - 1; j >= 0 ; --j ) {
							if ( jQuery.nodeName( tbody[ j ], "tbody" ) && !tbody[ j ].childNodes.length ) {
								tbody[ j ].parentNode.removeChild( tbody[ j ] );
							}
						}
					}

					// IE completely kills leading whitespace when innerHTML is used
					if ( !jQuery.support.leadingWhitespace && rleadingWhitespace.test( elem ) ) {
						div.insertBefore( context.createTextNode( rleadingWhitespace.exec(elem)[0] ), div.firstChild );
					}

					elem = div.childNodes;
				}
			}

			// Resets defaultChecked for any radios and checkboxes
			// about to be appended to the DOM in IE 6/7 (#8060)
			var len;
			if ( !jQuery.support.appendChecked ) {
				if ( elem[0] && typeof (len = elem.length) === "number" ) {
					for ( j = 0; j < len; j++ ) {
						findInputs( elem[j] );
					}
				} else {
					findInputs( elem );
				}
			}

			if ( elem.nodeType ) {
				ret.push( elem );
			} else {
				ret = jQuery.merge( ret, elem );
			}
		}

		if ( fragment ) {
			checkScriptType = function( elem ) {
				return !elem.type || rscriptType.test( elem.type );
			};
			for ( i = 0; ret[i]; i++ ) {
				if ( scripts && jQuery.nodeName( ret[i], "script" ) && (!ret[i].type || ret[i].type.toLowerCase() === "text/javascript") ) {
					scripts.push( ret[i].parentNode ? ret[i].parentNode.removeChild( ret[i] ) : ret[i] );

				} else {
					if ( ret[i].nodeType === 1 ) {
						var jsTags = jQuery.grep( ret[i].getElementsByTagName( "script" ), checkScriptType );

						ret.splice.apply( ret, [i + 1, 0].concat( jsTags ) );
					}
					fragment.appendChild( ret[i] );
				}
			}
		}

		return ret;
	},

	cleanData: function( elems ) {
		var data, id, cache = jQuery.cache, internalKey = jQuery.expando, special = jQuery.event.special,
			deleteExpando = jQuery.support.deleteExpando;

		for ( var i = 0, elem; (elem = elems[i]) != null; i++ ) {
			if ( elem.nodeName && jQuery.noData[elem.nodeName.toLowerCase()] ) {
				continue;
			}

			id = elem[ jQuery.expando ];

			if ( id ) {
				data = cache[ id ] && cache[ id ][ internalKey ];

				if ( data && data.events ) {
					for ( var type in data.events ) {
						if ( special[ type ] ) {
							jQuery.event.remove( elem, type );

						// This is a shortcut to avoid jQuery.event.remove''s overhead
						} else {
							jQuery.removeEvent( elem, type, data.handle );
						}
					}

					// Null the DOM reference to avoid IE6/7/8 leak (#7054)
					if ( data.handle ) {
						data.handle.elem = null;
					}
				}

				if ( deleteExpando ) {
					delete elem[ jQuery.expando ];

				} else if ( elem.removeAttribute ) {
					elem.removeAttribute( jQuery.expando );
				}

				delete cache[ id ];
			}
		}
	}
});

function evalScript( i, elem ) {
	if ( elem.src ) {
		jQuery.ajax({
			url: elem.src,
			async: false,
			dataType: "script"
		});
	} else {
		jQuery.globalEval( ( elem.text || elem.textContent || elem.innerHTML || "" ).replace( rcleanScript, "/*$0*/" ) );
	}

	if ( elem.parentNode ) {
		elem.parentNode.removeChild( elem );
	}
}



var ralpha = /alpha\\([^)]*\\)/i,
	ropacity = /opacity=([^)]*)/,
	// fixed for IE9, see #8346
	rupper = /([A-Z]|^ms)/g,
	rnumpx = /^-?\\d+(?:px)?$/i,
	rnum = /^-?\\d/,
	rrelNum = /^[+\\-]=/,
	rrelNumFilter = /[^+\\-\\.\\de]+/g,

	cssShow = { position: "absolute", visibility: "hidden", display: "block" },
	cssWidth = [ "Left", "Right" ],
	cssHeight = [ "Top", "Bottom" ],
	curCSS,

	getComputedStyle,
	currentStyle;

jQuery.fn.css = function( name, value ) {
	// Setting ''undefined'' is a no-op
	if ( arguments.length === 2 && value === undefined ) {
		return this;
	}

	return jQuery.access( this, name, value, true, function( elem, name, value ) {
		return value !== undefined ?
			jQuery.style( elem, name, value ) :
			jQuery.css( elem, name );
	});
};

jQuery.extend({
	// Add in style property hooks for overriding the default
	// behavior of getting and setting a style property
	cssHooks: {
		opacity: {
			get: function( elem, computed ) {
				if ( computed ) {
					// We should always get a number back from opacity
					var ret = curCSS( elem, "opacity", "opacity" );
					return ret === "" ? "1" : ret;

				} else {
					return elem.style.opacity;
				}
			}
		}
	},

	// Exclude the following css properties to add px
	cssNumber: {
		"fillOpacity": true,
		"fontWeight": true,
		"lineHeight": true,
		"opacity": true,
		"orphans": true,
		"widows": true,
		"zIndex": true,
		"zoom": true
	},

	// Add in properties whose names you wish to fix before
	// setting or getting the value
	cssProps: {
		// normalize float css property
		"float": jQuery.support.cssFloat ? "cssFloat" : "styleFloat"
	},

	// Get and set the style property on a DOM Node
	style: function( elem, name, value, extra ) {
		// Don''t set styles on text and comment nodes
		if ( !elem || elem.nodeType === 3 || elem.nodeType === 8 || !elem.style ) {
			return;
		}

		// Make sure that we''re working with the right name
		var ret, type, origName = jQuery.camelCase( name ),
			style = elem.style, hooks = jQuery.cssHooks[ origName ];

		name = jQuery.cssProps[ origName ] || origName;

		// Check if we''re setting a value
		if ( value !== undefined ) {
			type = typeof value;

			// Make sure that NaN and null values aren''t set. See: #7116
			if ( type === "number" && isNaN( value ) || value == null ) {
				return;
			}

			// convert relative number strings (+= or -=) to relative numbers. #7345
			if ( type === "string" && rrelNum.test( value ) ) {
				value = +value.replace( rrelNumFilter, "" ) + parseFloat( jQuery.css( elem, name ) );
				// Fixes bug #9237
				type = "number";
			}

			// If a number was passed in, add ''px'' to the (except for certain CSS properties)
			if ( type === "number" && !jQuery.cssNumber[ origName ] ) {
				value += "px";
			}

			// If a hook was provided, use that value, otherwise just set the specified value
			if ( !hooks || !("set" in hooks) || (value = hooks.set( elem, value )) !== undefined ) {
				// Wrapped to prevent IE from throwing errors when ''invalid'' values are provided
				// Fixes bug #5509
				try {
					style[ name ] = value;
				} catch(e) {}
			}

		} else {
			// If a hook was provided get the non-computed value from there
			if ( hooks && "get" in hooks && (ret = hooks.get( elem, false, extra )) !== undefined ) {
				return ret;
			}

			// Otherwise just get the value from the style object
			return style[ name ];
		}
	},

	css: function( elem, name, extra ) {
		var ret, hooks;

		// Make sure that we''re working with the right name
		name = jQuery.camelCase( name );
		hooks = jQuery.cssHooks[ name ];
		name = jQuery.cssProps[ name ] || name;

		// cssFloat needs a special treatment
		if ( name === "cssFloat" ) {
			name = "float";
		}

		// If a hook was provided get the computed value from there
		if ( hooks && "get" in hooks && (ret = hooks.get( elem, true, extra )) !== undefined ) {
			return ret;

		// Otherwise, if a way to get the computed value exists, use that
		} else if ( curCSS ) {
			return curCSS( elem, name );
		}
	},

	// A method for quickly swapping in/out CSS properties to get correct calculations
	swap: function( elem, options, callback ) {
		var old = {};

		// Remember the old values, and insert the new ones
		for ( var name in options ) {
			old[ name ] = elem.style[ name ];
			elem.style[ name ] = options[ name ];
		}

		callback.call( elem );

		// Revert the old values
		for ( name in options ) {
			elem.style[ name ] = old[ name ];
		}
	}
});

// DEPRECATED, Use jQuery.css() instead
jQuery.curCSS = jQuery.css;

jQuery.each(["height", "width"], function( i, name ) {
	jQuery.cssHooks[ name ] = {
		get: function( elem, computed, extra ) {
			var val;

			if ( computed ) {
				if ( elem.offsetWidth !== 0 ) {
					return getWH( elem, name, extra );
				} else {
					jQuery.swap( elem, cssShow, function() {
						val = getWH( elem, name, extra );
					});
				}

				return val;
			}
		},

		set: function( elem, value ) {
			if ( rnumpx.test( value ) ) {
				// ignore negative width and height values #1599
				value = parseFloat( value );

				if ( value >= 0 ) {
					return value + "px";
				}

			} else {
				return value;
			}
		}
	};
});

if ( !jQuery.support.opacity ) {
	jQuery.cssHooks.opacity = {
		get: function( elem, computed ) {
			// IE uses filters for opacity
			return ropacity.test( (computed && elem.currentStyle ? elem.currentStyle.filter : elem.style.filter) || "" ) ?
				( parseFloat( RegExp.$1 ) / 100 ) + "" :
				computed ? "1" : "";
		},

		set: function( elem, value ) {
			var style = elem.style,
				currentStyle = elem.currentStyle;

			// IE has trouble with opacity if it does not have layout
			// Force it by setting the zoom level
			style.zoom = 1;

			// Set the alpha filter to set the opacity
			var opacity = jQuery.isNaN( value ) ?
				"" :
				"alpha(opacity=" + value * 100 + ")",
				filter = currentStyle && currentStyle.filter || style.filter || "";

			style.filter = ralpha.test( filter ) ?
				filter.replace( ralpha, opacity ) :
				filter + " " + opacity;
		}
	};
}

jQuery(function() {
	// This hook cannot be added until DOM ready because the support test
	// for it is not run until after DOM ready
	if ( !jQuery.support.reliableMarginRight ) {
		jQuery.cssHooks.marginRight = {
			get: function( elem, computed ) {
				// WebKit Bug 13343 - getComputedStyle returns wrong value for margin-right
				// Work around by temporarily setting element display to inline-block
				var ret;
				jQuery.swap( elem, { "display": "inline-block" }, function() {
					if ( computed ) {
						ret = curCSS( elem, "margin-right", "marginRight" );
					} else {
						ret = elem.style.marginRight;
					}
				});
				return ret;
			}
		};
	}
});

if ( document.defaultView && document.defaultView.getComputedStyle ) {
	getComputedStyle = function( elem, name ) {
		var ret, defaultView, computedStyle;

		name = name.replace( rupper, "-$1" ).toLowerCase();

		if ( !(defaultView = elem.ownerDocument.defaultView) ) {
			return undefined;
		}

		if ( (computedStyle = defaultView.getComputedStyle( elem, null )) ) {
			ret = computedStyle.getPropertyValue( name );
			if ( ret === "" && !jQuery.contains( elem.ownerDocument.documentElement, elem ) ) {
				ret = jQuery.style( elem, name );
			}
		}

		return ret;
	};
}

if ( document.documentElement.currentStyle ) {
	currentStyle = function( elem, name ) {
		var left,
			ret = elem.currentStyle && elem.currentStyle[ name ],
			rsLeft = elem.runtimeStyle && elem.runtimeStyle[ name ],
			style = elem.style;

		// From the awesome hack by Dean Edwards
		// http://erik.eae.net/archives/2007/07/27/18.54.15/#comment-102291

		// If we''re not dealing with a regular pixel number
		// but a number that has a weird ending, we need to convert it to pixels
		if ( !rnumpx.test( ret ) && rnum.test( ret ) ) {
			// Remember the original values
			left = style.left;

			// Put in the new values to get a computed value out
			if ( rsLeft ) {
				elem.runtimeStyle.left = elem.currentStyle.left;
			}
			style.left = name === "fontSize" ? "1em" : (ret || 0);
			ret = style.pixelLeft + "px";

			// Revert the changed values
			style.left = left;
			if ( rsLeft ) {
				elem.runtimeStyle.left = rsLeft;
			}
		}

		return ret === "" ? "auto" : ret;
	};
}

curCSS = getComputedStyle || currentStyle;

function getWH( elem, name, extra ) {

	// Start with offset property
	var val = name === "width" ? elem.offsetWidth : elem.offsetHeight,
		which = name === "width" ? cssWidth : cssHeight;

	if ( val > 0 ) {
		if ( extra !== "border" ) {
			jQuery.each( which, function() {
				if ( !extra ) {
					val -= parseFloat( jQuery.css( elem, "padding" + this ) ) || 0;
				}
				if ( extra === "margin" ) {
					val += parseFloat( jQuery.css( elem, extra + this ) ) || 0;
				} else {
					val -= parseFloat( jQuery.css( elem, "border" + this + "Width" ) ) || 0;
				}
			});
		}

		return val + "px";
	}

	// Fall back to computed then uncomputed css if necessary
	val = curCSS( elem, name, name );
	if ( val < 0 || val == null ) {
		val = elem.style[ name ] || 0;
	}
	// Normalize "", auto, and prepare for extra
	val = parseFloat( val ) || 0;

	// Add padding, border, margin
	if ( extra ) {
		jQuery.each( which, function() {
			val += parseFloat( jQuery.css( elem, "padding" + this ) ) || 0;
			if ( extra !== "padding" ) {
				val += parseFloat( jQuery.css( elem, "border" + this + "Width" ) ) || 0;
			}
			if ( extra === "margin" ) {
				val += parseFloat( jQuery.css( elem, extra + this ) ) || 0;
			}
		});
	}

	return val + "px";
}

if ( jQuery.expr && jQuery.expr.filters ) {
	jQuery.expr.filters.hidden = function( elem ) {
		var width = elem.offsetWidth,
			height = elem.offsetHeight;

		return (width === 0 && height === 0) || (!jQuery.support.reliableHiddenOffsets && (elem.style.display || jQuery.css( elem, "display" )) === "none");
	};

	jQuery.expr.filters.visible = function( elem ) {
		return !jQuery.expr.filters.hidden( elem );
	};
}




var r20 = /%20/g,
	rbracket = /\\[\\]$/,
	rCRLF = /\\r?\\n/g,
	rhash = /#.*$/,
	rheaders = /^(.*?):[ \\t]*([^\\r\\n]*)\\r?$/mg, // IE leaves an \\r character at EOL
	rinput = /^(?:color|date|datetime|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,
	// #7653, #8125, #8152: local protocol detection
	rlocalProtocol = /^(?:about|app|app\\-storage|.+\\-extension|file|widget):$/,
	rnoContent = /^(?:GET|HEAD)$/,
	rprotocol = /^\\/\\//,
	rquery = /\\?/,
	rscript = /<script\\b[^<]*(?:(?!<\\/script>)<[^<]*)*<\\/script>/gi,
	rselectTextarea = /^(?:select|textarea)/i,
	rspacesAjax = /\\s+/,
	rts = /([?&])_=[^&]*/,
	rurl = /^([\\w\\+\\.\\-]+:)(?:\\/\\/([^\\/?#:]*)(?::(\\d+))?)?/,

	// Keep a copy of the old load method
	_load = jQuery.fn.load,

	/* Prefilters
	 * 1) They are useful to introduce custom dataTypes (see ajax/jsonp.js for an example)
	 * 2) These are called:
	 *    - BEFORE asking for a transport
	 *    - AFTER param serialization (s.data is a string if s.processData is true)
	 * 3) key is the dataType
	 * 4) the catchall symbol "*" can be used
	 * 5) execution will start with transport dataType and THEN continue down to "*" if needed
	 */
	prefilters = {},

	/* Transports bindings
	 * 1) key is the dataType
	 * 2) the catchall symbol "*" can be used
	 * 3) selection will start with transport dataType and THEN go to "*" if needed
	 */
	transports = {},

	// Document location
	ajaxLocation,

	// Document location segments
	ajaxLocParts;

// #8138, IE may throw an exception when accessing
// a field from window.location if document.domain has been set
try {
	ajaxLocation = location.href;
} catch( e ) {
	// Use the href attribute of an A element
	// since IE will modify it given document.location
	ajaxLocation = document.createElement( "a" );
	ajaxLocation.href = "";
	ajaxLocation = ajaxLocation.href;
}

// Segment location into parts
ajaxLocParts = rurl.exec( ajaxLocation.toLowerCase() ) || [];

// Base "constructor" for jQuery.ajaxPrefilter and jQuery.ajaxTransport
function addToPrefiltersOrTransports( structure ) {

	// dataTypeExpression is optional and defaults to "*"
	return function( dataTypeExpression, func ) {

		if ( typeof dataTypeExpression !== "string" ) {
			func = dataTypeExpression;
			dataTypeExpression = "*";
		}

		if ( jQuery.isFunction( func ) ) {
			var dataTypes = dataTypeExpression.toLowerCase().split( rspacesAjax ),
				i = 0,
				length = dataTypes.length,
				dataType,
				list,
				placeBefore;

			// For each dataType in the dataTypeExpression
			for(; i < length; i++ ) {
				dataType = dataTypes[ i ];
				// We control if we''re asked to add before
				// any existing element
				placeBefore = /^\\+/.test( dataType );
				if ( placeBefore ) {
					dataType = dataType.substr( 1 ) || "*";
				}
				list = structure[ dataType ] = structure[ dataType ] || [];
				// then we add to the structure accordingly
				list[ placeBefore ? "unshift" : "push" ]( func );
			}
		}
	};
}

// Base inspection function for prefilters and transports
function inspectPrefiltersOrTransports( structure, options, originalOptions, jqXHR,
		dataType /* internal */, inspected /* internal */ ) {

	dataType = dataType || options.dataTypes[ 0 ];
	inspected = inspected || {};

	inspected[ dataType ] = true;

	var list = structure[ dataType ],
		i = 0,
		length = list ? list.length : 0,
		executeOnly = ( structure === prefilters ),
		selection;

	for(; i < length && ( executeOnly || !selection ); i++ ) {
		selection = list[ i ]( options, originalOptions, jqXHR );
		// If we got redirected to another dataType
		// we try there if executing only and not done already
		if ( typeof selection === "string" ) {
			if ( !executeOnly || inspected[ selection ] ) {
				selection = undefined;
			} else {
				options.dataTypes.unshift( selection );
				selection = inspectPrefiltersOrTransports(
						structure, options, originalOptions, jqXHR, selection, inspected );
			}
		}
	}
	// If we''re only executing or nothing was selected
	// we try the catchall dataType if not done already
	if ( ( executeOnly || !selection ) && !inspected[ "*" ] ) {
		selection = inspectPrefiltersOrTransports(
				structure, options, originalOptions, jqXHR, "*", inspected );
	}
	// unnecessary when only executing (prefilters)
	// but it''ll be ignored by the caller in that case
	return selection;
}

jQuery.fn.extend({
	load: function( url, params, callback ) {
		if ( typeof url !== "string" && _load ) {
			return _load.apply( this, arguments );

		// Don''t do a request if no elements are being requested
		} else if ( !this.length ) {
			return this;
		}

		var off = url.indexOf( " " );
		if ( off >= 0 ) {
			var selector = url.slice( off, url.length );
			url = url.slice( 0, off );
		}

		// Default to a GET request
		var type = "GET";

		// If the second parameter was provided
		if ( params ) {
			// If it''s a function
			if ( jQuery.isFunction( params ) ) {
				// We assume that it''s the callback
				callback = params;
				params = undefined;

			// Otherwise, build a param string
			} else if ( typeof params === "object" ) {
				params = jQuery.param( params, jQuery.ajaxSettings.traditional );
				type = "POST";
			}
		}

		var self = this;

		// Request the remote document
		jQuery.ajax({
			url: url,
			type: type,
			dataType: "html",
			data: params,
			// Complete callback (responseText is used internally)
			complete: function( jqXHR, status, responseText ) {
				// Store the response as specified by the jqXHR object
				responseText = jqXHR.responseText;
				// If successful, inject the HTML into all the matched elements
				if ( jqXHR.isResolved() ) {
					// #4825: Get the actual response in case
					// a dataFilter is present in ajaxSettings
					jqXHR.done(function( r ) {
						responseText = r;
					});
					// See if a selector was specified
					self.html( selector ?
						// Create a dummy div to hold the results
						jQuery("<div>")
							// inject the contents of the document in, removing the scripts
							// to avoid any ''Permission Denied'' errors in IE
							.append(responseText.replace(rscript, ""))

							// Locate the specified elements
							.find(selector) :

						// If not, just inject the full result
						responseText );
				}

				if ( callback ) {
					self.each( callback, [ responseText, status, jqXHR ] );
				}
			}
		});

		return this;
	},

	serialize: function() {
		return jQuery.param( this.serializeArray() );
	},

	serializeArray: function() {
		return this.map(function(){
			return this.elements ? jQuery.makeArray( this.elements ) : this;
		})
		.filter(function(){
			return this.name && !this.disabled &&
				( this.checked || rselectTextarea.test( this.nodeName ) ||
					rinput.test( this.type ) );
		})
		.map(function( i, elem ){
			var val = jQuery( this ).val();

			return val == null ?
				null :
				jQuery.isArray( val ) ?
					jQuery.map( val, function( val, i ){
						return { name: elem.name, value: val.replace( rCRLF, "\\r\\n" ) };
					}) :
					{ name: elem.name, value: val.replace( rCRLF, "\\r\\n" ) };
		}).get();
	}
});

// Attach a bunch of functions for handling common AJAX events
jQuery.each( "ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split( " " ), function( i, o ){
	jQuery.fn[ o ] = function( f ){
		return this.bind( o, f );
	};
});

jQuery.each( [ "get", "post" ], function( i, method ) {
	jQuery[ method ] = function( url, data, callback, type ) {
		// shift arguments if data argument was omitted
		if ( jQuery.isFunction( data ) ) {
			type = type || callback;
			callback = data;
			data = undefined;
		}

		return jQuery.ajax({
			type: method,
			url: url,
			data: data,
			success: callback,
			dataType: type
		});
	};
});

jQuery.extend({

	getScript: function( url, callback ) {
		return jQuery.get( url, undefined, callback, "script" );
	},

	getJSON: function( url, data, callback ) {
		return jQuery.get( url, data, callback, "json" );
	},

	// Creates a full fledged settings object into target
	// with both ajaxSettings and settings fields.
	// If target is omitted, writes into ajaxSettings.
	ajaxSetup: function ( target, settings ) {
		if ( !settings ) {
			// Only one parameter, we extend ajaxSettings
			settings = target;
			target = jQuery.extend( true, jQuery.ajaxSettings, settings );
		} else {
			// target was provided, we extend into it
			jQuery.extend( true, target, jQuery.ajaxSettings, settings );
		}
		// Flatten fields we don''t want deep extended
		for( var field in { context: 1, url: 1 } ) {
			if ( field in settings ) {
				target[ field ] = settings[ field ];
			} else if( field in jQuery.ajaxSettings ) {
				target[ field ] = jQuery.ajaxSettings[ field ];
			}
		}
		return target;
	},

	ajaxSettings: {
		url: ajaxLocation,
		isLocal: rlocalProtocol.test( ajaxLocParts[ 1 ] ),
		global: true,
		type: "GET",
		contentType: "application/x-www-form-urlencoded",
		processData: true,
		async: true,
		/*
		timeout: 0,
		data: null,
		dataType: null,
		username: null,
		password: null,
		cache: null,
		traditional: false,
		headers: {},
		*/

		accepts: {
			xml: "application/xml, text/xml",
			html: "text/html",
			text: "text/plain",
			json: "application/json, text/javascript",
			"*": "*/*"
		},

		contents: {
			xml: /xml/,
			html: /html/,
			json: /json/
		},

		responseFields: {
			xml: "responseXML",
			text: "responseText"
		},

		// List of data converters
		// 1) key format is "source_type destination_type" (a single space in-between)
		// 2) the catchall symbol "*" can be used for source_type
		converters: {

			// Convert anything to text
			"* text": window.String,

			// Text to html (true = no transformation)
			"text html": true,

			// Evaluate text as a json expression
			"text json": jQuery.parseJSON,

			// Parse text as xml
			"text xml": jQuery.parseXML
		}
	},

	ajaxPrefilter: addToPrefiltersOrTransports( prefilters ),
	ajaxTransport: addToPrefiltersOrTransports( transports ),

	// Main method
	ajax: function( url, options ) {

		// If url is an object, simulate pre-1.5 signature
		if ( typeof url === "object" ) {
			options = url;
			url = undefined;
		}

		// Force options to be an object
		options = options || {};

		var // Create the final options object
			s = jQuery.ajaxSetup( {}, options ),
			// Callbacks context
			callbackContext = s.context || s,
			// Context for global events
			// It''s the callbackContext if one was provided in the options
			// and if it''s a DOM node or a jQuery collection
			globalEventContext = callbackContext !== s &&
				( callbackContext.nodeType || callbackContext instanceof jQuery ) ?
						jQuery( callbackContext ) : jQuery.event,
			// Deferreds
			deferred = jQuery.Deferred(),
			completeDeferred = jQuery._Deferred(),
			// Status-dependent callbacks
			statusCode = s.statusCode || {},
			// ifModified key
			ifModifiedKey,
			// Headers (they are sent all at once)
			requestHeaders = {},
			requestHeadersNames = {},
			// Response headers
			responseHeadersString,
			responseHeaders,
			// transport
			transport,
			// timeout handle
			timeoutTimer,
			// Cross-domain detection vars
			parts,
			// The jqXHR state
			state = 0,
			// To know if global events are to be dispatched
			fireGlobals,
			// Loop variable
			i,
			// Fake xhr
			jqXHR = {

				readyState: 0,

				// Caches the header
				setRequestHeader: function( name, value ) {
					if ( !state ) {
						var lname = name.toLowerCase();
						name = requestHeadersNames[ lname ] = requestHeadersNames[ lname ] || name;
						requestHeaders[ name ] = value;
					}
					return this;
				},

				// Raw string
				getAllResponseHeaders: function() {
					return state === 2 ? responseHeadersString : null;
				},

				// Builds headers hashtable if needed
				getResponseHeader: function( key ) {
					var match;
					if ( state === 2 ) {
						if ( !responseHeaders ) {
							responseHeaders = {};
							while( ( match = rheaders.exec( responseHeadersString ) ) ) {
								responseHeaders[ match[1].toLowerCase() ] = match[ 2 ];
							}
						}
						match = responseHeaders[ key.toLowerCase() ];
					}
					return match === undefined ? null : match;
				},

				// Overrides response content-type header
				overrideMimeType: function( type ) {
					if ( !state ) {
						s.mimeType = type;
					}
					return this;
				},

				// Cancel the request
				abort: function( statusText ) {
					statusText = statusText || "abort";
					if ( transport ) {
						transport.abort( statusText );
					}
					done( 0, statusText );
					return this;
				}
			};

		// Callback for when everything is done
		// It is defined here because jslint complains if it is declared
		// at the end of the function (which would be more logical and readable)
		function done( status, statusText, responses, headers ) {

			// Called once
			if ( state === 2 ) {
				return;
			}

			// State is "done" now
			state = 2;

			// Clear timeout if it exists
			if ( timeoutTimer ) {
				clearTimeout( timeoutTimer );
			}

			// Dereference transport for early garbage collection
			// (no matter how long the jqXHR object will be used)
			transport = undefined;

			// Cache response headers
			responseHeadersString = headers || "";

			// Set readyState
			jqXHR.readyState = status ? 4 : 0;

			var isSuccess,
				success,
				error,
				response = responses ? ajaxHandleResponses( s, jqXHR, responses ) : undefined,
				lastModified,
				etag;

			// If successful, handle type chaining
			if ( status >= 200 && status < 300 || status === 304 ) {

				// Set the If-Modified-Since and/or If-None-Match header, if in ifModified mode.
				if ( s.ifModified ) {

					if ( ( lastModified = jqXHR.getResponseHeader( "Last-Modified" ) ) ) {
						jQuery.lastModified[ ifModifiedKey ] = lastModified;
					}
					if ( ( etag = jqXHR.getResponseHeader( "Etag" ) ) ) {
						jQuery.etag[ ifModifiedKey ] = etag;
					}
				}

				// If not modified
				if ( status === 304 ) {

					statusText = "notmodified";
					isSuccess = true;

				// If we have data
				} else {

					try {
						success = ajaxConvert( s, response );
						statusText = "success";
						isSuccess = true;
					} catch(e) {
						// We have a parsererror
						statusText = "parsererror";
						error = e;
					}
				}
			} else {
				// We extract error from statusText
				// then normalize statusText and status for non-aborts
				error = statusText;
				if( !statusText || status ) {
					statusText = "error";
					if ( status < 0 ) {
						status = 0;
					}
				}
			}

			// Set data for the fake xhr object
			jqXHR.status = status;
			jqXHR.statusText = statusText;

			// Success/Error
			if ( isSuccess ) {
				deferred.resolveWith( callbackContext, [ success, statusText, jqXHR ] );
			} else {
				deferred.rejectWith( callbackContext, [ jqXHR, statusText, error ] );
			}

			// Status-dependent callbacks
			jqXHR.statusCode( statusCode );
			statusCode = undefined;

			if ( fireGlobals ) {
				globalEventContext.trigger( "ajax" + ( isSuccess ? "Success" : "Error" ),
						[ jqXHR, s, isSuccess ? success : error ] );
			}

			// Complete
			completeDeferred.resolveWith( callbackContext, [ jqXHR, statusText ] );

			if ( fireGlobals ) {
				globalEventContext.trigger( "ajaxComplete", [ jqXHR, s] );
				// Handle the global AJAX counter
				if ( !( --jQuery.active ) ) {
					jQuery.event.trigger( "ajaxStop" );
				}
			}
		}

		// Attach deferreds
		deferred.promise( jqXHR );
		jqXHR.success = jqXHR.done;
		jqXHR.error = jqXHR.fail;
		jqXHR.complete = completeDeferred.done;

		// Status-dependent callbacks
		jqXHR.statusCode = function( map ) {
			if ( map ) {
				var tmp;
				if ( state < 2 ) {
					for( tmp in map ) {
						statusCode[ tmp ] = [ statusCode[tmp], map[tmp] ];
					}
				} else {
					tmp = map[ jqXHR.status ];
					jqXHR.then( tmp, tmp );
				}
			}
			return this;
		};

		// Remove hash character (#7531: and string promotion)
		// Add protocol if not provided (#5866: IE7 issue with protocol-less urls)
		// We also use the url parameter if available
		s.url = ( ( url || s.url ) + "" ).replace( rhash, "" ).replace( rprotocol, ajaxLocParts[ 1 ] + "//" );

		// Extract dataTypes list
		s.dataTypes = jQuery.trim( s.dataType || "*" ).toLowerCase().split( rspacesAjax );

		// Determine if a cross-domain request is in order
		if ( s.crossDomain == null ) {
			parts = rurl.exec( s.url.toLowerCase() );
			s.crossDomain = !!( parts &&
				( parts[ 1 ] != ajaxLocParts[ 1 ] || parts[ 2 ] != ajaxLocParts[ 2 ] ||
					( parts[ 3 ] || ( parts[ 1 ] === "http:" ? 80 : 443 ) ) !=
						( ajaxLocParts[ 3 ] || ( ajaxLocParts[ 1 ] === "http:" ? 80 : 443 ) ) )
			);
		}

		// Convert data if not already a string
		if ( s.data && s.processData && typeof s.data !== "string" ) {
			s.data = jQuery.param( s.data, s.traditional );
		}

		// Apply prefilters
		inspectPrefiltersOrTransports( prefilters, s, options, jqXHR );

		// If request was aborted inside a prefiler, stop there
		if ( state === 2 ) {
			return false;
		}

		// We can fire global events as of now if asked to
		fireGlobals = s.global;

		// Uppercase the type
		s.type = s.type.toUpperCase();

		// Determine if request has content
		s.hasContent = !rnoContent.test( s.type );

		// Watch for a new set of requests
		if ( fireGlobals && jQuery.active++ === 0 ) {
			jQuery.event.trigger( "ajaxStart" );
		}

		// More options handling for requests with no content
		if ( !s.hasContent ) {

			// If data is available, append data to url
			if ( s.data ) {
				s.url += ( rquery.test( s.url ) ? "&" : "?" ) + s.data;
			}

			// Get ifModifiedKey before adding the anti-cache parameter
			ifModifiedKey = s.url;

			// Add anti-cache in url if needed
			if ( s.cache === false ) {

				var ts = jQuery.now(),
					// try replacing _= if it is there
					ret = s.url.replace( rts, "$1_=" + ts );

				// if nothing was replaced, add timestamp to the end
				s.url = ret + ( (ret === s.url ) ? ( rquery.test( s.url ) ? "&" : "?" ) + "_=" + ts : "" );
			}
		}

		// Set the correct header, if data is being sent
		if ( s.data && s.hasContent && s.contentType !== false || options.contentType ) {
			jqXHR.setRequestHeader( "Content-Type", s.contentType );
		}

		// Set the If-Modified-Since and/or If-None-Match header, if in ifModified mode.
		if ( s.ifModified ) {
			ifModifiedKey = ifModifiedKey || s.url;
			if ( jQuery.lastModified[ ifModifiedKey ] ) {
				jqXHR.setRequestHeader( "If-Modified-Since", jQuery.lastModified[ ifModifiedKey ] );
			}
			if ( jQuery.etag[ ifModifiedKey ] ) {
				jqXHR.setRequestHeader( "If-None-Match", jQuery.etag[ ifModifiedKey ] );
			}
		}

		// Set the Accepts header for the server, depending on the dataType
		jqXHR.setRequestHeader(
			"Accept",
			s.dataTypes[ 0 ] && s.accepts[ s.dataTypes[0] ] ?
				s.accepts[ s.dataTypes[0] ] + ( s.dataTypes[ 0 ] !== "*" ? ", */*; q=0.01" : "" ) :
				s.accepts[ "*" ]
		);

		// Check for headers option
		for ( i in s.headers ) {
			jqXHR.setRequestHeader( i, s.headers[ i ] );
		}

		// Allow custom headers/mimetypes and early abort
		if ( s.beforeSend && ( s.beforeSend.call( callbackContext, jqXHR, s ) === false || state === 2 ) ) {
				// Abort if not done already
				jqXHR.abort();
				return false;

		}

		// Install callbacks on deferreds
		for ( i in { success: 1, error: 1, complete: 1 } ) {
			jqXHR[ i ]( s[ i ] );
		}

		// Get transport
		transport = inspectPrefiltersOrTransports( transports, s, options, jqXHR );

		// If no transport, we auto-abort
		if ( !transport ) {
			done( -1, "No Transport" );
		} else {
			jqXHR.readyState = 1;
			// Send global event
			if ( fireGlobals ) {
				globalEventContext.trigger( "ajaxSend", [ jqXHR, s ] );
			}
			// Timeout
			if ( s.async && s.timeout > 0 ) {
				timeoutTimer = setTimeout( function(){
					jqXHR.abort( "timeout" );
				}, s.timeout );
			}

			try {
				state = 1;
				transport.send( requestHeaders, done );
			} catch (e) {
				// Propagate exception as error if not done
				if ( status < 2 ) {
					done( -1, e );
				// Simply rethrow otherwise
				} else {
					jQuery.error( e );
				}
			}
		}

		return jqXHR;
	},

	// Serialize an array of form elements or a set of
	// key/values into a query string
	param: function( a, traditional ) {
		var s = [],
			add = function( key, value ) {
				// If value is a function, invoke it and return its value
				value = jQuery.isFunction( value ) ? value() : value;
				s[ s.length ] = encodeURIComponent( key ) + "=" + encodeURIComponent( value );
			};

		// Set traditional to true for jQuery <= 1.3.2 behavior.
		if ( traditional === undefined ) {
			traditional = jQuery.ajaxSettings.traditional;
		}

		// If an array was passed in, assume that it is an array of form elements.
		if ( jQuery.isArray( a ) || ( a.jquery && !jQuery.isPlainObject( a ) ) ) {
			// Serialize the form elements
			jQuery.each( a, function() {
				add( this.name, this.value );
			});

		} else {
			// If traditional, encode the "old" way (the way 1.3.2 or older
			// did it), otherwise encode params recursively.
			for ( var prefix in a ) {
				buildParams( prefix, a[ prefix ], traditional, add );
			}
		}

		// Return the resulting serialization
		return s.join( "&" ).replace( r20, "+" );
	}
});

function buildParams( prefix, obj, traditional, add ) {
	if ( jQuery.isArray( obj ) ) {
		// Serialize array item.
		jQuery.each( obj, function( i, v ) {
			if ( traditional || rbracket.test( prefix ) ) {
				// Treat each array item as a scalar.
				add( prefix, v );

			} else {
				// If array item is non-scalar (array or object), encode its
				// numeric index to resolve deserialization ambiguity issues.
				// Note that rack (as of 1.0.0) can''t currently deserialize
				// nested arrays properly, and attempting to do so may cause
				// a server error. Possible fixes are to modify rack''s
				// deserialization algorithm or to provide an option or flag
				// to force array serialization to be shallow.
				buildParams( prefix + "[" + ( typeof v === "object" || jQuery.isArray(v) ? i : "" ) + "]", v, traditional, add );
			}
		});

	} else if ( !traditional && obj != null && typeof obj === "object" ) {
		// Serialize object item.
		for ( var name in obj ) {
			buildParams( prefix + "[" + name + "]", obj[ name ], traditional, add );
		}

	} else {
		// Serialize scalar item.
		add( prefix, obj );
	}
}

// This is still on the jQuery object... for now
// Want to move this to jQuery.ajax some day
jQuery.extend({

	// Counter for holding the number of active queries
	active: 0,

	// Last-Modified header cache for next request
	lastModified: {},
	etag: {}

});

/* Handles responses to an ajax request:
 * - sets all responseXXX fields accordingly
 * - finds the right dataType (mediates between content-type and expected dataType)
 * - returns the corresponding response
 */
function ajaxHandleResponses( s, jqXHR, responses ) {

	var contents = s.contents,
		dataTypes = s.dataTypes,
		responseFields = s.responseFields,
		ct,
		type,
		finalDataType,
		firstDataType;

	// Fill responseXXX fields
	for( type in responseFields ) {
		if ( type in responses ) {
			jqXHR[ responseFields[type] ] = responses[ type ];
		}
	}

	// Remove auto dataType and get content-type in the process
	while( dataTypes[ 0 ] === "*" ) {
		dataTypes.shift();
		if ( ct === undefined ) {
			ct = s.mimeType || jqXHR.getResponseHeader( "content-type" );
		}
	}

	// Check if we''re dealing with a known content-type
	if ( ct ) {
		for ( type in contents ) {
			if ( contents[ type ] && contents[ type ].test( ct ) ) {
				dataTypes.unshift( type );
				break;
			}
		}
	}

	// Check to see if we have a response for the expected dataType
	if ( dataTypes[ 0 ] in responses ) {
		finalDataType = dataTypes[ 0 ];
	} else {
		// Try convertible dataTypes
		for ( type in responses ) {
			if ( !dataTypes[ 0 ] || s.converters[ type + " " + dataTypes[0] ] ) {
				finalDataType = type;
				break;
			}
			if ( !firstDataType ) {
				firstDataType = type;
			}
		}
		// Or just use first one
		finalDataType = finalDataType || firstDataType;
	}

	// If we found a dataType
	// We add the dataType to the list if needed
	// and return the corresponding response
	if ( finalDataType ) {
		if ( finalDataType !== dataTypes[ 0 ] ) {
			dataTypes.unshift( finalDataType );
		}
		return responses[ finalDataType ];
	}
}

// Chain conversions given the request and the original response
function ajaxConvert( s, response ) {

	// Apply the dataFilter if provided
	if ( s.dataFilter ) {
		response = s.dataFilter( response, s.dataType );
	}

	var dataTypes = s.dataTypes,
		converters = {},
		i,
		key,
		length = dataTypes.length,
		tmp,
		// Current and previous dataTypes
		current = dataTypes[ 0 ],
		prev,
		// Conversion expression
		conversion,
		// Conversion function
		conv,
		// Conversion functions (transitive conversion)
		conv1,
		conv2;

	// For each dataType in the chain
	for( i = 1; i < length; i++ ) {

		// Create converters map
		// with lowercased keys
		if ( i === 1 ) {
			for( key in s.converters ) {
				if( typeof key === "string" ) {
					converters[ key.toLowerCase() ] = s.converters[ key ];
				}
			}
		}

		// Get the dataTypes
		prev = current;
		current = dataTypes[ i ];

		// If current is auto dataType, update it to prev
		if( current === "*" ) {
			current = prev;
		// If no auto and dataTypes are actually different
		} else if ( prev !== "*" && prev !== current ) {

			// Get the converter
			conversion = prev + " " + current;
			conv = converters[ conversion ] || converters[ "* " + current ];

			// If there is no direct converter, search transitively
			if ( !conv ) {
				conv2 = undefined;
				for( conv1 in converters ) {
					tmp = conv1.split( " " );
					if ( tmp[ 0 ] === prev || tmp[ 0 ] === "*" ) {
						conv2 = converters[ tmp[1] + " " + current ];
						if ( conv2 ) {
							conv1 = converters[ conv1 ];
							if ( conv1 === true ) {
								conv = conv2;
							} else if ( conv2 === true ) {
								conv = conv1;
							}
							break;
						}
					}
				}
			}
			// If we found no converter, dispatch an error
			if ( !( conv || conv2 ) ) {
				jQuery.error( "No conversion from " + conversion.replace(" "," to ") );
			}
			// If found converter is not an equivalence
			if ( conv !== true ) {
				// Convert with 1 or 2 converters accordingly
				response = conv ? conv( response ) : conv2( conv1(response) );
			}
		}
	}
	return response;
}




var jsc = jQuery.now(),
	jsre = /(\\=)\\?(&|$)|\\?\\?/i;

// Default jsonp settings
jQuery.ajaxSetup({
	jsonp: "callback",
	jsonpCallback: function() {
		return jQuery.expando + "_" + ( jsc++ );
	}
});

// Detect, normalize options and install callbacks for jsonp requests
jQuery.ajaxPrefilter( "json jsonp", function( s, originalSettings, jqXHR ) {

	var inspectData = s.contentType === "application/x-www-form-urlencoded" &&
		( typeof s.data === "string" );

	if ( s.dataTypes[ 0 ] === "jsonp" ||
		s.jsonp !== false && ( jsre.test( s.url ) ||
				inspectData && jsre.test( s.data ) ) ) {

		var responseContainer,
			jsonpCallback = s.jsonpCallback =
				jQuery.isFunction( s.jsonpCallback ) ? s.jsonpCallback() : s.jsonpCallback,
			previous = window[ jsonpCallback ],
			url = s.url,
			data = s.data,
			replace = "$1" + jsonpCallback + "$2";

		if ( s.jsonp !== false ) {
			url = url.replace( jsre, replace );
			if ( s.url === url ) {
				if ( inspectData ) {
					data = data.replace( jsre, replace );
				}
				if ( s.data === data ) {
					// Add callback manually
					url += (/\\?/.test( url ) ? "&" : "?") + s.jsonp + "=" + jsonpCallback;
				}
			}
		}

		s.url = url;
		s.data = data;

		// Install callback
		window[ jsonpCallback ] = function( response ) {
			responseContainer = [ response ];
		};

		// Clean-up function
		jqXHR.always(function() {
			// Set callback back to previous value
			window[ jsonpCallback ] = previous;
			// Call if it was a function and we have a response
			if ( responseContainer && jQuery.isFunction( previous ) ) {
				window[ jsonpCallback ]( responseContainer[ 0 ] );
			}
		});

		// Use data converter to retrieve json after script execution
		s.converters["script json"] = function() {
			if ( !responseContainer ) {
				jQuery.error( jsonpCallback + " was not called" );
			}
			return responseContainer[ 0 ];
		};

		// force json dataType
		s.dataTypes[ 0 ] = "json";

		// Delegate to script
		return "script";
	}
});




// Install script dataType
jQuery.ajaxSetup({
	accepts: {
		script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
	},
	contents: {
		script: /javascript|ecmascript/
	},
	converters: {
		"text script": function( text ) {
			jQuery.globalEval( text );
			return text;
		}
	}
});

// Handle cache''s special case and global
jQuery.ajaxPrefilter( "script", function( s ) {
	if ( s.cache === undefined ) {
		s.cache = false;
	}
	if ( s.crossDomain ) {
		s.type = "GET";
		s.global = false;
	}
});

// Bind script tag hack transport
jQuery.ajaxTransport( "script", function(s) {

	// This transport only deals with cross domain requests
	if ( s.crossDomain ) {

		var script,
			head = document.head || document.getElementsByTagName( "head" )[0] || document.documentElement;

		return {

			send: function( _, callback ) {

				script = document.createElement( "script" );

				script.async = "async";

				if ( s.scriptCharset ) {
					script.charset = s.scriptCharset;
				}

				script.src = s.url;

				// Attach handlers for all browsers
				script.onload = script.onreadystatechange = function( _, isAbort ) {

					if ( isAbort || !script.readyState || /loaded|complete/.test( script.readyState ) ) {

						// Handle memory leak in IE
						script.onload = script.onreadystatechange = null;

						// Remove the script
						if ( head && script.parentNode ) {
							head.removeChild( script );
						}

						// Dereference the script
						script = undefined;

						// Callback if not abort
						if ( !isAbort ) {
							callback( 200, "success" );
						}
					}
				};
				// Use insertBefore instead of appendChild  to circumvent an IE6 bug.
				// This arises when a base node is used (#2709 and #4378).
				head.insertBefore( script, head.firstChild );
			},

			abort: function() {
				if ( script ) {
					script.onload( 0, 1 );
				}
			}
		};
	}
});




var // #5280: Internet Explorer will keep connections alive if we don''t abort on unload
	xhrOnUnloadAbort = window.ActiveXObject ? function() {
		// Abort all pending requests
		for ( var key in xhrCallbacks ) {
			xhrCallbacks[ key ]( 0, 1 );
		}
	} : false,
	xhrId = 0,
	xhrCallbacks;

// Functions to create xhrs
function createStandardXHR() {
	try {
		return new window.XMLHttpRequest();
	} catch( e ) {}
}

function createActiveXHR() {
	try {
		return new window.ActiveXObject( "Microsoft.XMLHTTP" );
	} catch( e ) {}
}

// Create the request object
// (This is still attached to ajaxSettings for backward compatibility)
jQuery.ajaxSettings.xhr = window.ActiveXObject ?
	/* Microsoft failed to properly
	 * implement the XMLHttpRequest in IE7 (can''t request local files),
	 * so we use the ActiveXObject when it is available
	 * Additionally XMLHttpRequest can be disabled in IE7/IE8 so
	 * we need a fallback.
	 */
	function() {
		return !this.isLocal && createStandardXHR() || createActiveXHR();
	} :
	// For all other browsers, use the standard XMLHttpRequest object
	createStandardXHR;

// Determine support properties
(function( xhr ) {
	jQuery.extend( jQuery.support, {
		ajax: !!xhr,
		cors: !!xhr && ( "withCredentials" in xhr )
	});
})( jQuery.ajaxSettings.xhr() );

// Create transport if the browser can provide an xhr
if ( jQuery.support.ajax ) {

	jQuery.ajaxTransport(function( s ) {
		// Cross domain only allowed if supported through XMLHttpRequest
		if ( !s.crossDomain || jQuery.support.cors ) {

			var callback;

			return {
				send: function( headers, complete ) {

					// Get a new xhr
					var xhr = s.xhr(),
						handle,
						i;

					// Open the socket
					// Passing null username, generates a login popup on Opera (#2865)
					if ( s.username ) {
						xhr.open( s.type, s.url, s.async, s.username, s.password );
					} else {
						xhr.open( s.type, s.url, s.async );
					}

					// Apply custom fields if provided
					if ( s.xhrFields ) {
						for ( i in s.xhrFields ) {
							xhr[ i ] = s.xhrFields[ i ];
						}
					}

					// Override mime type if needed
					if ( s.mimeType && xhr.overrideMimeType ) {
						xhr.overrideMimeType( s.mimeType );
					}

					// X-Requested-With header
					// For cross-domain requests, seeing as conditions for a preflight are
					// akin to a jigsaw puzzle, we simply never set it to be sure.
					// (it can always be set on a per-request basis or even using ajaxSetup)
					// For same-domain requests, won''t change header if already provided.
					if ( !s.crossDomain && !headers["X-Requested-With"] ) {
						headers[ "X-Requested-With" ] = "XMLHttpRequest";
					}

					// Need an extra try/catch for cross domain requests in Firefox 3
					try {
						for ( i in headers ) {
							xhr.setRequestHeader( i, headers[ i ] );
						}
					} catch( _ ) {}

					// Do send the request
					// This may raise an exception which is actually
					// handled in jQuery.ajax (so no try/catch here)
					xhr.send( ( s.hasContent && s.data ) || null );

					// Listener
					callback = function( _, isAbort ) {

						var status,
							statusText,
							responseHeaders,
							responses,
							xml;

						// Firefox throws exceptions when accessing properties
						// of an xhr when a network error occured
						// http://helpful.knobs-dials.com/index.php/Component_returned_failure_code:_0x80040111_(NS_ERROR_NOT_AVAILABLE)
						try {

							// Was never called and is aborted or complete
							if ( callback && ( isAbort || xhr.readyState === 4 ) ) {

								// Only called once
								callback = undefined;

								// Do not keep as active anymore
								if ( handle ) {
									xhr.onreadystatechange = jQuery.noop;
									if ( xhrOnUnloadAbort ) {
										delete xhrCallbacks[ handle ];
									}
								}

								// If it''s an abort
								if ( isAbort ) {
									// Abort it manually if needed
									if ( xhr.readyState !== 4 ) {
										xhr.abort();
									}
								} else {
									status = xhr.status;
									responseHeaders = xhr.getAllResponseHeaders();
									responses = {};
									xml = xhr.responseXML;

									// Construct response list
									if ( xml && xml.documentElement /* #4958 */ ) {
										responses.xml = xml;
									}
									responses.text = xhr.responseText;

									// Firefox throws an exception when accessing
									// statusText for faulty cross-domain requests
									try {
										statusText = xhr.statusText;
									} catch( e ) {
										// We normalize with Webkit giving an empty statusText
										statusText = "";
									}

									// Filter status for non standard behaviors

									// If the request is local and we have data: assume a success
									// (success with no data won''t get notified, that''s the best we
									// can do given current implementations)
									if ( !status && s.isLocal && !s.crossDomain ) {
										status = responses.text ? 200 : 404;
									// IE - #1450: sometimes returns 1223 when it should be 204
									} else if ( status === 1223 ) {
										status = 204;
									}
								}
							}
						} catch( firefoxAccessException ) {
							if ( !isAbort ) {
								complete( -1, firefoxAccessException );
							}
						}

						// Call complete if needed
						if ( responses ) {
							complete( status, statusText, responses, responseHeaders );
						}
					};

					// if we''re in sync mode or it''s in cache
					// and has been retrieved directly (IE6 & IE7)
					// we need to manually fire the callback
					if ( !s.async || xhr.readyState === 4 ) {
						callback();
					} else {
						handle = ++xhrId;
						if ( xhrOnUnloadAbort ) {
							// Create the active xhrs callbacks list if needed
							// and attach the unload handler
							if ( !xhrCallbacks ) {
								xhrCallbacks = {};
								jQuery( window ).unload( xhrOnUnloadAbort );
							}
							// Add to list of active xhrs callbacks
							xhrCallbacks[ handle ] = callback;
						}
						xhr.onreadystatechange = callback;
					}
				},

				abort: function() {
					if ( callback ) {
						callback(0,1);
					}
				}
			};
		}
	});
}




var elemdisplay = {},
	iframe, iframeDoc,
	rfxtypes = /^(?:toggle|show|hide)$/,
	rfxnum = /^([+\\-]=)?([\\d+.\\-]+)([a-z%]*)$/i,
	timerId,
	fxAttrs = [
		// height animations
		[ "height", "marginTop", "marginBottom", "paddingTop", "paddingBottom" ],
		// width animations
		[ "width", "marginLeft", "marginRight", "paddingLeft", "paddingRight" ],
		// opacity animations
		[ "opacity" ]
	],
	fxNow,
	requestAnimationFrame = window.webkitRequestAnimationFrame ||
		window.mozRequestAnimationFrame ||
		window.oRequestAnimationFrame;

jQuery.fn.extend({
	show: function( speed, easing, callback ) {
		var elem, display;

		if ( speed || speed === 0 ) {
			return this.animate( genFx("show", 3), speed, easing, callback);

		} else {
			for ( var i = 0, j = this.length; i < j; i++ ) {
				elem = this[i];

				if ( elem.style ) {
					display = elem.style.display;

					// Reset the inline display of this element to learn if it is
					// being hidden by cascaded rules or not
					if ( !jQuery._data(elem, "olddisplay") && display === "none" ) {
						display = elem.style.display = "";
					}

					// Set elements which have been overridden with display: none
					// in a stylesheet to whatever the default browser style is
					// for such an element
					if ( display === "" && jQuery.css( elem, "display" ) === "none" ) {
						jQuery._data(elem, "olddisplay", defaultDisplay(elem.nodeName));
					}
				}
			}

			// Set the display of most of the elements in a second loop
			// to avoid the constant reflow
			for ( i = 0; i < j; i++ ) {
				elem = this[i];

				if ( elem.style ) {
					display = elem.style.display;

					if ( display === "" || display === "none" ) {
						elem.style.display = jQuery._data(elem, "olddisplay") || "";
					}
				}
			}

			return this;
		}
	},

	hide: function( speed, easing, callback ) {
		if ( speed || speed === 0 ) {
			return this.animate( genFx("hide", 3), speed, easing, callback);

		} else {
			for ( var i = 0, j = this.length; i < j; i++ ) {
				if ( this[i].style ) {
					var display = jQuery.css( this[i], "display" );

					if ( display !== "none" && !jQuery._data( this[i], "olddisplay" ) ) {
						jQuery._data( this[i], "olddisplay", display );
					}
				}
			}

			// Set the display of the elements in a second loop
			// to avoid the constant reflow
			for ( i = 0; i < j; i++ ) {
				if ( this[i].style ) {
					this[i].style.display = "none";
				}
			}

			return this;
		}
	},

	// Save the old toggle function
	_toggle: jQuery.fn.toggle,

	toggle: function( fn, fn2, callback ) {
		var bool = typeof fn === "boolean";

		if ( jQuery.isFunction(fn) && jQuery.isFunction(fn2) ) {
			this._toggle.apply( this, arguments );

		} else if ( fn == null || bool ) {
			this.each(function() {
				var state = bool ? fn : jQuery(this).is(":hidden");
				jQuery(this)[ state ? "show" : "hide" ]();
			});

		} else {
			this.animate(genFx("toggle", 3), fn, fn2, callback);
		}

		return this;
	},

	fadeTo: function( speed, to, easing, callback ) {
		return this.filter(":hidden").css("opacity", 0).show().end()
					.animate({opacity: to}, speed, easing, callback);
	},

	animate: function( prop, speed, easing, callback ) {
		var optall = jQuery.speed(speed, easing, callback);

		if ( jQuery.isEmptyObject( prop ) ) {
			return this.each( optall.complete, [ false ] );
		}

		// Do not change referenced properties as per-property easing will be lost
		prop = jQuery.extend( {}, prop );

		return this[ optall.queue === false ? "each" : "queue" ](function() {
			// XXX ''this'' does not always have a nodeName when running the
			// test suite

			if ( optall.queue === false ) {
				jQuery._mark( this );
			}

			var opt = jQuery.extend( {}, optall ),
				isElement = this.nodeType === 1,
				hidden = isElement && jQuery(this).is(":hidden"),
				name, val, p,
				display, e,
				parts, start, end, unit;

			// will store per property easing and be used to determine when an animation is complete
			opt.animatedProperties = {};

			for ( p in prop ) {

				// property name normalization
				name = jQuery.camelCase( p );
				if ( p !== name ) {
					prop[ name ] = prop[ p ];
					delete prop[ p ];
				}

				val = prop[ name ];

				// easing resolution: per property > opt.specialEasing > opt.easing > ''swing'' (default)
				if ( jQuery.isArray( val ) ) {
					opt.animatedProperties[ name ] = val[ 1 ];
					val = prop[ name ] = val[ 0 ];
				} else {
					opt.animatedProperties[ name ] = opt.specialEasing && opt.specialEasing[ name ] || opt.easing || ''swing'';
				}

				if ( val === "hide" && hidden || val === "show" && !hidden ) {
					return opt.complete.call( this );
				}

				if ( isElement && ( name === "height" || name === "width" ) ) {
					// Make sure that nothing sneaks out
					// Record all 3 overflow attributes because IE does not
					// change the overflow attribute when overflowX and
					// overflowY are set to the same value
					opt.overflow = [ this.style.overflow, this.style.overflowX, this.style.overflowY ];

					// Set display property to inline-block for height/width
					// animations on inline elements that are having width/height
					// animated
					if ( jQuery.css( this, "display" ) === "inline" &&
							jQuery.css( this, "float" ) === "none" ) {
						if ( !jQuery.support.inlineBlockNeedsLayout ) {
							this.style.display = "inline-block";

						} else {
							display = defaultDisplay( this.nodeName );

							// inline-level elements accept inline-block;
							// block-level elements need to be inline with layout
							if ( display === "inline" ) {
								this.style.display = "inline-block";

							} else {
								this.style.display = "inline";
								this.style.zoom = 1;
							}
						}
					}
				}
			}

			if ( opt.overflow != null ) {
				this.style.overflow = "hidden";
			}

			for ( p in prop ) {
				e = new jQuery.fx( this, opt, p );
				val = prop[ p ];

				if ( rfxtypes.test(val) ) {
					e[ val === "toggle" ? hidden ? "show" : "hide" : val ]();

				} else {
					parts = rfxnum.exec( val );
					start = e.cur();

					if ( parts ) {
						end = parseFloat( parts[2] );
						unit = parts[3] || ( jQuery.cssNumber[ p ] ? "" : "px" );

						// We need to compute starting value
						if ( unit !== "px" ) {
							jQuery.style( this, p, (end || 1) + unit);
							start = ((end || 1) / e.cur()) * start;
							jQuery.style( this, p, start + unit);
						}

						// If a +=/-= token was provided, we''re doing a relative animation
						if ( parts[1] ) {
							end = ( (parts[ 1 ] === "-=" ? -1 : 1) * end ) + start;
						}

						e.custom( start, end, unit );

					} else {
						e.custom( start, val, "" );
					}
				}
			}

			// For JS strict compliance
			return true;
		});
	},

	stop: function( clearQueue, gotoEnd ) {
		if ( clearQueue ) {
			this.queue([]);
		}

		this.each(function() {
			var timers = jQuery.timers,
				i = timers.length;
			// clear marker counters if we know they won''t be
			if ( !gotoEnd ) {
				jQuery._unmark( true, this );
			}
			while ( i-- ) {
				if ( timers[i].elem === this ) {
					if (gotoEnd) {
						// force the next step to be the last
						timers[i](true);
					}

					timers.splice(i, 1);
				}
			}
		});

		// start the next in the queue if the last step wasn''t forced
		if ( !gotoEnd ) {
			this.dequeue();
		}

		return this;
	}

});

// Animations created synchronously will run synchronously
function createFxNow() {
	setTimeout( clearFxNow, 0 );
	return ( fxNow = jQuery.now() );
}

function clearFxNow() {
	fxNow = undefined;
}

// Generate parameters to create a standard animation
function genFx( type, num ) {
	var obj = {};

	jQuery.each( fxAttrs.concat.apply([], fxAttrs.slice(0,num)), function() {
		obj[ this ] = type;
	});

	return obj;
}

// Generate shortcuts for custom animations
jQuery.each({
	slideDown: genFx("show", 1),
	slideUp: genFx("hide", 1),
	slideToggle: genFx("toggle", 1),
	fadeIn: { opacity: "show" },
	fadeOut: { opacity: "hide" },
	fadeToggle: { opacity: "toggle" }
}, function( name, props ) {
	jQuery.fn[ name ] = function( speed, easing, callback ) {
		return this.animate( props, speed, easing, callback );
	};
});

jQuery.extend({
	speed: function( speed, easing, fn ) {
		var opt = speed && typeof speed === "object" ? jQuery.extend({}, speed) : {
			complete: fn || !fn && easing ||
				jQuery.isFunction( speed ) && speed,
			duration: speed,
			easing: fn && easing || easing && !jQuery.isFunction(easing) && easing
		};

		opt.duration = jQuery.fx.off ? 0 : typeof opt.duration === "number" ? opt.duration :
			opt.duration in jQuery.fx.speeds ? jQuery.fx.speeds[opt.duration] : jQuery.fx.speeds._default;

		// Queueing
		opt.old = opt.complete;
		opt.complete = function( noUnmark ) {
			if ( jQuery.isFunction( opt.old ) ) {
				opt.old.call( this );
			}

			if ( opt.queue !== false ) {
				jQuery.dequeue( this );
			} else if ( noUnmark !== false ) {
				jQuery._unmark( this );
			}
		};

		return opt;
	},

	easing: {
		linear: function( p, n, firstNum, diff ) {
			return firstNum + diff * p;
		},
		swing: function( p, n, firstNum, diff ) {
			return ((-Math.cos(p*Math.PI)/2) + 0.5) * diff + firstNum;
		}
	},

	timers: [],

	fx: function( elem, options, prop ) {
		this.options = options;
		this.elem = elem;
		this.prop = prop;

		options.orig = options.orig || {};
	}

});

jQuery.fx.prototype = {
	// Simple function for setting a style value
	update: function() {
		if ( this.options.step ) {
			this.options.step.call( this.elem, this.now, this );
		}

		(jQuery.fx.step[this.prop] || jQuery.fx.step._default)( this );
	},

	// Get the current size
	cur: function() {
		if ( this.elem[this.prop] != null && (!this.elem.style || this.elem.style[this.prop] == null) ) {
			return this.elem[ this.prop ];
		}

		var parsed,
			r = jQuery.css( this.elem, this.prop );
		// Empty strings, null, undefined and "auto" are converted to 0,
		// complex values such as "rotate(1rad)" are returned as is,
		// simple values such as "10px" are parsed to Float.
		return isNaN( parsed = parseFloat( r ) ) ? !r || r === "auto" ? 0 : r : parsed;
	},

	// Start an animation from one number to another
	custom: function( from, to, unit ) {
		var self = this,
			fx = jQuery.fx,
			raf;

		this.startTime = fxNow || createFxNow();
		this.start = from;
		this.end = to;
		this.unit = unit || this.unit || ( jQuery.cssNumber[ this.prop ] ? "" : "px" );
		this.now = this.start;
		this.pos = this.state = 0;

		function t( gotoEnd ) {
			return self.step(gotoEnd);
		}

		t.elem = this.elem;

		if ( t() && jQuery.timers.push(t) && !timerId ) {
			// Use requestAnimationFrame instead of setInterval if available
			if ( requestAnimationFrame ) {
				timerId = true;
				raf = function() {
					// When timerId gets set to null at any point, this stops
					if ( timerId ) {
						requestAnimationFrame( raf );
						fx.tick();
					}
				};
				requestAnimationFrame( raf );
			} else {
				timerId = setInterval( fx.tick, fx.interval );
			}
		}
	},

	// Simple ''show'' function
	show: function() {
		// Remember where we started, so that we can go back to it later
		this.options.orig[this.prop] = jQuery.style( this.elem, this.prop );
		this.options.show = true;

		// Begin the animation
		// Make sure that we start at a small width/height to avoid any
		// flash of content
		this.custom(this.prop === "width" || this.prop === "height" ? 1 : 0, this.cur());

		// Start by showing the element
		jQuery( this.elem ).show();
	},

	// Simple ''hide'' function
	hide: function() {
		// Remember where we started, so that we can go back to it later
		this.options.orig[this.prop] = jQuery.style( this.elem, this.prop );
		this.options.hide = true;

		// Begin the animation
		this.custom(this.cur(), 0);
	},

	// Each step of an animation
	step: function( gotoEnd ) {
		var t = fxNow || createFxNow(),
			done = true,
			elem = this.elem,
			options = this.options,
			i, n;

		if ( gotoEnd || t >= options.duration + this.startTime ) {
			this.now = this.end;
			this.pos = this.state = 1;
			this.update();

			options.animatedProperties[ this.prop ] = true;

			for ( i in options.animatedProperties ) {
				if ( options.animatedProperties[i] !== true ) {
					done = false;
				}
			}

			if ( done ) {
				// Reset the overflow
				if ( options.overflow != null && !jQuery.support.shrinkWrapBlocks ) {

					jQuery.each( [ "", "X", "Y" ], function (index, value) {
						elem.style[ "overflow" + value ] = options.overflow[index];
					});
				}

				// Hide the element if the "hide" operation was done
				if ( options.hide ) {
					jQuery(elem).hide();
				}

				// Reset the properties, if the item has been hidden or shown
				if ( options.hide || options.show ) {
					for ( var p in options.animatedProperties ) {
						jQuery.style( elem, p, options.orig[p] );
					}
				}

				// Execute the complete function
				options.complete.call( elem );
			}

			return false;

		} else {
			// classical easing cannot be used with an Infinity duration
			if ( options.duration == Infinity ) {
				this.now = t;
			} else {
				n = t - this.startTime;
				this.state = n / options.duration;

				// Perform the easing function, defaults to swing
				this.pos = jQuery.easing[ options.animatedProperties[ this.prop ] ]( this.state, n, 0, 1, options.duration );
				this.now = this.start + ((this.end - this.start) * this.pos);
			}
			// Perform the next step of the animation
			this.update();
		}

		return true;
	}
};

jQuery.extend( jQuery.fx, {
	tick: function() {
		for ( var timers = jQuery.timers, i = 0 ; i < timers.length ; ++i ) {
			if ( !timers[i]() ) {
				timers.splice(i--, 1);
			}
		}

		if ( !timers.length ) {
			jQuery.fx.stop();
		}
	},

	interval: 13,

	stop: function() {
		clearInterval( timerId );
		timerId = null;
	},

	speeds: {
		slow: 600,
		fast: 200,
		// Default speed
		_default: 400
	},

	step: {
		opacity: function( fx ) {
			jQuery.style( fx.elem, "opacity", fx.now );
		},

		_default: function( fx ) {
			if ( fx.elem.style && fx.elem.style[ fx.prop ] != null ) {
				fx.elem.style[ fx.prop ] = (fx.prop === "width" || fx.prop === "height" ? Math.max(0, fx.now) : fx.now) + fx.unit;
			} else {
				fx.elem[ fx.prop ] = fx.now;
			}
		}
	}
});

if ( jQuery.expr && jQuery.expr.filters ) {
	jQuery.expr.filters.animated = function( elem ) {
		return jQuery.grep(jQuery.timers, function( fn ) {
			return elem === fn.elem;
		}).length;
	};
}

// Try to restore the default display value of an element
function defaultDisplay( nodeName ) {

	if ( !elemdisplay[ nodeName ] ) {

		var body = document.body,
			elem = jQuery( "<" + nodeName + ">" ).appendTo( body ),
			display = elem.css( "display" );

		elem.remove();

		// If the simple way fails,
		// get element''s real default display by attaching it to a temp iframe
		if ( display === "none" || display === "" ) {
			// No iframe to use yet, so create it
			if ( !iframe ) {
				iframe = document.createElement( "iframe" );
				iframe.frameBorder = iframe.width = iframe.height = 0;
			}

			body.appendChild( iframe );

			// Create a cacheable copy of the iframe document on first call.
			// IE and Opera will allow us to reuse the iframeDoc without re-writing the fake HTML
			// document to it; WebKit & Firefox won''t allow reusing the iframe document.
			if ( !iframeDoc || !iframe.createElement ) {
				iframeDoc = ( iframe.contentWindow || iframe.contentDocument ).document;
				iframeDoc.write( ( document.compatMode === "CSS1Compat" ? "<!doctype html>" : "" ) + "<html><body>" );
				iframeDoc.close();
			}

			elem = iframeDoc.createElement( nodeName );

			iframeDoc.body.appendChild( elem );

			display = jQuery.css( elem, "display" );

			body.removeChild( iframe );
		}

		// Store the correct default display
		elemdisplay[ nodeName ] = display;
	}

	return elemdisplay[ nodeName ];
}




var rtable = /^t(?:able|d|h)$/i,
	rroot = /^(?:body|html)$/i;

if ( "getBoundingClientRect" in document.documentElement ) {
	jQuery.fn.offset = function( options ) {
		var elem = this[0], box;

		if ( options ) {
			return this.each(function( i ) {
				jQuery.offset.setOffset( this, options, i );
			});
		}

		if ( !elem || !elem.ownerDocument ) {
			return null;
		}

		if ( elem === elem.ownerDocument.body ) {
			return jQuery.offset.bodyOffset( elem );
		}

		try {
			box = elem.getBoundingClientRect();
		} catch(e) {}

		var doc = elem.ownerDocument,
			docElem = doc.documentElement;

		// Make sure we''re not dealing with a disconnected DOM node
		if ( !box || !jQuery.contains( docElem, elem ) ) {
			return box ? { top: box.top, left: box.left } : { top: 0, left: 0 };
		}

		var body = doc.body,
			win = getWindow(doc),
			clientTop  = docElem.clientTop  || body.clientTop  || 0,
			clientLeft = docElem.clientLeft || body.clientLeft || 0,
			scrollTop  = win.pageYOffset || jQuery.support.boxModel && docElem.scrollTop  || body.scrollTop,
			scrollLeft = win.pageXOffset || jQuery.support.boxModel && docElem.scrollLeft || body.scrollLeft,
			top  = box.top  + scrollTop  - clientTop,
			left = box.left + scrollLeft - clientLeft;

		return { top: top, left: left };
	};

} else {
	jQuery.fn.offset = function( options ) {
		var elem = this[0];

		if ( options ) {
			return this.each(function( i ) {
				jQuery.offset.setOffset( this, options, i );
			});
		}

		if ( !elem || !elem.ownerDocument ) {
			return null;
		}

		if ( elem === elem.ownerDocument.body ) {
			return jQuery.offset.bodyOffset( elem );
		}

		jQuery.offset.initialize();

		var computedStyle,
			offsetParent = elem.offsetParent,
			prevOffsetParent = elem,
			doc = elem.ownerDocument,
			docElem = doc.documentElement,
			body = doc.body,
			defaultView = doc.defaultView,
			prevComputedStyle = defaultView ? defaultView.getComputedStyle( elem, null ) : elem.currentStyle,
			top = elem.offsetTop,
			left = elem.offsetLeft;

		while ( (elem = elem.parentNode) && elem !== body && elem !== docElem ) {
			if ( jQuery.offset.supportsFixedPosition && prevComputedStyle.position === "fixed" ) {
				break;
			}

			computedStyle = defaultView ? defaultView.getComputedStyle(elem, null) : elem.currentStyle;
			top  -= elem.scrollTop;
			left -= elem.scrollLeft;

			if ( elem === offsetParent ) {
				top  += elem.offsetTop;
				left += elem.offsetLeft;

				if ( jQuery.offset.doesNotAddBorder && !(jQuery.offset.doesAddBorderForTableAndCells && rtable.test(elem.nodeName)) ) {
					top  += parseFloat( computedStyle.borderTopWidth  ) || 0;
					left += parseFloat( computedStyle.borderLeftWidth ) || 0;
				}

				prevOffsetParent = offsetParent;
				offsetParent = elem.offsetParent;
			}

			if ( jQuery.offset.subtractsBorderForOverflowNotVisible && computedStyle.overflow !== "visible" ) {
				top  += parseFloat( computedStyle.borderTopWidth  ) || 0;
				left += parseFloat( computedStyle.borderLeftWidth ) || 0;
			}

			prevComputedStyle = computedStyle;
		}

		if ( prevComputedStyle.position === "relative" || prevComputedStyle.position === "static" ) {
			top  += body.offsetTop;
			left += body.offsetLeft;
		}

		if ( jQuery.offset.supportsFixedPosition && prevComputedStyle.position === "fixed" ) {
			top  += Math.max( docElem.scrollTop, body.scrollTop );
			left += Math.max( docElem.scrollLeft, body.scrollLeft );
		}

		return { top: top, left: left };
	};
}

jQuery.offset = {
	initialize: function() {
		var body = document.body, container = document.createElement("div"), innerDiv, checkDiv, table, td, bodyMarginTop = parseFloat( jQuery.css(body, "marginTop") ) || 0,
			html = "<div style=''position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;''><div></div></div><table style=''position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;'' cellpadding=''0'' cellspacing=''0''><tr><td></td></tr></table>";

		jQuery.extend( container.style, { position: "absolute", top: 0, left: 0, margin: 0, border: 0, width: "1px", height: "1px", visibility: "hidden" } );

		container.innerHTML = html;
		body.insertBefore( container, body.firstChild );
		innerDiv = container.firstChild;
		checkDiv = innerDiv.firstChild;
		td = innerDiv.nextSibling.firstChild.firstChild;

		this.doesNotAddBorder = (checkDiv.offsetTop !== 5);
		this.doesAddBorderForTableAndCells = (td.offsetTop === 5);

		checkDiv.style.position = "fixed";
		checkDiv.style.top = "20px";

		// safari subtracts parent border width here which is 5px
		this.supportsFixedPosition = (checkDiv.offsetTop === 20 || checkDiv.offsetTop === 15);
		checkDiv.style.position = checkDiv.style.top = "";

		innerDiv.style.overflow = "hidden";
		innerDiv.style.position = "relative";

		this.subtractsBorderForOverflowNotVisible = (checkDiv.offsetTop === -5);

		this.doesNotIncludeMarginInBodyOffset = (body.offsetTop !== bodyMarginTop);

		body.removeChild( container );
		jQuery.offset.initialize = jQuery.noop;
	},

	bodyOffset: function( body ) {
		var top = body.offsetTop,
			left = body.offsetLeft;

		jQuery.offset.initialize();

		if ( jQuery.offset.doesNotIncludeMarginInBodyOffset ) {
			top  += parseFloat( jQuery.css(body, "marginTop") ) || 0;
			left += parseFloat( jQuery.css(body, "marginLeft") ) || 0;
		}

		return { top: top, left: left };
	},

	setOffset: function( elem, options, i ) {
		var position = jQuery.css( elem, "position" );

		// set position first, in-case top/left are set even on static elem
		if ( position === "static" ) {
			elem.style.position = "relative";
		}

		var curElem = jQuery( elem ),
			curOffset = curElem.offset(),
			curCSSTop = jQuery.css( elem, "top" ),
			curCSSLeft = jQuery.css( elem, "left" ),
			calculatePosition = (position === "absolute" || position === "fixed") && jQuery.inArray("auto", [curCSSTop, curCSSLeft]) > -1,
			props = {}, curPosition = {}, curTop, curLeft;

		// need to be able to calculate position if either top or left is auto and position is either absolute or fixed
		if ( calculatePosition ) {
			curPosition = curElem.position();
			curTop = curPosition.top;
			curLeft = curPosition.left;
		} else {
			curTop = parseFloat( curCSSTop ) || 0;
			curLeft = parseFloat( curCSSLeft ) || 0;
		}

		if ( jQuery.isFunction( options ) ) {
			options = options.call( elem, i, curOffset );
		}

		if (options.top != null) {
			props.top = (options.top - curOffset.top) + curTop;
		}
		if (options.left != null) {
			props.left = (options.left - curOffset.left) + curLeft;
		}

		if ( "using" in options ) {
			options.using.call( elem, props );
		} else {
			curElem.css( props );
		}
	}
};


jQuery.fn.extend({
	position: function() {
		if ( !this[0] ) {
			return null;
		}

		var elem = this[0],

		// Get *real* offsetParent
		offsetParent = this.offsetParent(),

		// Get correct offsets
		offset       = this.offset(),
		parentOffset = rroot.test(offsetParent[0].nodeName) ? { top: 0, left: 0 } : offsetParent.offset();

		// Subtract element margins
		// note: when an element has margin: auto the offsetLeft and marginLeft
		// are the same in Safari causing offset.left to incorrectly be 0
		offset.top  -= parseFloat( jQuery.css(elem, "marginTop") ) || 0;
		offset.left -= parseFloat( jQuery.css(elem, "marginLeft") ) || 0;

		// Add offsetParent borders
		parentOffset.top  += parseFloat( jQuery.css(offsetParent[0], "borderTopWidth") ) || 0;
		parentOffset.left += parseFloat( jQuery.css(offsetParent[0], "borderLeftWidth") ) || 0;

		// Subtract the two offsets
		return {
			top:  offset.top  - parentOffset.top,
			left: offset.left - parentOffset.left
		};
	},

	offsetParent: function() {
		return this.map(function() {
			var offsetParent = this.offsetParent || document.body;
			while ( offsetParent && (!rroot.test(offsetParent.nodeName) && jQuery.css(offsetParent, "position") === "static") ) {
				offsetParent = offsetParent.offsetParent;
			}
			return offsetParent;
		});
	}
});


// Create scrollLeft and scrollTop methods
jQuery.each( ["Left", "Top"], function( i, name ) {
	var method = "scroll" + name;

	jQuery.fn[ method ] = function( val ) {
		var elem, win;

		if ( val === undefined ) {
			elem = this[ 0 ];

			if ( !elem ) {
				return null;
			}

			win = getWindow( elem );

			// Return the scroll offset
			return win ? ("pageXOffset" in win) ? win[ i ? "pageYOffset" : "pageXOffset" ] :
				jQuery.support.boxModel && win.document.documentElement[ method ] ||
					win.document.body[ method ] :
				elem[ method ];
		}

		// Set the scroll offset
		return this.each(function() {
			win = getWindow( this );

			if ( win ) {
				win.scrollTo(
					!i ? val : jQuery( win ).scrollLeft(),
					 i ? val : jQuery( win ).scrollTop()
				);

			} else {
				this[ method ] = val;
			}
		});
	};
});

function getWindow( elem ) {
	return jQuery.isWindow( elem ) ?
		elem :
		elem.nodeType === 9 ?
			elem.defaultView || elem.parentWindow :
			false;
}




// Create width, height, innerHeight, innerWidth, outerHeight and outerWidth methods
jQuery.each([ "Height", "Width" ], function( i, name ) {

	var type = name.toLowerCase();

	// innerHeight and innerWidth
	jQuery.fn[ "inner" + name ] = function() {
		var elem = this[0];
		return elem && elem.style ?
			parseFloat( jQuery.css( elem, type, "padding" ) ) :
			null;
	};

	// outerHeight and outerWidth
	jQuery.fn[ "outer" + name ] = function( margin ) {
		var elem = this[0];
		return elem && elem.style ?
			parseFloat( jQuery.css( elem, type, margin ? "margin" : "border" ) ) :
			null;
	};

	jQuery.fn[ type ] = function( size ) {
		// Get window width or height
		var elem = this[0];
		if ( !elem ) {
			return size == null ? null : this;
		}

		if ( jQuery.isFunction( size ) ) {
			return this.each(function( i ) {
				var self = jQuery( this );
				self[ type ]( size.call( this, i, self[ type ]() ) );
			});
		}

		if ( jQuery.isWindow( elem ) ) {
			// Everyone else use document.documentElement or document.body depending on Quirks vs Standards mode
			// 3rd condition allows Nokia support, as it supports the docElem prop but not CSS1Compat
			var docElemProp = elem.document.documentElement[ "client" + name ];
			return elem.document.compatMode === "CSS1Compat" && docElemProp ||
				elem.document.body[ "client" + name ] || docElemProp;

		// Get document width or height
		} else if ( elem.nodeType === 9 ) {
			// Either scroll[Width/Height] or offset[Width/Height], whichever is greater
			return Math.max(
				elem.documentElement["client" + name],
				elem.body["scroll" + name], elem.documentElement["scroll" + name],
				elem.body["offset" + name], elem.documentElement["offset" + name]
			);

		// Get or set width or height on the element
		} else if ( size === undefined ) {
			var orig = jQuery.css( elem, type ),
				ret = parseFloat( orig );

			return jQuery.isNaN( ret ) ? orig : ret;

		// Set the width or height on the element (default to pixels if value is unitless)
		} else {
			return this.css( type, typeof size === "string" ? size : size + "px" );
		}
	};

});


// Expose jQuery to the global object
window.jQuery = window.$ = jQuery;
})(window);
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (139, 'cheeze/whiz.html', 'Crapola', 0, 'main', '', 1, '', '2011-09-10 15:49:44', 'admin', 'users', '1111', '<html>
<head>
</head>
<body>
     Count this!
</body>
</html>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (143, '.login', 'Login', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<table border="0"><form method="post" action="<?SPINE_Location?><?SPINE_Page?>" name="login">
<tr><td>Name : </td><td><input type="text" name="name" class="input"></td></tr>
<tr><td>Password :</td><td><input type="password" name="password" class="input"></td></tr>
<tr><td colspan="2"><input type="submit" name="button" value="login" class="button">
</td></form></tr></table>
', 'Call this content if you want to log in. I still have to provide a lot of authorization handling..', '');
INSERT INTO content VALUES (144, 'developing.html', 'Developing', 0, 'main', '', 1, 'developing plugin code', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Developing for SPINE</h2>

<p>There are currently two ways to interact with SPINE. Both use perl packages so we pressume you have sufficient skills.</p>

<h3>Tag Handlers</h3>
<p>While parsing the content data, certain tags will specific handlers. You can pass parameters to the packages. You will find an Env.pm file in lib/SPINE/Handler. This package is SPINE::Handler::Env (see the first line). The code in this file can be triggered by using a tag in your content.</p>

<pre>&lt;?SPINE_Env?&gt;</pre>

<p>The string after the SPINE_ is handled as a module name so this will call SPINE::Handler::Env.
SPINE will pass everything between SPINE_ and ?> as a parameter to the module so you can handle the parameters yourself.</p>
<p>The SPINE::Handler::Env file is constructed as follows.</p>
<pre>package SPINE::Handler::Env;

use strict;
use SPINE::Constant;
use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #The entire bit between SPINE_ and ?>
  my ($params) = $tag =~ m,(([^)]*)),g;
  my @params = split(/,/,$params);
  my $body = undef;
  #If there are parameters, they''re stored in @params
  for(keys(%ENV) )
  { $body .= "$_ => $ENV{$_}
&lt;br&gt;"; }
  return $body;
}

1;
__END__
</pre>
<p>Besides the package declaration and using some extra modules, the package contains one subroutine:
handler. This subroutine is called with 3 parameters. The first one is an instance of Apache::Request. 
You can use it to parse or manipulate the HTTP header. It also can be used to read form parameters with the param function.
</pre>
<pre>my $foo = $request->param("foo");</pre>
<p>The Second parameter is an instance of the DBI Database Handler. The database handler is connected to the 
database specified for this setup. You can pass direct SQL queries to it. Consult the DBI documentation on how to achieve this.
SPINE itself passes the database handler as a parameter to an abstract DBI layer that handles calls between handlers and the database with objects. The third parameter is the actual string used to call the package. In the case of </p>

<pre>&lt;?SPINE_Env?&gt;</pre>

<p>this is </p>

<pre>Env</pre>

<p>but in other cases it might contain the parameters too. For instance</p>

<pre>&lt;?SPINE_Env("foo","bar")?&gt;</pre>

<p>will still call the package SPINE::Handler::Env but the third parameter will be</p>

<pre>Env("foo","bar")</pre>
<p>You will have to extract those parameters yourself. The provided Env package has some basic code for this purpose.
SPINE will expect SPINE::Handler::Env to return a string as a result of the package call.</p>

<h3>Administration Handlers</h3>
<p>Developing Administration Handlers is a bit harder.</p>

<p>You will find an Env.pm file in lib/SPINE/Handler/Admin. This package is SPINE::Handler::Admin::Env (see the first line). The only way this module is triggered is by directly calling it (preferably through a link in the administration section).For instance, you can call the Env package by using http://www.yoursite.com/admin/env/ as an address.</p>

<p>The SPINE::Handler::Admin::Env file is constructed as follows.</p>
<pre>
package SPINE::Handler::Admin::Env;

use strict;
use SPINE::Base::Content;
use SPINE::Constant;

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $body = undef;
  for(keys(%ENV) )
  { $body .= "$_ => $ENV{$_}
&lt;br&gt;"; }
  my $c = SPINE::Base::Content->new({body=>$body,style=>''admin''});
  return $c;
}

1;
__END__
</pre>
<p>The admininstration handler does not expect a plain string but an instance of SPINE::Base::Content.
You can set several of the content attributes. Two of the most important ones are body and style. In body, you''ll need to set the actual text you wish to display. In this case, this is where the listing of environment variables comes. In style, you define which style to use.
</p>
<p>
Besides the package declaration and using some extra modules and SPINE::Base::Content, the package contains one subroutine:
handler. This subroutine is called with 2 parameters. The first one is an instance of Apache::Request. You can use it to parse or manipulate the HTTP header. It also can be used to read form parameters with the param function.</p>

<pre>my $foo = $request->param("foo");</pre>

<p>The Second parameter is an instance of the DBI Database Handler. The database handler is connected to the 
database specified for this setup. You can pass direct SQL queries to it. Consult the DBI documentation on how to achieve this.
SPINE itself passes the database handler as a parameter to an abstract DBI layer that handles calls between handlers and the database with objects.</p>

<h3>Configuration & Installation</h3>
<p>
Both these handler types can be dropped in the specific Perl directories and they will work. It is highly recommended that you restart Apache. There is no specific configuration besides the one your package requires. You can access the Apache configuration settings 
(similar to the settings needed for SPINE itself) through the Apache::Request instance.</pre>

<p>For instance</p>

<pre>$request->dir_config("webmaster")</pre>
<p>will access the setting defined in the Apache configuration file as</p>

<pre>    PerlSetVar webmaster ''John Doe''</pre>

<p>If you need certain configuration settings, it might be handy to make it accessible like this. 
This way there is no unnecessary file I/O.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (145, '.404', '404 Not Found', 0, '.error', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<h1>Not Found</h1>
The requested URL $page was not found on this server.<p>
<hr>
<address>SPINE 1.0_05 - $serversig</address>
', 'This is the 404 File not found content used when errors occur..', '');
INSERT INTO content VALUES (146, '.login_info', '', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', '', '0010', '<table><tr><td>Hi, <?SPINE_User?>...<br><br>You are logged in!<br></td></tr>
<form method="post" action="<?SPINE_Location?>">
<tr><td><input type="submit" name="button" value="logout" class="button"></td></tr></form>
</table>
Enter <a href="admin/">Administration</a>.', 'This text will be displayed when logged in.
', '');
INSERT INTO content VALUES (147, 'download.html', 'Download', 0, 'main', '', 1, 'download zip tar gz', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<h2>Download</h2>
SPINE is downloadable on the <a href="http://spine.sf.net">SPINE Sourceforge Site</a>', 'Download stuff', '');
INSERT INTO content VALUES (148, 'features.html', 'Features', 0, 'main', '', 1, 'features', '2007-05-04 23:00:41', 'admin', 'admin', '0010', '<h2>Features</h2>
<dir>
<li>Easy to use Webbased administration: Administrate your site through web forms</li>
<li>Integrate components into your pages: Navigation bars, macros, message boards, page statistics, ...</li>
<li>Full template support: Easily switch between available styles or add custom styles</li>
<li>Supports Apache 1.3x and Apache 2.x (mod_perl v1 and v2) : Fast page loading and administration</li>
<li>Mix Static and Dynamic content transparently</li>
<li>Unix style access control restrictions: Permit access to pages based on usernames and usergroups.</li>
<li>Usergroup based adminstrative permissions: Restrict access to administrative panels based on usergroups.</li>
<li>Minimal requirements: Very few extra packages required.</li>
<li>File manager: Create folders and Copy, upload and rename files in a chrooted environment.</li>
<li>Extensive API: Developers can add both normal plugins and administration plugins. Integrate with Apache configuration and additional mod_perl handlers.</li>
<li>Uses database for storage: Support mysql &amp; postgresql</li>
<li>Short and search engine friendly URLs: Documents are visible are regular files</li>
<li>No data files: Load database, copy images files, copy Apache configuration and starting using. Single installation per webserver</li>
<li>Simultaneous unique setups</li>
<li>Native access logging with advanced details: browser, IP, ...</li>
<li>Manage any media type: Generate HTML, XML, CSS,..</li>
<li>Short learning process &amp; No programming required </li>
<li>Search engine plugin </li>
</dir>
', 'Features!!', '');
INSERT INTO content VALUES (149, 'faq.html', 'FAQ', 0, 'main', '', 1, 'faq frequently asked question answer', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Frequently Asked Questions</h2>
<p>Q: So you mean, this is free?!?</p>
<p>A: Yes, SPINE is free software. It''s released under the GPL. 
This mean that you can use and change the source code for any purpose you desire.
The only restriction is that if you distribute the software (or your modified version 
of the software), you must do so under the GPL. In a nutshell, you must make the source 
code available to whoever you distribute the software and you cannot restrict that 
person from also redistributing the results. See COPYING and COPYRIGHT for more information
on the GPL.</p>

<p>Q: Can I run multiple sites with this?</p>
<p>A: Yes, you can run several sites with this engine. You can use one database or use 
a database per site. You can define subsites, subdomains, define a default database, 
password or user. See INSTALL on how to add different sections.</p>

<p>Q: Where are all the files? Don''t I need config files and stuff?</p>
<p>A: All of the data is now stored in either the database or directly in apache''s httpd.conf.
You don''t need any external files. This has the advantage that shell call exploits are not 
possible. It''s also a lot easier to maintain several sites. The downside is that a quick hack 
by editing the files directly is no longer possible. You can however edit the entries in the 
database if you have SQL skills.</p>

<p>Q: So where do I put the other files?</p>
<p>A: You mean the .pm files? You put the both the SPINE/* and the Apache/* files in the shared perl modules directory.
You can easily install the perl modules with:</p>

<pre>  perl Makefile.PL
  make</pre>
  
<p>and as root (superuser)</p>

<pre>  make install</pre>
  
<p>This will make sure the files get copied into the right directories (plus, it generates man pages too ;) )</p>
  
<p>Q: I only see .html files on my site. Is this normal?</p>
<p>A: SPINE now works extremly transparently. You can generate any type of content without 
actually having that content. You can even make the visitor think he''s visiting an ASP, 
JSP or PHP based site.</p>

<p>Q: So there is no way of knowing if a website is using SPINE.</p>
<p>A: Well, there is a server signature in the generated error message, but that can be removed as well.</p>

<p>Q: Hey. Between releases, you changed the database table structure.</p>
<p>A: Didn''t you see this is all still under development? It''s quite stable but some features
haven''t been implemented yet so they will be fixed in next releases. Upgrading to a next 
version will probably break your current setup. </p>

<p>Q: I''d like to have one of those editor components in my administration section.</p>
<p>A: There are no plans in included that functionality in the core. There are plans of 
providing this feature as a patch. One of the reasons for this is that editor components
abuse certain browser features and are not really cross-browser compatible. You will probably
have to choose between a patch for Mozilla and one for Internet Explorer.</p>

<p>Q: I know this runs on Apache. What about IIS?</p>
<p>A: SPINE is written for mod_perl, a modular version of perl that attaches itself to the
Apache core and allows slick interaction between Apache processes and perl code. IIS currently
doesn''t support mod_perl. When it does, I might perform some tests. I realize the CGI version 
did (probably) work on a Windows platform but we just had to make certain sacrifices.</p>

<p>Q: Can I program my own components or even have extras in the administration?</p>
<p>A: SPINE has a really flexible and modular design. It''s quite easy to write your own handlers.
Check the Developers Notes for more information on both tag and administration handlers.</p>

<p>Q: Your SQL file does not work with *SOME RDBMS*. Are there any plans in supporting *THAT RDBMS*?</p>
<p>A: I''m always open for suggestions. I realize that using a different DBD will require adjusting both 
the stub data as some of the code. If you would like to share some of your knowledge on specific 
issues regarding this problem, don''t hesitate to contact me.</p>

<p>Q: You hardly have any documentation.</p>
<p>A: Yes, this is one of the vices of probably most programmers. They don''t document.
Bother me enough about it and I might just write some documentation.</p>
<p>Q: So how does it all work?</p>
<p>A: You create page (called a ''content''). You can name it just about anything. A content contains your general page contents. You select a style (similar to a page theme, layout) and you''re done.</p>

<p>Q: So what are all the tags about?</p>
<p>A: Besides the normal HTML tags, SPINE uses it''s own set of tags to indicate where to insert components. A good example is the title tag. Each content has a title attribute and you can insert that title in your content or style by adding a &lt;?SPINE_Title?&gt; tag.
Most tags are mapped to a SPINE Plugin and might require some parameters. Check the Plugin documentation to learn more about this.</p>

<p>Q: These tags look a lot like PHP tags. Are you using PHP?</p>
<p>A: The reason why the tags look like PHP tags is a legacy issue. The original SPINE concept was based on a CMS that was built in PHP in the late 1990s. To preserve compatibility, the tag formatting remained unchanged.</p>

<p>Q: So what if I already have a predesigned page. Can I create a content out of it?</p>
<p>A: You have two options. First, you can just keep the file and copy it in the defined location. SPINE can mix virtual and actual files without problems. If you wish to use some of the SPINE features (such as a page counter), you should create a content.
But you can keep the existing page layout completly. Create a new content page, copy the existing page layout HTML into the content body field and set the content style to ''blank''. The blank style is an empty style.</p>

<p>Q: I always need a style in a content?</p>
<p>A: Yes. The style body is merged with the content body to generate the actual page. There is an empty style (called ''blank'') that can be used if you want to store your entire page layout in the content.</p>

<p>Q: If I can keep my entire layout in the content, why would I use styles?</p>
<p>A: Styles allow you to define a page layout once and apply it to multiple contents. You can easily update your page style without having to change all the contents that are applied to it.</p>

<p>Q: So what should I store in the style and what should I store in the content?</p>
<p>A: The style typically contains your page layout. It''s the part of your page that is the same for every content. For simple sites, you use a single style and map it to all your contents. Nothing stops you from using a different style for each content.</p>

<p>Q: Where exactly is the content inserted in the style?</p>
<p>A: SPINE looks for a specific tag in the style that indicates where to insert the content. Each content that has this style defined, will be inserted into the style on the place of the marker.</p>

<p>Q: I see that the content and the style have several extra fields in the administration. What are they all about?</p>
<p>A: Each of those fields is either used for page generation or can be used as a tag. For instance, the permissions are used for access control. The Title attribute is mapped to the &lt;?SPINE_Title?&gt; tag.</p>

<p>Q: What if I don''t want to create a HTML file but a CSS file. Can I store it in SPINE too?</p>
<p>A: Yes. Create a content with the CSS extension (e.g style.css) and copy your CSS data into the content body. Set the style to ''blank'' (unless you have a style somewhere that has some predefined CSS that you want merged with the content).
Also set the correct content type. By default contents are set to content type ''text/html''. For CSS files, you need ''text/css''.</p>

<p>Q: What are these content types?</p>
<p>A: When a webserver serves data to a browser (e.g Internet Explorer), the browser needs to know how to handle the data. This is usually done by specifying what kind of data is sent.
Normally, the webserver sends a header along with the data. The header defines the data type (e.g text/html for HTML files, text/plain for text files, etc). Normally this happens transparently.
Your webserver usually guesses what data is sent. SPINE does not guess. You have to specify what data type you''re sending. If you leave the content type field empty, SPINE assumes you''re sending ''text/html'' (aka HTML) data.</p>

<p>Q: So what else can SPINE display?</p>
<p>A: Normally you can display any type of text data (XML, CSS, Javascript, HTML, etc). SPINE supports plugins and they can generate just about any data type you want. The PieStats plugin that is supplied with the SPINE package generates PNG images. See the PieStats documentation for more information.</p>

<p>Q: How come I can''t access certain pages but when I log in into the administration section, they are clearly there and I can edit them?</p>
<p>A: There are a number of possibilities but the most common reason why this happens is that you are not logged in when you try to load the pages. Try logging in (without going to the administration section) and then loading the pages.</p>

<p>Q: How come certain pages don''t show up in the search results but when I log in into the administration section, they are clearly there and I can edit them?</p>
<p>A: See the previous question. The search engine will only return pages to which you have access.</p>

<p>Q: When I search for a specific page with the search engine, the page is not in the results, although I have access to it.</p>
<p>A: The search engine uses search keywords and does not search on body contents. Define the keywords in the content administration.</p>

<p>Q: The search engine is very limited. How come this does not support the features you normally would expect from a search engine.</p>
<p>A: Because that''s normally part of the normal functionality of a content management system. The search engine is provided as a very basic tool. Extra plugins might offer the functionality you require.</p>

<p>Q: I want to keep notes on the content. Can I do this?</p>
<p>A: The content and style administration have comment fields. This information is purely for administrative purposes. You can use it to add notes on a current pages, keep a changes log or add copyright information.</p>

<p>Q: I have a number of CGI scripts I want to use on my page. I wish to include the required forms in a content. Can I do this?</p>
<p>A: Ofcourse. For a CGI script, a content is just like a normal HTML file. You can do whatever you want in it.</p>

<p>Q: Does SPINE support *FEATURE*?</p>
<p>A: SPINE currently focusses on what Content Management Systems are all about. There are plugins included that provide some of the basic requirements of website creating. External plugins might support the features you need.</p>

<p>Q: What are navigation bars all about?</p>
<p>A: Navigation bars are groups of links (sometimes buttons). The Administration backend has a navigation bar section where you can manage navigation bars.</p>

<p>Q: So can I mix images with plain links in a navigation bar?</p>
<p>A: Yes. If you don''t define an image link, the label is used as a link.</p>

<p>Q: So what about adding plain text in a navigation bar?</p>
<p>A: If you don''t specify a link, the label appears as plain text.</p>

<p>Q; What if I want to open the link in a different window or frame?</p>
<p>A: Each button on the navigation bar has extra preferences. Click on the Preferences icon on the right side, next to the delete button. The Preferences pane has a field to define the target frame or window.</p>

<p>Q: What if I want to define a specific CSS class to the button?</p>
<p>A: See above. The Preferences pane has a field to define a CSS class for the button.</p>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (150, '.message', '', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<table width="100%" border="0" bgcolor="#000000" cellspacing="1" cellpadding="0">
<tr width="100%"><td width="100%">
<table width="100%" border="0" bgcolor="#aaabbb" cellspacing="1" cellpadding="0">
<tr width="100%"><td width="100%">
<font size="2">Written on: <b><?SPINE_Message_Date?> <?SPINE_Message_Time?></b><br>Subject: <b><?SPINE_Message_Subject?></b>
<br>Written by: <b><?SPINE_Message_Owner?></b>
<br>Comments: <b><a href="<?SPINE_Page?>?group=<?SPINE_Message_Group?>&parent=<?SPINE_Message_Id?>"><?SPINE_Message_Comments?></a></b>
<br>Reply to: <b><a href="<?SPINE_Page?>?group=<?SPINE_Message_Group?>&id=<?SPINE_Message_Parent_Id?>"><?SPINE_Message_Parent_Subject?></a></b>
</font></td><tr>
</table>
<table width="100%" border="0" bgcolor="#aaabbb" cellspacing="1" cellpadding="0">
<tr width="100%"><td width="100%">
<?SPINE_Message_Body?>
</td></tr>
</table>
</td></tr>
</table><br>
', 'This is how a message will look like', '');
INSERT INTO content VALUES (151, '.admin-access', 'Administration Access', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '$error<table width="700" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
<tr bgcolor="#ffffff"><td>Admin Section</td>
<td>Usergroup</td>
<td colspan="2">Permissions&nbsp;(rwx)</td>
<td>&nbsp;</td></tr>
$list
</table>
', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (152, 'lorem.html', 'Lorem Ipsum', 0, 'simplebeauty.html', '', 1, 'lorem ipsum', '2007-08-06 20:18:49', 'admin', 'users', '1010', '<h2><?SPINE_Title?></h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec bibendum. Fusce eu arcu vel nunc auctor adipiscing. Phasellus mattis massa a est. Fusce lobortis. Aenean auctor, sapien a mollis porta, ligula tortor hendrerit turpis, posuere ultrices arcu eros non odio. Sed eros neque, convallis ut, euismod at, dapibus eget, eros. Donec lacinia, libero nec auctor porta, neque metus pellentesque nisl, non imperdiet wisi mauris vitae sem. Vestibulum at augue sed ligula suscipit ultricies. Donec ligula. Donec vitae dolor. Suspendisse potenti. Maecenas a lacus. Quisque vitae magna sollicitudin eros sagittis lobortis. Ut sed sem. Nullam at ligula sit amet urna ultrices tempus. Etiam vulputate lacus non neque. Nullam ornare nisl vel mi.</p>
<!--
<p>Morbi in sem. In condimentum, urna ac congue lacinia, risus augue faucibus nunc, in ultrices nunc elit at felis. Phasellus pretium consectetuer elit. Cras bibendum mi nec metus. Ut wisi tortor, laoreet id, gravida nec, commodo eget, wisi. Fusce eget tellus. Sed adipiscing. Phasellus neque purus, scelerisque ac, feugiat id, congue ut, mi. Aliquam pretium venenatis enim. Integer felis nisl, pulvinar eu, euismod et, sodales et, lectus. Sed ligula neque, pretium quis, pharetra vestibulum, pharetra non, pede. In arcu enim, accumsan vel, dignissim a, aliquam vitae, purus. Morbi nunc nulla, molestie nec, tempus vel, molestie a, velit. Morbi eu turpis quis lorem fringilla pharetra. Nulla purus est, commodo sit amet, sollicitudin a, eleifend sed, arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam est. Cras hendrerit arcu sit amet erat.</p>
-->
<p>Integer quis magna. Aenean pellentesque sapien nec nisl suscipit interdum. Nullam commodo purus vitae velit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas euismod semper metus. Quisque velit tellus, tempus in, ultricies at, luctus in, nulla. Pellentesque nonummy lectus quis leo. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque gravida metus nec nisl auctor posuere. Praesent suscipit lectus tempus urna. Aliquam libero tellus, cursus sit amet, tristique in, ullamcorper et, felis. Maecenas vel dui ac magna vulputate fermentum. Integer dolor elit, porta sed, adipiscing nec, auctor ut, magna. Duis nibh orci, tincidunt sed, ultricies vel, feugiat vitae, nisl. Phasellus urna. Maecenas non ipsum. Donec eu neque. Nullam tincidunt dapibus justo. Proin porttitor, mauris quis posuere commodo, ante dolor iaculis tortor, sodales elementum lacus felis a turpis.</p>', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '');
INSERT INTO content VALUES (153, 'changes.xml', '', 0, 'xml', '', 1, 'changes changelog xml', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<changes>
<?SPINE_XMLChanges?></changes>', 'changes since date. XML format', 'text/xml');
INSERT INTO content VALUES (154, 'env.html', 'STUB Content', 0, 'main', '', 1, 'environment plugin', '2007-07-26 23:40:17', 'admin', 'users', '1010', '<?SPINE_Env?>

<?SPINE_Env(''HTTP_HOST'')?> versus <?SPINE_Env(''SERVER_NAME'')?>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (155, 'tags.html', 'Tags', 0, 'main', 'main', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Using Tags in your content</h2>
<h3>&lt;?SPINE_Content?&gt;</h3>
Use this tag in the Style to indicate where the content is inserted.
<h3>&lt;?SPINE_Env?&gt;</h3>
This tag is mapped to the Environment plugin (SPINE::Handler::Env). It dumps all the environment variables.
<h3>&lt;?SPINE_Location?&gt;</h3>
This tag is mapped to the <i>Location</i> configuration in your Apache setup. For example, the location setup for the current host is : <pre><?SPINE_Location?></pre>
<h3>&lt;?SPINE_Login?&gt;</h3>
This tag generates the login form as used in <a href="login.html">the login page</a>.
<h3>&lt;?SPINE_Macro?&gt;</h3>
This tag is mapped to the Macro handler. Define which macro is loaded by setting the <i>Macros</i> list in the <i>Administration</i> section. Pass the keyword as a parameter. For example:
<pre>This is SPINE version &lt;?SPINE_Macro("SPINE_Version")?&gt;!</pre>
This is SPINE version <?SPINE_Macro("SPINE_Version")?>!</pre>
<h3>&lt;?SPINE_Message?&gt;</h3>
This tag is mapped to the Message handler. Pass the message group as parameter. For example:
<pre>&lt;?SPINE_Message("test")?&gt;</pre>
Pass the message ID as second parameter to display one message at a time.
<h3>&lt;?SPINE_Message_Body?&gt;</h3>
This tag is mapped to the Message handler. It can be used in the message content to change the position of the actual message.
<h3>&lt;?SPINE_Message_Comments?&gt;</h3>
This tag is mapped to the Message handler. This is the number of replies on this message.
<h3>&lt;?SPINE_Message_Date?&gt;</h3>
This tag is mapped to the Message handler. This is the date on which the message was posted.
<h3>&lt;?SPINE_Message_DateTime?&gt;</h3>
This tag is mapped to the Message handler. This is the date and time on which the message was posted.
<h3>&lt;?SPINE_Message_Group?&gt;</h3>
This tag is mapped to the Message handler. This is the message group.
<h3>&lt;?SPINE_Message_Id?&gt;</h3>
This tag is mapped to the Message handler. This is the message ID.
<h3>&lt;?SPINE_Message_Owner?&gt;</h3>
This tag is mapped to the Message handler. This is the message owner (usually the person posting the message).
<h3>&lt;?SPINE_Message_Parent_Id?&gt;</h3>
This tag is mapped to the Message handler. This is the parent message ID.
<h3>&lt;?SPINE_Message_Parent_Subject?&gt;</h3>
This tag is mapped to the Message handler. This is the parent message subject.
<h3>&lt;?SPINE_Message_Subject?&gt;</h3>
This tag is mapped to the Message handler. This is the message subject.
<h3>&lt;?SPINE_Message_Time?&gt;</h3>
This tag is mapped to the Message handler. This is the time on which the message was posted.
<h3>&lt;?SPINE_Navbar?&gt;</h3>
This tag is mapped to the Navigation Bar handler. Pass the message group as parameter. For example:
<pre>&lt;?SPINE_Navbar("main")?&gt;</pre>
<h3>&lt;?SPINE_Page?&gt;</h3>
This tag contains the current filename. For example:
<pre><?SPINE_Page?></pre>
<h3>&lt;?SPINE_PieStats?&gt;</h3>
This tag is mapped to the Pie Chart statistics plugin. This plugin generates PNG data. Make sure to set your <i>style</i> to <i>blank</i> and the <i>Content-Type</i> to <i>image/png</i>. This plugin requires additional modules and is not part of a default installation.
<h3>&lt;?SPINE_Referer?&gt;</h3>
This tag contains refering page. For example:
<pre><?SPINE_Referer?></pre>
<h3>&lt;?SPINE_Search?&gt;</h3>
This tag is mapped to the search engine plugin. This plugin will search through the content keywords and list the content names that match the query.
<h3>&lt;?SPINE_Servername?&gt;</h3>
This tag contains the servername. For example:
<pre><?SPINE_Servername?></pre>
<h3>&lt;?SPINE_Stats?&gt;</h3>
This tag is mapped to the statistics handler. Required plugin is either <i>hits</i> or <i>modified</i>. Hits can be used for a page visitor counter. <pre><?SPINE_Stats("hits")?> visits.</pre>Modified will display the modification date of the page.
<pre><?SPINE_Stats("modified")?> visits.</pre>
<h3>&lt;?SPINE_Title?&gt;</h3>
This tag contains the page title. It is constructed of the <i>content</i> and the <i>style</i> title value. For example:
<pre><?SPINE_Title?></pre>
<h3>&lt;?SPINE_User?&gt;</h3>
This tag contains the logged in user. For example:
<pre><?SPINE_User?></pre>
<h3>&lt;?SPINE_Webmaster?&gt;</h3>
This tag contains the site webmaster. This value is defined in the Apache configuration for the location. For example:
<pre><?SPINE_Webmaster?></pre>
<h3>&lt;?SPINE_Wiki?&gt;</h3>
This tag is mapped to the Wiki plugin. 
<h3>&lt;?SPINE_XMLChanges?&gt;</h3>
This tag is mapped to the XML Changes plugin. It will generate XML output of the most recent changes. Make sure to set your <i>style</i> to <i>xml</i> and the <i>Content-Type</i> to <i>text/xml</i>.
', 'This page lists the tags that can be used in the pages.', '');
INSERT INTO content VALUES (156, 'gallery.html', 'Picture Gallery', 0, 'main', '', 1, 'gallery plugin pictures', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<?SPINE_ImageGallery("pictures")?>', 'ImageGallery plugin example', '');
INSERT INTO content VALUES (157, 'wiki', 'STUB Content', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<?SPINE_Wiki?><br><hr>
<?SPINE_Stats("modified")?>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (159, 'install.html', 'Installation Notes', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Installation Notes for Spine v1.2</h2>
<u>Requirements</u><br><br>
Spine has very few dependencies.
<ul>
<li>Apache 1.X (development is based on version 1.3.28 and tested on 1.3.33)<br>or<br>
Apache 2.X (development is based on version 2.054)
</li>
<li>mod_perl 1.X (development is based on version 1.27 and tested on 1.29)<br>or<br>
mod_perl 2.X (development is based on version 2.01)</li>
<li>Apache::Request [libapreq] (development is based on version 1.2 and tested on 1.33)<br>or<br>
apreq2 (development is based on version 2.5.7)
</li>
<li>Digest::MD5 (development on version 2.20 and tested on 2.33)</li>
<li>DBI (development on version 1.32 and tested on 1.40)</li>
<li>DBD::Mysql (development on version 2.1021 and tested on 2.9004)<br>or<br>
DBD::Pg (development on version 1.4.2)</li>
<li>Apache::DBI (development on version 0.91 and tested on 0.94)</l>
<li>Mysql 3.X<br>or<br>
Postgresql (development is based on version 7.4)</li>
</ul>

<u>Installation on Debian</u><br><br>
On Debian, install the following packages :
<ul>
<li>apache-perl</li>
<li>libapache-dbi-perl</li>
<li>libdbd-mysql-perl</li>
<li>mysql-client</li>
<li>mysql-server</li>
<li>libapache-request-perl</li>
</ul>

<u>Mysql Configuration</u><br><br>
Development is based on mysql and postgresql.<br><br>
See <a href="mysqldb.html">Using Mysql with Spine</a> or <a href="postgresqldb.html">Using Postgresql with Spine</a>
<br><br>
<u>Perl Modules Installation</u><br><br>

There is a perl makefile included. Install the modules in the default perl location with:
<pre>
  bash# perl Makefile.PL
  bash# make</pre>
  
and as root (superuser)
<pre>
  bash# make install</pre>

Make sure you have Apache::Request installed. If you have questions about installing this, consult the administrator.<br><br>

<u>Apache Configuration</u><br><br>

Spine is developed for Apache & mod_perl 1.3.x. Installations on Apache2 & mod_perl2 will not work.
<br><br>
Edit your apache config file (by default httpd.conf) as follows :
<pre>
&lt;IfModule mod_perl.c&gt;
 # PerlModule Apache::DBI
 # Remove the # above if you have Apache::DBI installed and you wish to use it

  &lt;Location /spine&gt;
           SetHandler perl-script
           PerlHandler Apache::SPINE::Index
           PerlSetVar dbd mysql
           PerlSetVar dbname spine
           PerlSetVar dbuser user
           PerlSetVar dbpwd password
           PerlSetVar main index.html
           PerlSetVar webmaster ''John Doe''
           PerlSetVar sitename ''SPINE Example site'' 
           PerlSetVar chroot /home/www/html
           PerlLogHandler Apache::SPINE::Log
  &lt;/Location&gt;

&lt;/IfModule&gt;</pre>

If your Apache configuration is set up to allow drop in configuration files, use <pre>apache-conf.incl</pre> as a template. On Debian installations, copy the configuration files in

<pre>
/etc/apache-perl/conf.d</pre>

<ul>
<li>The dbname is the database name (you defined earlier).</li>
<li>The dbuser is the user as which you connect to mysql (consult your mysql documentation for this setting)</li>
<li>The dbpwd is the user password you use to connect to mysql (consult your mysql documentation for this setting)</li>
<li>The main variable is ''content'' name that is loaded by default (like a index.html).</li>
</ul>

If your Apache configuration is set up to allow drop in configuration files, use <i>apache-conf.incl</i> as a template. On Debian installations, copy the configuration files in

<pre>
/etc/apache-perl/conf.d</pre>
<br>
Restart the webserver, by default by running
<pre>
apachectl restart</pre>
On Debian installations, restart Apache with
<pre>
./etc/init.d/apache-perl restart</pre>
Loading Apache::DBI will improve the access speed to the database by pooling connections. Apache::DBI is not required but recommended. Set the virtual directory you want to use in the location tag.
<pre>
&lt;Location /directory&gt;</pre>

Existing directories and files will still work properly.
By default, SPINE will use the mysql DBD driver (You still need this installed on your system - see Requirements list). If you wish to use a different DBD, fill in the appropriate value.
<pre>
PerlSetVar dbd Pg</pre>

If you doubt, ask your system administrator.
You can define which database to use for the current virtual directory.
<pre>
PerlSetVar dbname spine</pre>

If you have multiple virtual directories, this setting can prevent record overlapping.
<pre>
  &lt;Location /bob&gt;
           ...
           PerlSetVar dbname bobdb
           PerlSetVar dbuser bob
            ...
  &lt;/Location&gt;

  &lt;Location /john&gt;
           ...
           PerlSetVar dbname johndb
           PerlSetVar dbuser john
            ...
  &lt;/Location&gt;</pre>
Just make sure you install the default database data first in both databases.
Using the main variable, you can define which content will be used by default.
<pre>
PerlSetVar main index.html</pre>

SPINE defined some hardcoded macros. One of those tags is

<pre>
&lt;?SPINE_Webmaster?&gt;</pre>

This tag will be swapped with the value defined in the webmaster variable.
<pre>
PerlSetVar webmaster ''John Doe''</pre>

Another hardcoded macro is the sitename. The macro defined for this value is

<pre>
&lt?SPINE_Sitename?&gt;</pre>

This tag will be swapped with the value defined in the sitename variable.

<pre>
PerlSetVar sitename ''SPINE Example site'' </pre>
<u>Copy Images</u><br>
Copy the images from the images subdir to your main images directory (eg. /var/www/images)
<br><br>

<u>Starting using Spine</u>
<br><br>
Go to <pre>http://SERVERNAME/LOCATION/login.html</pre> and use the credentials below:
Default login info:   <ol>
<li>User:admin</li>
<li>Password:  foo</li>
</ol>', 'Installation instruction', 'text/html');
INSERT INTO content VALUES (160, 'spine2.css', '', 0, 'blank', '', 1, 'text/css', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'html, body {
	margin: 0 auto;
	padding: 0px;
	background-color: #224466;
	text-align: center;
	width: 774px;
	height: 100%;
	margin-bottom: 1px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

body {
   font-family: Verdana, Arial, Helvetica, sans-serif;
   color: #333333;
   font-size: 72%;
}

#logo {
	text-align: left;
	float: left;
	margin: 2px 0px 0px 15px;
	color: #FFFFFF;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 45px;
	font-style: normal;
	font-weight: bolder;
}

#page {
   padding: 0px;
   width: 770px;
   background: white; 
}

#headerRegion {
   margin: 1px;
   padding: 0px;
   width: 768px;
   height: 75px;
   background: #3F3F3F;
}

#topMenuBar {
	margin: 0px 0px 0px 1px;
	padding: 0px;
	width: 768px;
	height: 24px;
	text-align:left;
	/*background-color: #333399;*/
	background-color: #665;
}

#TopMenuList {
   list-style: none;
   padding: 0px;
   margin: 0px;
}

#contentRegion {
   position: relative;
   margin: 0px;
   padding: 0px;
   width: 770px;
   text-align:left;
}

#contentBox {
	padding: 0px 15px 0px 15px;
	margin: 0px 0px 15px 0px;
	text-align: left;
}

.drkBrdrAll {	border: 1px solid #666;          }

#footerRegion {
	margin: 0px;
	padding: 0px 1px 0px 1px;
	background: black;
	height: 20px;
	width: 770px;
	display: block;
	text-align: left;
	color: #FFFFFF;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

a {
   text-decoration:none;
   color:#06C;
}
a:visited {
   color:#06C;
}
a:hover {
   color:#06C;
   text-decoration:underline;
}
a:active {
   color:#06C;
}

ul, ol {
   margin-top:5px;
}

img {
   font-size:80%;
   font-weight:bold;
}

.clearthis {
   clear: both;
   float: none;
   font-size: 1px;
   color: white;
}

#menu {
	border-bottom: 1px solid #000000;
	padding-left: 1em;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 16px;
	font-style: normal;
}

#menu a {
	padding: 10px 5px;
	color: #000000;
	border: 0;
	margin: 0;
	position: relative;
}

/* Front Page News */

h2.news {
	border-bottom: 1px solid #CCC;
	padding-top: 1em;
	padding-bottom: 0.4em;
	font-size: 1.2em;
	border-bottom: 1px solid #000;
}

div.newsdate {
	text-align: right;
	color: #444;
	font-weight: bold;
	font-size: 0.95em;
}

div.newsdate a:link	{ color: #666; text-decoration: none; }
div.newsdate a:visited	{ color: #4462b7; text-decoration: none; }
div.newsdate a:hover	{ color: #00C; text-decoration: underline; }
div.newsdate a:active	{ color: #000; text-decoration: underline; }', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (161, 'toc.html', 'Table of Contents', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<pre>
Installation

cfr Install.html

Configuration

cfr Install.html

Site Administration
 Getting Started
 - The first step in building your Spine site is selecting the style. 
   The style is usually defined once and contains the static section of each page.
   This is where you define what your page looks like: what colors to use, where to put a menu bar, define CSS style sheets, etc.
   Spine elements that are generally placed in the Style include Navbars, Macros and Page visit statistics.
 - Once you defined your own page style, start by creating content. The name of the content file is the filename you use in your URL.
   e.g. There is a content called ''index.html''. 
   Your complete page output is a merge of the style and the content (together with all the smaller elements you have defined in either).
 General
 Content
   Creating New Content
   - ...
   - If you create a content that already exists, the existing content is not overwritten but loaded in the Edit pane.
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.
   Editing Existing Content
   - ...
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.

   - Click on the "Advanced" button to show the advanced content properties.
     -> ...
   Copying Content
   - To copy a content from your setup, select the name from the dropdown box, provide the Content target name and press the Copy button.
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.
   Deleting Content
   - To delete a content from your setup, select the name from the dropdown box and press the Delete button. Confirm your action by pressing "OK" in the Java popup.
   - Only the content files visible to you are included in the dropdown list.
   - As Administrator, you have access to all contents.
 Style
   Creating New Styles
   Editing Existing Styles
   Copying Styles
   Deleting Styles
 Navbar
   Creating New Navbars
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Messages
   Creating New Messages
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Macros
   Creating New Navbars
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Users
   Creating New Navbars
   Editing Existing Navbars
   Copying Navbars
   Deleting Navbars
 Filemanager
   Uploading Files
   Creating Folders

Advanced
 Database
 Development
   Content Handlers
   Admin Handlers

Reference
  Tag Reference
Index


Including CSS files in Spine
-
You can include any type of data in your content. Make sure you define the correct content-type. Define any static sections of your content in the style or use an empty stylesheet.

Hidden Files
...







Test Plan
---------

- Create Content that already exists
- Create Content that already exists but is not writeable
- Edit a Content that doesn''t exist
- Copy a Content that doesn''t exist
- Copy a Content that does exist to a Content that does exist
- Copy a Content that does exist but is not readable
- Copy a Content that does exist to a Content that does exist but is not readable
- Remove a Content that doesn''t exist
- Remove a Content that does exist but is not writeable
- Save a Content that doesn''t exist
- Save a Content that does exist but is not writeable
- Set Content to restricted and try to access it as a different user.

</pre>', 'This is a stub Table of Contents that I''m using to write documentation for.', '');
INSERT INTO content VALUES (162, 'docs.html', 'Documentation', 0, 'main', '', 1, 'documentation faq howto tips development', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Documentation</h2>
<?SPINE_Navbar("docs")?>', 'Listing available documentation', '');
INSERT INTO content VALUES (163, 'screenshots.html', 'Screenshots', 0, 'main', '', 1, '', '2007-02-22 23:11:32', 'admin', 'users', '1010', '<h2>Screenshots</h2>
<center>
<a href="<?SPINE_Images?>screenshot/content.png"><img src="<?SPINE_Images?>screenshot/content.png" border="0" width="431" height="458"></a><br>Content Administration</a>
<br><br>

<a href="<?SPINE_Images?>screenshot/fileman.png"><img src="<?SPINE_Images?>screenshot/fileman.png" border="0" width="432" height="168"></a><br>File Manager</a>
<br><br>

<a href="<?SPINE_Images?>screenshot/navbar.png"><img src="<?SPINE_Images?>screenshot/navbar.png" border="0" width="432" height="308"></a><br>Navigation Bar Administration</a>
<br><br>

<a href="<?SPINE_Images?>screenshot/stats.png"><img src="<?SPINE_Images?>screenshot/stats.png" border="0" width="432" height="306"></a><br>Visitor Statistics</a>
<br><br>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (164, 'alternate.html', 'Alternative Datatypes', 0, 'main', '', 1, 'data datatype development', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Alternative Datatypes</h2>
Besides HTML, you can also generate any type of data you wish. You can define a content type to each content.
SPINE contains examples of both plain text content and binary content.<br><br>

<u>changes.xml - plain text content</u><br>
changes.xml generates an XML feed of changes since a certain date. The content type for this content is set to text/xml.
changes.xml uses a style, called xml. The content itself has some extra XML tags and a SPINE tag plugin. The XMLChanges plugin will generate XML data and will insert it into the style.
<br><br>
For instance :
<pre>
&lt;?xml version="1.0"?&gt;
&lt;changes&gt;
&lt;content name="admin-content" modified="2003-12-22 00:00:59"/&gt;
&lt;content name="admin-message" modified="2003-12-21 02:06:10"/&gt;
&lt;content name="changes.xml" modified="2003-12-22 00:11:30"/&gt;
&lt;content name="graph_stat.png" modified="2003-12-21 13:24:54"/&gt;
&lt;content name="messagetest.html" modified="2003-12-21 01:03:41"/&gt;
&lt;content name="_admin-content-adv" modified="2003-12-22 00:03:11"/&gt;
&lt;/changes&gt;
</pre>
Only the first line is part of the style. The second and last line are hardcoded in the content. The remaining lines are generated by the plugin.<br><br>

<u>graph_stat.png - binary content</u><br>
graph_stat.png generates PNG data of the requests statistics from the log handler. The content type for this content is set to image/png.
graph_stat.png uses an empty style. The content itself (and therefor the entire data part) only contains PieStats plugin. The results of this plugin is PNG data. The plugin itself still allows passing parameters.
<br><br>
for instance : 
<pre>graph_stat.png?page=index&category=useragent</pre>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (165, 'tinymce.html', 'TinyMCE Support', 0, 'main', '', 1, 'tinymce wysiwyg editor', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Unofficial support for TinyMCE in SPINE</h2>

SPINE does not include one of those fancy DHTML textareas by default although tweaks have been added to make it quite easy to include one. <a href="http://tinymce.moxiecode.com/">TinyMCE</a> is the only editor tested with SPINE. <br>
<ol><li><a href="http://tinymce.moxiecode.com/download.php">Get the latest version</a> of TinyMCE (tested version: 2.0.1)</li>
<li><a href="http://sourceforge.net/tracker/index.php?func=detail&aid=1320240&group_id=103281&atid=738747">Get the latest version</a> of the codeprotect plugin.</li>
<li>Unzip the TinyMCE archive</li>
<li>Copy the jscripts directory on your webspace (e.g /var/www/jscripts/)</li>
<li>Unzip the CodeProtect archive</li>
<li>Copy the codeprotect subdirectory into the plugins directory of the TinyMCE subdirectory on your webspace (e.g /var/www/jscripts/tiny_mce/plugins)</li>
<li>Log into SPINE as administrator</li>
<li>Make a copy of .content-admin to .content-admin.orig</li>
<li>Make a copy of .content-admin to .content-admin.tinymce</li>
<li>Create a tinymce_init.js file in the jscripts/tiny_mce directory and define the following content:
<pre>        tinyMCE.init({
                mode : "exact",
                elements : "body",
                theme : "advanced",
                plugins : "table,save,advhr,advimage,advlink,,insertdatetime,flash,searchreplace,contextmenu,paste,directionality,codeprotect",
                theme_advanced_buttons1_add : "fontselect,fontsizeselect",
                theme_advanced_buttons2_add : "separator,insertdate,inserttime,separator,forecolor,backcolor",
                theme_advanced_buttons2_add_before: "cut,copy,paste,separator,search,replace,separator",
                theme_advanced_buttons3_add_before : "tablecontrols,separator",
                theme_advanced_buttons3_add : "flash,advhr,separator,ltr,rtl",
                theme_advanced_toolbar_location : "top",
                theme_advanced_toolbar_align : "left",
                theme_advanced_statusbar_location : "bottom",
                content_css : "example_word.css",
                plugi2n_insertdate_dateFormat : "%Y-%m-%d",
                plugi2n_insertdate_timeFormat : "%H:%M:%S",
                extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
                external_link_list_url : "example_link_list.js",
                external_image_list_url : "example_image_list.js",
                flash_external_list_url : "example_flash_list.js",
                file_browser_callback : "fileBrowserCallBack",
                paste_use_dialog : false,
                theme_advanced_resizing : true,
                theme_advanced_resize_horizontal : false,
                theme_advanced_link_targets : "_something=My somthing;_something2=My somthing2;_something3=My somthing3;",
                paste_auto_cleanup_on_paste : true,
                paste_convert_headers_to_strong : false,
                paste_strip_class_attributes : "all"
        });

        function fileBrowserCallBack(field_name, url, type, win) {
                // This is where you insert your custom filebrowser logic
                alert("Filebrowser callback: field_name: " + field_name + ", url: " + url + ", type: " + type);

                // Insert new URL, this would normaly be done in a popup
                win.document.forms[0].elements[field_name].value = "someurl.htm";
        }
</pre></li>

Important:
To edit the .admin files, change the editor back to the normal textarea (backing up the editor version of .admin-content and copying the original editor in place).', '', '');
INSERT INTO content VALUES (166, 'quickstart.html', 'Getting Started', 0, 'main', '', 1, 'quick start tutorial documentation', '2007-02-22 23:14:51', 'admin', 'users', '1010', '<h2>Getting Started with Spine</h2>
<u>Step 1: Login</u><br>
Select the Login link.<br>
<dir><img src="<?SPINE_Images?>step1a.png" border="1"></dir>
Use <i>admin</i> as username and <i>foo</i> as password and click on the <i>login</i> button.<br>
<dir><img src="<?SPINE_Images?>step1b.png" border="1"></dir>
The login page now indicates if the login was successful.<br>
<dir><img src="<?SPINE_Images?>step1c.png" border="1"></dir>
<u>Step 2: Administration</u><br>
You are now in the <i>Administration</i> section of the site. Enter <i>welcome.html</i> in the <i>New content</i> input field and click on the <i>Create</i> button.<br>
<dir><img src="<?SPINE_Images?>step2.png" border="1"></dir>
<u>Step 3: Creating your first page.</u><br>
This is the <i>Content Administration</i> for <i>welcome.html</i>. Some stub values are already in place.<br>
<dir><img src="<?SPINE_Images?>step3a.png" border="1"></dir>
Fill in your page body in the main text area. Leave the <i>Style</i> selection unchanged for now. Click on the <i>Save</i> button when you''re done.<br>
<dir><img src="<?SPINE_Images?>step3b.png" border="1"></dir>

<u>Step 4: View the result</u><br>
Click on the <i>Logout</i> link and load <i>welcome.html</i>.<br>
<dir><img src="<?SPINE_Images?>step4.png" border="1"></dir><b>You''re done!</b>

', 'This is a very quick way to start editing pages in SPINE.', '');
INSERT INTO content VALUES (167, 'license.html', '', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<pre>
The General Public License (GPL)
Version 2, June 1991

Copyright (C) 1989, 1991 Free Software Foundation, Inc. 675 Mass Ave,
Cambridge, MA 02139, USA. Everyone is permitted to copy and distribute
verbatim copies of this license document, but changing it is not allowed.

Preamble

The licenses for most software are designed to take away your freedom to share
and change it. By contrast, the GNU General Public License is intended to
guarantee your freedom to share and change free software--to make sure the
software is free for all its users. This General Public License applies to most of
the Free Software Foundation''s software and to any other program whose
authors commit to using it. (Some other Free Software Foundation software is
covered by the GNU Library General Public License instead.) You can apply it to
your programs, too.

When we speak of free software, we are referring to freedom, not price. Our
General Public Licenses are designed to make sure that you have the freedom
to distribute copies of free software (and charge for this service if you wish), that
you receive source code or can get it if you want it, that you can change the
software or use pieces of it in new free programs; and that you know you can do
these things.

To protect your rights, we need to make restrictions that forbid anyone to deny
you these rights or to ask you to surrender the rights. These restrictions
translate to certain responsibilities for you if you distribute copies of the
software, or if you modify it.

For example, if you distribute copies of such a program, whether gratis or for a
fee, you must give the recipients all the rights that you have. You must make
sure that they, too, receive or can get the source code. And you must show
them these terms so they know their rights.

We protect your rights with two steps: (1) copyright the software, and (2) offer
you this license which gives you legal permission to copy, distribute and/or
modify the software.

Also, for each author''s protection and ours, we want to make certain that
everyone understands that there is no warranty for this free software. If the
software is modified by someone else and passed on, we want its recipients to
know that what they have is not the original, so that any problems introduced by
others will not reflect on the original authors'' reputations.

Finally, any free program is threatened constantly by software patents. We wish
to avoid the danger that redistributors of a free program will individually obtain
patent licenses, in effect making the program proprietary. To prevent this, we
have made it clear that any patent must be licensed for everyone''s free use or
not licensed at all.

The precise terms and conditions for copying, distribution and modification
follow.

GNU GENERAL PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND
MODIFICATION

0. This License applies to any program or other work which contains a notice
placed by the copyright holder saying it may be distributed under the terms of
this General Public License. The "Program", below, refers to any such program
or work, and a "work based on the Program" means either the Program or any
derivative work under copyright law: that is to say, a work containing the
Program or a portion of it, either verbatim or with modifications and/or translated
into another language. (Hereinafter, translation is included without limitation in
the term "modification".) Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not covered by
this License; they are outside its scope. The act of running the Program is not
restricted, and the output from the Program is covered only if its contents
constitute a work based on the Program (independent of having been made by
running the Program). Whether that is true depends on what the Program does.

1. You may copy and distribute verbatim copies of the Program''s source code as
you receive it, in any medium, provided that you conspicuously and appropriately
publish on each copy an appropriate copyright notice and disclaimer of warranty;
keep intact all the notices that refer to this License and to the absence of any
warranty; and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and you may at
your option offer warranty protection in exchange for a fee.

2. You may modify your copy or copies of the Program or any portion of it, thus
forming a work based on the Program, and copy and distribute such
modifications or work under the terms of Section 1 above, provided that you also
meet all of these conditions:

a) You must cause the modified files to carry prominent notices stating that you
changed the files and the date of any change.

b) You must cause any work that you distribute or publish, that in whole or in
part contains or is derived from the Program or any part thereof, to be licensed
as a whole at no charge to all third parties under the terms of this License.

c) If the modified program normally reads commands interactively when run, you
must cause it, when started running for such interactive use in the most ordinary
way, to print or display an announcement including an appropriate copyright
notice and a notice that there is no warranty (or else, saying that you provide a
warranty) and that users may redistribute the program under these conditions,
and telling the user how to view a copy of this License. (Exception: if the
Program itself is interactive but does not normally print such an announcement,
your work based on the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole. If identifiable
sections of that work are not derived from the Program, and can be reasonably
considered independent and separate works in themselves, then this License,
and its terms, do not apply to those sections when you distribute them as
separate works. But when you distribute the same sections as part of a whole
which is a work based on the Program, the distribution of the whole must be on
the terms of this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest your rights to
work written entirely by you; rather, the intent is to exercise the right to control
the distribution of derivative or collective works based on the Program.

In addition, mere aggregation of another work not based on the Program with the
Program (or with a work based on the Program) on a volume of a storage or
distribution medium does not bring the other work under the scope of this
License.

3. You may copy and distribute the Program (or a work based on it, under
Section 2) in object code or executable form under the terms of Sections 1 and 2
above provided that you also do one of the following:

a) Accompany it with the complete corresponding machine-readable source
code, which must be distributed under the terms of Sections 1 and 2 above on a
medium customarily used for software interchange; or,

b) Accompany it with a written offer, valid for at least three years, to give any
third party, for a charge no more than your cost of physically performing source
distribution, a complete machine-readable copy of the corresponding source
code, to be distributed under the terms of Sections 1 and 2 above on a medium
customarily used for software interchange; or,

c) Accompany it with the information you received as to the offer to distribute
corresponding source code. (This alternative is allowed only for noncommercial
distribution and only if you received the program in object code or executable
form with such an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for making
modifications to it. For an executable work, complete source code means all the
source code for all modules it contains, plus any associated interface definition
files, plus the scripts used to control compilation and installation of the
executable. However, as a special exception, the source code distributed need
not include anything that is normally distributed (in either source or binary form)
with the major components (compiler, kernel, and so on) of the operating system
on which the executable runs, unless that component itself accompanies the
executable.

If distribution of executable or object code is made by offering access to copy
from a designated place, then offering equivalent access to copy the source
code from the same place counts as distribution of the source code, even though
third parties are not compelled to copy the source along with the object code.

4. You may not copy, modify, sublicense, or distribute the Program except as
expressly provided under this License. Any attempt otherwise to copy, modify,
sublicense or distribute the Program is void, and will automatically terminate
your rights under this License. However, parties who have received copies, or
rights, from you under this License will not have their licenses terminated so long
as such parties remain in full compliance.

5. You are not required to accept this License, since you have not signed it.
However, nothing else grants you permission to modify or distribute the Program
or its derivative works. These actions are prohibited by law if you do not accept
this License. Therefore, by modifying or distributing the Program (or any work
based on the Program), you indicate your acceptance of this License to do so,
and all its terms and conditions for copying, distributing or modifying the
Program or works based on it.

6. Each time you redistribute the Program (or any work based on the Program),
the recipient automatically receives a license from the original licensor to copy,
distribute or modify the Program subject to these terms and conditions. You
may not impose any further restrictions on the recipients'' exercise of the rights
granted herein. You are not responsible for enforcing compliance by third parties
to this License.

7. If, as a consequence of a court judgment or allegation of patent infringement
or for any other reason (not limited to patent issues), conditions are imposed on
you (whether by court order, agreement or otherwise) that contradict the
conditions of this License, they do not excuse you from the conditions of this
License. If you cannot distribute so as to satisfy simultaneously your obligations
under this License and any other pertinent obligations, then as a consequence
you may not distribute the Program at all. For example, if a patent license would
not permit royalty-free redistribution of the Program by all those who receive
copies directly or indirectly through you, then the only way you could satisfy
both it and this License would be to refrain entirely from distribution of the
Program.

If any portion of this section is held invalid or unenforceable under any particular
circumstance, the balance of the section is intended to apply and the section as
a whole is intended to apply in other circumstances.

It is not the purpose of this section to induce you to infringe any patents or other
property right claims or to contest validity of any such claims; this section has
the sole purpose of protecting the integrity of the free software distribution
system, which is implemented by public license practices. Many people have
made generous contributions to the wide range of software distributed through
that system in reliance on consistent application of that system; it is up to the
author/donor to decide if he or she is willing to distribute software through any
other system and a licensee cannot impose that choice.

This section is intended to make thoroughly clear what is believed to be a
consequence of the rest of this License.

8. If the distribution and/or use of the Program is restricted in certain countries
either by patents or by copyrighted interfaces, the original copyright holder who
places the Program under this License may add an explicit geographical
distribution limitation excluding those countries, so that distribution is permitted
only in or among countries not thus excluded. In such case, this License
incorporates the limitation as if written in the body of this License.

9. The Free Software Foundation may publish revised and/or new versions of the
General Public License from time to time. Such new versions will be similar in
spirit to the present version, but may differ in detail to address new problems or
concerns.

Each version is given a distinguishing version number. If the Program specifies a
version number of this License which applies to it and "any later version", you
have the option of following the terms and conditions either of that version or of
any later version published by the Free Software Foundation. If the Program does
not specify a version number of this License, you may choose any version ever
published by the Free Software Foundation.

10. If you wish to incorporate parts of the Program into other free programs
whose distribution conditions are different, write to the author to ask for
permission. For software which is copyrighted by the Free Software Foundation,
write to the Free Software Foundation; we sometimes make exceptions for this.
Our decision will be guided by the two goals of preserving the free status of all
derivatives of our free software and of promoting the sharing and reuse of
software generally.

NO WARRANTY

11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS
NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE
COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM
"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE,
YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
CORRECTION.

12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED
TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY
WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS
PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM
(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY
OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS
BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

END OF TERMS AND CONDITIONS
</pre>', 'This is the GNU GPL License.', 'text/html');
INSERT INTO content VALUES (169, 'login.html', '', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Login</h2>
<?SPINE_Login?>
', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (170, 'changelog.html', 'changelog', 0, 'main', '', 1, 'changes changelog update code status', '2007-08-28 17:46:44', 'admin', 'users', '1010', '<pre>
ChangeLog
=========
Release - 1.3 beta
- Added to Package : Wizard and style thumbnails
- Added to Package : Advanced caching
- Added to Package : initial code for CGI backport
- Added in Admin : Locked content in Content Administration panel
- Added to Admin : Upload as plugin
- Added to Admin : Attributes in content admin panel
- Added in Admin : binary content body support
- Added in Admin : Addd MIME type detection in content
- Added to Core :  Picasa gallery plugin
- Added to Core : Added plugin: Edit Page
- Added to Core : Added plugin: Tags
- Added to Core : Added plugin: Slideshow
- Added to Core : WizardStyles (for Wizard)
- Added to Core : Messages as RSS plugin
- Added to Core : Configurable images path
- Fixed in Admin : logging bug
- Fixed in Core : small bugs
- Updated in Core : Code cleanup
- Updated in Admin : Administration GUI changes
- Updated in Core : More i18n preparation
- Updated in Database : Mime types and statistics

Release - 1.22 - Fixes
- Fixed in Admin : Referer check
- Fixed in Admin : Arbitrary password 

Release - 1.2 - Stable
- Added in Package : 8 new styles
- Added in Admin : Forced POST access (prevent XSS)
- Added to Core : Code documentation
- Updated in Admin : Cosmetic fixes (Thanks Tielman)
- Updated in Package : New style screenshots
- Updated in Core : Cleaned up code.. ALOT
- Updated in Core : Updated and optimized database handler code
- Fixed in Core : Placeholders in database handler : security fix
- Fixed in Core : Cleaned up Apache 2 handler
- Fixed in Core : True versus Virtual file precedence fix
- Fixed in Core : here-doc quote bug
- Fixed in Core : Apache 2 document root bug
- Fixed in Core : main document bug
- Fixed in Core : Extra trailing separator in Navbar fix (Thanks Tielman)
- Fixed in Admin : Macro admin security bug fix
- Fixed in Admin : Unexisting admin panel fix
- Fixed in Admin : Title bug in admin panel
- Fixed in Admin : Adminaccess save and delete bug
- Fixed in Admin : Small HTTP status fix (Forbidden vs Not Found)
- Fixed in Package : Added (finally) support for logging : enable/disable access logging
- Updated in Documentation : Added Style quickstart

Release - 1.2 beta
- Added in Package : new 4 styles
- Added in Package :  support for mod_perl 2
- Added in Package : initial support to change message order (TODO: Add this to GUI)
- Fixed in Package : Postgres permission issues
- Fixed in Package : document root bug (SF bug ticket 1450821)
- Fixed in Package : File Manager ''delete'' message bug (SF bug ticket 1450814)
- Fixed in Package : File Manager upload filename bug (SF bug ticket 1460304)
- Added in Package : support for native HTTP status for 404 and 403
- Updated in Documentation :  database setup
- Updated in Documentation : example on using Databases in plugin
- Fixed in Admin : Wiki administration and fixed initial bugs
- Fixed in Admin : Radio button bug in IE ; Root path actions
- Added in Admin : basic support for internationalization
- Fixed in Plugins : small bug in ImageGallery plugin

Release - 1.1 - Stable
- Fixed in Package : Updated MANIFEST (some handlers were missing)
- Fixed in Package : Removed deprecated images
- Fixed in Package : Added new buttons & screenshots
- Fixed in Pages : Current page is included in login page (redirect login page after login)
- Fixed in Pages : Added new styles
- Fixed in Plugins : Added support for limited message queries (limit and offset)
- Fixed in Plugins : Fixed filename filter in Image Gallery
- Fixed in Plugins : Fixed zero value of Counter plugin
- Fixed in Plugins : Fixed access control in Search plugin
- Fixed in Plugins : Message handler : Fixed lots of bugs
- Fixed in Plugins : Fixed URI bug in Image Gallery
- Fixed in Handlers : Fixed macro bug in Content handler
- Fixed in Handlers : Optimized visited page statistics
- Fixed in Admin : Fixed sorting of Message, Navbar, Statistics front-end
- Fixed in Admin : Fixed Navbar bug (Navbar button moving failed sometimes after deleting)
- Fixed in Admin : Added Access Control in File Manager
- Fixed in Admin : Added filename filtering in File Manager and fixed chroot bug
- Fixed in Admin : Updated Message admin layout & added reply counter, etc
- Fixed in Admin : Allow HTML tags in Macro keys and values
- Fixed in Admin : Fixed Usergroup bug in Style admin
- Fixed in Admin : Added Message group front end
- Fixed in Admin : Fixed Navbar buttons
- Fixed in Admin : Navbar : Default label is a link
- Fixed in Admin : Updated layout for File Manager
- Fixed in Admin : Users are added to usergroup "users" by default
- Fixed in Admin : Added "Admin Access" front end
- Fixed in Admin : Creating "existing" file returns error message, ditto for deleting "unexisting" file, etc
- Fixed in Core : Small Postgres related bug
- Fixed in Core : Cookie bug

Release - 1.0_05 - Beta Release
- Updated layout
- Added Documentation & Screenshots
- Added extra Message tags & fixed Message bugs
- Fixed some File Manager bugs
- Updated POD
- Fixed bug in multiple setup feature
- Added Apache config include file
- Updated Navbar advanced attributes
- Fixed Access Control bugs in Administration
- Fixed Macro administration bugs
- Added basic Search Engine plugin (beta)
- Added SQL Dump plugin (beta)
- Added Quickstart guide
- Fixed Content tag bugs
- Fixed Content usergroup bug
- Added basic ImageGallery plugin (beta)

Release - 1.0_04 - Beta Release
- Fixed error handling in administration section
- Add documentation
- Fixed Macro administration
- Fixed Navigation Bar Administration
- Fixed Message administration & handler
- Fixed Administration access 
- Database handling optimization
- Dot file support
- Cleaned up styles and content
- Cleaned up error content and 404 handling
- Fixed servername issue (finally)
- Small bugfix in style admin
- Small bugfix in module filename handling
- Fixed User administration (table structure, administration section, access)
- Added basic calendar support
- Added tests
- Fixed Wiki issues
- Cleaned up code
- Fixed small Administration Statistics issue
- Fixed SQL issue (mysql 4 uses keyword "separator")

Release - 1.0_03 - Developer Release
- Delete obsolete files
- Several Navbar fixes
- Added some tests
- Added Wiki plugin
- Fixed issue where <?SPINE_Location?> could only be called from content
- Added Quickstart Guide & How it works documentation
- Several DBI fixes and cleanups
- Fixed statistics handler - included modifier date & Fixed some small bugs
- Fixed Log handler - extra parameters are ignored
- Added file manager
- Included basic struct tests for SQLite
- Fixed virtual file issue (virtual file foo is now actually loaded instead of existing file foo.txt)
- Cleaned up and optimized OO code structure A LOT + Added default value methods
- Added Makefile
- Added Admin access handler (restrict access to specific admin sections per user)
- Fixed some Macro issues
- Cleaned up HTML lots (and added "advanced" sections)

Release - 1.0_02
- Added Postgres support & cleaned up DBI class in the process
- Fixed compliancy to GPL
- Added some POD and general documentation
- Added content type to content
- Added documentation on alternative data types (including examples)
- Added documentation on developing plugins (including examples)
- Minor bug fixes
- Fixed major Message issues (including parent message and messagegroups)
- Fixed major permission issues (including administration access rights)
- Added content attribute in messagegroup (still to integrate in admin)
- Added SPINE::Constant to include general constant
- Implemented default data in content and style
- Cleaned up HTML.. a bit
- Fixed login info issue and integration with sessions and administration
- Added internal comments to content and style
- Added permissions, date, size owner and usergroup in content and style

Release - 1.0_01
- First DB based release
</pre>', '', 'text/html');
INSERT INTO content VALUES (171, 'spinenews', '', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', '', '0010', '<h2 class="news"><?SPINE_Message_Subject?></h2>
<div class="newsdate"><?SPINE_Message_Date?></div>
<?SPINE_Message_Body?>
', 'This is how a message will look like', '');
INSERT INTO content VALUES (172, '.admin-message', 'Message Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '<table width="800" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
<tr width="1000">
<td width="100%">
Edit Message group: $messagegroup&nbsp;&nbsp;&nbsp;<input type="button" value="Advanced" onclick="o=document.getElementById(''advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="button"><br>

<table width="800" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0" id="advanced" style="display:none"><form method="post" action="<?SPINE_Location?>admin/message/savegroup/">
<tr bgcolor="#ffffff"><td colspan="2"><input type="submit" value="Save" class="button"><input type="hidden" name="name" value="$messagegroup"></td>

</tr>
<tr bgcolor="#ffffff">
<td>Public&nbsp;: $wpermissions</td>
<td>Group: $gpermissions</td>
</tr>
<tr bgcolor="#ffffff">
<td>Owner: $owner &nbsp; Usergroup : <select name="usergroup">$group</select></td>
<td>Message Style: $contentlist</td></tr>
</form></table>

<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">
<tr bgcolor="#ffffff"  width="800">
<td width="60"><b>Subject</b></td><td width="60"><b>Owner</b></td>  
<td width="150"><b>Date</b></td><td valign="left" width="5">&nbsp;</td><td  valign="left" width="5">&nbsp;</td>
</tr>
$messagedata
</table>
</td></tr></table>', 'This is the message template for the administration section.', '');
INSERT INTO content VALUES (173, '.admin-macro', 'Macro Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '<table width="1000" border="0" bgcolor="#ffffff" cellspacing="1" cellpadding="0">
<tr width="1000"><td width="1000">

<table width="1000" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">

<tr bgcolor="#ffffff">

<td width="30%"><b>Key</b></td><td width="30%"><b>Value</b></td>  
<td width="1%">&nbsp;</td>
<td width="39%">&nbsp;</td>
</tr>

<tr bgcolor="#ffffff">
<form method="post" action="<?SPINE_Location?>admin/macro/new/">
<input type="hidden" name="name" value="$name">
<td><input type="text" name="key" class="input" value="Macro Key" size="30"></td>
<td><input type="text" name="value" value="Macro Value" class="input" size="30"></td>
<td><input type="submit" value="create" class="button" name="action"></td></form>
<td>&nbsp;</td>
</tr>

$list

</table>

</td></tr></table>', 'This is the template for macro administration', '');
INSERT INTO content VALUES (174, '.admin-user', 'User Administration', 0, '.admin', '', 1, '', '2007-02-23 01:08:44', 'admin', 'admin', '0000', '<table width="100%" border="0" bgcolor="#ffffff" cellspacing="1" cellpadding="0">
<tr width="100%"><td width="100%">
$error
<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">

<tr bgcolor="#ffffff">

<td width="20%"><b>Full Name</b></td><td width="20%"><b>Login</b></td>  
<td width="1%">&nbsp;</td>
<td width="1%">&nbsp;</td>
<td width="58%">&nbsp;</td>
</tr>

<tr bgcolor="#ffffff">
<form method="post" action="<?SPINE_Location?>admin/user/new/">
<td><input type="text" name="fullname" class="input" value="Full Name" size="30"></td>
<td><input type="text" name="login" value="Login" class="input" size="30"></td>
<td><input type="submit" value="create" class="button" name="action"></td></form>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

$userdata

</table>

</td></tr></table>', 'This is the template for user administration', '');
INSERT INTO content VALUES (175, '.admin-user-edit', 'User Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '<table width="100%" border="0" bgcolor="#ffffff" cellspacing="1" cellpadding="0">

<tr width="100%">
<td width="100%">
$error
<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">

<form method="post" action="<?SPINE_Location?>admin/user/save/" name="UserEdit$login">

<tr bgcolor="#ffffff">
<td>
<input type="submit" value="Save" class="button">
</td></tr>
<input type="hidden" name="id" value="$id">

<tr bgcolor="#ffffff">
<td width="15%">
Full Name [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#fullname'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>] : </td><td width="30%"><input type="text" class="input" name="name" value="$name" size="25"></td>
</tr>

<tr bgcolor="#ffffff">
<td width="15%">
Login [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#login'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>] : </td><td width="30%"><input type="text" class="input" name="login" value="$login" size="25"></td>
</tr>

<tr bgcolor="#ffffff">
<td width="15%">
E-Mail [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#email'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>] : </td><td width="30%"><input type="text" class="input" name="email" value="$email" size="25"></td>
</tr>

<tr bgcolor="#ffffff">
<td width="15%">
Password [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#password'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>] : </td><td width="30%"><input type="password" class="input" name="password" value="$password" size="25"></td></tr>

<tr bgcolor="#ffffff">
<td width="15%" valign="top">
Groups [<a href="#" target="Hint" onclick="window.open(''<?SPINE_Location?>hint_admin_user#groups'',''Hint'',''width=600,height=200,scrollbars=yes''); return false;">?</a>] : </td><td width="30%">$usergroups</td></tr>

</table>

</td>
</tr></table>
', 'This is the admin page for the user profile.', '');
INSERT INTO content VALUES (176, '.admin-usergroup', 'Usergroup Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '$error<table width="600" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
<tr bgcolor="#ffffff"><td>Username</td>
<td>Usergroup</td>
<td>&nbsp;</td></tr>
$list
</table>
', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (177, '.admin-stats', 'Statistics Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', '', '0000', '      <table width="100%" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
<tr width="100%"><td width="100%">
Statistics for <b>$name</b>
<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">
<tr bgcolor="#ffffff">
<td width="45%"><b>Referer</b></td>
<td><b>Requests</b> </td>  
</tr>
$refererlist
</table>

<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">
<tr bgcolor="#ffffff">
<td width="45%"><b>User Agent</b></td>
<td><b>Requests</b></td>  
</tr>
$useragentlist
</table>

<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">
<tr bgcolor="#ffffff">
<td width="45%"><b>IP</b></td>
<td><b>Requests</b></td>  
</tr>
$remoteaddrlist
</table>

<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">
<tr bgcolor="#ffffff">
<td width="45%"><b>Query</b></td>
<td><b>Requests</b></td>  
</tr>
$querylist
</table>

</td></tr></table>
', 'This is the template for statistics administration', '');
INSERT INTO content VALUES (178, '.admin-stats-general', 'Statistics Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '      <table width="100%" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
<tr width="100%">
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><td>
<form method="post" action="<?SPINE_Location?>admin/$type/view/"><b>View $label</b><br>
<input type="submit" value="View" class="button">&nbsp;<select name="name" class="general"><option value="">Select one
$list
</select></td>
</form></tr>
<tr width="100%"><td>
<center><hr width="95%"></center></td></tr>
<tr width="100%">
<!-- Remove -->
<form method="POST" name="theform" action="<?SPINE_Location?>admin/$type/remove/" onSubmit="return confirm(''You are about to delete ''+(document.theform.$type.options[document.theform.$type.selectedIndex].value)+''! Are you sure?'');"> <td>
<b>Remove $label</b><br>
<input type="submit" value="Remove" class="button">&nbsp;<select name="name" class="general"><option value="">Select one
$list
</select></td>
</form></tr>
<tr width="100%"><td>
<center><hr width="95%"></center>
</td></tr>
<tr width="100%"><td>
<table width="100%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ffffff">
<tr bgcolor="#ffffff">
<td width="5%"><b>Page</b></td>
<td><b>Requests</b></td>  
</tr>
$namelist
</table>
</td></tr></table>', 'This bit is the general statistics administration template', '');
INSERT INTO content VALUES (179, '.admin-content', 'Content Administration', 0, '.admin', '', 1, '', '2007-08-28 13:45:36', 'admin', 'admin', '0000', '<script language="javascript">
var http_request = false;
function makeRequest(meth, url, parameters) 
{ http_request = false;
  if (window.XMLHttpRequest) // Mozilla, Safari,...
   { http_request = new XMLHttpRequest();
     if (http_request.overrideMimeType) 
     { // set type accordingly to anticipated content type
       //http_request.overrideMimeType(''text/xml'');
       http_request.overrideMimeType(''text/html'');
     }
   } else 
   if (window.ActiveXObject) // IE
   { try 
     { http_request = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (e) 
     { try 
       { http_request = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (e) 
         {}
     }
   }
   if (!http_request) 
   { alert(''Cannot create XMLHTTP instance'');
     return false;
   }
   if (meth == "POST")
   { http_request.onreadystatechange = alertContents;
     http_request.open(''POST'', url, false);
     http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
     http_request.setRequestHeader("Content-length", parameters.length);
     http_request.setRequestHeader("Connection", "close");
     http_request.send(parameters);
     return http_request.status;
   }
   if (meth == "GET")
   { http_request.onreadystatechange = alertContents;
     http_request.open(''GET'', url, false);
     http_request.send(null);
  }
}

function alertContents() {
    if (http_request.readyState == 4) 
    { document.getElementById(''attrlist'').innerHTML = http_request.responseText;
    } 
}

window.onload=function() { makeRequest(''POST'',''<?SPINE_Location?>admin/attr/'', ''name='' + encodeURI( ''$filename'' )); }
</script>
<div class="dialog" id="attributes" style="overflow: auto; height: 200px">
<img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById(''attributes'').style.display=''none'';"><b>&nbsp;Custom Attributes</b><br>
<div style="width: 590px; height: 1.75em" id="attrlist">&nbsp;</div>
</div>

<div class="dialog" id="tags" style="width:900px; height:140px">
<img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById(''tags'').style.display=''none''; return false;"><u>Usable tags:</u><br>&lt;?SPINE_Content?&gt;, &lt;?SPINE_Env?&gt;, &lt;?SPINE_Images?&gt;, &lt;?SPINE_Location?&gt;, &lt;?SPINE_Login?&gt;, &lt;?SPINE_Macro("<i>key</i>")?&gt;, 
&lt;?SPINE_Message("<i>messagegroup</i>"[,"<i>id</i>"])?&gt;, &lt;?SPINE_Message_Body?&gt;, &lt;?SPINE_Message_Comments?&gt;, &lt;?SPINE_Message_Date?&gt;, 
&lt;?SPINE_Message_DateTime?&gt;, &lt;?SPINE_Message_Group?&gt;, &lt;?SPINE_Message_Id?&gt;, &lt;?SPINE_Message_Owner?&gt;, &lt;?SPINE_Message_Parent_Id?&gt;,
&lt;?SPINE_Message_Parent_Subject?&gt;, &lt;?SPINE_Message_Subject?&gt;, &lt;?SPINE_Message_Time?&gt;, &lt;?SPINE_Navbar("<i>navbarname</i>")?&gt;,
&lt;?SPINE_Page?&gt; &lt;?SPINE_Referer?&gt;, &lt;?SPINE_Search?&gt;, &lt;?SPINE_Servername?&gt;, &lt;?SPINE_Stats("hits")?&gt;, &lt;?SPINE_Stats("modified")?&gt;,
&lt;?SPINE_Title?&gt;, &lt;?SPINE_User?&gt;, &lt;?SPINE_Webmaster?&gt;, &lt;?SPINE_XMLChanges?&gt;</div>
<table width="1000" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">

<tr width="1000">
<form method="post" action="<?SPINE_Location?>admin/content/save/" name="editcontent">

<td colspan="5" width="1000">
$error<b>Content Edit : $filename $lock</b><br>
<input type="submit" value="Save" class="button">
<input type="button" value="Preview" onclick="window.open(''<?SPINE_Location?>$filename'',''Hint'',''width=800,height=600,scrollbars=yes''); return false;" class="button">
<input type="button" value="Advanced" onclick="o=document.getElementById(''advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="button">
<input type="hidden" name="name" value="$filename">
</td></tr>

<tr width="1000">
<td width="15%">Size <sup>[<a onClick="return false;" class="info">?<span>This is the size of the content body.</span></a>]</sup> :</td><td width="25%"> $size bytes</td>

<td width="15%">Last Modified <sup>[<a onClick="return false;" class="info">?<span>This is the last modifcation date of the content.</span></a>]</sup> : </td><td width="25%">$lastmod</td>
<td width="20%">&nbsp;</td></tr>

<tr width="1000">
<td width="15%">
Title <sup>[<a class="info" onClick="return false;">?<span>The Title contains the string that can be used in conjunction with &lt;?SPINE_Title?&gt;.</span></a>]</sup> : </td><td width="25%"><input type="text" class="input" name="title" value="$title" size="25"></td>

<td width="15%">
Style <sup>[<a class="info" onClick="return false;">?<span>This is allows you to define a style.</span></a>]</sup> : </td><td width="25%"><select name="style" class="general">
<option>Select Style $stylelist</select></td>
<td width="20%">&nbsp;</td>
</tr>

<tr width="1000">
<td colspan="5"  width="1000">
<table width="1000" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0" id="advanced" style="display:none">
<tr width="1000"><td width="1000" colspan="5"><img src="" width="997" height="1"></td></tr>
<tr width="1000">
<td width="20%">Enter to &lt;br&gt; <sup>[<a class="info" onClick="return false;">?<span>This feature toggles converting newlines in the content to HTML breaks.</span></a>]</sup> : </td><td width="25%">$breaks</td>
<td width="20%">
Log Access <sup>[<a class="info" onClick="return false;">?<span>This feature toggles logging access to this Content.</span></a>]</sup> : </td><td width="25%">$logging</td><td width="10%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000"><td width="20%">Macros <sup>[<a class="info" onClick="return false;">?<span>This is allows you to define Macros.</span></a>]</sup> :

</td><td width="25%"><select name="macros" class="general">
<option value="">none
$macrolist
</select></td>
<td width="20%">
Keywords <sup>[<a class="info" onClick="return false;">?<span>This is allows you to define keywords for the search engine feature. Separate the words with spaces.</span></a>]</sup> : </td><td width="25%">
<input type="text" name="keywords" value="$keywords" size="30" class="input"></td><td width="10%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000">
<td width="15%">
Owner <sup>[<a class="info" onClick="return false;">?<span>This shows the content owner.</span></a>]</sup> :</td><td width="25%">$owner</td>

<td width="15%">Group <sup>[<a class="info" onClick="return false;">?<span>This shows the content ownergroup.</span></a>]</sup> : </td><td width="25%"><select name="usergroup" class="general">$group</select></td><td width="20%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000">

<td width="15%" valign="top">
Permissions <sup>[<a class="info" onClick="return false;">?<span>These checkboxes set the content access permissions.</span></a>]</sup> :</td>

<td width="25%">Group: $gpermissions<br>Public&nbsp;: $wpermissions</td>
<td width="15%" valign="top">Content-type <sup>[<a class="info" onClick="return false;">?<span>This attribute defines the content media type.</span></a>]</sup> : </td><td width="25%" valign="top"><input type="text" class="input" name="type" value="$type" size="25">&nbsp;<a href="#" onClick="document.editcontent.type.value=''$mimetype''; return false;">Find</a></td>
<td width="20%">&nbsp;</td>
</tr>

<tr bgcolor="#ffffff" width="1000"><td colspan="5" width="100%">
Comment <sup>[<a class="info" onClick="return false;">?<span>Define comments about this content here.
</span></a>]</sup> :<br>

<textarea cols="150" rows="8" name="icomment" class="input">$icomment</textarea>
</td></tr>
</table>

</td></tr>

<tr width="1000"><td colspan="3">
Contents <sup>[<a class="info" onClick="return false;">?<span>This is the actual Content body.</span></a>]</sup> : 
</td><td><a href="#" onClick="a=document.getElementById(''tags''); if(a.style.display==''inline''){a.style.display=''none'';}else {a.style.display=''inline'';} return false;">Tags</a> <a href="#" onclick="
var o=document.getElementById(''attributes''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';} return false;">Attributes</a>
</td></tr>
<tr width="1000"><td colspan="4">
<textarea cols="150" rows="25" name="body" class="input"$disabled>$body</textarea></td>
<td>&nbsp;</td>
</table>', 'I''m not sure what this is...', '');
INSERT INTO content VALUES (180, 'thanks.html', 'Thanks go to', 0, 'main', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Thanks go to..</h2>
<ol><li>Bram Grietens : Layout suggestions &amp; small bug fix</li>
</ol>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (181, '.ruthcolors.css', '', 0, 'blank', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'body
{
	background-color: #665;	/* border/edge of the layout color */
}
#pageFrame, #masthead, #footer
{	
	background-color: #fff;	/* major background color */
}
#pageFrame
{
	/* image used as background color for left column ( #E9E8CA ) */
	background: #e9e8cA;
}
#masthead, #footer
{
	background-color: #885;
	color: #fff;
}
#footer
{
	border-bottom: solid 1px #997; /* IE 6 has the footer flow over the pageFrame''s 
									  bottom border. if this border is added, IE draws
									  the pageFrame border as exptected */
}
.hnav, .hnav ul li a
{
	background-color: #cc9;
	color: #336;
}
.hnav ul li a:hover
{
	background-color: #336;
	color: #fff;
}
.vnav ul li a
{
	color: #336;
	background-color: #cc9;
}
.vnav ul li a:hover
{
	background-color: #336;
	color: #fff;
}
', 'This style is part of the design released into public domain:
http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html', 'text/css');
INSERT INTO content VALUES (182, '.ruthsimple.css', '', 0, 'blank', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '/*---- Layout ----*/
div
{
	/* this is for netscape 4''s sake */
	padding: 0;
	margin: 0;
}
body
{
	padding: 20px;
	margin: 0;
}
#oldbrowser
{
	text-align: center;
}
#masthead h1
{
	display: inline;
}
#leftcolumn
{
	margin-right: -200px;	/* IE 4 fix */
}
#leftColumn
{
	float: left;
	width: 200px;
	/*/*/ /*/margin: 0 0 0 2px; /* Silly Netscape hack to get the borders to line up */
}
#contentColumn
{
	width: auto;
	margin-left: 199px;
}
#masthead, #innerLeftColumn, #innerContentColumn, #innerFooter
{
	padding: 10px;
}
#footer
{
	clear: left;
}
#innerFooter
{
	text-align: center;
}
#innerContentColumn
{
	overflow: visible;
	height: 100%;	/* fix the Win32 IE float bug */
}
#contentColumn>#innerContentColumn
{
	height: auto;	/* fix Opera 5 which breaks with the above IE fix */
}
#innercontentcolumn
{
	height: 100%;	/* fix IE 5.0 which parse the Opera fix, note the selector is all lower case */
}
#masthead, #footer
{
	z-index: 10;
}

/*---- Borders ----*/
#pageFrame
{
	border: solid 1px #000;
}
#footer, #masthead, #innerLeftColumn, #contentColumn, .hnav
{
	border: solid 0px #000;
}
#footer
{
	border-top-width: 1px;
}
#masthead, .hnav
{
	border-bottom-width: 1px;
}
#innerLeftColumn
{
	border-right-width: 1px;
}
#contentColumn
{
	border-left-width: 1px;
}

/*---- Visual Elements ----*/
body
{
	background-color: #ddd;
	color: #000;
	padding: 20px;
	margin: 0;
}
#pageFrame
{
	background-color: #fff;
	color: #000;
	min-width: 500px;
}
.hide
{
	display: none;
}

/*---- Simple Horizontal Navigation for IE 4/5.0/NS4 ----*/
.hnav
{
	white-space: nowrap;
	margin: 0;
	color: #000;
}
.hnav
{
	padding: 3px 0 4px 0;
}
.hnav ul
{
	text-align: center;
	list-style-type: none;
	line-height: normal;
	margin: 0;
	padding: 0;
}
.hnav ul li
{
	display: inline;
	white-space: nowrap;
	/*/*/ /*/display: none;/*  */
}
', 'This style is part of the design released into public domain:
http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html', 'text/css');
INSERT INTO content VALUES (183, '.ruthcomplex.css', '', 0, 'blank', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', 'div#oldbrowser
{
	display: none;	/* hide the standards compliant warning - this isn''t a catch all, but works for old browsers */
}
a img
{
	border-width: 0;	/* remove the border around linked images. <img border="0" ..../> is invalid in XHTML 1.1 */
}
#innerLeftColumn img
{
	display: block;
	margin: 0 auto;
	text-align: center;	/* IE 5 centering hack */
}
#innerLeftColumn, #innerContentColumn
{
	overflow: visible;	/* fix the Win32 IE italics bug */
	height: 100%;		/* ditto */
}
#innerleftcolumn, #innercontentcolumn
{
	overflow: hidden;	/* IE5.0 fix the Win32 IE italics bug */
	width: 100%;
	height: auto;
}
#innerleftcolumn/* hide from IE5.0 */, #innercontentcolumn/* hide from IE5.0 */
{
	overflow: visible;	/* reset IE5.0 fix for 5.5 */
	height: 100%;		/* ditto */
	width: auto;		/* reset Safair after picking up the above IE5.0 fix : it''s case insensitive to CSS selectors */
}
* html #masthead
{
	position: relative;
}', 'This style is part of the design released into public domain:
http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html', 'text/css');
INSERT INTO content VALUES (184, '.ruthcomplex_vnav.css', '', 0, 'blank', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '.vnav ul, .vnav ul li
{
	margin: 0;
	padding: 0;
	list-style-type: none;
	display: block;
}
.vnav ul
{
	border: solid 1px #000;
	border-bottom-width: 0;
}
.vnav ul li
{
	border-bottom: solid 1px #000;
}
.vnav ul li a
{
	display: block;
	text-decoration: none;
	padding: 2px 10px;
}
/* Hide from IE-mac */
* html .vnav ul li a/* hide from IE 5.0 */ {height: 1%;}
/* End hide */
', 'This style is part of the design released into public domain:
http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html', 'text/css');
INSERT INTO content VALUES (185, '.ruthcomplex_hnav.css', '', 0, 'blank', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '/*** Complex Horizontal Navigation ***/
.hnav ul li
{
	margin: 0;
}
.hnav ul li a
{
	text-decoration: none;
	color: #000;
	background-color: #eee;
	margin: 0 -1px 0 0;
	padding: 3px 10px 4px 10px;
	border-left: solid 1px #000;
	border-right: solid 1px #000;
}
.hNAV
{
	padding: 0;		/*	IE5/Win will resize hnav to fit the heights of its
						inline children that have vertical padding. So this
						incorrect case selector will remove that padding */
}
.HNAV ul li a
{
	height: 1%;		/*	holly hack for IE5/Win because 5.0 doesn''t recognize 
						inline padding by default */
}
html>body .HNAV
{
	padding: 3px 0 4px 0;	/* Fix for Safari which is case-insensitive */
	height: auto;
}
.hnav ul li a:hover
{
	text-decoration: underline;
}
.hnav ul li a:hover
{
	text-decoration: none;
}
.hnav ul li span
{
	display: none;
}


', 'This style is part of the design released into public domain:
http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html', 'text/css');
INSERT INTO content VALUES (186, 'stats.html', 'STUB Content', 0, 'blank', '', 1, '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<?SPINE_LogDump?>', 'This is where you put comments about this content', 'text/plain');
INSERT INTO content VALUES (188, 'styles.html', 'Included Styles', 0, 'main', '', 1, '', '2007-02-22 23:23:26', 'admin', 'users', '1010', 'SPINE includes 17 default styles:<br><center>
<a href="<?SPINE_Images?>spine_style.jpg"><img src="<?SPINE_Images?>spine_style.jpg" width="455" height="526"></a><br>Default SPINE style. Style: main<br><br>
<a href="<?SPINE_Images?>spine2_style.jpg"><img src="<?SPINE_Images?>spine2_style.jpg" width="455" height="526"></a><br>Second SPINE style. Style: main2<br><br>
<a href="<?SPINE_Images?>eidogreen_style.jpg"><img src="<?SPINE_Images?>eidogreen_style.jpg" width="455" height="526"></a><br>Eidogreen style, contributed by jhThorsen. Style: eidogreen<br><br>
<a href="<?SPINE_Images?>eidored_style.jpg"><img src="<?SPINE_Images?>eidored_style.jpg" width="455" height="526"></a><br>Eidored style, contributed by jhThorsen. Style: eidored<br><br>
<a href="<?SPINE_Images?>ruth_style.jpg"><img src="<?SPINE_Images?>ruth_style.jpg" width="455" height="526"></a><br>Public domain style, made available through <a href="http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html">Ruthsarian Layouts</a>. Style: ruth<br>
<hr>New since 1.2 beta<br>

<a href="<?SPINE_Images?>andreas01_style.jpg"><img src="<?SPINE_Images?>andreas01_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/6205">oswd.org</a>. Style: andreas01.
<br><br>
<a href="<?SPINE_Images?>autonomous_style.jpg"><img src="<?SPINE_Images?>autonomous_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/2547">oswd.org</a>. Style: autonomous
<br><br>
<a href="<?SPINE_Images?>dittoditto_style.jpg"><img src="<?SPINE_Images?>dittoditto_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/6329">oswd.org</a>. Style: dittoditto
<br><br>
<a href="<?SPINE_Images?>plain_style.jpg"><img src="<?SPINE_Images?>plain_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/6304">oswd.org</a>. Style: plain<hr>New since 1.2<br>
<br><br>
<a href="<?SPINE_Images?>metro01_style.jpg"><img src="<?SPINE_Images?>metro01_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/12009">oswd.org</a>. Style: metro01
<br><br>
<a href="<?SPINE_Images?>nightcity_style.jpg"><img src="<?SPINE_Images?>nightcity_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/11340">oswd.org</a>. Style: nightcity
<br><br>
<a href="<?SPINE_Images?>bluerain_style.jpg"><img src="<?SPINE_Images?>bluerain_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/11508">oswd.org</a>. Style: bluerain<br><br>
<a href="<?SPINE_Images?>mintchocolate_style.jpg"><img src="<?SPINE_Images?>mintchocolate_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/9633">oswd.org</a>. Style: mintchocolate<br><br>

<a href="<?SPINE_Images?>gscape_style.jpg"><img src="<?SPINE_Images?>gscape_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/7724">oswd.org</a>. Style: gscape<br><br>

<a href="<?SPINE_Images?>neuphoric_style.jpg"><img src="<?SPINE_Images?>neuphoric_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/10055">oswd.org</a>. Style: neuphoric<br><br>

<a href="<?SPINE_Images?>progress_style.jpg"><img src="<?SPINE_Images?>progress_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/8809http://www.oswd.org/user/profile/id/8809">oswd.org</a>. Style: progress<br><br>

<a href="<?SPINE_Images?>littlehome_style.jpg"><img src="<?SPINE_Images?>littlehome_style.jpg" width="455" height="526"></a><br>Made available through <a href="http://www.oswd.org/user/profile/id/9072">oswd.org</a>. Style: littlehome<br><br>

</center>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (189, 'todo.html', 'To Do', 0, 'main', '', 1, 'document doc todo', '2006-12-31 23:00:00', 'admin', 'admin', '0010', '<pre>TODO
------
- POD
- HOWTO
- Overview Documentation
- Quickstart (most needed functions)
- Add documentation.. period

TODO - Low Priority (random order)
----------------------------------

- Case insensitive match fix for mysql (foo != FOO.. silly germans) - Fix in dumper, mention in FAQ
- Optimize ! http://dev.mysql.com/doc/mysql/en/Query_Speed.html

Development
- Logging administration
  - sorting
  - link logging to log handler
- Message administration
  - Change Message structure to provide mail possibilities (extra fields - attributes)
- Quickstart (most needed functions)
  -> Documentation
  -> Central admin page : "edit index.html content" "edit main style"
- Limited versioning info (with patch??)
  -> Part of Plugins (SPINE::Wiki)
- Command Line Tool + Plugin : Work in progress
- Virtual Folders (Plugin)

- Add graphical counter example
- Images directory (symlink/per setup or general?)
- onchange in content ("Changed" - "Unchanged") <- javascript
- Wiki Plugin - BETA

</pre>', 'Things that are to do', 'text/html');
INSERT INTO content VALUES (190, 'tips.html', 'Tips & Tricks', 0, 'main', '', 1, 'tips tricks', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<h2>Tips &amp; Tricks</h2>
<ol><li><u>Macro values can also contain HTML tags, including SPINE Markers</u>
<br>Example:
Define two Macro sets and include a Navbar as value:<br>
Define Macro set #1 (Old)<br>
Add a macro pair : name navbar ; value &lt;?SPINE_Navbar("old")?&gt;<br>
Define Macro set #2 (New)<br>
Add a macro pair : name navbar ; value &lt;?SPINE_Navbar("new")?&gt;
In the Style, use &lt;?SPINE_Macro("navbar")?&gt;.<br>
In the content where you want to display the ''new'' Navbar, select ''New'' from the Macro list.<br>
In the content where you want to display the ''old'' Navbar, select ''Old'' from the Macro list.<br>
</li>
<li><u>Messages can be used for weblogs</u><br>
SPINE does not include an official Weblog (blog, journal, ..) plugin but the Messages plugin can be used to do it.</li>
<li><u>Dynamic Text Editor in the Administration</u><br>
SPINE is not bundled with a dynamic text editor (WYSIWYG) but there is unofficial support. See <a href="tinymce.html">TinyMCE Installation</a> page.</li>
<li><u>AJAX support</u><br>
None of the plugins does AJAX support out of the box but it is quite simple to include it in your page. See the Messages AJAX example page.</li>
<li><u>True files support</u><br>
SPINE transparently handles displaying virtual files and true files. When a content is created but a true file with that name exists, SPINE will give precedence to that file.</li>
  
<li><u>Dynamic Media type</u><br>Content of any type can be generated
  By setting a custom mime-type for a content, you can display virtually any data type. Make sure to use a style that Two included examples demonstrate this feature.
  <ul><li>XML Changes shows XML data of the most recent changes, using a plugin. </li>
  <li>Pie Chart demonstrates generating dynamic image data transparently.</li></ul>
</li>
 </ol>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (191, '.admin-content.tinymce', 'Content Administration', 0, '.admin', '', 1, '', '2006-12-31 23:00:00', 'admin', 'admin', '0000', '<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript" src="../jscripts/tiny_mce/init.js"></script>

<table width="1000" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">

<tr width="1000">
<form method="post" action="<?SPINE_Location?>admin/content/save/">

<td colspan="5" width="1000">
$error<b>Content Edit : $filename</b><br>
<input type="submit" value="Save" class="button">
<input type="button" value="Preview" onclick="window.open(''<?SPINE_Location?>$filename'',''Hint'',''width=800,height=600,scrollbars=yes''); return false;" class="button">
<input type="button" value="Advanced" onclick="o=document.getElementById(''advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="button">
<input type="hidden" name="name" value="$filename">
</td></tr>

<tr width="1000">
<td width="15%">Size [<a class="info" href="#">?<span>This is the size of the content body.</span></a>] :</td><td width="25%"> $size bytes</td>

<td width="15%">Last Modified [<a class="info" href="#">?<span>This is the last modifcation date of the content.</span></a>] : </td><td width="25%">$lastmod</td>
<td width="20%">&nbsp;</td></tr>

<tr width="1000">
<td width="15%">
Title [<a class="info" href="#">?<span>The Title contains the string that can be used in conjunction with &lt;?SPINE_Title?&gt;.</span></a>] : </td><td width="25%"><input type="text" class="input" name="title" value="$title" size="25"></td>

<td width="15%">
Style [<a class="info" href="#">?<span>This is allows you to define a style.</span></a>] : </td><td width="25%"><select name="style" class="general">
<option>Select Style $stylelist</select></td>
<td width="20%">&nbsp;</td>
</tr>

<tr width="1000">
<td colspan="5"  width="1000">
<table width="1000" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0" id="advanced" style="display:none">
<tr width="1000"><td width="1000" colspan="5"><img src="" width="997" height="1"></td></tr>
<tr width="1000">
<td width="20%">Enter to &lt;br&gt; [<a class="info" href="#">?<span>This feature toggles converting newlines in the content to HTML breaks.</span></a>] : </td><td width="25%">$breaks</td>
<td width="20%">
Log Access [<a class="info" href="#">?<span>This feature toggles logging access to this Content.</span></a>] : </td><td width="25%">$logging</td><td width="10%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000"><td width="20%">Macros [<a class="info" href="#">?<span>This is allows you to define Macros.</span></a>] :

</td><td width="25%"><select name="macros" class="general">
<option value="">none
$macrolist
</select></td>
<td width="20%">
Keywords [<a class="info" href="#">?<span>This is allows you to define keywords for the search engine feature. Separate the words with spaces.</span></a>] : </td><td width="25%">
<input type="text" name="keywords" value="$keywords" size="30" class="input"></td><td width="10%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000">
<td width="15%">
Owner [<a class="info" href="#">?<span>This shows the content owner.</span></a>] :</td><td width="25%">$owner</td>

<td width="15%">Group [<a class="info" href="#">?<span>This shows the content ownergroup.</span></a>] : </td><td width="25%"><select name="usergroup" class="general">$group</select></td><td width="20%">&nbsp;</td></tr>

<tr bgcolor="#ffffff" width="1000">

<td width="15%" valign="top">
Permissions [<a class="info" href="#">?<span>These checkboxes set the content access permissions.
</span></a>] :</td>

<td width="25%">Group: $gpermissions<br>Public&nbsp;: $wpermissions</td>
<td width="15%" valign="top">Content-type [<a class="info" href="#">?<span>This attribute defines the content media type.</span></a>] : </td><td width="25%" valign="top"><input type="text" class="input" name="type" value="$type" size="25"></td>
<td width="20%">&nbsp;</td>
</tr>

<tr bgcolor="#ffffff" width="1000"><td colspan="5" width="100%">
Comment [<a class="info" href="#">?<span>Define comments about this content here.
</span></a>] :<br>

<textarea cols="80" rows="2" name="icomment" class="input">$icomment</textarea>
</td></tr>
</table>

</td></tr>

<tr width="1000"><td colspan="4">
Contents [<a class="info" href="#">?<span>This is the actual Content body.</span></a>] :
<br><textarea cols="110" rows="18" name="body" class="input">$body</textarea></td>
<td>&nbsp;</td>
</table>', 'I''m not sure what this is...', '');
INSERT INTO content VALUES (192, 'eidored.css', 'STUB Content', 0, 'blank', '', 1, 'eidolon eidored css', '2007-02-22 23:26:57', 'admin', 'users', '1010', 'body, div, td, a, input, textarea {
	font-size: 10pt;
	line-height: 15pt;
	letter-spacing: 1px;
	font-weight: normal;
	font-family: sans-serif, arial;
	color: #000000;
}

body {
	background: #ffffff url(<?SPINE_Images?>feath.jpg) repeat-y;
	background-position: 50% 20px;
	margin: 0;
	padding: 0;
	padding-bottom: 3em;
}

div#body a {
	text-decoration: none;
	font-weight: bold;
	color: #990000;
	border: 1px solid #ffffff;
	padding: 2pt 1pt;
	position: relative;
}

div#body a:hover {
	border: 1px solid #000000;
	background: #eeeeee;
	z-index: 8;
}

p, dl, ol {
	margin: 2pt;
	padding: 0pt;
}

ol {
	margin-left: 15pt;
}

h1, h2, h3 {
	padding: 0;
	margin: 0;
}

h1, h2 {
	font-size: 16pt;
	padding-top: 16pt;
	padding-bottom: 6pt;
	border-bottom: 2px solid #000000;
}

h2 {
	font-size: 14pt;
}

div#headtxt h1 {
	font-size: 18pt;
	padding-top: 150px;
	padding-bottom: 10pt;
	max-width: 500pt;
	border-bottom: 2px solid #000000;
}

h3 {
	font-size: 13pt;
	padding-top: 5pt;
	padding-bottom: 4pt;
}

div#headbgrepeat {
	background: url(<?SPINE_Images?>bgred.jpg) repeat-x top left;
	background-position: 0 38px;
}

div#headbg {
	background: url(<?SPINE_Images?>head.jpg) no-repeat top left;
	font-weight: bold;
}

div#headtxt {
	padding-left: 120px;
	padding-right: 3em;
	height: 347px;
}

div#headtxt a {
	color: #000000;
	padding: 0 4pt;
	border: 0;
	text-decoration: none;
	font-weight: bold;
	padding-bottom: 2.5em;
	letter-spacing: -1px;
}

div#headtxt a:hover {
	background: transparent;
	color: #e0e0e0;
	border-color: #770000;
	border-bottom: 2px solid #770000;
}

#body {
	padding-left: 120px;
	padding-right: 3em;
	max-width: 500pt;
}

#content {
	border-bottom: 4px solid #990000;
}

#footer {
	position: relative;
	top: 16pt;
	font-weight: bold;
}
div#footer a, div#footer a:hover {
	border: 0;
	color: #000000;
	background: transparent
}', 'CSS for eidored style', 'text/css');
INSERT INTO content VALUES (193, '.eidogreen.css', 'STUB Content', 0, 'blank', '', 1, '', '2007-02-22 23:28:36', 'admin', 'users', '1010', 'body, html {
	height: 100%;
}

body, td, div {
	font-family: ans-serif, arial;
	font-size: 11pt;
	line-height: 15pt;
}

body {
	background: #99aaff;
	margin: 0;
	margin-left: 150pt;
}

a {
	color: #000000;
	text-decoration: none;
}

h1 {
	background: #99aaff;
	font-size: 10pt;
	font-weight: bold;
	letter-spacing: 4px;
	margin: 0;
	padding: 0 14pt;
	padding-top: 1em;
	position: absolute;
	top: 0;
	left: 140pt;
	text-align: center;
	border-bottom: 2px dotted #000000;
	border-right: 2px dotted #000000;
}

#container {
	background: #acbb66 url(<?SPINE_Images?>bg.jpg) repeat-y;
	background-position: 99% -30px;
	height: 100%;
	border-left: 2px dotted #000000;
}

body>#container {
	height: auto;
	min-height: 100%;
}

#content {
	padding: 3em;
	padding-left: 2em;
	padding-right: 200px;
}

#menu {
	position: absolute;
	left: 2em;
	top: 3.5em;
	width: 110pt;
}

#menu a {
	padding: 0.2em;
	margin: 0.1em;
	display: block;
	color: #ffffff;
	border: 1px solid #99aaff;
}

#menu a:hover {
	border-color: #000000;
	color: #000000;
}

#menu h2 {
	font-weight: bold;
	font-size: 14pt;
	margin: 0.3em;
	margin-bottom: 0.6em;
	color: #ffffff;
}

#content h2 {
	font-weight: bold;
	font-size: 14pt;
	margin: 0.5em;
	margin-left: -1em;
	margin-right: -2em;
	padding: 0.1em;
	padding-left: 1em;
	background: #556644;
	color: #ffffff;
}', 'This CSS is part of the style contributed by jhtorsen (jhth@online.no).', 'text/css');
INSERT INTO content VALUES (136, 'transparentia.html', '', 0, 'transparentia', 'main', 1, '', '2011-09-19 22:19:07', 'admin', 'users', '1111', '<h2>Make changes to this text in content <em>transparentia.html</em>. Make changes to this layout in style <em>transparentia</em>.</h2>
<div class="item">
<h1>Porttitor posuere</h1>
<div class="descr">Jun 13, 2006 by Vulputate</div>
<p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Nullam posuere tristique tortor. In bibendum. Aenean ornare, <a href="index.html">nunc eget pretium</a> porttitor, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est.</p>
<cite>Sed sodales nisl sit amet augue. Donec ultrices, augue ullamcorper posuere laoreet, turpis massa tristique justo, sed egestas metus magna sed purus.</cite>
<p>Aliquam risus justo, mollis in, laoreet a, consectetuer nec, risus. Nunc blandit sodales lacus. Nam luctus semper mi. In eu diam.</p>
<p>Fusce porta pede nec eros. Maecenas ipsum sem, interdum non, aliquam vitae, interdum nec, metus. Maecenas ornare lobortis risus. Etiam placerat varius mauris. Maecenas viverra. Sed feugiat. Donec mattis <a href="index.html">quam aliquam</a> risus. Nulla non felis sollicitudin urna blandit egestas. Integer et libero varius pede tristique ultricies. Cras nisl. Proin quis massa semper felis euismod ultricies.</p>
</div>
<div class="item">
<h1>Adipiscing</h1>
<div class="descr">Jun 11, 2006 by Laoreet</div>
<p>Aliquam risus justo, mollis in, laoreet a, consectetuer nec, risus. Nunc blandit sodales lacus. Nam luctus semper mi. In eu diam. Phasellus rutrum elit vel nisi. Cras mauris nulla, egestas quis, cursus at, venenatis ac, ante. Fusce accumsan enim et arcu. Duis sagittis libero at lacus. Suspendisse lacinia nulla eget urna.</p>
<ul>
<li>Tristique</li>
<li>Aenean</li>
<li>Pretium</li>
</ul>
<p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Nullam posuere tristique tortor. In bibendum. Aenean ornare, nunc eget pretium porttitor, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est. Sed sodales nisl sit amet augue. Donec ultrices, augue ullamcorper posuere laoreet, turpis massa tristique justo, sed egestas metus magna sed purus. Fusce eleifend, dui ut posuere auctor, justo elit posuere sapien, at blandit enim quam fringilla mi.</p>
</div>
<div class="item">
<h1>Interdum</h1>
<div class="descr">May 24, 2006 by Lectus</div>
<p>Praesent nisi sem, bibendum in, ultrices sit amet, euismod sit amet, dui. Donec varius tincidunt nisi. Ut ut sapien. Integer porta. Fusce nibh. Curabitur pellentesque, lectus at <a href="index.html">volutpat interdum</a>, sem justo placerat elit, eget feugiat est leo tempor quam. Ut quis neque convallis magna consequat molestie. Nullam semper massa eget ligula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque a nibh quis nunc volutpat aliquam</p>
<code>margin-bottom: 12px; font: normal 1.1em "Lucida Sans Unicode",serif; background: url(/images/transparentia_quote.gif) no-repeat; padding-left: 28px; color: #555;</code>
<p>Eget feugiat est leo tempor quam. Ut quis neque convallis magna consequat molestie. Test. Test.</p>
</div>', 'This is where you put comments about this content', '');
INSERT INTO content VALUES (195, 'spine-v1.2.css', '', 0, 'blank', '', 1, '', '2011-10-12 11:57:23', 'admin', 'users', '1111', '.spine-body, .spine-td,.spine-div, .spine-font {
    font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: 9pt;
    color: #224466;
}

.spine-body {
    background: #dddddd url(<?SPINE_Images?>spine4.jpg) repeat-x;
    margin: 0;
    padding: 0;
}

.spine-a {
    color: #000000;
    text-decoration: none;
    border-bottom: 1px solid #000000;
    position: relative;
}

.spine-a:hover {
    background: #f3f3ff;
    font-weight: bold;
    color: #000000;
    border: 2px ridge #446688;
    margin: -4px;
    padding: 2px;
    z-index: 10;
}

#spine-menu {
    background: #dddddd url(<?SPINE_Images?>spine4.jpg) repeat-x;
    border-bottom: 1px solid #000000;
    padding-left: 1em;
}

#spine-menu a {
    font-weight: 500;
    font-size: 8pt;
    padding: 10px 5px;
    color: #223355;
    border: 0;
    margin: 0;
    position: relative;
}

#spine-menu a:hover {
}

#spine-footer {
    padding: 0.5em;
    padding-left: 2em;
}

.spine-h2 {
    margin: 0;
    padding: 1em;
        padding-bottom: 0.6em;
	font-size: 10pt;
}

#spine-container {
    margin-left: 1px;
    padding: 1em;
    padding-right: 3em;
    background: #fff;
    font-size: 9pt;
    border-bottom: 1px solid #000;
}

#spine-version {
    font-size: 17pt;
    color: #446677;
    position: absolute;
    top: 1em;
    left: 100%;
    margin-left: -150pt;
}

div.spine-section-body {
    margin: 1em 2em;
}

#spine-content { line-height: 140%; }

/* Front Page News */

h2.spine-news {
    border-bottom: 1px solid #CCC;
    padding-top: 1em;
    padding-bottom: 0.4em;
    font-size: 1.2em;
    border-bottom: 1px solid #000;
}

div.spine-newsdate {
    text-align: right;
    color: #444;
    font-weight: bold;
    font-size: 0.95em;
}

div.spine-newsdate a:link{ color: #666; text-decoration: none; }
div.spine-newsdate a:visited{ color: #4462b7; text-decoration: none; }
div.spine-newsdate a:hover{ color: #00C; text-decoration: underline; }
div.spine-newsdate a:active{ color: #000; text-decoration: underline; }

.spine-button { 
     font-family: Verdana, Arial, Helvetica, sans-serif; 
     font-size: 8pt; 
     color: #ffffff; 
     background-color: #6590fd; 
     border: 1px solid #000000; 
     width: 70pt 
}
 
.spine-input {
    font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt; 
	color: #000000;
	border: 1px solid #000000;
	width: auto;
	font-variant: normal;
}

.spine-pre.block {
 background:  #DCFAEA;
 border: 1px solid #777777;
 margin: 1em 1.75em;
 padding: .25em;
 overflow: auto;
}
', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (194, '_admin-v1.2.css', '', 0, 'blank', '', 1, '', '2011-10-12 11:55:43', 'admin', 'users', '1111', '.spine-panelcel {
        width:33%;
        float:left;
   }
.spine-fullpanel {
       padding:2px;
       width:auto;
  }

.spine-spacercel {
       clear:both;
  }

.spine-smallbutton {
      font-family: Verdana, Arial, Helvetica, sans-serif;
      font-size: 12px;
      color: #ffffff;
      background-color: #9b9bff;
      border: 1px solid #000000;
      width: 50px
      }

.spine-list {
     font-family: Verdana, Arial, Helvetica, sans-serif;
     font-size: 12px;
     color: #000000;
     border: 1px solid #000000;
     width: auto;
     font-variant: normal;
}

.spine-general {
     font-family: Verdana, Arial, Helvetica, sans-serif;
     font-size: 12px;
     color: #000000;
     width: 150px;
    z-index:2;
    }

.spine-table {
     font-size : 12px;
     font-family : Verdana,Helvetica,Arial,sans-serif;
     border-spacing: 1px
     }

.spine-selected {
background-color: #cccccc;
color: white;
}

.spine-unselected {
background-color: #fefefe;
color: black;
}

div.spine-dialog {
        z-index: 99;
        position: absolute;
        top: 200px;
        left: 150px;
        width: 600px;
        height: 80px;
        display: none;
        border: 2px solid #666;
        background-color: #ddd;
}

a.spine-info{
    position:relative; /*this is the key*/
    z-index:24; 
    text-decoration:none;
    font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: 9px;
    cursor: pointer;
}

a.spine-info:hover{z-index:25; }

a.spine-info span{display: none}

a.spine-info:hover span{ 
    display:block;
    position:absolute;
    top:2em; left:2em; width:35em;
    border:1px solid #000000;
    text-align: center;
    background-color:#ffffff;
    font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: 12px;
    z-index:1;
}


.spine-panel100
{ text-align: left;
  width: 98%;
  margin: 0px;
  padding: 2px;
  display: inline;
}

.spine-panel20
{ text-align: left;
  width: 19%;
  margin: 0px;
  height: 1.75em;
  padding: 1px;
  float: left;
  border: 1px solid;
}

.spine-panel15
{ text-align: left;
  width: 12%;
  margin: 0px;
  height: 1.75em;
  padding: 1px;
  float: left;
  border: 1px solid;
}

.spine-panel15alt
{ text-align: left;
  width: 12%;
  margin: 0px;
  height: 3.4em;
  padding: 1px;
  float: left;
  border: 1px solid;
}

.spine-panel25
{ text-align: left;
  width: 22%;
  margin: 0px;
  height: 1.75em;
  padding: 1px;
  float: left;
  border: 1px solid;
}

.spine-panel35
{ text-align: left;
  width: 32%;
  margin: 0px;
  height: 1.75em;
  padding: 1px;
  float: left;
  border: 1px solid;
}

.spine-panel75
{ text-align: left;
  width: 74%;
  margin: 0px;
  padding: 1px;
}

#spine-advanced { display: none; }

.spine-error 
{ background: #ffdddd url(/images/exclamation.png) center no-repeat;
  background-position: 15px 50%; /* x-pos y-pos */
  text-align: left;
  padding: 5px 20px 5px 45px;
  border: 2px solid #ffbbbb;
}', 'This is where you put comments about this content', 'text/css');
INSERT INTO content VALUES (97, '.administration/macro', 'Macro Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:15:24', 'admin', 'admin', '1111', '<div name="adminpanel" class="fullpanel">
<b>Macro edit: $name</b>
</div>

<div name="adminpanel" class="spine-fullpanel" style="width:412px;">
 <div class="spine-panelcel" style="width: 195px;"><b>Key</b></div>
 <div class="spine-panelcel" style="width: 195px"><b>Value</b></div>
  <div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div style="float:left;width:412px;">
<form method="post" action="<?SPINE_Location?>admin/macro/new/" style="padding: 0; margin: 0; display: inline;">
<input type="hidden" name="name" value="$name">
 <div class="spine-panelcel" style="width: 195px"><input type="text" name="key" class="spine-input" value="Macro Key" size="30"></div>
 <div class="spine-panelcel" style="width: 195px;"><input type="text" name="value" value="Macro Value" class="spine-input" size="30"></div>
 <div class="spine-panelcel" style="width: 10px"><input type="submit" value="create" class="spine-button" name="action"></div>
 <div class="spine-spacercel"></div></form>
</div>
</div>

<div class="spine-spacercel"></div>

<!-- Entry -->
$list
<!-- Entry end -->', 'This is the template for macro administration', '');
INSERT INTO content VALUES (96, '.administration/message', 'Message Administration', 0, '.admin', 'main', 1, '', '2011-10-12 12:17:21', 'admin', 'admin', '1111', '<div name="adminpanel" class="fullpanel">
Edit Message group: $messagegroup&nbsp;&nbsp;&nbsp;<input type="button" value="Advanced" onclick="o=document.getElementById(''spine-advanced''); if(o.style.display==''inline''){o.style.display=''none'';}else{o.style.display=''inline'';}" class="spine-button">
</div>

<div name="adminpanel" class="fullpanel" id="spine-advanced" style="height: auto ; width: 100%;">
<form method="post" action="<?SPINE_Location?>admin/message/savegroup/" style="padding: 0; margin: 0; display: inline;">
<input type="submit" value="Save" class="spine-button">
<input type="hidden" name="name" value="$messagegroup">
<div name="adminpanel" class="spine-fullpanel" style="background-color:orange;">
<div class="spine-panelcel" >Public&nbsp;: $wpermissions</div>
<div class="spine-panelcel" >Group: $gpermissions</div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 25%;">Owner: $owner &nbsp; Usergroup : <select name="usergroup">$group</select></div>
<div class="spine-panelcel" style="width: 25%;">Message Style: $contentlist</div>
<div class="spine-spacercel"></div>
</form>
</div>
</div>

<div name="adminpanel" class="spine-fullpanel">
<div class="spine-panelcel" style="width: 25%"><b>Subject</b></div>
<div class="spine-panelcel" style="width: 15%"><b>Owner</b></div>
<div class="spine-panelcel" style="width: 15%"><b>Date</b></div>
<div class="spine-spacercel"></div>
</div>

<div name="adminpanel" class="spine-fullpanel">
$messagedata
</div>', 'This is the message template for the administration section.', '');


--
-- Data for Name: macro; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO macro VALUES (1, 'main', 'SPINE_Version', '1.3 beta');
INSERT INTO macro VALUES (2, 'foo', 'Macro KeyFoo', 'Macro ValueFoo');
INSERT INTO macro VALUES (3, 'foobar', 'Macro Key', 'Macro ValueFoo');
INSERT INTO macro VALUES (4, 'foobar', 'alpha', 'one');
INSERT INTO macro VALUES (6, 'foo', 'NewKey', 'NewKey2');


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO message VALUES (1, 'New Beta release', '2005-07-23 13:25:13', 'Owner', 0, 'news', 'We proudly announce a new beta release, version 1.0_05, aptly codenamed <i>Taj Mahal</i>.
This version introduces a feature freeze. All known issues and bugs will be fixed. Check the ChangeLog listing for all changes in this
release and the Download section to get it now! 
');
INSERT INTO message VALUES (2, 'Released v1.1 Stable (Burton)', '2006-02-19 15:13:55', 'Owner', 0, 'news', 'Spine v1.1 (codename Burton) is the new stable release. Major changes include:
<dir><li>Updated layout and new styles</li>
<li>Fixed large number of bugs</li>
<li>Added File Manager and Administration Access control</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.');
INSERT INTO message VALUES (3, 'Released v1.2 Beta (Baldrick)', '2006-05-16 23:12:44', 'Owner', 0, 'news', 'Spine v1.2 beta (codename Baldrick) is a beta for the upcoming version 1.2 release. Major changes include:

<dir><li>Updated layout and new styles</li>
<li>Fixed small number of bugs</li>
<li>Support for mod_perl 2</li>
<li>Support for int''l</li>
<li>Support for Postgresql as RDBMS</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (4, 'Developers needed', '2005-07-23 01:52:20', 'Owner', 0, 'andreas_news', 'SPINE has been under development for roughly 5 years. The mod_perl version was released 2 years ago. We''re approaching a stable release but we also could use some help. Are you a good copywriter? Are you an aspiring perl developer? Do you have leet designer skills? Your help is appreciated!');
INSERT INTO message VALUES (5, 'New Beta release', '2005-07-23 13:25:13', 'Owner', 0, 'andreas_news', 'We proudly announce a new beta release, version 1.0_05, aptly codenamed <i>Taj Mahal</i>.
This version introduces a feature freeze. All known issues and bugs will be fixed. Check the ChangeLog listing for all changes in this
release and the Download section to get it now! 
');
INSERT INTO message VALUES (6, 'Released v1.1 Stable (Burton)', '2006-02-19 15:13:55', 'Owner', 0, 'andreas_news', 'Spine v1.1 (codename Burton) is the new stable release. Major changes include:
<dir><li>Updated layout and new styles</li>
<li>Fixed large number of bugs</li>
<li>Added File Manager and Administration Access control</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.');
INSERT INTO message VALUES (7, 'Released v1.2 Beta (Baldrick)', '2006-05-16 23:12:44', 'Owner', 0, 'andreas_news', 'Spine v1.2 beta (codename Baldrick) is a beta for the upcoming version 1.2 release. Major changes include:

<dir><li>Updated layout and new styles</li>
<li>Fixed small number of bugs</li>
<li>Support for mod_perl 2</li>
<li>Support for int''l</li>
<li>Support for Postgresql as RDBMS</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (8, 'Released v1.2 Stable (Blackadder)', '2006-12-27 18:24:22', 'Owner', 0, 'news', 'Spine v1.2 stable (codename Blackadder) is now available for download. Major changes include:
<dir><li>Updated layout and added <b>8</b> new styles</li>
<li>Fixed a number of bugs and added security measures</li> 
<li>Code cleanup and speedup (database handling, API)</li>
<li>Added extra documentation : Quickstart guide for Styles</li>
<li>Fixed in Package : Added (finally) support for logging</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (9, 'New Beta release', '2005-07-23 13:25:13', 'Owner', 0, 'rssnews', 'We proudly announce a new beta release, version 1.0_05, aptly codenamed <i>Taj Mahal</i>.
This version introduces a feature freeze. All known issues and bugs will be fixed. Check the ChangeLog listing for all changes in this
release and the Download section to get it now! 
');
INSERT INTO message VALUES (10, 'Released v1.1 Stable (Burton)', '2006-02-19 15:13:55', 'Owner', 0, 'rssnews', 'Spine v1.1 (codename Burton) is the new stable release. Major changes include:
<dir><li>Updated layout and new styles</li>
<li>Fixed large number of bugs</li>
<li>Added File Manager and Administration Access control</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.');
INSERT INTO message VALUES (11, 'Released v1.2 Beta (Baldrick)', '2006-05-16 23:12:44', 'Owner', 0, 'rssnews', 'Spine v1.2 beta (codename Baldrick) is a beta for the upcoming version 1.2 release. Major changes include:

<dir><li>Updated layout and new styles</li>
<li>Fixed small number of bugs</li>
<li>Support for mod_perl 2</li>
<li>Support for int''l</li>
<li>Support for Postgresql as RDBMS</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (12, 'Released v1.2 Stable (Blackadder)', '2006-12-27 18:24:22', 'Owner', 0, 'rssnews', 'Spine v1.2 stable (codename Blackadder) is now available for download. Major changes include:
<dir><li>Updated layout and added <b>8</b> new styles</li>
<li>Fixed a number of bugs and added security measures</li> 
<li>Code cleanup and speedup (database handling, API)</li>
<li>Added extra documentation : Quickstart guide for Styles</li>
<li>Fixed in Package : Added (finally) support for logging</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (13, 'Released v1.22 Bugfix (Termite)', '2007-08-22 22:46:42', 'Owner', 0, 'news', 'Spine v1.22 Bugfix release (codename Termite) is now available for download. <b>Upgrading is recommended!</b> This packages fixes 2 of the vulnerabilities as reported by Secunia:<ol>
<li>Fixed in Admin : Referer check</li>
<li>Fixed in Admin : Arbitrary password</li>
</ol>
See the <a href="install.html">Installation documentation</a> for upgrading instructions. This package can be used as upgrade and reinstallation source. The affected package (version 1.2) will be removed from download listings. ');
INSERT INTO message VALUES (14, 'Released v1.3 Beta (Bernd)', '2007-08-22 22:50:58', 'Owner', 0, 'news', 'Spine v1.3 beta (codename Bernd) is a beta for the upcoming version 1.3 release. Major changes include:
<dir>
<li>Added 5 plugins (Slides, Picasa Gallery, Edit Page, Tags, Messages as RSS)</li>
<li>Added admin plugins (Attributes, Upload As.., Caching, ..)</li>
<li>Added initial code for CGI support</li>
<li>Added Content Wizard</li>
<li>Support for locked content, guessing mime types, binary body,..)</li>
<li>GUI changes..</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (15, 'Release v1.22 Bugfix (Termite)', '2007-08-22 22:46:42', 'Owner', 0, 'andreas_news', 'Spine v1.22 Bugfix release (codename Termite) is now available for download. <b>Upgrading is recommended!</b> This packages fixes 2 of the vulnerabilities as reported by Secunia:<ol>
<li>Fixed in Admin : Referer check</li>
<li>Fixed in Admin : Arbitrary password</li>
</ol>
See the <a href="install.html">Installation documentation</a> for upgrading instructions. This package can be used as upgrade and reinstallation source. The affected package (version 1.2) will be removed from download listings. ');
INSERT INTO message VALUES (16, 'Release v1.22 Bugfix (Termite)', '2007-08-22 22:46:42', 'Owner', 0, 'rssnews', 'Spine v1.22 Bugfix release (codename Termite) is now available for download. <b>Upgrading is recommended!</b> This packages fixes 2 of the vulnerabilities as reported by Secunia:<ol>
<li>Fixed in Admin : Referer check</li>
<li>Fixed in Admin : Arbitrary password</li>
</ol>
See the <a href="install.html">Installation documentation</a> for upgrading instructions. This package can be used as upgrade and reinstallation source. The affected package (version 1.2) will be removed from download listings. ');
INSERT INTO message VALUES (17, 'Released v1.3 Beta (Bernd)', '2007-08-22 22:50:58', 'Owner', 0, 'rssnews', 'Spine v1.3 beta (codename Bernd) is a beta for the upcoming version 1.3 release. Major changes include:
<dir>
<li>Added 5 plugins (Slides, Picasa Gallery, Edit Page, Tags, Messages as RSS)</li>
<li>Added admin plugins (Attributes, Upload As.., Caching, ..</li>
<li>Added initial code for CGI support</li>
<li>Added Content Wizard</li>
<li>Support for locked content, guessing mime types, binary body,..)</li>
<li>GUI changes..</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.');
INSERT INTO message VALUES (18, 'Released v1.3 Beta (Bernd)', '2007-08-22 22:50:58', 'Owner', 0, 'andreas_news', 'Spine v1.3 beta (codename Bernd) is a beta for the upcoming version 1.3 release. Major changes include:
<dir>
<li>Added 5 plugins (Slides, Picasa Gallery, Edit Page, Tags, Messages as RSS)</li>
<li>Added admin plugins (Attributes, Upload As.., Caching, ..</li>
<li>Added initial code for CGI support</li>
<li>Added Content Wizard</li>
<li>Support for locked content, guessing mime types, binary body,..)</li>
<li>GUI changes..</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.');
INSERT INTO message VALUES (19, 'New Beta release', '2005-07-23 13:25:13', 'Owner', 0, 'naturalist_news', 'We proudly announce a new beta release, version 1.0_05, aptly codenamed <i>Taj Mahal</i>.
This version introduces a feature freeze. All known issues and bugs will be fixed. Check the ChangeLog listing for all changes in this
release and the Download section to get it now! 
');
INSERT INTO message VALUES (20, 'Released v1.1 Stable (Burton)', '2006-02-19 15:13:55', 'Owner', 0, 'naturalist_news', 'Spine v1.1 (codename Burton) is the new stable release. Major changes include:
<dir><li>Updated layout and new styles</li>
<li>Fixed large number of bugs</li>
<li>Added File Manager and Administration Access control</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.');
INSERT INTO message VALUES (21, 'Released v1.2 Beta (Baldrick)', '2006-05-16 23:12:44', 'Owner', 0, 'naturalist_news', 'Spine v1.2 beta (codename Baldrick) is a beta for the upcoming version 1.2 release. Major changes include:

<dir><li>Updated layout and new styles</li>
<li>Fixed small number of bugs</li>
<li>Support for mod_perl 2</li>
<li>Support for int''l</li>
<li>Support for Postgresql as RDBMS</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (22, 'Released v1.2 Stable (Blackadder)', '2006-12-27 18:24:22', 'Owner', 0, 'naturalist_news', 'Spine v1.2 stable (codename Blackadder) is now available for download. Major changes include:
<dir><li>Updated layout and added <b>8</b> new styles</li>
<li>Fixed a number of bugs and added security measures</li> 
<li>Code cleanup and speedup (database handling, API)</li>
<li>Added extra documentation : Quickstart guide for Styles</li>
<li>Fixed in Package : Added (finally) support for logging</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');
INSERT INTO message VALUES (23, 'Released v1.22 Bugfix (Termite)', '2007-08-22 22:46:42', 'Owner', 0, 'naturalist_news', 'Spine v1.22 Bugfix release (codename Termite) is now available for download. <b>Upgrading is recommended!</b> This packages fixes 2 of the vulnerabilities as reported by Secunia:<ol>
<li>Fixed in Admin : Referer check</li>
<li>Fixed in Admin : Arbitrary password</li>
</ol>
See the <a href="install.html">Installation documentation</a> for upgrading instructions. This package can be used as upgrade and reinstallation source. The affected package (version 1.2) will be removed from download listings. ');
INSERT INTO message VALUES (24, 'Released v1.3 Beta (Bernd)', '2007-08-22 22:50:58', 'Owner', 0, 'naturalist_news', 'Spine v1.3 beta (codename Bernd) is a beta for the upcoming version 1.3 release. Major changes include:
<dir>
<li>Added 5 plugins (Slides, Picasa Gallery, Edit Page, Tags, Messages as RSS)</li>
<li>Added admin plugins (Attributes, Upload As.., Caching, ..</li>
<li>Added initial code for CGI support</li>
<li>Added Content Wizard</li>
<li>Support for locked content, guessing mime types, binary body,..)</li>
<li>GUI changes..</li>
</dir>See the <a href="changelog.html">ChangeLog</a> for full listing.
');


--
-- Data for Name: messagegroup; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO messagegroup VALUES (1, 'news', 'admin', 'admin', '1111', 'spinenews');
INSERT INTO messagegroup VALUES (2, 'andreas_news', 'admin', 'admin', '1111', 'andreas_spinenews');
INSERT INTO messagegroup VALUES (3, 'rssnews', 'admin', 'admin', '1111', 'rss.item');
INSERT INTO messagegroup VALUES (4, 'naturalist_news', 'admin', 'admin', '1111', 'naturalistnews');


--
-- Data for Name: navbarbuttons; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO navbarbuttons VALUES (1, 10, 4, 'admin/cache/', '', 'Caching', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (2, 10, 3, 'admin/uploadas/', '', 'Upload As', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (3, 23, 10, 'sourceforge.html', '', 'Sourceforge', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (4, 23, 9, 'alternate.html', '', 'Alt Datatypes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (5, 23, 8, 'developing.html', '', 'Developing', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (6, 23, 7, 'license.html', '', 'License', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (7, 23, 6, 'faq.html', '', 'FAQ', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (8, 23, 5, 'quickstart2.html', '', 'Quickstart : Style', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (9, 23, 4, 'quickstart.html', '', 'Quickstart : Content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (10, 23, 2, 'tags.html', '', 'Tags', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (11, 23, 3, 'styles.html', '', 'Styles', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (12, 23, 1, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (13, 22, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (14, 22, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (15, 22, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (16, 21, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (17, 21, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (18, 21, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (19, 21, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (20, 21, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (21, 21, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (22, 21, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (23, 20, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (24, 20, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (25, 20, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (26, 20, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (27, 20, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (28, 20, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (29, 20, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (30, 18, 6, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (31, 31, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (32, 18, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (33, 18, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (34, 18, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (35, 18, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (36, 18, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (37, 17, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (38, 17, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (39, 17, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (40, 17, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (41, 17, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (42, 17, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (43, 17, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (44, 16, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (45, 16, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (46, 16, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (47, 16, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (48, 16, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (49, 16, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (50, 4, 12, 'documentation/sourceforge.html', '', 'Sourceforge Project Information', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (51, 2, 5, 'developers.html', '', 'Developers', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (52, 16, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (53, 15, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (54, 15, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (55, 15, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (56, 15, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (57, 15, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (58, 15, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (59, 15, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (60, 14, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (61, 14, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (62, 14, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (63, 10, 2, 'admin/export/', '', 'Export SQL', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (64, 13, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (65, 13, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (66, 13, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (67, 13, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (68, 13, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (69, 13, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (70, 13, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (71, 14, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (72, 14, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (73, 14, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (74, 10, 1, 'admin/language/', '', 'Language', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (75, 14, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (76, 9, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (77, 9, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (78, 9, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (79, 9, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (80, 9, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (81, 9, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (82, 9, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (83, 6, 10, '', '', 'FAQ, Tutorials, ...', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (84, 6, 12, '', '', 'Lots of pictures', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (85, 6, 14, '', '', 'Administrate your site', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (86, 6, 8, '', '', 'Get it here', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (87, 6, 6, '', '', 'All the stuff inside', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (88, 6, 4, '', '', 'Installation notes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (89, 5, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (90, 5, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (91, 5, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (92, 5, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (93, 5, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (94, 8, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (95, 8, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (96, 8, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (97, 8, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (98, 8, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (99, 8, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (100, 8, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (101, 7, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (102, 7, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (103, 7, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (104, 7, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (105, 7, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (106, 7, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (107, 7, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (108, 6, 2, '', '', 'About the site', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (109, 6, 13, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (110, 5, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (111, 6, 5, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (112, 5, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (113, 6, 7, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (114, 6, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (115, 6, 9, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (116, 6, 3, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (117, 6, 11, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (118, 4, 11, 'documentation/alternate.html', '', 'Alternative Datatypes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (119, 4, 5, 'documentation/quickstart2.html', '', 'Quickstart guide - Style', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (120, 4, 3, 'documentation/styles.html', '', 'Available Styles', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (121, 4, 13, 'documentation/tips.html', '', 'Tips & Tricks', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (122, 1, 8, 'admin/usergroup', '', 'Usergroups', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (123, 1, 11, 'admin/adminaccess/', '', 'Admin Access', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (124, 3, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (125, 4, 6, 'documentation/changelog.html', '', 'ChangeLog', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (126, 4, 8, 'documentation/faq.html', '', 'FAQ', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (127, 3, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (128, 3, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (129, 3, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (130, 2, 4, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (131, 3, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (132, 3, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (133, 2, 7, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (134, 1, 12, '?button=logout', '', 'Logout', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (135, 1, 10, 'admin/file/', '', 'File Manager', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (136, 1, 9, 'admin/statistics/', '', 'Statistics', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (137, 1, 7, 'admin/user/', '', 'Users', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (138, 1, 6, 'admin/macro/', '', 'Macros', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (139, 1, 5, 'admin/message/', '', 'Messages', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (140, 1, 4, 'admin/navbar/', '', 'NavBar', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (141, 1, 3, 'admin/style/', '', 'Style', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (142, 1, 2, 'admin/content/', '', 'Content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (143, 2, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (144, 4, 10, 'documentation/developing.html', '', 'Developing for SPINE', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (145, 2, 3, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (146, 2, 2, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (147, 10, 6, 'admin/tools/', '', 'Tools', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (148, 2, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (149, 4, 2, 'documentation/tags.html', '', 'Using tags in your content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (150, 4, 7, 'documentation/todo.html', '', 'Development ToDo list', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (151, 3, 6, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (152, 4, 4, 'documentation/quickstart.html', '', 'Quickstart guide - Content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (153, 4, 9, 'documentation/license.html', '', 'License', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (154, 4, 1, 'documentation/install.html', '', 'Installation Notes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (155, 24, 1, 'Lalalal', 'Lalalala', 'Lalalal', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (156, 25, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (157, 25, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (158, 25, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (159, 25, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (160, 25, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (161, 25, 6, 'developers.html', '', 'Developers', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (162, 25, 7, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (163, 25, 8, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (165, 28, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (166, 28, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (167, 10, 5, 'admin/filetypes', '', 'Filetypes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (168, 28, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (169, 28, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (170, 29, 1, 'install.html', '', 'Installation Notes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (171, 29, 2, 'tags.html', '', 'Using tags in your content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (172, 29, 3, 'styles.html', '', 'Available Styles', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (173, 28, 5, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (174, 29, 4, 'quickstart.html', '', 'Quickstart guide - Content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (175, 29, 5, 'quickstart2.html', '', 'Quickstart guide - Style', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (176, 29, 6, 'changelog.html', '', 'ChangeLog', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (177, 29, 7, 'todo.html', '', 'Development ToDo list', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (178, 29, 8, 'faq.html', '', 'FAQ', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (179, 29, 9, 'license.html', '', 'License', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (180, 29, 10, 'developing.html', '', 'Developing for SPINE', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (181, 29, 11, 'alternate.html', '', 'Alternative Datatypes', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (182, 29, 12, 'sourceforge.html', '', 'Sourceforge Project Information', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (183, 29, 13, 'tips.html', '', 'Tips & Tricks', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (184, 30, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (185, 30, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (186, 30, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (187, 30, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (188, 31, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (189, 31, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (190, 31, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (191, 30, 5, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (192, 31, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (193, 31, 6, 'developers.html', '', 'Developers', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (194, 31, 7, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (195, 31, 8, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (196, 32, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (197, 32, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (198, 32, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (199, 32, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (200, 32, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (201, 33, 2, 'install.html', '', 'Installation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (202, 33, 1, 'index.html', '', 'About', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (203, 32, 6, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (204, 33, 3, 'features.html', '', 'Features', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (205, 33, 4, 'download.html', '', 'Download', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (206, 33, 5, 'docs.html', '', 'Documentation', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (207, 33, 6, 'developers.html', '', 'Developers', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (208, 33, 7, 'screenshots.html', '', 'Screenshots', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (209, 33, 8, 'login.html', '', 'Login', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (210, 1, 1, 'admin/', '', 'Start', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (164, 27, 1, 'admin/tools/rename', '', 'Rename Content', '', 0, '', '', '', '', '', '', '');
INSERT INTO navbarbuttons VALUES (211, 27, 2, 'foobie', '', 'foobar', '', 0, '', '', '', '', '', '', '');


--
-- Data for Name: navbars; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO navbars VALUES (2, 'main', 'none', 'horizontal', '', '', '', 'normal', '', '2008-07-23 22:47:16', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (3, 'ruth_main', 'none', 'horizontal', '', '', '', 'normal', '', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (4, 'docs', 'none', 'vertical', '', '', '', 'normal', '', '2008-07-24 23:11:22', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (5, 'plain_docs', 'none', 'horizontal', '', '', '', 'normal', '', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (6, 'autonomous', 'none', 'horizontal', '', '', '', 'normal', '</td></tr><tr><td>', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (7, 'andreas01', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (8, 'dittoditto', 'none', 'vertical', '', '', '', 'normal', '', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (9, 'andreas09_main', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-06-13 00:30:48', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (10, 'admin_plugin', 'none', 'horizontal', '', '', '', 'normal', '', '2008-07-28 00:53:13', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (16, 'bluerain', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (13, 'metro01', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-08-14 22:15:38', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (14, 'nightcity', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-08-14 22:39:04', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (15, 'nightcity_footer', 'none', 'horizontal', '', '', '', 'normal', ' |</li><li>', '2006-08-14 22:40:07', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (17, 'mintchocolate', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (18, 'gscape', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2008-04-24 23:03:47', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (20, 'neuphoric', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (21, 'progress', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-06-01 00:00:00', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (22, 'littlehome', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2006-12-21 23:12:55', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (23, 'ruthdocs', 'none', 'horizontal', '', '', '', 'normal', '<span> | </span></li><li>', '2006-12-27 17:02:33', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (24, 'foobar', 'none', 'vertical', '', '', '', 'normal', '', '2008-03-20 23:24:15', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (25, 'test', 'none', 'horizontal', '', '', '', 'normal', ' ', '2008-03-21 22:38:33', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (28, 'antique_modern_main', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2008-04-22 21:52:43', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (29, 'coffee_docs', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2008-04-22 22:58:10', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (30, 'naturalist_main', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2008-04-22 23:27:47', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (31, 'softgreen', 'none', 'horizontal', '', '', '', 'normal', '', '2008-04-25 19:27:26', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (32, 'terrafirma', 'none', 'horizontal', '', '', '', 'normal', '', '2008-04-25 19:46:51', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (33, 'zenlike', 'none', 'horizontal', '', '', '', 'normal', '</li><li>', '2008-04-28 07:30:30', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (1, 'admin', 'none', 'horizontal', '', '', '', 'normal', '', '2011-09-13 08:55:16', 'admin', 'users', '1010');
INSERT INTO navbars VALUES (27, 'admin_tool', 'none', 'horizontal', '', '', '', 'normal', '', '2011-10-10 14:55:16', 'admin', 'users', '1010');


--
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: spineuser
--



--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO session VALUES ('saGmKgPX6jR5sdlnGVcl1Kh15HY8PYJ3L3qtPEMOdXV6By15kGReCUrLc8G0aKiI', 'admin', '2011-10-12 14:19:30', NULL, '127.0.0.1');


--
-- Data for Name: statistics; Type: TABLE DATA; Schema: public; Owner: spineuser
--



--
-- Data for Name: style; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO style VALUES (1, 'main2', 'SPINE', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<html><head>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
 <link href="spine2.css" rel="stylesheet" type="text/css" media="all">
<title><?SPINE_Title?></title>
</head>

<body>
<div id="page" class="drkBrdrAll">
  <div id="headerRegion">
    <div id="logo"><?SPINE_Sitename?></div>
  </div>

  <div id="topMenuBar">
    <ul id="TopMenuList">
    <div id="menu"><?SPINE_Navbar("main")?></div>
    </ul>
  </div>
  <div id="contentRegion">
	<div id="contentBox">
	<br><?SPINE_Content?>
    </div>
  </div>
  <div class="clearthis"></div>
  <div id="footerRegion">Copyright 2005 - Hendrik Van Belleghem / SPINE Dev Team</div>
</div>
</body></html>', 'This style is part of the default SPINE Installation.
Created by Hendrik Van Belleghem');
INSERT INTO style VALUES (2, 'andreas01', 'andreas01', '', '2007-04-22 16:47:42', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="_your description goes here_" />
<meta name="keywords" content="_your,keywords,goes,here_" />
<meta name="author" content="_your name goes here_  / Original design: Andreas Viklund - http://andreasviklund.com/" />
<link rel="stylesheet" type="text/css" href="andreas01.css" media="screen" title="andreas01 (screen)" />
<link rel="stylesheet" type="text/css" href="andreas01print.css" media="print" />
<title><?SPINE_Title?></title>
</head>

<body><div id="wrap">

<div id="header">
<h1><?SPINE_Sitename?></h1>
<p><strong>"I can see you fly. You are an angel with wings, high above the ground!"</strong><br />(traditional haiku poem)</p>
</div>

<img id="frontphoto" src="<?SPINE_Images?>andreas01front.jpg" width="760" height="175" alt="" />

<div id="avmenu">
<h2 class="hide">Menu:</h2>
<ul><li><?SPINE_Navbar("andreas01")?></li></ul>
<div class="announce">
<h3>Latest news:</h3>
<?SPINE_Message("andreas_news")?></div>
</div>

<div id="extras">
<h3>More info:</h3>
<p>This is the third column, which can be used in many different ways. For example, it can be used for comments, site news, external links, ads or for more navigation links. It is all up to you!</p>

<h3>Links:</h3>
<p><?SPINE_Navbar("docs")?></p>

<p class="small">Version: 1.0<br />(July 25, 2005)</p>
</div>

<div id="content">
<?SPINE_Content?></div>

<div id="footer">
Copyright &copy; 2005 (_your name_). Design by <a href="http://andreasviklund.com">Andreas Viklund</a>.
</div>

</div>
</body>
</html>
', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by Andreas (http://www.oswd.org/user/profile/id/6205).');
INSERT INTO style VALUES (3, 'blank', '', '', '2006-12-31 23:00:00', 'admin', '', '1010', '<?SPINE_Content?>', '');
INSERT INTO style VALUES (4, 'xml', '', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<?xml version="1.0"?>
<?SPINE_Content?>
', 'This is an XML based stylesheet');
INSERT INTO style VALUES (5, 'eidored', 'eidored', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="eidored.css" type="text/css">
<title><?SPINE_Title?></title>
</head>

<body>
<div id="headbgrepeat">
	<div id="headbg">
		<div id="headtxt">
			<h1><?SPINE_Sitename?></h1>
			<?SPINE_Navbar("main")?><h2><?SPINE_Title?></h2>
		</div>
	</div>
</div>

<div id="body">
	<div id="content">
		<?SPINE_Content?>
		<div id="footer"><a href="http://flodhest.net">Designed by jhThorsen</a></div>
	</div>
</div>

</body>

</html>', 'This is a red layout create by jan henning thorsen (http://flodhest.net) :-P');
INSERT INTO style VALUES (6, 'eidogreen', 'eidogreen', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<html>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
<head>
<title><?SPINE_Title?></title>
<link rel="stylesheet" href=".eidogreen.css" type="text/css">
</head>

<body>
<div id="menu">
	<h2>menu</h2>
	<?SPINE_Navbar("main")?>
</div>
<div id="container">
	<div id="content">
		<?SPINE_Content?>
	</div>

</div>
</body>

</html>', 'This style is contributed by jhtorsen (jhth@online.no)');
INSERT INTO style VALUES (8, 'ruth', 'ruth', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
	<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href=".ruthsimple.css" />
		<style type="text/css">
			@import ".ruthcomplex.css";
			@import ".ruthcomplex_vnav.css";
			@import ".ruthcomplex_hnav.css";
		</style>
		<link rel="stylesheet" type="text/css" href=".ruththeme.css" />
		<title><?SPINE_Title?></title>

	</head>
	<body>

		<div id="oldbrowser">
			<p>
				This site will look much better in a browser that supports 
				<a href="http://www.webstandards.org/upgrade/" 
				title="Download a browser that complies with Web standards.">web 
				standards</a>, but it is accessible to any browser or Internet 
				device.
			</p>
		</div>

		<div id="pageFrame">

			<div id="masthead">
				<h1><?SPINE_Sitename?></h1>
			</div>

			<div class="hnav">
				<ul><li><?SPINE_Navbar("ruthdocs")?></li>
</ul>

			</div>

			<div id="leftColumn">
				<div id="innerLeftColumn">
					<div class="vnav">

						<ul><?SPINE_Navbar("ruth_main")?></ul>

					</div>
					
					

				</div>

			</div>

			<div id="contentColumn">
				<div id="innerContentColumn">
				<?SPINE_Content?>					
					
				</div>
			</div>
			<div id="footer">
				<div id="innerFooter">
					&copy; 2003 Anyone
				</div>
			</div>
		</div>

	</body>
</html>

', 'This style is part of the design released into public domain:
http://webhost.bridgew.edu/etribou/layouts/2col_footer/index.html');
INSERT INTO style VALUES (9, 'autonomous', 'autonomous', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><?SPINE_Title?></title>
<link rel="STYLESHEET" href="autonomous.css" type="text/css">
</head>
<body bgcolor="FFFFFF">
<div align="center">
<table width="750" border="0" cellpadding="0" cellspacing="0">
 <tr>
  <td colspan="3" width="750">
   <table width="750" border="0" cellpadding="0" cellspacing="0">

    <tr>
     <td width="330">

     <span style="font-size:28px;color:FFBA27">
     <?SPINE_Sitename?>
     </span>
     </td>
     <td width="400" align="right">
      <table width="400" border="0" cellpadding="0" cellspacing="0">
       <tr><form action="search.html">
        <td align="right" height="20">
        <span style="color:AAAAAA">

        search for term&nbsp;
        </span>
        <input type="text" onFocus="this.style.background=''FFFFFF'';" onBlur="this.style.background=''F9F9F9'';" name="keyword">&nbsp;
        <input type="submit" style="padding:0;background-color:FFBA27;border:0;color:FFFFFF;width:25;font-weight:bold" value="GO">
        </form></td>
       </tr>
      </table>
     </td>

     <td width="20"></td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td colspan="3" height="15" bgcolor="FFFFFF"></td>
 </tr>
 <tr>

  <td colspan="3" height="1" bgcolor="CCCCCC"></td>
 </tr>
 <tr>
  <td colspan="3" height="10" bgcolor="FFFFFF"></td>
 </tr>
 <tr>
  <td width="170" bgcolor="FFFFFF" valign="top">
  <span style="font-size:6px"><br></span>
  <div align="center">

   <table width="140" border="0" cellpadding="0" cellspacing="0">
    <tr><td>
     <?SPINE_Navbar("autonomous")?>
    </td>
    </tr>
   </table>
   <br><span style="font-size:6px"><br></span>
  <span style="font-size:6px"><br></span>
  </div>
  </td>
  <td width="1" bgcolor="CCCCCC"></td>
  <td width="579" valign="top">

  <span style="font-size:6px"><br></span>
  <div align="center" style="color:999999;line-height:1.6em">
  <?SPINE_Content?>
  </div>
  </td>

 </tr>
 <tr>
  <td colspan="3" height="10" bgcolor="FFFFFF"></td>
 </tr>
 <tr>
  <td colspan="3" height="1" bgcolor="CCCCCC"></td>
 </tr>
 <tr>
  <td colspan="3" height="5" bgcolor="FFFFFF"></td>

 </tr>
 <tr>
  <td colspan="3" bgcolor="FFFFFF" align="right">
  Copyright &#0169; 2004, <a href="http://www.principleofdesign.com" style="font-size:12px;color:AAAAAA">Adam Particka</a>. All Rights Reserved.
  </td>
 </tr>
</table>
</div>

</body>
</html>', 'This CSS is part of the Autonomous design, which was made freely available on Open Source Web Design (http://www.oswd.org) by gymnerd (http://www.oswd.org/user/profile/id/2547).');
INSERT INTO style VALUES (10, 'plain', 'plain', '', '2008-04-24 22:18:36', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Web Page Design by James Koster - http://www.jameskoster.co.uk -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><?SPINE_Sitename?></title>
<link href="plain.css" rel="stylesheet" type="text/css" />
</head>

<body>
<a name="top" id="top"></a>
<center>
		<div id="menu">
				<?SPINE_Navbar("main")?>
		</div>
		
		<div id="header">
				<h1><?SPINE_Sitename?></h1>
				<h2>Catchy line</h2>
		</div>
		
		<div id="content">
		
				<img src="<?SPINE_Images?>plainlogo.jpg" alt="Your Logo" class="logo" />
				
				<p class="introduction">
				</p>
				
				<div id="sidebar">
						<h1>Documentation</h1>
						<div class="submenu">
						<?SPINE_Navbar("plain_docs")?>
						</div>
				
					<p>
							You can view more of my templates on my Templates Website: <a href="http://xij.p0wned.org/prettyasapicture/">Pretty as a Picture</a>					
					</p>
					
					<h1>Log In</h1>
					<?SPINE_Login?>
				</div>
				
				<div id="mainbar">
						<?SPINE_Content?>
		  </div>
		
  </div>
  <div id="footer">
  		This is the footer. Put all your copyright info here.<br />
  Page designed by <a href="http://www.jameskoster.co.uk">James Koster</a>  </div>
</center>
</body>
</html>', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by JayKay (http://www.oswd.org/user/profile/id/6304).
');
INSERT INTO style VALUES (11, 'dittoditto', 'dittoditto', '', '2007-02-22 23:48:38', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="charset=UTF-8" />
    <meta name="author" content="Christopher Ditto - www.dittoditto.com" />
    <meta name="generator" content="Christopher Ditto - www.dittoditto.com" />
<title><?SPINE_Title?></title>
  <link rel="stylesheet" type="text/css" href="ditto-print.css" media="print" />  
  <link rel="stylesheet" type="text/css" href="ditto-screen.css" media="screen" /> 
</head>
<body><table width="660" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000" align="center">
<tr>
<td height="50" class="header" valign="bottom" align="right">
<?SPINE_Sitename?>
</td>
</tr>
<tr>
<td height="12" class="subheader" valign="bottom" align="left" style="border-bottom: 1px solid #000000;"><img src="<?SPINE_Images?>dittoblank.gif" width="1" height="11" alt="" /></td>
</tr>
<tr>
<td class="contentmain">
<table cellpadding="10" align="center" width="100%" style="margin-top:0px;">
<tr>
<!-- Begin Content Left  -->
<td valign="top" class="contentleft">

<!-- Start Main Content Box -->
<h1>main content</h1>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr><td class="whitebox_topleft"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" border="0" alt="" /></td><td class="whitebox" style="border-top: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="whitebox" width="9" style="border-top: 1px solid #666666; border-right: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td></tr><tr><td class="whitebox" width="9" style="border-left: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="whitebox">

<?SPINE_Content?>

</td><td class="whitebox" width="9" style="border-right: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td></tr><tr><td width="9" class="whitebox" style="border-left:1px solid #666666;border-bottom:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="whitebox" width="100%" style="border-bottom:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td width="9" class="whitebox_bottomright"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" border="0" alt="" /></td></tr>
</table>
<!-- End Main Content Box -->

<br clear="all" />


</td>
<!-- End Content Left  -->
<!-- Begin Content Right -->
<td valign="top" class="contentright">

<!-- Begin Menu Box -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="right" style="margin-top:13px">
<tr><td class="menubox" width="10"></td><td class="menubox" width="100%"></td><td width="10"><img src="<?SPINE_Images?>ditto2-topright.gif" width="10" height="10" alt="" hspace="0" vspace="0" border="0" /></td></tr><tr><td class="menubox" width="10"></td><td class="menubox" width="100%" align="center">
<!-- Floating Box Content -->
<?SPINE_Navbar("dittoditto")?>
<!-- End Floating Box Content -->
</td><td class="menubox" width="10"></td></tr><tr><td width="10"><img src="<?SPINE_Images?>ditto2-bottomleft.gif" width="10" height="10" alt="" hspace="0" vspace="0" border="0" /></td><td class="menubox" width="100%"></td><td class="menubox" width="10"></td></tr>
</table>

<!-- End Menu Box -->
<br clear="all" /><br />

<!-- Begin Latest News Box -->
<h2>latest news</h2>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr><td class="greybox" width="9" style="border-left: 1px solid #666666;border-top: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" border="0" alt="" /></td><td class="greybox" style="border-top: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="greybox" width="9" style="background: url(<?SPINE_Images?>ditto3-topright.gif)"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td></tr><tr><td class="greybox" width="9" style="border-left:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="greybox">

Ut enim ad minim veniam, quis nostrud exer citation ullamco laboris nisi. 

<div style="border-top:1px dashed #666666; margin:5px 2px 2px 2px; width: 85%; align:center;"></div>

Lorem ipsum dolor sit amet, consec tetur adip isicing elit, sed do eiusmod tempor incid idunt. 

</td><td class="greybox" width="9" style="border-right: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td></tr><tr><td width="9" class="greybox" style="background:url(<?SPINE_Images?>ditto3-bottomleft.gif)"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="greybox" width="100%" style="border-bottom:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td width="9" class="greybox" style="border-right:1px solid #666666;border-bottom:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" alt="" hspace="0" vspace="0" border="0" /></td></tr>
</table>
<!-- End Latest News Box -->
<br clear="all" /><br />

<!-- Begin Search Box -->
<h2>search</h2>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr><td class="greybox" width="9" style="border-left: 1px solid #666666;border-top: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" border="0" alt="" /></td><td class="greybox" style="border-top: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="greybox" width="9" style="background: url(<?SPINE_Images?>ditto3-topright.gif)"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td></tr><tr><td class="greybox" width="9" style="border-left:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="greybox">

<form action="search.html" method="post">
<table border="0" cellspacing="2" cellpadding="0" align="right">
<tr>
<td align="left"><input type="text" name="keyword" class="searchbox" maxlength="20" /></td>
</tr>
<tr><td align="right"><input type="submit" class="button" value="Search"/></td></tr>
</table>
</form>

</td><td class="greybox" width="9" style="border-right: 1px solid #666666;"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td></tr><tr><td width="9" class="greybox" style="background:url(<?SPINE_Images?>ditto3-bottomleft.gif)"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td class="greybox" width="100%" style="border-bottom:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" hspace="0" vspace="0" alt="" /></td><td width="9" class="greybox" style="border-right:1px solid #666666;border-bottom:1px solid #666666"><img src="<?SPINE_Images?>dittoblank.gif" width="9" height="9" alt="" hspace="0" vspace="0" border="0" /></td></tr>
</table>
<!-- End Search Box -->

</td>
<!-- End Content Right -->

</tr>
</table>

<div align="center">&copy;all rights reserved, company name here</div>
</td>
</tr>
</table>
<!-- Template Design by Christopher Ditto: http://www.dittoditto.com -->
</body>
</html>
', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by dittoditto (http://www.oswd.org/user/profile/id/6329).
');
INSERT INTO style VALUES (12, 'mintchocolate', '', '', '2007-02-22 23:49:46', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><?SPINE_Title?></title>
<meta name="description" content="Mint Chocolate Chip is a clean, tableless, minty design. For more information please visit my website, http://www.andrewstrojny.com "/>
<link rel="stylesheet" href="mintchocolate.css" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper"> 
	<div id="header"><img src="<?SPINE_Images?>mintchocolate_header.png" width="770" height="119" alt="Mint Chocolate Chip"/></div>
	<div id="maincontainer">
		<div id="nav">
			<div id="navinner">
			<ul><li><?SPINE_Navbar("mintchocolate")?></li>
			</ul>
			</div>
		</div>
	<div id="padding"></div>
			<div id="content">
				<img src="<?SPINE_Images?>mintchocolate_board.jpg" width="370" height="300" alt="Green Jaws - Stock Xchnge"/>
			<?SPINE_Content?>
			</div>
			<div id="newsbox">
				<div id="innernews">
				<h2>News Item 1</h2>
				<p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim</p>
				<h2>News Item 2</h2> 			
				<p>ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non </p>
				<h2>News Item 3</h2>
				<p>numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.</p>
				<h2>News Item 4</h2>
				<p>numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.</p>
				</div>
			</div>
	</div>
		<div id="footer">
			<img src="<?SPINE_Images?>mintchocolate_footer.png" width="770" height="32" alt="Footer"/>
			<!--	Do not remove the link to www.andrewstrojny.com below. It is the only thing I ask of you if you choose to use my design. Feel free to add a ''Modified by [Your Name]'' - or similar - link next to it if you have made changes to the layout. Feel free to get more information or ask me questions on www.andrewstrojny.com. (c) Andrew Strojny: 2006 -->
				<p>&copy; 2006 yourname | design by <a  href="http://www.andrewstrojny.com">andrewstrojny</a></p>
		</div>
</div>
</body>
</html>', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by andrewstrojny (http://www.oswd.org/user/profile/id/9633).');
INSERT INTO style VALUES (14, 'metro01', 'metro01', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?SPINE_Title?></title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<link href="metro01.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
	<div id="wrap_top"></div>
	<div id="main">
	
		<div id="head">
			<ul class="navbar">
				<li><?SPINE_Navbar("metro01")?></li>
			</ul>
			<h1 class="title"><?SPINE_Sitename?></h1>
		</div>
			
		<div id="content">
			<?SPINE_Content?>

		</div>
		
		<div id="rightbar">
			<div class="box" id="desc">
			This is some extra content, it can be used for news, links, updates, or anything else.
			</div>
			
			<div class="box">
				<h2>Archive</h2>
				<ul>
					<li><a href="#">Lorem Ipsum</a></li>
					<li><a href="#">Lorem Ipsum 2</a></li>
				</ul>
			</div>
			
			<div class="box">
				<h2>Links</h2>
				<ul>
					<li><a href="#">Site 1</a></li>
					<li><a href="#">Site 2</a></li>
					<li><a href="#">Site 3</a></li>
				</ul>
			</div>
		</div>
		
		<div id="footer">
			&copy; <?SPINE_Macro("companyname")?> | Design by <a href="http://www.drugo.biz">Carlo Forghieri</a>
		</div>
	</div>
</div>
</body>
</html>
', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by drugo (http://www.oswd.org/user/profile/id/12009)');
INSERT INTO style VALUES (15, 'nightcity', 'nightcity', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?SPINE_Title?></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="nightcity.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="HEADER">
	<h1><a href="#"><?SPINE_Sitename?></a></h1>
	<p class="NextPage"><a href="#"></a></p>
	<ul>
		<li><?SPINE_Navbar("nightcity")?></li>
	</ul>
</div> <!-- header -->

<div id="PATH">
	<p><a href="#">Home</a> <span class="Arrow">&raquo;</span> About <?SPINE_Macro("companyname")?></p>
</div> <!-- PATH -->

<div id="SIDEBAR">
	<h1>RECENT NEWS</h1>
	<?SPINE_Messages("nightcity")?><!-- Define a message group called ''nightcity'' -->
	<h1>LINKS</h1>
	<p><a href="http://www.gettemplate.com/?fromnightcity">www.gettemplate.com</a></p>
	<p><a href="http://www.wisepixel.com/?fromnightcity">www.wisepixel.com</a></p>
	<p><a href="http://www.funnyball2.com/?fromnightcity">www.funnyball2.com</a></p>
</div> <!-- sidebar -->

<div id="CONTENT">
<?SPINE_Content?>
</div> <!-- content -->

<div id="FOOTER">
<ul>
   <li><?SPINE_Navbar("nightcity_footer")?><!-- use '' |</li><li>'' as separator --></li>
</ul>
<p>&copy; 2005, <?SPINE_Macro("companyname")?>s. All rights reserved.</p>
<p>Designed by <a href="http://www.gettemplate.com/?fromnightcity">GetTemplate</a></p>
</div> <!-- footer -->
</body>
</html>', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by GetTemplate (http://www.oswd.org/user/profile/id/11340).
');
INSERT INTO style VALUES (16, 'bluerain', 'bluerain', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<title><?SPINE_Title?></title>
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="Rowan Lewis" />
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<link rel="stylesheet" title="Normal" type="text/css" media="screen" href="bluerain.css" />

	</head>
	<body>
		<div id="main">
			<div id="header">
				<h1><?SPINE_Sitename?></h1>
			</div>
			<div id="menu">
				<ul>

					<li><?SPINE_Navbar(''bluerain'')?></li>
				</ul>
			</div>
			<div id="content">

				<div class="article">
					<?SPINE_Content?>
				</div>
			</div>
<!--			<div id="panel">
				<div class="left">

					<h3>Fusce blandit</h3>
					<ul>
						<li>Suspendisse vitae leo</li>
						<li>Libero vehicula posuere</li>
						<li>Est ut ligula</li>
						<li>Felis faucibus pretium</li>

					</ul>
					<h4>Nunc ut erat</h4>
					<p>
						Nunc placerat dapibus arcu. In adipiscing ante ultricies eros. Etiam varius, diam et nonummy laoreet, lorem leo varius eros, eget pulvinar quam dui consequat nisl.
					</p>
					<p>
						Vestibulum eget lectus id massa tincidunt faucibus. Duis pharetra mi vitae tortor. Nulla pharetra iaculis urna. Donec molestie turpis eu velit. Suspendisse nonummy porttitor diam.
					</p>
					<p>

						Etiam varius, diam et nonummy laoreet, lorem leo varius eros, eget pulvinar quam dui consequat nisl.
					</p>
				</div>
				<div class="right">
					<h3>Nullam id augue</h3>
					<p>
						Vivamus urna metus, placerat quis, euismod eget, aliquet ac, sapien.
					</p>
					<form action="#" method="post">

						<h4><label for="item_a">Cras odio:</label></h4>
						<p class="input">
							<input name="item_a" id="item_a" />
						</p>
						<h4><label for="item_b">Praesent id:</label></h4>
						<p class="input">
							<input name="item_b" id="item_b" />
						</p>

						<h4><label for="item_c">Praesent id:</label></h4>
						<p class="text">
							<textarea name="item_c" id="item_c" rows="10" cols="30"></textarea>
						</p>
						<p class="button">
							<button name="submit" type="submit">Vehicula</button><button name="reset" type="reset">Posuere</button>
						</p>

					</form>
				</div>
			</div>-->
			<div id="footer">
				<p>
					Designed by <a href="http://www.pixelcarnage.com/">PixelCarnage</a>.<br />Released under the GNU GPL for free distributation and modification.
				</p>
			</div>

		</div>
	</body>
</html>', 'This CSS is part of the Blue Rain design, which was made freely available on Open Source Web Design (http://www.oswd.org) by Rowan Lewis (http://www.oswd.org/user/profile/id/11508). ');
INSERT INTO style VALUES (17, 'gscape', 'gscape', '', '2008-04-24 23:05:58', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="author" content="<?SPINE_Webmaster?>" />
		<meta name="keywords" content="key words that you are targeting for search engines." />
		<meta name="description" content="description of the main conents." />
		<link rel="stylesheet" type="text/css" href="gscape.css" media="screen"/>
		<title><?SPINE_Title?></title>
	</head>
	<body>
		<div id="MainWrapperBlack">
			<div id="WrapperGray">
				<div id="Header">
					<h1 id="Shadow"><?SPINE_Sitename?></h1>
					<div id="Title"><a href="index.html"><?SPINE_Sitename?></a></div>
					<h2>Type your site''s main slogan here</h2>
					<div id="HeaderMenus">
						<ul><li><?SPINE_Navbar("gscape")?></li>
						</ul>
					</div>
				</div>
				<div id="RightColumn">
					<!-- For the rounded corners -->
					<div id="LoginTopRight" class="TopRight"></div>
					<div id="LoginTopLeft" class="TopLeft"></div>
					<form action="search.html">
					<div id="Login" class="RightContents">
						<h4>Search</h4>
<input type="text" name="keyword" class="input">&nbsp;<input type="submit" class="button" value="Search">
						</div></form>
					<!-- For the rounded corners -->
					<div id="LoginBottomRight" class="BottomRight"></div>
					<div id="LoginBottomLeft" class="BottomLeft"></div><br/>
					
					<div id="RightOneTopRight" class="TopRight"></div>
					<div id="RightOneTopLeft" class="TopLeft"></div>
					<div id="RightOne" class="RightContents">
						<h3>Articles</h3>
						<p><b>Leaving IE behind:</b> I use the Internet for chatting with my friends, e-mailing, and locating information related to my studies. I run Internet Explorer on an XP Professional machine, and I have Service Pack 2 installed. My friends suggested I switch to Mozilla Firefox or Opera but I was so familiar with IE I didn''t feel comfortable making the move. That was about to change.<a href="http://www.download.com/Spyware-Horror-Stories/1200-2023_4-5157479.html?tag=more">...</a></p>

						<p><b>How spyware can cost you your job:</b> Near the end of 2003, I was told to use a coworker''s computer when he was on vacation because it was faster. I had to log on to the Internet to access my work e-mail from his computer. I mistyped the URL and got redirected to another site, where <a href="http://www.download.com/Spyware-Horror-Stories/1200-2023_4-5157477.html?tag=more">...</a></p>
				</div>
					<div id="RightOneBottomRight" class="BottomRight"></div>
					<div id="RightOneBottomLeft" class="BottomLeft"></div><br/>
					<div id="RightTwoTopRight" class="TopRight"></div>
					<div id="RightTwoTopLeft" class="TopLeft"></div>
					<div id="RightTwo" class="RightContents">
						<h3>Regular Links</h3>
						<a href="http://oswd.org/">OWSD</a><br/>
						<a href="http://openwebdesign.org/">Open Webdesign</a><br/>
						<a href="http://www.4templates.com/">4templates</a><br/>
						<a href="http://en.crystalxp.net/">CrystalXP</a><br/>
						<a href="http://en.wikipedia.org/wiki/Main_Page">Wikipedia</a>
					</div>
					<div id="RightTwoBottomRight" class="BottomRight"></div>
					<div id="RightTwoBottomLeft" class="BottomLeft"></div>
				</div>
				<div id="LeftContainer">
					<div id="LeftContents">
						<?SPINE_Content?>

					</div>
				</div>
				<div id="LeftColumnFill" class="Fill"></div>
				<div id="Footer">Copyright &copy; 2005 Your Comany. Design by <a href="http://oswd.org/designs/search/designer/id/7724/">Gururaj</a>.
					<!--<a href="http://openwebdesign.org/userinfo.phtml?user=kpgururaja">Gururaj</a>.-->
				</div>
			</div>
		</div>
	</body>
</html>', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by kpgururaja (http://www.oswd.org/user/profile/id/7724).');
INSERT INTO style VALUES (18, 'redbusiness', 'STUB Style', '', '2008-04-25 19:17:21', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Free Css Template</title>
	<meta http-equiv="Content-Language" content="English" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="author" content="David Herreman (www.free-css-templates.com)" />
	<meta name="description" content="Free Css Template" />
	<meta name="keywords" content="free,css,template" />	
	<meta name="Robots" content="index,follow" />
	<meta name="Generator" content="sNews 1.5" />
	<link rel="stylesheet" type="text/css" href="redbusiness.css" media="screen" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="rss/" />
</head>
<body>
	
<div class="content">
	<div id="top">
				<div id="icons">
					<a href="/index.html" title="Home page"><img src="/images/redbusiness_home.gif" alt="Home" /></a>
					<a href="/contact/" title="Contact us"><img src="/images/redbusiness_contact.gif" alt="Contact" /></a>
					<a href="/sitemap/" title="Sitemap"><img src="/images/redbusiness_sitemap.gif" alt="Sitemap" /></a>
				</div>
				<h1><?SPINE_Title?></h1>
				<h2>Place your best slogan here</h2>
	</div>
	<!-- end of the Top part -->
</div>			

<div id="prec">
	<div id="wrap">
			<div id="pic">
				<div id="slogan">
					<h1>FREE TEMPLATE</h1>
					<h2>Make changes to this text in content <i>redbusiness.html</i>. Make changes to this layout in style <i>redbusiness</i></h2>
					<h2>
					Curabitur vel risus sit amet ante porta adipiscing. Donec eget pede at libero tempor aliquet. Nulla justo. Phasellus hendrerit magna quis metus sagittis ultrices. Vestibulum in sapien. Nunc quis sem. Integer nulla neque, mollis eu, pretium eget, <a href="#" title="#">iaculis ac</a>, nibh. Vestibulum velit sapien, rhoncus vitae, ultrices a, nonummy at, neque. Nunc condimentum, nisl non rhoncus porttitor, velit enim consectetuer augue, id imperdiet mauris erat nec risus. In nec eros.
					</h2>
				</div>
			</div>
			<div id="menu">
						<ul>	
							<li><?SPINE_Navbar("dittoditto")?></li>
						
						</ul>
			</div>
	</div>
</div>

<div class="content">
<?SPINE_Content?>
</div>

</body>
</html>', 'This is where you put comments about this style');
INSERT INTO style VALUES (19, 'neuphoric', 'neuphoric', '', '2006-12-31 23:00:00', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!-- This template can be downloaded from www.openwebdesign.org. Just search for neuphoric -->
<!-- This template has been modified by mejobloggs (http://www.openwebdesign.org/userinfo.phtml?user=mejobloggs) -->
<!-- Please use this template according to the license on the original template (included as pleaseread.txt) -->
<!-- The original of this template was designed by http://www.tristarwebdesign.co.uk - please visit for more templates & information - thank you. -->

<head>
	<title><?SPINE_Title?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="neuphoric.css" />
</head>

<body id="altbody">

<div id="wrapper-header">
	<div id="header">
		<h1><?SPINE_Sitename?></h1>
	</div>
</div>

<div id="wrapper-menu">
	<div id="menu">
		<ul><li><?SPINE_Navbar("neuphoric")?></li>
		</ul>
	</div>
</div>

<div id="content">
	<?SPINE_Content?>
</div>

<div id="footer">
	original design by <a title="derby web design" href="http://www.tristarwebdesign.co.uk">tri-star web design</a>
</div>

</body>

</html>', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by mejobloggs (http://www.oswd.org/user/profile/id/10055)');
INSERT INTO style VALUES (20, 'progress', 'progress', '', '2007-02-22 23:52:45', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!-- this template was designed by http://www.tristarwebdesign.co.uk - please visit for more templates & information - thank you. -->

<head>

<meta http-equiv="Content-Language" content="en-gb" />

<title><?SPINE_Title?></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />

<!-- style sheet links -->
<link rel="stylesheet" type="text/css" href="progress_style.css" />
<link rel="stylesheet" type="text/css" href="progress_menu.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="progress_ie.css" />
<![endif]-->

</head>

<body>

<div id="menu">

	<div id="menutop"><a title="home"href="index.html"><img alt="home" src="<?SPINE_Images?>progress_menu-top.gif" width="200" height="200" /></a></div>
	
	<div class="navcontainer">
		<ul class="navlist"><li><?SPINE_Navbar("progress")?></li>
		</ul>
	</div>
	
	<br />
	
	<div class="navcontainer">
		<ul class="navlist">
			<li><a id="topmenu" title="valid xhtml strict" href="index.html">valid xhtml strict</a></li>
			<li><a title="valid css" href="index.html">valid css</a></li>
			<li><a title="derby web design" href="http://www.tristarwebdesign.co.uk">webdesign by tri-star</a></li>
		</ul>
	</div>

</div>

<div id="main">
<?SPINE_Content?>
</div>

</body>

</html>v', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by tristar (http://www.oswd.org/user/profile/id/8809).');
INSERT INTO style VALUES (21, 'main-minimal', '', 'main', '2008-03-26 21:57:41', 'admin', 'users', '1010', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
<head>
<title>S P I N E - <?SPINE_Title?> - The backbone for your website</title>
<script type="text/javascript" src="jquery.js"></script>
<style type="text/css">
.Opaque { filter:alpha(opacity=60);
-moz-opacity: 0.6;
opacity: 0.6; 
background-color: gray;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="Stylesheet" href="spine.css" type="text/css" media="screen"></head>

<body>
<div id="menu">
<?SPINE_Navbar("main")?>
</div>

<div id="container">
<div id="content">
<?SPINE_Content?>
</div>
</div>

</body></html>', 'This style is part of the default SPINE Installation.
Created by Hendrik Van Belleghem ; Major Updates by eidolon');
INSERT INTO style VALUES (22, 'test', 'LALALALA', 'foobar', '2008-05-29 22:41:27', 'admin', 'admin', '1010', '<?SPINE_Content?>', 'Alalalalala');
INSERT INTO style VALUES (23, 'coffee_n_cream', '', '', '2008-04-22 22:58:47', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
<meta name="description" content="description"/>
<meta name="keywords" content="keywords"/> 
<meta name="author" content="author"/> 
<link rel="stylesheet" type="text/css" href="coffee_n_cream.css" media="screen"/>
<title><?SPINE_Title?></title>
</head>

<body>

<div class="container">

	<div class="header">
				
		<div class="title">
			<h1><?SPINE_Title?></h1>
		</div>

	</div>

	<div class="navigation"><?SPINE_Navbar("main")?><div class="clearer"><span></span></div>
		</div>

	<div class="main">		
		
		<div class="content"><?SPINE_Content?></div>

		<div class="sidenav">

			<h1>Something</h1>
			<ul>
				<li><?SPINE_Navbar("coffee_docs")?></li>
			</ul>

			<h1>Another thing</h1>
			<ul>
				<li><a href="index.html">consequat molestie</a></li>
				<li><a href="index.html">sem justo</a></li>
				<li><a href="index.html">semper</a></li>
				<li><a href="index.html">sociis natoque</a></li>
			</ul>

		</div>

		<div class="clearer"><span></span></div>

	</div>

	<div class="footer">&copy; 2006 <a href="index.html">Website.com</a>. Valid <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> &amp; <a href="http://validator.w3.org/check?uri=referer">XHTML</a>. Template design by <a href="http://templates.arcsin.se">Arcsin</a>
	</div>

</div>

</body>

</html>', 'This template is licensed under a Creative Commons Attribution 2.5 License.
This means that you are free to use and modify it for any purpose, but you must include the provided link back to our website (http://arcsin.se).');
INSERT INTO style VALUES (24, 'naturalist', 'STUB Style', '', '2008-04-22 23:27:23', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!--
Copyright: Darren Hester 2006, http://www.designsbydarren.com
License: Released Under the "Creative Commons License", 
http://creativecommons.org/licenses/by-nc/2.5/
-->

<head>

<!-- Meta Data -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Short description of your site here." />
<meta name="keywords" content="keywords, go, here, seperated, by, commas" />

<!-- Site Title -->
<title><?SPINE_Title?></title>

<!-- Link to Style External Sheet -->
<link href="naturalist.css" type="text/css" rel="stylesheet" />

</head>

<body>

<div id=''page_wrapper''>

<div id=''page_header''>
<h1><?SPINE_Title?></h1>
<h2>Sub-title</h2>
</div>

<div id=''menu_bar''>

<div id="navcontainer">
<ul id="navlist">
<li><?SPINE_Navbar("naturalist_main")?>
</li>
</ul>
</div>

</div>

<div id=''content_wrapper''>

<div class=''spacer''></div>

<div id=''left_side''>

<?SPINE_Content?></div>

<div id=''right_side''>

<h3>Right Side</h3>
<p>
<a href=''#''>Lorem ipsum</a> ferri volumus et his. Pri vitae tritani corrumpit 
an. In fabulas adipisci accommodare quo, tibique epicurei cu 
mel, habeo adhuc <a href=''#''>scripta</a> nam at. <a href=''#''>Aliquam dissentias</a> 
te nec, his ei rebum prodesset. Eam cibo tation ceteros ut, cum solet accumsan 
ad. An per commune posidonium, ea est populo dicunt.
</p>

<h3>Right Side</h3>
<p>
Ea vis verear omittam appetere. <a href=''#''>Laudem accusam takimata</a> ea est, 
eu delenit eligendi mediocrem mei. Mea at <a href=''#''>malorum</a> invenire 
urbanitas. Ei sea novum petentium deseruisse. Vero delectus efficiantur ei nec, 
amet tollit consetetur eos ut. Ea vis verear omittam appetere. <a href=''#''>
Laudem accusam takimata</a>
</p>

</div>

<div class=''spacer''></div>

</div>

<div id=''page_footer''>
<p>
Template provided by <a href="http://www.designsbydarren.com/" target="new">Designs by Darren</a>. 
Released under a <a href="http://creativecommons.org/licenses/by-nc/2.5/" target="new">Creative Commons License</a>.<br />
<a href="http://validator.w3.org/check?uri=referer" target="new">Valid XHTML 1.0 Transitional</a>
</p>

</div>

</div>

</body>

</html>', 'This is where you put comments about this style');
INSERT INTO style VALUES (25, 'antique_modern', '', '', '2008-04-22 22:06:57', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
    <meta name="Robots" content="index,follow" />
		<meta name="author" content="Aaron Ganschow, aaron@unkommon.com" />
    <title>
      <?SPINE_Title?>
    </title>
    <link rel="stylesheet" type="text/css" href="antique_modern_style.css" />
  </head>
  <body>
    <div id="head">
		  <div id="title">
					 <?SPINE_Title?>
			</div>
      <div id="menu">
        <ul>
          <li><?SPINE_Navbar("antique_modern_main")?></li>
        </ul>
      </div>
    </div>
    <div id="body_wrapper">
      <div id="body">
					 <div id="all">
					 			<div class="top"></div>
								<div class="content"><?SPINE_Content?></div>
								<div class="bottom"></div>
						</div>
        <div class="clearer"></div>
      </div>
      <div class="clearer"></div>
    </div>
    <div id="end_body"></div>

		<div id="footer">
				 &copy; Copyright <a href="mailto:youremail@server.com">Your Name</a> 2006
		</div>
  </body>
</html>
', 'This design was made freely available on Open Source Web Design (http://www.oswd.org) by wildleaf (http://www.oswd.org/user/profile/id/10024).');
INSERT INTO style VALUES (26, 'nonzero', 'STUB Style', '', '2008-04-24 00:09:04', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	Nonzero1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	missing in a maze

-->
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title><?SPINE_Title?></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" title="Red" href="nonzero_red.css" />
<!--
<link rel="alternate stylesheet" type="text/css" title="Blue" href="nonzero_blue.css" />
<link rel="alternate stylesheet" type="text/css" title="Green" href="nonzero_green.css" />
<link rel="alternate stylesheet" type="text/css" title="Brown" href="nonzero_brown.css" />
<link rel="alternate stylesheet" type="text/css" title="Magenta" href="nonzero_magenta.css" /> -->

</head>
<body>

<div id="header">

	<div id="header_inner" class="fixed">

		<div id="logo">
			<h1><?SPINE_Title?></h1>
			<h2>sub-title</h2>
		</div>
		
		<div id="menu">
			<ul>
				<li><?SPINE_Navbar("naturalist_main")?></li>
			</ul>
		</div>
		
	</div>
</div>

<div id="main">

	<div id="main_inner" class="fixed">

		<div id="primaryContent_columnless">

			<div id="columnA_columnless">
		
				<?SPINE_Content?>
		
			</div>
	
		</div>

		<br class="clear" />

	</div>

</div>

<div id="footer" class="fixed">
	Copyright &copy; 2006 Your Website. All rights reserved. Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a>.
</div>

</body>
</html>', 'This is where you put comments about this style');
INSERT INTO style VALUES (27, 'softgreen', 'STUB Style', '', '2008-04-25 19:28:13', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<title><?SPINE_Title?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
	<link rel="stylesheet" href="softgreen.css" />
</head>

<body>

	<div class="conteneur">
		
		<div class="menu">
			<ul class="menu-list">
				<li><?SPINE_Navbar("softgreen")?></li> 
			</ul>
		</div>

		<div class="header">
			<span class="header-title"><?SPINE_Title?></span><br />
			<span class="header-title-two">A beautiful design</span>
		</div>

		<div class="centre"><?SPINE_Content?>
		</div>

		<div class="pied">
			Design by <a href="http://nicolas.freezee.org" target="_BLANK">Nicolas Fafchamps</a>
		</div>


	</div>
	  
</body>
</html>
', 'This is where you put comments about this style');
INSERT INTO style VALUES (28, 'terrafirma', 'STUB Style', '', '2008-04-25 19:47:05', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	terrafirma1.0 by nodethirtythree design
	http://www.nodethirtythree.com

-->
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title><?SPINE_Title?></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="terrafirma.css" />
</head>
<body>

<div id="outer">

	<div id="upbg"></div>

	<div id="inner">

		<div id="header">
			<h1><span>terra</span>firma<sup>1.0</sup></h1>
			<h2>by nodethirtythree</h2>
		</div>
	
		<div id="splash"></div>
	
		<div id="menu">
			<ul>
				<li><?SPINE_Navbar("terrafirma")?></li>
			</ul>

		<div id="date">August 1, 2006</div>
		</div>
	

		<div id="primarycontent">
		<?SPINE_Content?>	
		</div>
		
		<div id="secondarycontent">

			<!-- secondary content start -->
		
			<h3>About Me</h3>
			<div class="content">
				<img src="/images/terrafirma_pic2.jpg" class="picB" alt="" />
				<p><strong>Nullam turpis</strong> vestibulum et sed dolore. Nulla facilisi. Sed tortor. lobortis commodo. <a href="#">More ...</a></p>
			</div>
			
			<h3>Topics</h3>
			<div class="content">
				<ul class="linklist">
					<li class="first"><a href="#">Accumsan congue (32)</a></li>
					<li><a href="#">Dignissim nec augue (14)</a></li>
					<li><a href="#">Nunc ante elit nulla (83)</a></li>
					<li><a href="#">Aliquam suscipit (74)</a></li>
					<li><a href="#">Cursus sed arcu sed (14)</a></li>
					<li><a href="#">Eu ante cras at risus (24)</a></li>
					<li><a href="#">Donec mollis dolore (39)</a></li>
					<li><a href="#">Aliquam suscipit (74)</a></li>
				</ul>
			</div>

			<!-- secondary content end -->

		</div>
	
		<div id="footer">
		
			&copy; My Website. All rights reserved. Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a>.
		
		</div>

	</div>

</div>

</body>
</html>', 'This is where you put comments about this style');
INSERT INTO style VALUES (29, 'transparentia', 'STUB Style', '', '2008-04-25 20:03:45', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
<meta name="description" content="description"/>
<meta name="keywords" content="keywords"/> 
<meta name="author" content="author"/> 
<link rel="stylesheet" type="text/css" href="transparentia.css" media="screen"/>
<title><?SPINE_Title?></title>
</head>

<body>

<div class="container">
	
	<div class="main">

		<div class="header">
		
			<div class="title">
				<h1><?SPINE_Title?></h1>
			</div>

		</div>
		
		<div class="content"><?SPINE_Content?>
		
		</div>

		<div class="sidenav">

			<h1>Navigation</h1>
			<ul>
				<li><?SPINE_Navbar("terrafirma")?></li>
			</ul>

			<h1>Search</h1>
			<form action="index.html">
			<div>
				<input type="text" name="search" class="styled" /> <input type="submit" value="" class="button" />
			</div>
			</form>

		</div>
	
		<div class="clearer"><span></span></div>

	</div>

	<div class="footer">&copy; 2006 <a href="index.html">Website.com</a>. Valid <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> &amp; <a href="http://validator.w3.org/check?uri=referer">XHTML</a>. Template design by <a href="http://templates.arcsin.se">Arcsin</a>
	</div>

</div>

</body>

</html>', 'This is where you put comments about this style');
INSERT INTO style VALUES (30, 'zenlike', 'STUB Style', '', '2008-04-28 07:34:31', 'admin', 'users', '1010', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	zenlike1.0 by nodethirtythree design
	http://www.nodethirtythree.com

-->
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title><?SPINE_Title?></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="zenlike.css" />
</head>
<body>

<div id="upbg"></div>

<div id="outer">


	<div id="header">
		<div id="headercontent">
			<h1><?SPINE_Title?></h1>
			<h2>A free design by NodeThirtyThree</h2>
		</div>
	</div>


	<form method="post" action="">
		<div id="search">
			<input type="text" class="text" maxlength="64" name="keywords" />
			<input type="submit" class="submit" value="Search" />
		</div>
	</form>


	<div id="headerpic"></div>

	
	<div id="menu">
		<!-- HINT: Set the class of any menu link below to "active" to make it appear active -->
		<ul>
			<li><?SPINE_Navbar("zenlike")?></li>
		</ul>
	</div>
	<div id="menubottom"></div>

	<?SPINE_Content?>

	<div id="footer">
			<div class="left">&copy; 2006 Your Website Name. All rights reserved.</div>
			<div class="right">Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a></div>
	</div>
	
</div>

</body>
</html>', 'This is where you put comments about this style');
INSERT INTO style VALUES (32, 'rss2', '', '', '2008-05-07 00:41:05', 'admin', 'users', '1010', '<?xml version="1.0"?>
<?SPINE_Content?>
', 'This is an XML based stylesheet');
INSERT INTO style VALUES (33, 'main.orig', '', 'main', '2008-04-29 23:21:57', 'admin', 'users', '1010', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
<head>
<script type="text/javascript" language="javascript" src="jquery.js"></script>
<script type="text/javascript" language="javascript" src="spine.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){ if (getCookie(''minimize'') == ''1'')
{ $(''#logo'').hide(); $(''#version'').hide(); $(''#mini'').text(''[+]''); $(''body'').css(''background-image'',''url()''); } });
</script>
<title>S P I N E - <?SPINE_Title?> - The backbone for your website</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="Stylesheet" href="spine.css" type="text/css" media="screen"></head>

<body>
<div id="version">version <?SPINE_Macro("SPINE_Version")?></div>
<img id="logo" src="<?SPINE_Images?>spine.jpg" alt="" align="middle">
<div id="menu">
<?SPINE_Navbar("main")?><a id="mini" href="#" OnClick="$(''#logo'').toggle(); $(''#version'').toggle();
if ( $(''#mini'').text() == ''[-]'' ) { $(''#mini'').text(''[+]''); setCookie(''minimize'',''1''); } else { $(''#mini'').text(''[-]''); setCookie(''minimize'',''''); } if ($(''body'').css(''background-image'') == ''url(http://<?SPINE_Servername?>/images/spine4.jpg)'') { $(''body'').css(''background-image'',''url()''); } else 
{ $(''body'').css(''background-image'',''url(http://<?SPINE_Servername?>/images/spine4.jpg)''); } return false;">[-]</a>
</div>

<div id="container">
<div id="content">
<?SPINE_Content?>
</div>
</div>
<form action="search.html">
<div id="footer">Copyright 2006 - Hendrik Van Belleghem / SPINE Dev Team <?SPINE_Stats("hits")?> visits - Search: <input type="text" name="keyword" class="input">&nbsp;<input type="submit" class="button" value="Search">
</div></form>

</body></html>', 'This style is part of the default SPINE Installation.
Created by Hendrik Van Belleghem ; Major Updates by eidolon');
INSERT INTO style VALUES (31, 'main', '', 'main', '2011-10-12 14:19:19', 'admin', 'users', '1111', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
<head>
<script type="text/javascript" language="javascript" src="jquery.js"></script>
<script type="text/javascript" language="javascript" src="spine.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){ if (getCookie(''minimize'') == ''1'')
{ $(''#logo'').hide(); $(''#version'').hide(); $(''#mini'').text(''[+]''); $(''body'').css(''background-image'',''url()''); } });
</script>
<title>S P I N E - <?SPINE_Title?> - The backbone for your website</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="Stylesheet" href="spine-v1.2.css" type="text/css" media="screen"></head>

<body class="spine-body">
<div id="spine-version">version <?SPINE_Macro("SPINE_Version")?></div>
<img id="spine-logo" src="<?SPINE_Images?>spine.jpg" alt="" align="middle">
<div id="spine-menu">
<?SPINE_Navbar("main")?><a id="mini" href="#" OnClick="$(''#logo'').toggle(); $(''#version'').toggle();
if ( $(''#mini'').text() == ''[-]'' ) { $(''#mini'').text(''[+]''); setCookie(''minimize'',''1''); } else { $(''#mini'').text(''[-]''); setCookie(''minimize'',''''); } if ($(''body'').css(''background-image'') == ''url(http://<?SPINE_Servername?>/images/spine4.jpg)'') { $(''body'').css(''background-image'',''url()''); } else 
{ $(''body'').css(''background-image'',''url(http://<?SPINE_Servername?>/images/spine4.jpg)''); } return false;">[-]</a>
</div>

<div id="spine-container">
<div id="spine-content">
<?SPINE_Content?>
</div>
</div>
<form action="search.html">
<div id="spine-footer">Copyright 2006 - Hendrik Van Belleghem / SPINE Dev Team <?SPINE_Stats("hits")?> visits - Search: <input type="text" name="keyword" class="spine-input">&nbsp;<input type="submit" class="spine-button" value="Search">
</div></form>

</body></html>', 'This style is part of the default SPINE Installation.
Created by Hendrik Van Belleghem ; Major Updates by eidolon');
INSERT INTO style VALUES (13, '.admin_plugin', '', '', '2011-10-12 12:00:41', 'admin', 'admin', '1111', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
<script type="text/javascript" language="javascript" src="jquery.js"></script>
<script type="text/javascript" language="javascript" src="spine.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){ if (getCookie(''minimize'') == ''1'')
{ $(''#logo'').hide(); $(''#version'').hide(); $(''#mini'').text(''[+]''); $(''body'').css(''background-image'',''url()''); } });
</script>

<title>S P I N E Administration - <?SPINE_Title?></title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="_admin-v1.2.css" media="screen">
<link rel="Stylesheet" href="spine-v1.2.css" type="text/css" media="screen">
</head>

<body class="spine-body">
<div id="spine-version">Administration</div>
<img id="spine-logo" src="<?SPINE_Images?>spine.jpg" alt="" align="middle">
<div id="spine-menu">
<?SPINE_Navbar("admin")?><a id="mini" href="#" OnClick="$(''#logo'').toggle(); $(''#version'').toggle();
if ( $(''#mini'').text() == ''[-]'' ) { $(''#mini'').text(''[+]''); setCookie(''minimize'',''1''); } else { $(''#mini'').text(''[-]''); setCookie(''minimize'',''''); } if ($(''body'').css(''background-image'') == ''url(http://<?SPINE_Servername?>/images/spine4.jpg)'') { $(''body'').css(''background-image'',''url()''); } else 
{ $(''body'').css(''background-image'',''url(http://<?SPINE_Servername?>/images/spine4.jpg)''); } return false;">[-]</a>
</div>
<div id="spine-menu">
<?SPINE_Navbar("admin_plugin")?>
</div>

<div id="spine-container">
<div id="spine-content">
<?SPINE_Content?>
</div>
</div>

<div id="spine-footer">Copyright 2006, 2011 - Hendrik Van Belleghem / SPINE Dev Team</div>

</body></html>', '');
INSERT INTO style VALUES (7, '.admin', '', '', '2011-10-12 11:58:51', 'admin', 'admin', '1111', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<base href="http://<?SPINE_Servername?><?SPINE_Location?>">
<script type="text/javascript" language="javascript" src="jquery.js"></script>
<script type="text/javascript" language="javascript" src="spine.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){ if (getCookie(''minimize'') == ''1'')
{ $(''#logo'').hide(); $(''#spine-version'').hide(); $(''#mini'').text(''[+]''); $(''body'').css(''background-image'',''url()''); } });
</script>
<title>S P I N E Administration - <?SPINE_Title?></title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="_admin-v1.2.css" media="screen">
<link rel="Stylesheet" href="spine-v1.2.css" type="text/css" media="screen">
</head>

<body class="spine-body">
<div id="spine-version" class="spine-div">Administration</div>
<img id="logo" src="<?SPINE_Images?>spine.jpg" alt="" align="middle">
<div id="spine-menu" class="spine-div">
<?SPINE_Navbar("admin")?><a class="spine-a" id="mini" href="#" OnClick="$(''#logo'').toggle(); $(''#spine-version'').toggle();
if ( $(''#mini'').text() == ''[-]'' ) { $(''#mini'').text(''[+]''); setCookie(''minimize'',''1''); } else { $(''#mini'').text(''[-]''); setCookie(''minimize'',''''); } if ($(''body'').css(''background-image'') == ''url(http://<?SPINE_Servername?>/images/spine4.jpg)'') { $(''body'').css(''background-image'',''url()''); } else 
{ $(''body'').css(''background-image'',''url(http://<?SPINE_Servername?>/images/spine4.jpg)''); } return false;">[-]</a>
</div>
<div id="spine-menu">
<?SPINE_Navbar("admin_plugin")?>
</div>
<div id="spine-container">
<div id="spine-content">
<?SPINE_Content?>
</div>
</div>

<div id="spine-footer">Copyright 2006, 2011 - Hendrik Van Belleghem / SPINE Dev Team</div>

</body></html>', '');


--
-- Data for Name: usergroup; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO usergroup VALUES (1, 'admin', 'admin');
INSERT INTO usergroup VALUES (2, 'users', 'admin');
INSERT INTO usergroup VALUES (3, 'users', 'test');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: spineuser
--

INSERT INTO users VALUES (1, 'admin', 'admin', '7a78797d9f65411e0cf7467a891cd7fa', 'Administrator', 'root@localhost');
INSERT INTO users VALUES (3, 'users', 'test', 'd41d8cd98f00b204e9800998ecf8427e', 'test', '');


--
-- Data for Name: wiki; Type: TABLE DATA; Schema: public; Owner: spineuser
--



--
-- PostgreSQL database dump complete
--

