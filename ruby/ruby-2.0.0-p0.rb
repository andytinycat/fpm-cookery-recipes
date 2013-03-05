class Ruby200 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '2.0.0.0'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2'
  sha256 'c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f'

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
