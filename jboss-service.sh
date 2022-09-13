#!/bin/sh

#### 	Description :- 	DISCLAIMER: The following information has been provided by Red Hat, 
####    but is outside the scope of the posted Service Level Agreements and support procedures, 
####	https://access.redhat.com/support/offerings/production/soc.html. 

#### Set environment variables ####

export JAVA_HOME=/usr/lib64/jvm/jre-11-openjdk
export JBOSS_HOME=/home/ahaque/Downloads/jboss-eap-7.3
export MANAGEMENT_PORT=9990




case "$1" in
    start)  
	echo -n "Starting Jboss in standalone mode"		
	nohup $JBOSS_HOME/bin/standalone.sh & 
		;;

    stop)
	echo -n "Stopping Jboss"
	$JBOSS_HOME/bin/jboss-cli.sh --connect --controller=localhost:$MANAGEMENT_PORT --command=":shutdown" &>/dev/null
		;;
  
    status)
	echo -n "Checking status of the server "
	$JBOSS_HOME/bin/jboss-cli.sh --connect --controller=localhost:$MANAGEMENT_PORT --command=":read-attribute(name=server-state)"
		;;

    *)

echo "Usage: $0 {start|stop|status}"

	exit 1
		;;
esac
