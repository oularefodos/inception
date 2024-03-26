adduser -h /var/www -s /bin/false -D ${USER_FTP}
echo "${USER_FTP}:${PASS_FTP}" | /usr/sbin/chpasswd
adduser ${USER_FTP} root

sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf
sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf
sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf
sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf

echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

vsftpd /etc/vsftpd/vsftpd.conf