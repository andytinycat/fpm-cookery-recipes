class MuninNode < FPM::Cookery::Recipe
  description 'Munin node package'

  name     'munin-node'
  version  '2.0.11.1'
  source   'http://downloads.sourceforge.net/project/munin/stable/2.0.11/munin-2.0.11.1.tar.gz'

  section    'main'
  maintainer '<agency-devs@forward.co.uk>'
  vendor     'agency-devs@forward.co.uk'
  iteration  '1'
  license    'GNU GPL'

  homepage 'http://munin-monitoring.org'

  platforms [:debian, :ubuntu] do
    post_install  'deb-post-install'
    pre_uninstall 'deb-pre-uninstall'
  end

  build_depends \
    libnet-server-perl, libtime-hires-perl, libnet-snmp-perl,
    libdigest-hmac-perl, libdigest-sha-perl, libcrypt-des-perl,
    libnet-ssleay-perl, libhtml-template-perl

  depends \
    libnet-server-perl, libtime-hires-perl, libnet-snmp-perl,
    libdigest-hmac-perl, libdigest-sha-perl, libcrypt-des-perl,
    libnet-ssleay-perl, libhtml-template-perl

  def build
    system "DESTDIR=#{destdir} make"
  end

  def install
    system "make install-common-prime install-node-prime install-plugins-prime"
  end
end
