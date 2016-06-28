$googleUrl="https://translate.google.co.in/#en/de/"

function findEByID {param ($name)
    return $ie.Document.getElementById("$name")
}

function gtv($s, $waitInSecond){
    $url=$googleUrl + [uri]::EscapeDataString($s)
    $ie.navigate($url)
    wait-ieBusy
    Start-Sleep -Milliseconds 500
    $prnouceButton=findEByID("gt-src-listen")
    $prnouceButton.click()
    Start-Sleep -second $waitInSecond
}

function wait-ieBusy {
    while ($ie.Busy -eq $true) {
        Start-Sleep -Milliseconds 100;
        Write-Host "[$(Get-Date -Format 'yyyy-mm-dd hh:mm')] Wait browser for for 0.1 second"
    }
}

 

#handle the music
Add-Type -AssemblyName presentationCore
$wmplayer = New-Object System.Windows.Media.MediaPlayer
$filepath="C:\Users\...path\opening\bensound-funnysong.mp3"
$wmplayer.Volume=0.2
$wmplayer.Open($filepath)
$wmplayer.Play()

#try to catch the beat
Start-Sleep -Seconds 9.6

#start IE
$ie = New-Object -com internetexplorer.application
$ie.visible = $true
gtv "Hello fellows, this is Google cortana, welcome to Lunch & Learn April Session, about the PowerShell" 6
gtv "Windows PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language built on the .NET Framework." 16
gtv "okay ! Let's start from something fun" 4
gtv "I say POWER, You say SHELL" 5
gtv "Power" 1.5
gtv "Shell" 1.5
gtv "Power" 1.5
gtv "Shell" 1.5
gtv "Hahahaha, I feel good" 3
gtv "I'm going to tell a joke" 3.5
gtv "Can February March? " 4
gtv "No, but......" 2
gtv "APRIL MAY!!!!!!" 2
$ie.navigate("http://www.guy-sports.com/fun_pictures/polar_bear_penguin.jpg")
Start-Sleep -Seconds 2
gtv "Sorry for it!" 3
gtv "This time is a real joke!" 3
gtv "If Earth rotates 30 times faster, what will happen" 4
$wmplayer.Pause()
Start-Sleep -Seconds 5
$wmplayer.play()
gtv "we will receive our salary daily" 3
gtv "Yippee !" 1
Start-Sleep -Seconds 2
$ie.navigate("https://cdn.meme.am/instances/57473020.jpg")
Start-Sleep -Seconds 4

$wmplayer.Stop()
$wmplayer.close() 
