# Log Level : Debug, Info, Warin, Error


# add timestamp automatically

# use case 1: include at top of scripts, logging is automatic
# use case 2: can accept pipe values


Write-Output | Log-Info


#Write-Verbose
Write-Debug
Write-Output
Write-Warning
Write-Error

function Get-CurrentTimeStamp(){
    return get-date -Format "yyyy-MM-dd HH:MM:ss"
}

function Add-Log {
    [cmdletbinding()]
    Param(
        [parameter(ValueFromPipeline=$True)]

        [string]
        $log,

        [ValidateSet(“error”,”warn”,”info”)] 
        [string]
        $level,

        [switch] $switch
    )
    $curentTimeStamp = get-date -Format "yyyy-MM-dd HH:MM:ss"

    # foreach ($l in $log){

    if($level -eq "warn"){
        Write-host "[$curentTimeStamp] $log" -ForegroundColor Yellow
    }
}



Write-Output "123" | Add-Log -level warn



function Log-Info(){

}

function Log-Warn(){

}