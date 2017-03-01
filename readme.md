##自动生成GIT项目的Commit的Markdown日志

Feature1: 生成个人本项目过去7天的commit日志，方便写周报和回顾过去一周的工作内容

Feature2: 生成本项目所有的commit日志，可以总览项目的进度和提交记录，每条记录都拥有链接，点击可以直接进入git查看提交记录



用法：将allCommitLog.js、allCommitLog.sh、selfCommitLog.sh放到项目中去

特殊说明：allCommitLog.js中需要指定生成日志的branch，目前指定的是develop，可以自行修改

git地址：git config --get remote.origin.url

1. npm run sc

生成个人过去7天的commit日志

2. npm run sa

生成本项目的所有commit日志