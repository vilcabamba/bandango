#! /bin/sh

# copy to /etc/init.d

### BEGIN INIT INFO
# Provides:   pumacontrol
# Required-Start: $remote_fs $syslog
# Required-Stop:  $remote_fs $syslog
# Default-Start:  2 3 4 5
# Default-Stop:   0 1 6
# Short-Description: Puma web server 
### END INIT INFO
 
# Simple move this file into /etc/init.d/pumacontrol.sh
# Also make sure you `chmod +x pumacontrol.sh`.

# If you need to start puma at boot time run this in debian/ubuntu: update-rc.d pumacontrol.sh defaults
# It will create some links to execute /etc/init.d/pumacontrol.sh start at the begining

# I use this in a system where the rails app is running by a normal user,  where puma is 
# configured in PUMA_CONFIG_FILE. In PUMA_CONFIG_FILE is stated to create a pid file with the PID of 
# puma in the PUMA_PID_FILE file. The socket where nginx is redirecting the web traffic and puma is 
# listening is PUMA_SOCKET

# You need to specify a location for the PUMA_CONFIG_FILE

PUMA_CONFIG_FILE=/home/pi/config/puma.rb # WRITE HERE PUMA CONFIG FILE LOCATION
# strip out quotes, remove comments, initial spaces, and get only the filename
# if desired write here the path to the desired file for example:
PUMA_PID_FILE=/tmp/bandango.pid
PUMA_PID_FILE=`grep pidfile $PUMA_CONFIG_FILE | sed -e "/^#/d;/^$/d;s/^\s*//;s/\w* //;s/['\"]*//g"`
PUMA_PID_FILE=`grep pidfile $PUMA_CONFIG_FILE | sed -e "/^#/d;/^$/d;s/^\s*//;s/\w* //;s/['\"]*//g"`
PUMA_SOCKET=`grep bind $PUMA_CONFIG_FILE | sed -e "/^#/d;/^$/d;s/^\s*//;s/\w* //;s/unix:\/\///;s/['\"]*//g"`
WORKING_DIR=`grep directory $PUMA_CONFIG_FILE | sed -e "/^#/d;/^$/d;s/^\s*//;s/\w* //;s/['\"]*//g"`
if [ $1 -a $2 ] ; then # If passed 2 params the second one should be the puma config file
  PUMA_CONFIG_FILE=$2
fi
PUMA_CONFIGFILE_OWNER=`ls -l $PUMA_CONFIG_FILE |cut -d' ' -f3`
 
#------------------------ checkings -------------------------------------
if [ ! -r $PUMA_CONFIG_FILE ] ; then # if not readable
  echo "File $PUMA_CONFIG_FILE not found or not readable"
  echo "You should write in pumacontrol.sh the location of your config/puma.rb"
  echo "or run this script like this 'pumacontrol.sh start /path/railsapp/config/puma.rb'"
  exit 1
fi
if [ -z $PUMA_PID_FILE ] ; then # if empty string
  echo "pidfile option in $PUMA_PID_FILE not found. You should write something like"
  echo 'pidfile "/path/puma.pid"'
  exit 1
fi
if [ -z $PUMA_SOCKET ] ; then # if empty string
  echo "bind option in $PUMA_SOCKET not found. You should write something like"
  echo 'bind "unix://path/railsAppName.sock"'
  exit 1
fi
if [ -z $WORKING_DIR ] ; then # if empty string
  echo "directory option in $WORKING_DIR not found. You should write something like"
  echo "directory '/path/yourRailsAppRootDir/'"
  exit 1
fi


#------------------------ functions -------------------------------------
# check if puma process is running
puma_is_running() {
  if [ -S $PUMA_SOCKET ] ; then # if file exist and its a socket
    if [ -r $PUMA_PID_FILE ] ; then # if file exist and readable
      if cat $PUMA_PID_FILE | xargs pgrep -P > /dev/null ; then
        return 0
      else
        echo "No puma process found"
      fi
    else
      echo "No puma pid file found"
    fi
  else
    echo "No puma socket found"
  fi
 
  return 1
}
 
#------------------------ script -------------------------------------
case "$1" in
  start)
    echo "Starting puma..."
      if [ -e $PUMA_SOCKET  ] ; then # if socket exists
        rm -f $PUMA_SOCKET
        echo "removed $PUMA_SOCKET"
      fi
      # Exec puma as the owner, so we need to be either root or the real owner"*
      if [ `whoami` = $PUMA_CONFIGFILE_OWNER ] # owner
      then
        /bin/bash --login -c "(cd $WORKING_DIR && bundle exec puma -C $PUMA_CONFIG_FILE)"
      elif [ `whoami` = root ] # root
      then
        su -l $PUMA_CONFIGFILE_OWNER -c "(cd $WORKING_DIR && bundle exec puma -C $PUMA_CONFIG_FILE)"
      else # error
        echo "you should be root or the owner of the file to have the gemset ready to start the rails stack"
      fi
 
    echo "done"
    ;;
 
  stop)
      if [ -e $PUMA_PID_FILE ] ; then # if pid file exists
        echo "Stopping puma..."
        /bin/bash --login -c " kill -s SIGTERM `cat $PUMA_PID_FILE` "
        echo "Killed puma PID `cat $PUMA_PID_FILE`"
        rm -f $PUMA_PID_FILE
        echo "removed $PUMA_PID_FILE"
      fi
      if [ -e $PUMA_SOCKET ] ; then # if socket exists
        rm -f $PUMA_SOCKET
        echo "removed  $PUMA_SOCKET"
      fi
    echo "done"
    ;;
 
  restart)
    if puma_is_running ; then
      echo "Hot-restarting puma..."
      if [ -e $PUMA_PID_FILE ] ; then
        /bin/bash --login -c " kill -s SIGUSR2 `cat $PUMA_PID_FILE` "
        echo "Killed puma PID `cat $PUMA_PID_FILE`"
      fi
      echo "Doublechecking the process restart..."
      sleep 5
      if puma_is_running ; then
        echo "done"
        exit 0
      else
        echo "Puma restart failed :/"
        exit 1 # return error
      fi
    fi
 
    echo "Trying cold reboot"
    $0 start
    ;;
 
  status)
    if puma_is_running ; then
      echo "puma is running"
      exit 0
    else
      echo "puma is not running"
      exit 1 # return error
    fi

    ;;
  *)
    echo "Usage: script/puma.sh {start|stop|restart|status}" >&2
    ;;
esac
