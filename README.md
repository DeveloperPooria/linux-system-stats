# linux-system-stats
Calculate CPU and memory usage

Steps are:

1.Create empty shell script
$ sudo vi system_stats.sh

2.Copy and paste the code

3.Make shell script executable
$ sudo chmod +x system_stats.sh

4.Create cron job
$ sudo crontab -e
Add the following lines to it.
0 10 * * * ./system_stats.sh >>/opt/system.log
This way you will have a daily record of your system information in a single file. You can simply view it with the following command.
$ sudo cat /opt/system.log
