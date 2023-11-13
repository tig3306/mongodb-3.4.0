#!/bin/bash

ps -ef|grep mongo.conf|grep -v grep|awk '{printf $2}'|xargs kill -9