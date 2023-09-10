# 本番運用時の注意
roleはadmin権限なので本番運用時は気を付ける

glueのjobとworkflowは手動対応  
https://blog.serverworks.co.jp/run-glue-workflow-when-the-files-is-reached

## テーブル作成
create table acinfotokyo (
id serial primary key,
time timestamp,
voltage double,
frequency double);
