class MuninNode < FPM::Cookery::Recipe
  description 'Munin master package'

  name     'munin-master'
  version  '2.0.11.1'
  source   'http://downloads.sourceforge.net/project/munin/stable/2.0.11/munin-2.0.11.1.tar.gz'

  section    'main'
  maintainer '<agency-devs@forward.co.uk>'
  vendor     'f3d'
  license    'GNU GPL'

  homepage 'http://munin-monitoring.org'

  platforms [:debian, :ubuntu] do
    post_install  'munin.postinst'
  end

  build_depends \
    'libnet-server-perl', 'libtime-hires-perl', 'libnet-snmp-perl', 'libdigest-hmac-perl',
    'libdigest-sha-perl', 'libcrypt-des-perl', 'libnet-ssleay-perl', 'libhtml-template-perl', 'libstorable-perl', 
    'libdigest-md5-perl', 'libparams-validate-perl', 'libtimedate-perl', 'libgetopt-long-descriptive-perl', 
    'libfile-copy-recursive-perl', 'libcgi-fast-perl', 'libio-socket-inet6-perl', 'liblog-log4perl-perl', 'librrds-perl'

  depends \
    'libnet-server-perl', 'libtime-hires-perl', 'libnet-snmp-perl', 'libdigest-hmac-perl',
    'libdigest-sha-perl', 'libcrypt-des-perl', 'libnet-ssleay-perl', 'libhtml-template-perl', 'libstorable-perl', 
    'libdigest-md5-perl', 'libparams-validate-perl', 'libtimedate-perl', 'libgetopt-long-descriptive-perl', 
    'libfile-copy-recursive-perl', 'libcgi-fast-perl', 'libio-socket-inet6-perl', 'liblog-log4perl-perl', 'librrds-perl'

  def build
    # Copy in custom Makefile
    safesystem "cp ../../Makefile.config #{builddir}/munin-#{version}/Makefile.config"
    make
  end

  def install
    make 'install', 'DESTDIR' => destdir 
  end
end
