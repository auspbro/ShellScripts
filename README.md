ShellScripts
============

install DHCP, TFTP, MiniOmaha server.

1.	Ubuntu server installation (@Ubuntu server)
	Version:
	64bits : ubuntu-12.04.2-alternate-amd64.iso
	Needed packages:  samba, cifs, DHCP, TFTP, pigz, cherrypy3
	
	a.	Online
		# sudo apt-get install samba smbfs isc-dhcp-server xinetd tftpd-hpa pigz cherrypy3
		// samba smbfs 	     使用在跟Windows server的網路芳鄰溝通上
		// xinetd tftpd-hpa  這兩個是配套的
		// pigz cherrypy3    MiniOmaha server會用到的套件
		
	b.	Offline
		Unzip package tarball
		# sudo dpkg -i samba/*.deb
		# sudo dpkg -i dhcpd/*.deb
		# sudo dpkg -i xinetd/*.deb
		# sudo dpkg -i pigz_2.1.6-1_amd64.deb
		# sudo dpkg -i cherrypy3/*.deb
		


2.	DHCP sever setup(@Ubuntu server)

	a.	Modify DHCP configuration
		# sudo vi /etc/dhcp/dhcpd.conf
		For example:
			ddns-update-style none;
			default-lease-time 600;
			max-lease-time 7200;
			subnet 192.168.0.0 netmask 255.255.255.0 {
			        range 192.168.0.101 192.168.0.110;	// set send IP range
			        option subnet-mask 255.255.255.0;
			        option routers 192.168.0.1;	// 指自己
			        next-server 192.168.0.1;       	// next-server 通常指向TFTP server,因我們架在同一台機器上 所以還是指向自己
                        }
			
	b.	Configure the right NIC for DHCP server	
		# sudo vi /etc/default/isc-dhcp-server
		For example:
			INTERFACES="eth0"			// 設定自己server用到哪一個網路裝置
			
	c.	Disable network-manager before enable DHCP server	
		# sudo /etc/init.d/network-manager stop
		//這個部分可以透過"網路->Edit connections... -> Wired -> add or Edit -> IPV4 setting -> Method set "Manual" -> Set "Address" example : Address=192.168.0.1 Mask=255.255.255.0
		
	d.	Set server IP
		For example:
			# sudo ifconfig eth0 192.168.0.1	// 設定自己server所用的IP, eth0為變數,要看自己server用到哪一個網路裝置
		
	e.	Enable DHCP server
		# sudo /etc/init.d/isc-dhcp-server start
		


3.	TFTP server setup(@Ubuntu server)

	a.	Configuring the folder of tftp share
		For example: the folder is /home/chiahsiu/tftpboot
			# mkdir /home/ALEX/tftpboot
			# sudo vi /etc/default/tftpd-hpa
				TFTP_USERNAME="tftp"
				TFTP_DIRECTORY="/home/ALEX/tftpboot"
				TFTP_ADDRESS="0.0.0.0:69"
				TFTP_OPTIONS="--secure"
		
	b.	Restart xinetd and tftpd
		# sudo service xinetd restart
		# sudo service tftpd restart



4.	MiniOmaha server setup 

	a.	Decompressing factory bundle tarball

	b.	Configure factory image  	
	For example, suppose your project name is "tricky" 
		# ./factory_setup/make_factory_package.sh --board tricky --release release/recovery_image.bin  --factory factory_test/chromiumos_factory_image.bin --hwid_updater hwid/hwid_v3_bundle_tricky.sh
		(You should see ./factory_setup/miniohama.conf gets updated)
	
	c.	Enable MiniOmaha server
	# ./start_download_server.sh
	Actually, start_download_server.sh is a script which gathers few commands.
	You can customize by modify script or type commands yourself.
	
	For example, you want to indicate a special port (5678) for your MiniOmaha server:
		# cd factory_setup/
		
		Only need validate one time (below command) after configuring factory image.
		# python miniomaha.py --validate_factory_config
		# python miniomaha.py --port 5678



5. 	Google shopfloor server 

	a. CD in factory bundle image folder
	b. For Example in project wolf
	# ./shopfloor/shopfloor_server -m cros.factory.shopfloor.wolf_shopfloor
