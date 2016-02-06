#not valid for IE11
$url = "https://translate.google.com/#en/zh-CN/this%20is%20a%20test"
 
function waitforpageload { while ($ie.Busy -eq $true) { Start-Sleep -Milliseconds 500; } }
#while($ie.busy) {start-sleep 1}    should also work, count in second


function findInputWithName {param ($name)
    $ie.Document.getElementsByTagName("input") | where-object {$_.name -and $_.name.EndsWith($name)}
}
function findAnchorWithID {param ($name)  #works
    $ie.Document.getElementsByTagName("a") | where-object {$_.id -and $_.id.EndsWith($name)}
}


function findEByID {param ($name)
    return $ie.Document.getElementById("$name")
    
}

$ie = New-Object -com internetexplorer.application
$ie.visible = $true
$ie.navigate($url)
waitforpageload
 
$prnouceButton=findEByID("gt-src-listen")
$prnouceButton.click()
Start-Sleep -Milliseconds 5000;

$SignInIcon=findEByID("gb_70") #find Sign In icon
$SignInIcon.click()
waitforpageload #this is necessary

$inputEmail=findEByID("Email")
#input user name
$inputEmail.value ="soulcity@126.com"
$inputPass=findEByID("Passwd")
#input password
$inputPass.value ="XXXXXX"

$cookieCheckbox=findEByID("PersistentCookie")
$cookieCheckbox.click()  #checkbox click
