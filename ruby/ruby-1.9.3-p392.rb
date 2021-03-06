class Ruby193 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1.9.3.392'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2'
  sha256 '5a7334dfdf62966879bf539b8a9f0b889df6f3b3824fb52a9303c3c3d3a58391'

  maintainer '<agency-devs@forward.co.uk>'
  vendor     'f3d'
  license    'The Ruby License'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev', 'libncurses5-dev', 'libffi-dev', 'libgdbm-dev'

  depends 'libffi6', 'libncurses5', 'libreadline6', 'libssl1.0.0', 'libtinfo5',
          'libyaml-0-2', 'zlib1g', 'libgdbm3'
  
  conflicts "ruby1.9"
  replaces "ruby"

  def build
    configure :prefix => "/usr/local", 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
