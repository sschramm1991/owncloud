#Set ContainerID to a varibale
containerid=$(docker ps -aq -f "name=oc_owncloud")

#Renew Certificates and Keys
/usr/bin/certbot renew -q

#Copy New Certificates and Keys to Conatiner Volume
if test `find /etc/letsencrypt/archive/cloud.schramm-mainz.de -name "cert*" -mmin -5`
then   
   find /etc/letsencrypt/archive/cloud.schramm-mainz.de -name "*" -mmin -5 -exec cp {} /home/steven/docker/cloud-test/certs \;
   rm -f /home/steven/docker/cloud-test/certs/ privkey.pem chain.pem cert.pem
   mv cert* cert.pem
   mv privkey* privkey.pem
   mv chain* chain.pem

   #Restart Container with the running webservice which is consuming the certificates and keys
   docker rm -f $containerid
   docker stack deploy -c /home/steven/docker/cloud-test/docker-compose.yml oc
else
   echo "Nothing to do"
fi
