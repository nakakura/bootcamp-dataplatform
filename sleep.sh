#!/bin/sh
hadoop dfs -rmr /user/$USER/free/sleep
hadoop jar /usr/lib/hadoop/contrib/streaming/hadoop-streaming-0.20.2-*.jar \
 -D mapred.job.name="sleep" \
 -D mapred.job.priority=NORMAL \
 -input /data/pfjson/twitter/20120801.5min \
 -output /user/$USER/free/sleep \
 -mapper "/bin/sh /home/student14/free/sleep/map.sh" \
 -reducer "/usr/local/bin/ruby /home/student14/free/sleep/reduce.rb"
