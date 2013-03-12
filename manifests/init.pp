# Define: wkhtmltopdf
# 
# This modules installs wkhtmltopdf to the system
# 
# Parameters:
#   version: version string
#   arch: architecture, 'i386' or 'amd64', defaults to 'amd64'
#   target_dir: the directory to install to, defaults to '/usr/local/bin'
#
# Actions
#   downloads wkhtmltopdf to the desired location
#   renames it to 'wkhtmltopdf'
#
# Example use:
#   wkhtmltopdf { '0.11.0_rc1': }
#
define wkhtmltopdf(
  $version = $name,
  $arch = 'amd64',
  $target_dir = '/usr/local/bin'
) {
  $filename = "wkhtmltopdf-${version}-static-${arch}.tar.bz2"
  exec { "wget https://wkhtmltopdf.googlecode.com/files/${filename} && tar -xf ${filename} -C ${target_dir}":
    cwd => '/tmp',
    unless => "test -f ${target_dir}/wkhtmltopdf"
  }

  exec { "mv wkhtmltopdf-${arch} wkhtmltopdf":
    cwd => $target_dir,
    onlyif => "test -f ${target_dir}/wkhtmltopdf-${arch}"
  }
}