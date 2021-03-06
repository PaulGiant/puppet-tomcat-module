Puppet Tomcat Module
========================

## <a name='TOC'>Table of Contents</a>

  1. [Introduction](#Introduction)
  1. [Installation](#Installation)
  1. [Usage](#Usage)
  1. [Testing](#Testing)
  1. [Contributing](#Contributing)

## <a name='Introduction'>Introduction</a>

This module install Tomcat with puppet

## <a name='Installation'>Installation</a>

Clone this repository in a tomcat directory in your puppet module directory

	git clone https://github.com/ancosen/puppet-tomcat-module tomcat

## <a name='Usage'>Usage</a>

If you include the tomcat::setup class by setting source_mode to `web` the module will download the package, extract it and move it 
in a specific directory. If you set the source_mode `local` the tomcat package must be place in `/tomcat/files/` 
folder. The module will do the same operations without download the package.

	tomcat::setup { "tomcat":
	  family => "7",
	  update_version => "55",
	  extension => ".zip",
	  source_mode => "local",
	  installdir => "/opt/",
	  tmpdir => "/tmp/"
	  }

It's important to define a global search path for the `exec` resource to make module work. 
This should usually be placed in `manifests/site.pp`. It is also important to make sure `unzip` and `tar` command 
are installed on the target system:

	Exec {
	  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
	}

	package { 'tar':
	  ensure => installed
	}

	package { 'unzip':
	  ensure => installed
	}

## <a name='Testing'>Testing</a>

The Puppet tomcat module has been tested on the following Operating Systems: 

1. CentOS 6.5 x64
1. Debian 7.5 x64
1. Fedora 20.0 x86_64
1. Ubuntu 14.04 x64

## <a name='Contributing'>Contributing</a>

Feel free to contribute by testing, opening issues and adding/changing code
