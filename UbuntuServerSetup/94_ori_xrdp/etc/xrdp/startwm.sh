#. /etc/X11/Xsession
if [ -e $HOME/.xsession ]; then
. $HOME/.xsession
else
. /etc/X11/Xsession
fi
