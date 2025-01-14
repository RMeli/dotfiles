#!/bin/bash

set -u

# Use 1password to automatically connect to VPN
USER=$(op item get "ETHZ VPN" --fields label=username)
PASSWORD=$(op item get "ETHZ VPN" --fields label=password --reveal)
OTP=$(op item get "ETHZ" --otp)

echo -e ${PASSWORD}"\n"${OTP} | sudo openconnect --passwd-on-stdin --user=${USER} -g cscs --useragent AnyConnect sslvpn.ethz.ch/cscs 
