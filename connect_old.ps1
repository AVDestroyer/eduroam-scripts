while ($true) {
	$result = Test-NetConnection 8.8.8.8
	while (-not $result.PingSucceeded) {
		netsh wlan connect eduroam
		echo "Tried to reconnect"
		Start-Sleep -Seconds 15
		$result = Test-NetConnection 8.8.8.8
	}
	echo "Connection is OK"
	Start-Sleep -Seconds 15

}
