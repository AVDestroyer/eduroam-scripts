# Arnav's eduroam reconnect scripts
On a Windows computer, while at UCLA, the `eduroam` network will periodically drop you. These scripts help to automate clicking the "connect" button whenever this happens.

Needless automation? maybe. I don't care.

## connect_old.ps1
This will periodically ping `8.8.8.8` and check if the connection has been dropped. If it has, it will try to reconnect to `eduroam`. Very simple.

## connect.ps1
This is intended to be used as a script in a scheduled Windows task. This is because I don't want to lower the delay in the old script and keep it running in a PowerShell terminal while still pinging `8.8.8.8`; rather, I would like it to just be a background task that will only activate when the network is dropped, not just every 15 seconds. However, I am currently unable to figure out the correct triggers for this script, so it doesn't work very well at the moment. Do not use this for now, just use `connect_old.ps1`
