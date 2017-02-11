# Aix_nfso
#
# Manage /etc/tunables/nextboot on AIX using the nfso command and puppet
#
# @param value Value to set
# @param key Setting to change
define aix_nfso(
    $value,
    $key = $title,
) {

  exec { "aix_nfso->${key}":
    command => "nfso -p -o ${key}=${value}",
    unless  => "nfso -p -o ${key} | awk '{print \$3}' | grep ${value}",
    path    => ['/usr/sbin', '/usr/bin','/bin'],
  }
}
