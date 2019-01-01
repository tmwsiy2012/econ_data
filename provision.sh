     hostname econ_data-eng
     echo "econ_data-eng" > /etc/hostname
     apk update
     apk add docker git
     service docker start
     rc-update add docker boot
     sed -i.bak s/docker:x:101:/docker:x:101:vagrant/g /etc/group
     su - vagrant -c "git clone https://github.com/tmwsiy2012/econ_data /home/vagrant/econ_data"
     git config --global user.email "eddie@eddiedunn.com"
     git config --global user.name "Eddie Dunn"
     docker run --name econ_data -e POSTGRES_PASSWORD=password -d postgres
