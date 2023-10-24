$wifiAdapter = Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*Wi-Fi*"}

if ($wifiAdapter) {
    if ($wifiAdapter.MediaConnectionState -eq 'Connected') {
        Write-Host "Wi-Fi is connected. Exiting."
	Exit 0
    } else {
        Write-Host "Wi-Fi is not connected."
    }
} else {
    Write-Host "Wi-Fi adapter not found."
}

$networkoutput = netsh wlan show networks
$networks = $networkoutput -split 'SSID \d+ : '
$foundEduroam = $false

foreach ($network in $networks) {
    $ssid = $network.Trim()
    if ($ssid -eq "eduroam") {
        $foundEduroam = $true
        break
    }
}

if ($foundEduroam) {
    Write-Host "eduroam network found!"
    netsh wlan connect eduroam
} else {
    Write-Host "eduroam network not found."
}