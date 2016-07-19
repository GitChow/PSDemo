# due to the cache issue in some cases
# use to update css and js with MD5 value as suffix

$projectPath="D:\devenv\git\main"

Set-Location $projectPath
rm -Recurse -Force target\*
Copy-Item -Recurse -Force src target
Copy-Item -Force pom.xml target


# for CSS files
Set-Location "$projectPath\target\src\main\webapp\css"
Get-ChildItem *.css | %{
    #get the MD5 info
    $MD5=(get-filehash $_ -Algorithm MD5).Hash

    $currentName = $_.Name
    $newFileName=$_.Name.Split(".")[0]+$MD5+".css"

    mv $_.Name "$newFileName"

    $allJSP=Get-ChildItem -Recurse -File *.jsp ..\view
    foreach($file in $allJSP){
        (Get-Content $file.FullName).replace($currentName, $newFileName) | Set-Content $file.FullName
    }
}

# for JS files
Set-Location "$projectPath\target\src\main\webapp\js"
Get-ChildItem *.js | %{
    #get the MD5 info
    $MD5=(get-filehash $_ -Algorithm MD5).Hash

    $currentName = $_.Name
    $newFileName=$_.Name.Split(".")[0]+$MD5+".js"

    mv $_.Name "$newFileName"

    $allJSP=Get-ChildItem -Recurse -File *.jsp ..\view
    foreach($file in $allJSP){
        (Get-Content $file.FullName).replace($currentName, $newFileName) | Set-Content $file.FullName
    }
}


Set-Location "$projectPath\target"
mvn clean package

#move the war file to desktop
mv .\target\elearning.war ~\desktop -Force
#clean target folder
Set-Location $projectPath
rm -Recurse -Force target\*
Set-Location ~\Desktop