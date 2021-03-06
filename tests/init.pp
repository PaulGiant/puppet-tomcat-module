# Just copy init.pp in your manifests directory. Place the tomcat package into /tomcat/files folder, if you select "local" mode.
# The module extract the folder and move it in a specified path

# Resource Default for exec
Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

package { 'tar':
      ensure => installed
  }

package { 'unzip':
      ensure => installed
  }

tomcat::setup { "tomcat":
  family => "7",
  update_version => "55",
  extension => ".zip",
  source_mode => "local",
  installdir => "/opt/",
  tmpdir => "/tmp/"
  }

