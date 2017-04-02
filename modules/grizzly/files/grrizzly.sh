#!/bin/bash

HOME_DIR=$(cd $(dirname $0); cd ..;pwd -P)
APP_PATH="${HOME_DIR}/application"
LOGGER_DIRPATH="${HOME_DIR}/${APP_NAME}/log"
LOGGER_FILEPATH="${HOME_DIR}/log/${SERVICE_NAME}.log"
PID_FILE="${HOME_DIR}/pid/${SERVICE_NAME}.pid"
min_mem=$(($(free -m | awk '/^Mem:/{print $2}')*60/100))
max_mem=$(($(free -m | awk '/^Mem:/{print $2}')*80/100))
ADDL_PARAMS="-Xms${min_mem}m -Xmx${max_mem}m"
JAR_NAME=$(ls -1 $APP_PATH)
JAR_PATH=${APP_PATH}/${JAR_NAME}

start() {
  echo -n "Starting $SERVICE_NAME "
  if [ -f $PID_FILE ]; then
    read ppid < $PID_FILE
    if [ `ps --pid $ppid 2> /dev/null | grep -c $ppid 2> /dev/null` -eq '1' ]; then
      echo "$SERVICE_NAME is already running."
      return 1
    else
      rm -f $PID_FILE
    fi
  fi

  PID=`java -jar ${JAR_PATH} ${ADDL_PARAMS} >> $LOGGER_FILEPATH 2>&1 & echo $!`
  echo $PID > ${PID_FILE}

  while true
  do
    [ -f $LOGGER_FILEPATH ] && [ -f $PID_FILE ] && break
    sleep 2
  done

  echo $(cat $LOGGER_FILEPATH)
  status
  return $?
}

stop() {
  echo -n "Stopping $SERVICE_NAME "

  if [ -f $PID_FILE ]; then
    read kpid < $PID_FILE
    kwait=30
    count=0
    # Try issuing SIGTERM

    kill -15 $kpid
    until [ `ps --pid $kpid 2> /dev/null | grep -c $kpid 2> /dev/null` -eq '0' ] || [ $count -gt $kwait ]
    do
      sleep 1
      count=$(expr $count + 1)
    done

    if [ "$count" -gt "$kwait" ]; then
      kill -9 $kpid
    fi
  fi

  rm -f $PID_FILE
  echo
}

status() {
  if [ -f $PID_FILE ]; then
    read ppid < $PID_FILE
    if [ `ps --pid $ppid 2> /dev/null | grep -c $ppid 2> /dev/null` -eq '1' ]; then
      echo "$SERVICE_NAME is running (pid $ppid)"
      return 0
    else
      return 1
    fi
  fi

  echo "$SERVICE_NAME is not running"
  exit 3
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    echo "Restarting Application ..."
    $0 stop
    $0 start
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    echo
    exit 1
  ;;
esac
exit 0