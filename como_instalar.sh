# source https://www.digitalocean.com/community/tutorials/how-to-install-hadoop-in-stand-alone-mode-on-ubuntu-20-04
sudo apt update
sudo apt install default-jdk
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz.sha512
shasum -a 512 hadoop-3.3.1.tar.gz
cat hadoop-3.3.1.tar.gz.sha512

tar -xzvf hadoop-3.3.1.tar.gz
sudo mv hadoop-3.3.1 /usr/local/hadoop

readlink -f /usr/bin/java | sed "s:bin/java::"

sudo nano /usr/local/hadoop/etc/hadoop/hadoop-env.sh

'''
Nesse arquivo colocar a seguinte sentença:
#export JAVA_HOME=
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
'''

/usr/local/hadoop/bin/hadoop
mkdir ~/input
cp /usr/local/hadoop/etc/hadoop/*.xml ~/input
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.1.jar grep ~/input ~/grep_example 'allowed[.]*'
cat ~/grep_example/*