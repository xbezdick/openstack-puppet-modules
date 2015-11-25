# == Class: neutron::agents:lbaas::package
#
# Installs Neutron Load Balancing agent package.
#
# === Parameters
#
# [*package_ensure*]
#   (optional) Ensure state for package. Defaults to 'present'.
#
class neutron::agents::lbaas::package (
  $package_ensure = present,
) {
  include ::neutron::params

  Package['neutron']             -> Package['neutron-lbaas-agent']
  package { 'neutron-lbaas-agent':
    ensure => $package_ensure,
    name   => $::neutron::params::lbaas_agent_package,
    tag    => ['openstack', 'neutron-package'],
  }
}
