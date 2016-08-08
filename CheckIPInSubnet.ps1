# refered to https://ficility.net/2013/03/16/powershell-example-how-to-work-with-the-ip-addresses-ipv4/
function New-IPv4toBin ($ipv4){
 $BinNum = $ipv4 -split '\.' | ForEach-Object {[System.Convert]::ToString($_,2).PadLeft(8,'0')}
 return $binNum -join ""
}

function Test-IPinIPRange ($Address,$CIDR) {
    $Lower = $CIDR.split("/")[0]
    $mask = $CIDR.split("/")[1]

    [Char[]]$a = (New-IPv4toBin $Lower).ToCharArray()
	  [Int[]]$array = (1..32)

  	for($i=0;$i -lt $array.length;$i++){
  		if($array[$i] -gt $mask){$array[$i]="0"}else{$array[$i]="1"}
  	}
  
  	[string]$mask = $array -join ""
  	[Char[]]$b = $mask.ToCharArray()
  	[Char[]]$c = (New-IPv4toBin $Address).ToCharArray()
  	$res = $true
	
    for($i=0;$i -le $a.length;$i++){
		if($a[$i] -ne $c[$i] -and $b[$i] -ne "0"){
		    $res = $false
		} 
	 }
	 return $res
}

$IPRangeLocationA=@(
    "11.111.0.0/18",
    "22.22.0.0/16"
)

function Test-IPinLocationRange($inputIP){
    foreach ($ipCIDR in $IPRangeLocationA){
        if(Test-IPinIPRange $inputIP $ipCIDR){
            return $true
        }
    }
    return $false
}
