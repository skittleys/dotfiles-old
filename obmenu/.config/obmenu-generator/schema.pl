##!/usr/bin/perl
##
## SCHEMA supports the following keys: item, cat, begin_cat, end_cat,
##                                     exit, raw, sep, obgenmenu
##
## Modified by Carl Duff.

=for comment

item: add an item into the menu
{item => ["command", "label", "icon"]}

cat: add a category into the menu
{cat => ["name", "label", "icon"]}

begin_cat: begin of a category
{begin_cat => ["name", "icon"]}

end_cat: end of a category
{end_cat => undef}

sep: menu line separator
{sep => undef} or {sep => "label"}

exit: default "Exit" action
{exit => ["label", "icon"]}

raw: any valid Openbox XML string
{raw => q(xml string)},

obgenmenu: category provided by obmenu-generator
{obgenmenu => "label"}

scripts: executable scripts from a directory
{scripts => ["/my/dir", BOOL, "icon"]}
BOOL - can be either true or false (1 or 0)
0 == open the script in background
1 == open the script in a new terminal

wine_apps: windows applications installed via wine
{wine_apps => ["label", "icon"]}

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to a icon or a valid icon name
#    * By default, category names are case insensitive. (e.g.: X-XFCE == x_xfce)

require '/home/cm/.config/obmenu-generator/config.pl';

our $SCHEMA = [
#             COMMAND                 	LABEL          		ICON
   {sep => "Launch"},
   {item => ['terminator',   	 	'Terminator','terminator']},
   {item => ['urxvt',   	 	'urxvt','urxvt']},
   {item => ['spacefm',      		'SpaceFM','spacefm']},
   {item => ['subl',      		'Sublime Text','sublime_text']},
   {sep => "Applications"},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},
	
	{sep => "System"},
## Custom "Advanced Menu"

   {begin_cat => ['Advanced',  'gnome-settings']},
   {begin_cat => ['Desktop and Login',  '/usr/share/icons/Faenza/apps/48/dconf-editor.png']},
   {item => ['subl ~/.conkyrc','Conky RC','sublime_text']},
   {item => ['subl ~/.config/tint2/tint2rc','Tint2 Panel', 'sublime_text']},
   {item => ['gksu subl /etc/slim.conf','Slim Configuration', 'sublime_text']},
   {item => ['subl ~/.xinitrc','.xinitrc', 'sublime_text']},
   {item => ['subl ~/.xprofile','.xprofile', 'sublime_text']},
   {end_cat   => undef},
   {begin_cat => ['Obmenu-Generator', '/usr/share/icons/Faenza/apps/48/menu-editor.png']},
		{item => ['subl ~/.config/obmenu-generator/schema.pl','Pipe Menu Schema', 'sublime_text']},
		{item => ['subl ~/.config/obmenu-generator/config.pl','Pipe Menu Config', 'sublime_text']},
		{item => ['obmenu-generator -d','Refresh Icon Set','/usr/share/icons/Faenza/apps/48/application-default-icon.png']},
   {end_cat   => undef},
   {begin_cat => ['Openbox',  'openbox']},
		{item => ['openbox --reconfigure','Reconfigure Openbox','openbox']},
		{item => ['subl ~/.config/openbox/autostart','Openbox Autostart', 'sublime_text']},
		{item => ['subl ~/.config/openbox/rc.xml','Openbox RC', 'sublime_text']},
		{item => ['subl ~/.config/openbox/menu.xml','Openbox Menu', 'sublime_text']},
		{item => ['gksu subl /etc/oblogout.conf','Openbox Logout', 'sublime_text']},
   {end_cat   => undef},
   {begin_cat => ['Pacman / Servers', '/usr/share/icons/Faenza/apps/48/package-manager-icon.png']},
		{item => ['terminator -e sudo ~/.config/executables/change-repo.sh','Switch stable, testing and unstable repos','terminator']},
		{item => ['gksu subl /etc/pacman.conf','Pacman Config', 'sublime_text']},
		{item => ['gksu subl /etc/pacman.d/mirrorlist','Pacman Mirrorlist', 'sublime_text']},
   {end_cat   => undef},
   {end_cat   => undef},

  {sep => undef},


## Use Oblogout script instead of simple exit command

   {item => ['xlock -mode blank', 'Lock Screen', 'lock']},
   {item => ['oblogout',        'Logout...',      'exit']},

    #{cat => ['qt',          'QT Applications',    'qtlogo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL             ICON
    #{wine_apps => ['Wine apps', 'applications-other']},

]
