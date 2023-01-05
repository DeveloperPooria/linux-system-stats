#!/bin/bash
printf "\033[32m-------------------------------------------\n"
printf "\033[1;37m$(date)\n"
#cpu use threshold
cpu_threshold='80'
 #mem idle threshold
mem_threshold='100'
 #disk use threshold
disk_threshold='90'
#---cpu
cpu_usage() {
        cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
        cpu_use=`expr 100 - $cpu_idle`
        printf "\033[1;37mcpu utilization: $cpu_use percent."
        if [ $cpu_use -gt $cpu_threshold ];
                then
                        printf "\033[31m\tcpu warning!!!\n"
                else
                        printf "\033[32m\tcpu is fine!\n"
        fi
}
#---mem
mem_usage() {
 #MB units
        mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
        printf "\033[1;37mMemory space remaining : $mem_free MB."
        if [ $mem_free -lt $mem_threshold  ];
                then
                        printf "\033[31m\tMemory warning!!!\n"

                else
                        printf "\033[32m\tMemory is fine!\n"
        fi
}
#---disk
disk_usage() {
        disk_use=`df -P | grep /dev/sda | grep -v -E '(tmp|boot)' | awk '{print $5}' | cut -f 1 -d "%"`
        printf "\033[1;37mdisk usage : $disk_use percent."
        if [ $disk_use -gt $disk_threshold ];
                then
                        printf "\033[31m\tdisk warning!!!\n"
                else
                        printf "\033[32m\tdisk is fine!\n"
        fi
}
cpu_usage
mem_usage
disk_usage
printf "\033[32m-------------------------------------------\n"
