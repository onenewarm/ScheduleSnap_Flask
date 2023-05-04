#!/usr/bin/env bash

REPOSITORY=/home/ec2-user/app

echo "> 현재 구동 중인 애플리케이션 pid 확인"

APP_NAME=$(ls -tr $REPOSITORY/*.py | tail -n 1)

CURRENT_PID=$(pgrep -f $APP_NAME)
echo "현재 구동 중인 애플리케이션 pid: $CURRENT_PID"

if [ -z "$CURRENT_PID" ]; then
  echo "현재 구동 중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> 새 애플리케이션 배포"

echo "> APP NAME: $APP_NAME"

echo "> $APP_NAME 에 실행권한 추가"

chmod +x $APP_NAME

echo "> $APP_NAME 실행"
#-Duser.timezone=Asia/Seoul
nohup sudo python3 $APP_NAME > $REPOSITORY/nohup.out 2>&1 &