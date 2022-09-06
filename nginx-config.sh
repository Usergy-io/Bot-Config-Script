#!/bin/bash

#Updating APT
printf("Updating APT");
sudo apt update -y
wait 
printf("\n);
printf("APT Updated\n");


#Installing NGINX
printf("Installing NGINX...");
sudo apt install nginx -y
wait
printf("\n");
printf("NGINX Installed");

#Firewall Adjust
printf("Firewall config available:");
sudo ufw app list
wait
sudo ufw allow 'Nginx HTTP'
sudo ufw status
printf("\n");
printf("Firewall configured!");


#Checking Web Server
printf("Checking webserver status:");
systemctl status nginx
printf("\n");

#Managing and Restarting NGINX
sudo systemctl stop nginx

