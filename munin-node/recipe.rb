class MuninNode < FPM::Cookery::Recipe
  description 'Munin node package'

  name     'munin-node'
  version  '2.0.11.1'
  source   'http://downloads.sourceforge.net/project/munin/stable/2.0.11/munin-2.0.11.1.tar.gz'

  section    'main'
  maintainer '<agency-devs@forward.co.uk>'
  vendor     'f3d'
  license    'GNU GPL'

  homepage 'http://munin-monitoring.org'

  platforms [:debian, :ubuntu] do
    post_install  'munin-node.postinst'
    post_uninstall 'munin-node.postrm'
  end

  build_depends \
    'libnet-server-perl', 'libtime-hires-perl', 'libnet-snmp-perl',
    'libdigest-hmac-perl', 'libdigest-sha-perl', 'libcrypt-des-perl',
    'libnet-ssleay-perl', 'libhtml-template-perl'

  depends \
    'libnet-server-perl', 'libtime-hires-perl', 'libnet-snmp-perl',
    'libdigest-hmac-perl', 'libdigest-sha-perl', 'libcrypt-des-perl',
    'libnet-ssleay-perl', 'libhtml-template-perl'

  def build
    # Copy in custom Makefile
    safesystem "cp ../../Makefile.config #{builddir}/munin-#{version}/Makefile.config"
    make
  end

  def install
    make 'install-common-prime', 'DESTDIR' => destdir 
    make 'install-node-prime', :DESTDIR => destdir 
    make 'install-plugins-prime', :DESTDIR => destdir 
  end
end
