# = Class: autofs
#
# Manages autofs mount points
#
# This class includes defined types for looping through arrays of configuration
# file names.
#
# Requires the use of environments and hieradata.
#
# === Authors
#
# David Hollinger III <EagleDelta2@gmail.com>
#
# === Copyright
#
# Copyright 2014 David Hollinger III
#
#
class autofs(
  $mounts      = undef,
  $use_map_dir = false,
  $map_dir     = '/etc/auto.master.d'
) {
  class { 'autofs::package': }
  class { 'autofs::service': }
  contain 'autofs::package'
  contain 'autofs::service'

  if ( $mounts != undef ) {
    class { 'autofs::mounts': mount => $mounts }
  }
}
