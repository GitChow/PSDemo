$style="
<style>
	tbody tr:nth-child(2n) { background-color: #eef4f9; }
	td { font-size: 0.8em;padding: 3px 8px; }
	th { background-color: #567f9f;color: white;font-size: 0.9em;padding: 5px 8px;text-align: left; }
	html body {font-family: 'Segoe UI','Segoe',Tahoma,Helvetica,Arial,sans-serif; }
</style>
"
 
$messageBody = Get-Process |select Name, Path, Company, CPU|Select-Object -First 10 | convertto-html -Head $style
 
 
$theMail = @{
    From            = "xx@xx.com"
    To              = "xx@xx.com"
    Subject         = "Top 10 processes"
    BodyAsHTML      = $True
    Body            = "$messageBody"
    Priority        = "Normal"
    SmtpServer      = "xx.xx.com"
 
}
 
Send-MailMessage @theMail 
