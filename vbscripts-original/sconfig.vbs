'-------------------------------------------
' Copyright (c) Microsoft Corporation. All rights reserved.
'
' Version 2.0
' sconfig.vbs - Configuration script used to setup a machine for remote configuration
'
'-------------------------------------------

const L_Msg001_Text		= "No IP address"
const L_Msg002_Text		= "   No IP   "
const L_Msg003_Text		= "No active network adapters found."
const L_Msg004_Text		= "Warning"
const L_Msg005_Text		= "                         Server Configuration"
const L_Msg006_Text		= "1) Domain/Workgroup:			"
const L_Msg007_Text		= "2) Computer Name:			"
const L_Msg008_Text		= "3) Add Local Administrator"
const L_Msg009_Text		= "8) Network Settings"
const L_Msg010_Text		= "5) Windows Update Settings:		"
const L_Msg011_Text		= "6) Download and Install Updates 	"
const L_Msg012_Text		= "7) Remote Desktop:			"
const L_Msg013_Text		= "Selection:"  
const L_Msg014_Text		= "9) Date and Time" 
const L_Msg015_Text		= ") Log Off User"
const L_Msg016_Text		= ") Restart Server"
const L_Msg017_Text 	= ") Shut Down Server" 
const L_Msg018_Text 	= ") Exit to Command Line"
const L_Msg019_Text		= "Enter number to select an option: "
const L_Msg020_Text		= "Change Domain/Workgroup Membership"
const L_Msg021_Text		= "Join (D)omain or (W)orkgroup? (Blank=Cancel) "
const L_Msg022_Text		= "Domain"
const L_Msg023_Text		= "Workgroup"
const L_Msg024_Text		= "Machine currently joined to a domain."
const L_Msg025_Text		= "Do you want to remove this computer from the current domain now?"
const L_Msg026_Text		= "Specify an authorized domain\user:  "
const L_Msg027_Text		= "Removing computer from current domain..."
const L_Msg028_Text		= "You must restart your computer to apply these changes."
const L_Msg029_Text		= "Restart now?"
const L_Msg030_Text		= "Restart"
const L_Msg031_Text		= "Specify domain\user:  "
const L_Msg032_Text		= "Join Domain"
const L_Msg033_Text		= "Enter new computer name (Blank=Cancel): "
const L_Msg034_Text		= "Computer Name"
const L_Msg035_Text		= "Changing Computer name..."
const L_Msg036_Text		= "Enter account to join local Administrators group (Blank=Cancel): "
const L_Msg037_Text		= "Adding to local Administrators group..."
const L_Msg038_Text		= "Local Administrators Group"	
const L_Msg039_Text		= "User added to local Administrators group."
const L_Msg040_Text		= "Output"
const L_Msg043_Text		= "Windows Update currently set to: "
const L_Msg044_Text		= "Select (A)utomatic or (M)anual updates: "
const L_Msg045_Text		= "Automatic"
const L_Msg046_Text		= "System will check for and install updates every day at 3:00 AM." 
const L_Msg047_Text		= "Enabling Automatic updates..."
const L_Msg048_Text		= "Manual"
const L_Msg049_Text		= "System will never check for updates."
const L_Msg050_Text		= "Disabling Automatic updates..."
const L_Msg051_Text		= "Windows Update set to "
const L_Msg052_Text		= "Update Settings"
const L_Msg053_Text		= "(E)nable or (D)isable Remote Desktop? (Blank=Cancel) "
const L_Msg054_Text		= "1) Allow only clients running Remote Desktop with Network Level Authentication (more secure)"
const L_Msg055_Text		= "2) Allow clients running any version of Remote Desktop (less secure)"
const L_Msg056_Text		= "Enter selection: "
const L_Msg057_Text		= "Enabling Remote Desktop..."
const L_Msg058_Text		= "Remote Desktop enabled for clients running any version of Remote Desktop (less secure)."
const L_Msg059_Text		= "Remote Desktop"
const L_Msg060_Text		= "Remote Desktop enabled for clients only running Remote Desktop with Network Level Authentication (more secure)."
const L_Msg061_Text		= "Failed to disable Remote Desktop."
const L_Msg062_Text		= "Disabling Remote Desktop..."
const L_Msg063_Text		= "Remote Desktop disabled."
const L_Msg064_Text		= "Are you sure you want to log off?"
const L_Msg065_Text		= "Log Off"
const L_Msg066_Text		= "Are you sure you want to restart?"
const L_Msg067_Text		= "Are you sure you want to shut down?"
const L_Msg068_Text		= "Shut Down"
const L_Msg069_Text		= "Enabled (all clients)"
const L_Msg070_Text		= "Enabled (more secure clients only)"
const L_Msg071_Text		= "Disabled"
const L_Msg072_Text		= "--------------------------------" 
const L_Msg073_Text		= "    Network settings"
const L_Msg074_Text		= "Available Network Adapters"
const L_Msg075_Text		= "Index#	IP address	Description"
const L_Msg076_Text		= "Select Network Adapter Index# (Blank=Cancel):  "
const L_Msg077_Text		= "    Network Adapter Settings" 
const L_Msg078_Text		= "NIC Index"
const L_Msg079_Text		= "Description"
const L_Msg080_Text		= "IP Address" 
const L_Msg081_Text		= "DHCP enabled"
const L_Msg082_Text		= "Preferred DNS Server"
const L_Msg083_Text		= "Alternate DNS Server"
const L_Msg084_Text		= "1) Set Network Adapter Address" 	
const L_Msg085_Text		= "2) Set DNS Servers"
const L_Msg086_Text		= "3) Clear DNS Server Settings"
const L_Msg087_Text		= "4) Return to Main Menu"
const L_Msg088_Text		= "Select option:  "
const L_Msg089_Text		= "Select (D)HCP, (S)tatic IP (Blank=Cancel): "
const L_Msg090_Text		= "Set Static IP"
const L_Msg091_Text		= "Enter static IP address: "
const L_Msg092_Text		= "Enter subnet mask (Blank = Default "
const L_Msg093_Text		= "): "
const L_Msg094_Text		= "Enter default gateway: "
const L_Msg095_Text		= "Setting NIC to static IP..." 
const L_Msg096_Text		= "The IP address could not be changed."
const L_Msg097_Text		= "Network Settings"
const L_Msg098_Text		= "Setting NIC to use DHCP..."
const L_Msg099_Text		= "DNS Servers"
const L_Msg100_Text		= "Enter new preferred DNS server (Blank=Cancel): "
const L_Msg101_Text		= "Preferred DNS server set."
const L_Msg102_Text		= "Enter alternate DNS server (Blank = none): "
const L_Msg103_Text		= "Alternate DNS server set."
const L_Msg104_Text		= "Alternate DNS server could not be set."
const L_Msg105_Text		= "Preferred DNS server could not be set."
const L_Msg106_Text		= "DNS servers removed. DNS servers will be automatically obtained from network."
const L_Msg107_Text		= "DNS servers could not be deleted."
const L_Msg108_Text		= "Failed to join workgroup"
const L_Msg109_Text		= "Welcome to workgroup: "
const L_Msg110_Text		= "Participating"
const L_Msg111_Text		= "Inspecting system..."
const L_Msg112_Text		= "Please specify a valid IP address."
const L_Msg113_Text		= "IP addresses with 127 are not valid because they are reserved for loopback addresses. Please specify some other valid value between 1 and 223."
const L_Msg114_Text		= "Access is denied."
const L_Msg115_Text		= "The parameter is incorrect."
const L_Msg116_Text		= "The system cannot open the specified object."
const L_Msg117_Text		= "Unable to update the password."
const L_Msg118_Text 	= "Logon failure: unknown username or password."
const L_Msg119_Text		= "The specified domain either does not exist or could not be contacted."
const L_Msg120_Text		= "The account already exists."
const L_Msg121_Text		= "The machine is already joined to the domain."
const L_Msg122_Text		= "The machine is not currently joined to a domain."
const L_Msg123_Text		= "Failed to join domain."
const L_Msg124_Text		= "Name of domain to join:  "
const L_Msg125_Text		= "Name of workgroup to join:  "
const L_Msg126_Text 		= "Joining "
const L_Msg127_Text 		= "..."
const L_Msg128_Text		= "==============================================================================="
const L_Msg129_Text		= "E"	'(E)nable
const L_Msg130_Text		= "D"	'(D)isable
const L_Msg131_Text		= "S"	'(S)tatic IP
const L_Msg132_Text		= "D" 	'(D)HCP
const L_Msg133_Text		= "W"	'(W)orkgroup
const L_Msg134_Text		= "D" 	'(D)omain
const L_Msg135_Text		= "In a domain environment, specify domain\username."
const L_Msg136_Text		= "In a workgroup environment, specify username."
const L_Msg137_Text		= "M"	'Manual
const L_Msg138_Text		= "A"	'Automatic
const L_Msg139_Text		= "Subnet Mask"
const L_Msg140_Text		= "Default Gateway"
const L_Msg141_Text		= "This option will enable the server graphical user interface shell and require a reboot."
const L_Msg142_Text		= "12) Restore Graphical User Interface (GUI)"
const L_Msg143_Text		= "11) Windows Activation             "
const L_Msg144_Text		= "Type SCONFIG to display this menu."
const L_Msg145_Text		= "Enabled"
const L_Msg146_Text		= "Disabled"
const L_Msg149_Text		= "Confirm"
const L_Msg150_Text		= "1) Display License info"
const L_Msg151_Text		= "2) Activate Windows"
const L_Msg153_Text		= "3) Install Product key" 
const L_Msg155_Text		= "4) Return to main menu" 
const L_Msg156_Text		= "4) Configure Remote Management          "
const L_Msg157_Text 	= "1) Enable Remote Management"
const L_Msg158_Text		= "2) Disable Remote Management"
const L_Msg161_Text		= "4) Return to main menu"
const L_Msg165_Text		= "Failed to reconfigure Windows Firewall."
const L_Msg166_Text		= "Remote Management blocked for all Windows Firewall profiles."
const L_Msg167_Text		= "Do you want to change the computer name before restarting the computer?"		
const L_Msg168_Text		= "Change computer name"
const L_Msg172_Text		= "Press Enter to continue..."
const L_Msg175_Text		= "Failure"
const L_Msg179_Text		= "  Configure Remote Management"
const L_Msg186_Text		= "IPv6 Address"
const L_Msg187_Text		= "IPv6 Gateway"
const L_Msg188_Text		= "3) Configure Server Response to Ping"
const L_Msg189_Text		= "Allow remote machines to Ping this server?"
const L_Msg190_Text		= "Successfully configured to allow Ping"
const L_Msg191_Text		= "Successfully configured to disallow Ping"
const L_Msg193_Text		= "Help improve Windows Server! By joining the Customer Experience Improvement Program (CEIP), Windows will periodically collect and upload statistical information about your system to Microsoft. The program also periodically downloads a file to collect information about problems you might have with Windows. The information collected is not used to identify or contact you or your company."
const L_Msg194_Text		= "If you participate and then decide to use imaging technology on this server to build other servers, those servers will be included in the CEIP."
const L_Msg195_Text		= "For more information, please visit http://go.microsoft.com/fwlink/?LinkId=285528"
const L_Msg196_Text		= "For Windows privacy information, please visit http://go.microsoft.com/fwlink/?LinkId=280262"
const L_Msg197_Text		= "10) Help improve the product with CEIP  "
const L_Msg198_Text		= "Not participating"
const L_Msg199_Text		= "Participate in Customer Experience Improvement Program?"
const L_Msg200_Text		= "Customer Experience Improvement Program (CEIP)"
const L_Msg201_Text		= " -- Windows Activation --"
const L_Msg202_Text		= "Customer Experience Improvement Program (CEIP) settings are managed by system administrator and cannot be modified."
const L_Msg203_Text		= "Failed to enable Remote Desktop."
const L_Msg204_Text     = "Enabling Remote Management..."
const L_Msg205_Text     = "Disabling Remote Management..."
const L_Msg206_Text     = "Successfully enabled Remote Management"
const L_Msg207_Text     = "Failed to enable Remote Management"
const L_Msg208_Text     = "Successfully disabled Remote Management"
const L_Msg209_Text     = "Failed to disable Remote Management"
const L_Msg210_Text     = "Current Status: Remote Management is enabled"
const L_Msg211_Text     = "Current Status: Remote Management is disabled"
const L_Msg212_Text     = "Failed to retrieve Remote Management settings"
const L_Msg213_Text     = "Remote Management settings are managed by system administrator and cannot be be modified."
const L_Msg214_Text     = "Enable Graphical User Interface"
const L_Msg215_Text     = "Unknown"
const L_Msg216_Text     = "Enter Product Key"
const L_Msg217_Text		= "Help improve Microsoft Hyper-V Server! By joining the Customer Experience Improvement Program (CEIP), Windows will periodically collect and upload statistical information about your system to Microsoft. The program also periodically downloads a file to collect information about problems you might have with Windows. The information collected is not used to identify or contact you or your company."
const L_Msg218_Text		= "For Microsoft Hyper-V Server privacy information, please visit http://go.microsoft.com/fwlink/?LinkId=227746"


const WUA_Script		= "cscript WUA_SearchDownloadInstall.vbs"

Dim CmdResults
Dim pcname
Dim group_type
Dim groupname
Dim InDomain
Dim MgmtNIC
Dim Autopatch
Dim Update_schedule
Dim objNetAdapter
Dim DNSsetting
Dim DisplayIP
Dim objWshScriptExec
Dim TS_status
Dim HVS_SKU
Dim CEIP_Status
Dim RemoteManagementStatus


Set oShell = WScript.CreateObject ("WScript.shell")

Set objWMIService = GetObject( "winmgmts:\\.\root\cimv2")

'Force to run with cscript
if Instr(1,Wscript.FullName,"Cscript",vbTextCompare)=0 then
    oShell.Run "cscript " & chr(34) & wscript.ScriptFullName & chr(34)
    wscript.quit
end if

Set oUACExec = oShell.Exec("cmd /c " & chr(34) & "whoami /groups | find " & chr(34) & "S-1-16-12288" & chr(34) & chr(34))

Do While (oUACExec.Status = cnWshRunning)
    WScript.Sleep 100
Loop 

If oUACExec.ExitCode <> 0 Then
    Set objShell = CreateObject("Shell.Application")
    objShell.ShellExecute "cscript", Chr(34) & WScript.ScriptFullName & Chr(34), "", "runas", 1
    wscript.quit
end if

GetInitialStatusValues()

Do

' Get NICs
Set nics = objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration where IPenabled=TRUE")
    
' Try to select the first NIC with an active IP		
for each n in nics
    MgmtNIC= n.index
    Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)
    exit for
next	
            
' Deal with case where NICs go away
if MgmtNIC="" then
    'No active NIC
    DisplayIP = L_Msg003_Text
else
    Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)
    
    if objNetAdapter.IPenabled then 
        DisplayIP = objNetAdapter.IPAddress(0)
    else
        'No Active NICs
        DisplayIP = L_Msg003_Text
    end if	
end if

' Get Domain status
InDomain = GetDomainStatus()

' Get Remote Desktop status
CheckRemoteDesktop()

' Get Customer Exp Improvement Program status
CheckCEIPstatus()

'Get Remote Mangement status
CheckRemoteManagementStatus()

wscript.echo 
wscript.echo L_Msg128_Text '======
wscript.echo L_Msg005_Text 'sconfig
wscript.echo L_Msg128_Text '======
wscript.echo
wscript.echo L_Msg006_Text & group_type &":  " & groupname  'domain/workgroup
wscript.echo L_Msg007_Text & pcname		'Computer name
wscript.echo L_Msg008_Text				'Add local admin
wscript.echo L_Msg156_Text & RemoteManagementStatus	'Configure Remote Access
wscript.echo ""

wscript.echo L_Msg010_Text & Update_schedule	'Update settings
wscript.echo L_Msg011_Text	'Download and Install updates
wscript.echo L_Msg012_Text & TS_status	'Remote Desktop
wscript.echo "" 
if MgmtNIC="" then 		' Network settings
    wscript.echo L_Msg009_Text & vbTab & vbTab & vbTab & DisplayIP
else 
    wscript.echo L_Msg009_Text
end if
wscript.echo L_Msg014_Text ' Date and Time
wscript.echo L_Msg197_Text & CEIP_Status ' CEIP

if HVS_SKU then 
    offset=0
else
    ' Show Activation and Restore GUI menu items on Server Core
    wscript.echo L_Msg143_Text  ' 11) Windows Activation
    offset=1
end if

wscript.echo ""
wscript.echo cstr(11+offset) & L_Msg015_Text ' Logoff
wscript.echo cstr(12+offset) & L_Msg016_Text ' Restart
wscript.echo cstr(13+offset) & L_Msg017_Text ' Shut Down 
wscript.echo cstr(14+offset) & L_Msg018_Text ' Exit to cmd line
wscript.echo
if HVS_SKU then wscript.echo 

wscript.StdOut.Write L_Msg019_Text       
OptionSelection = Wscript.StdIn.ReadLine   

wscript.echo

Select Case OptionSelection
        
    Case "1"	'Change Domain/workgroup name
    
        wscript.echo
        wscript.echo L_Msg020_Text

        do
          wscript.echo
          wscript.StdOut.Write L_Msg021_Text
          DorW = Wscript.StdIn.ReadLine 
        loop until ucase(DorW)=ucase(L_Msg134_Text) or ucase(DorW)=ucase(L_Msg133_Text) or DorW="" 

        if ucase(DorW)=ucase(L_Msg133_Text) then
            'Join Workgroup
            'If in a domain, we need to remove it first before joining a workgroup
            if InDomain then 
                confirm = msgbox(L_Msg024_Text & vbCRLF & L_Msg025_Text,VBYesNo,L_Msg004_Text) 
                if confirm=vbYes then 
                    wscript.StdOut.Write L_Msg026_Text
                    domainuser = Wscript.StdIn.ReadLine

                    wscript.echo
                    wscript.echo L_Msg027_Text
                    
                    targetstr = "netdom remove %computername% /domain:" & NewGroupName & " /userd:" & domainuser & " /passwordd:*"
                    result= oShell.Run(targetstr,1,TRUE)
                    
                    if result=0 then
                        confirm = msgbox(L_Msg028_Text & vbCRLF & L_Msg029_Text, VBYesNo,L_Msg030_Text)
                        if confirm=vbYes then oShell.Run "shutdown /r /t 0",1
                    else
                        DomainAccessErrorMsg(result)
                    end if		
                end if
            else
                JoinWorkgroup()
            end if
            
         end if
          
         if ucase(DorW)=ucase(L_Msg134_Text) then  
            'Joining Domain
            group_type= L_Msg022_Text

            wscript.echo
            wscript.echo L_Msg032_Text
            
            wscript.StdOut.Write L_Msg124_Text
            NewGroupName = Wscript.StdIn.ReadLine
        
            wscript.StdOut.Write L_Msg026_Text
            domainuser = Wscript.StdIn.ReadLine

            wscript.echo
            wscript.echo L_Msg126_Text & NewGroupName & L_Msg127_Text				
            wscript.echo

            targetstr = "netdom join %computername% /domain:" & NewGroupName & " /userd:" & domainuser & " /passwordd:*"

            result= oShell.Run(targetstr,1,TRUE)

            if result=0 then

                confirm = msgbox(L_Msg167_Text, vbYesNo+vbDefaultButton2,L_Msg168_Text)
                if confirm=vbYes then 
                    ChangeComputerName()
                else
                    confirm = msgbox(L_Msg028_Text & vbCRLF & L_Msg029_Text, VBYesNo,L_Msg030_Text)
                    if confirm=vbYes then oShell.Run "shutdown /r /t 0",1
                end if

            else 
                DomainAccessErrorMsg(result)						
            end if			
                    
          end if


    
    Case "2"	'Change Computer Name
        
        ChangeComputerName()

        
    Case "3"	'Add Account to local admin
    
        wscript.echo L_Msg135_Text
        wscript.echo L_Msg136_Text
        wscript.echo
        wscript.StdOut.Write L_Msg036_Text
        AddUserAcct = Wscript.StdIn.ReadLine
        if AddUserAcct="" then
            'cancel	
        else			
            if not InDomain then 
                'Handle workgroup case by creating account first
                targetstr = "net user " & AddUserAcct & " * /add"
                result= oShell.Run(targetstr,1,TRUE)
                if result<>0 then
                    'Show error message
                    RunShowOutput(targetstr)
                else
                    AddToAdminGroup()
                end if
            else 
                AddToAdminGroup()
            end if
    
    
        end if

    Case "4"	'Configure for remote management
        ConfigureRemoteManagement()	
        
    Case "5"	'Update Settings
    
        wscript.echo L_Msg043_Text & Update_schedule
        wscript.StdOut.Write L_Msg044_Text
        updateselection = Wscript.StdIn.ReadLine
        
        if ucase(updateselection)=ucase(L_Msg138_Text) then
            'Make updates automatic
            Update_schedule= L_Msg045_Text
            strSchedule= L_Msg046_Text
            wscript.echo
            wscript.echo L_Msg047_Text
            oShell.Run "Cscript %WinDir%\System32\SCregEdit.wsf /AU 4" & NewComputerName,7,TRUE			
        end if
        
        if ucase(updateselection)=ucase(L_Msg137_Text) then   
            'Make updates manual
            Update_schedule= L_Msg048_Text
            strSchedule= L_Msg049_Text
            wscript.echo
            wscript.echo L_Msg050_Text
            oShell.Run "Cscript %WinDir%\System32\SCregEdit.wsf /AU 1" & NewComputerName,7,TRUE	
        end if
        
        if ucase(updateselection)=ucase(L_Msg137_Text) or ucase(updateselection)=ucase(L_Msg138_Text) then 
            oShell.Run "Net stop wuauserv",7,TRUE	
            oShell.Run "Net start wuauserv",7,TRUE	
 
            MsgBox L_Msg051_Text & Update_schedule & ".  " & strSchedule, vbInformation, L_Msg052_Text
        end if	
    
    Case "6"	'Install Security Patches
    
        'Install all patches on seperate thread
        oShell.Run WUA_Script,1,False

    
    Case "7"    'Enable/disable Remote Desktop
          WScript.Echo
          wscript.StdOut.Write L_Msg053_Text
          rd = Wscript.StdIn.ReadLine

          if ucase(rd)=ucase(L_Msg129_Text) then ' Enable
            do
                wscript.echo
                wscript.echo L_Msg054_Text
                wscript.echo
                wscript.echo L_Msg055_Text
                wscript.echo
                wscript.StdOut.Write L_Msg056_Text
                rdsecuritylevel = Wscript.StdIn.ReadLine
            loop while not (rdsecuritylevel="1" or rdsecuritylevel="2")
            
            wscript.echo
            wscript.echo L_Msg057_Text
           
            'Enable Remote Desktop Admin mode
            result=oShell.Run("Cscript %WinDir%\System32\Scregedit.wsf /ar 0 " & NewComputerName,7,TRUE)
            oShell.Run "Cscript %WinDir%\System32\Scregedit.wsf /cs 1 " & NewComputerName,7,TRUE 	
    
            if result=0 then
                if rdsecuritylevel=2 then 
                    'Allow WinXP and Win 2003 clients
                    oShell.Run "Cscript %WinDir%\System32\Scregedit.wsf /cs 0 " & NewComputerName,7,TRUE
                    msgbox L_Msg058_Text,Information,L_Msg059_Text				
                else
                    msgbox L_Msg060_Text,Information,L_Msg059_Text				
                end if
            else
                msgbox L_Msg203_Text,vbCritical,L_Msg059_Text
            end if				
            
          end if
          
          if ucase(rd)=ucase(L_Msg130_Text) then
            wscript.echo
            wscript.echo L_Msg062_Text
                 
            'Disable Remote Desktop mode
            result=oShell.Run("Cscript %WinDir%\System32\Scregedit.wsf /ar 1 " & NewComputerName,7,TRUE)
            oShell.Run "Cscript %WinDir%\System32\Scregedit.wsf /cs 1 " & NewComputerName,7,TRUE
            
            if result=0 then
                msgbox L_Msg063_Text,vbInformation,L_Msg059_Text
            else
                msgbox L_Msg061_Text,vbCritical,L_Msg059_Text
            end if		
          end if
          
    Case "8"	 'Change Management NIC Assignment
        
        If MgmtNIC<>"" then  
            ManagementNICsettings()
        else
            'Display no active NIC message
            DisplayIP = L_Msg003_Text
        end if
          
    Case "9"	'Set Date and Time
        oShell.Run "control timedate.cpl"	

    Case "10"	'Customer Experience Improvement Program
        DisplayCEIPdialog()
        
    Case "11"	
        if not(HVS_SKU) then 'show Activation menu item	
            ActivateInstall()
        else 'Logoff 
            confirm = msgbox(L_Msg064_Text, vbYesNo+vbDefaultButton2,L_Msg065_Text)
            if confirm=vbYes then 
                oShell.Run "logoff",7,True
            end if		
        end if
        
    Case "12"	
        if not(HVS_SKU) then	'Log Off
            confirm = msgbox(L_Msg064_Text, vbYesNo+vbDefaultButton2,L_Msg065_Text)
            if confirm=vbYes then 
                oShell.Run "logoff",7,True
            end if			
        else ' Restart
            confirm = msgbox(L_Msg066_Text, vbYesNo+vbDefaultButton2,L_Msg030_Text)
            if confirm=vbYes then 
                oShell.Run "shutdown /r /t 0",1	
            end if
        end if			
		
    Case "13"	
        if not(HVS_SKU) then	' Restart
            confirm = msgbox(L_Msg066_Text, vbYesNo+vbDefaultButton2,L_Msg030_Text)
            if confirm=vbYes then oShell.Run "shutdown /r /t 0",1			
        else  'Shut Down
            confirm = msgbox(L_Msg067_Text, vbYesNo+vbDefaultButton2,L_Msg068_Text)
            if confirm=vbYes then oShell.Run "shutdown /s /t 0",1
        end if		
        
    Case "14"
        if not(HVS_SKU) then	'Shut Down
            confirm = msgbox(L_Msg067_Text, vbYesNo+vbDefaultButton2,L_Msg068_Text)
            if confirm=vbYes then oShell.Run "shutdown /s /t 0",1	
        else  'Exit to command line
            wscript.quit
        end if		
        
    Case "15" 	
        if not(HVS_SKU) then	'Exit to command line
            wscript.quit		
        end if						
	

    Case Else
        '

end Select 

Loop  'Loops back to main menu unless exiting 

wscript.quit


sub CheckRemoteDesktop()
 ' True if Remote Desktop enabled
 Dim Sh, sKey, sValueName, sValue, nValue
 Set Sh = CreateObject("WScript.Shell")
 sKey = "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\"
 sValueName = "fDenyTSConnections"
 sValue = Sh.RegRead(SKey & sValueName)
 
 if sValue=0 then 
    nValue= Sh.RegRead(sKey & "WinStations\RDP-Tcp\UserAuthentication")
    if nValue = 0 then 
        TS_status= L_Msg069_Text
    else
        TS_status= L_Msg070_Text
    end if
 else
    TS_status= L_Msg071_Text
 end if
 
End sub 

Function LegalNicSelected(pickedNIC)
    LegalNicSelected=False
    For Each nic in nics
        if pickedNIC=CStr(nic.Index) then 
            LegalNicSelected=True
        end if
    Next
end Function

Sub ManagementNICsettings()

    Set nics = objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPenabled=TRUE")
    Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)		
        
    wscript.echo 
    wscript.echo L_Msg072_Text 
    wscript.echo L_Msg073_Text 
    wscript.echo L_Msg072_Text
    wscript.echo
    wscript.echo
    wscript.echo L_Msg074_Text 
    wscript.echo	
    wscript.echo L_Msg075_Text
                                
    For Each nic in nics			
        if nic.IPenabled then
            DisplayIP = nic.IPAddress(0) 
        else
            DisplayIP=L_Msg002_Text
        end if
        wscript.echo
        
        'Adjust spacing for non EN-US 
        if instr(L_Msg075_Text,"Index#") then 	
            wscript.StdOut.Write "  " & nic.Index & VBTab & DisplayIP & VBTab & left(nic.Description,54)	
        else
            wscript.StdOut.Write "  " & nic.Index & VBTab & VBTab & DisplayIP & VBTab & left(nic.Description,47)
        end if
    Next
    
    wscript.Echo
    do
        wscript.Echo
        wscript.StdOut.Write L_Msg076_Text
        SelectedNIC = Wscript.StdIn.ReadLine
    loop until LegalNicSelected(SelectedNIC) or SelectedNIC = ""
    
            
    if SelectedNIC="" then
            'Do nothing, Cancel was selected, return to main menu
    else
        'Set the MgmtNIC to a legal value		
        MgmtNIC=SelectedNIC				
            
        do 
            wscript.echo 
            wscript.echo L_Msg072_Text
            wscript.echo L_Msg077_Text
            wscript.echo L_Msg072_Text
            wscript.echo
            Set nics = objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration where IPenabled=TRUE")					
            Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)
            
            'Display NIC info (IP, DHCP, DNS)			
            For Each nic in nics
              if nic.index=cint(MgmtNIC) then		
                if nic.IPenabled then
                    DisplayIP = ""
                    DisplayIP = nic.IPAddress(0) 
                    DisplayIPv6 = ""
                    DisplayIPv6 = nic.IPAddress(1)
                else
                    DisplayIP=L_Msg002_Text
                end if
                
                wscript.echo
                wscript.echo L_Msg078_Text & vbTab & vbTab & MgmtNIC
                wscript.echo L_Msg079_Text & vbTab & vbTab & nic.Description
                wscript.echo L_Msg080_Text & vbTab & vbTab & DisplayIP & vbTab & DisplayIPv6
                wscript.echo L_Msg139_Text & vbTab & vbTab & nic.IPSubnet(0)
                wscript.echo L_Msg081_Text & vbTab & vbTab & nic.DHCPenabled
                
                on error resume next
                DefaultGateway= cstr(nic.DefaultIPGateway(0))
                if err<>0 then
                    DefaultGateway = ""
                end if 
                on error goto 0	

                on error resume next
                DisplayIPv6Gateway = cstr(nic.DefaultIPGateway(1))
                if err<>0 then
                    DisplayIPv6Gateway = ""
                end if 
                on error goto 0							
                
                wscript.echo L_Msg140_Text & vbTab & vbTab & DefaultGateway	& vbTab & DisplayIPv6Gateway
                
                on error resume next
                primarydns= cstr(nic.DNSServerSearchOrder(0))
                if err<>0 then
                    primarydns=""
                end if 
                altdns= cstr(nic.DNSServerSearchOrder(1))
                if err<>0 then
                    altdns=""
                end if 
                on error goto 0
                
                wscript.echo L_Msg082_Text & vbTab & primarydns
                wscript.echo L_Msg083_Text & vbTab & altdns
    
              end if
            Next
            
            'Display Network Adapter Options								
            wscript.echo
            wscript.echo L_Msg084_Text	
            wscript.echo L_Msg085_Text
            wscript.echo L_Msg086_Text
            wscript.echo L_Msg087_Text
            wscript.echo
            wscript.echo
            do
                wscript.StdOut.Write L_Msg088_Text
                NIC_option = Wscript.StdIn.ReadLine	
            loop until (left(NIC_option,1)>= "1" and left(NIC_option,1) <= "4") or NIC_option=""			

            Select Case NIC_option
            
                Case "1"  ' Set NIC IP to DHCP or Static
                            
                    '---- Set IP for Selected NIC
                    wscript.echo	
                    wscript.echo
                    wscript.StdOut.Write L_Msg089_Text
                    IPtypeSelection = Wscript.StdIn.ReadLine						 
                
                    Select Case ucase(IPtypeSelection)
                                        
                        Case ucase(L_Msg131_Text)	'Set Static IP
        
                            wscript.echo
                            wscript.echo L_Msg090_Text
                            do
                                wscript.StdOut.Write L_Msg091_Text
                                ip_address = wscript.StdIn.ReadLine
                            loop until CheckStaticIP(ip_address)
                        
                            
                            If IdentifyIPv4(ip_address) then 
                            
                                'Get Netmask
                                wscript.StdOut.Write L_Msg092_Text & DefaultNetmask(ip_address) & L_Msg093_Text
                                netmask = wscript.StdIn.ReadLine
                                if netmask="" then netmask=DefaultNetmask(ip_address)
                                
                                ' Get IPv4 Gateway
                                do
                                    wscript.StdOut.Write L_Msg094_Text
                                    gateway = wscript.StdIn.ReadLine	
				    if gateway="" then exit do
                                loop until CheckStaticIP(gateway)
                                
                            else
                                ' Get IPv6 Gateway
                                
                            end if
                                    
                                                
                            'Set the IP address info
                            strIPAddress = Array(ip_address)
                            strSubnetMask = Array(netmask)
                            strGateway = Array(gateway)
                            strGatewayMetric = Array(1)
                         
                            wscript.echo L_Msg095_Text
                            
                            'clear out all gateway entries first
                            arrClearGateways = Array()
                            errGateways = objNetAdapter.SetGateways(arrClearGateways, null)
                                                         
                            objNetAdapter.ReleaseDHCPLease
                            errEnable = objNetAdapter.EnableStatic(strIPAddress, strSubnetMask)
                            errGateways = objNetAdapter.SetGateways(strGateway, strGatewaymetric)
                            
                            If errEnable=0 Then
                                Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)	
                            Else
                                msgbox L_Msg096_Text & vbCrLF & errEnable,vbCritical,L_Msg097_Text
                                wscript.echo L_Msg096_Text 
                            End If 
                            
                        Case ucase(L_Msg132_Text)   'Set DHCP
                            wscript.echo
                            wscript.echo L_Msg098_Text
                                        
                            'clear out all gateway entries first
                            arrClearGateways = Array()
                            errGateways = objNetAdapter.SetGateways(arrClearGateways, null)			
                                                        
                            errEnable = objNetAdapter.EnableDHCP()
                            objNetAdapter.RenewDHCPLease
                            
                            If errEnable = 0 Then
                                Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)					 	
                            Else
                                msgbox L_Msg096_Text,vbCritical,L_Msg097_Text
                                wscript.echo L_Msg096_Text
                            End If 				
                                        
                        Case Else
                            'Cancel
                            
                    end Select
                            
                    
                Case "2"   ' Change DNS
                
                        wscript.echo L_Msg099_Text		
                        wscript.echo
                        wscript.StdOut.Write L_Msg100_Text
                        DNSServer = wscript.StdIn.ReadLine	
                        
                        strDNSServer=Array(DNSServer)
                        
                        if DNSServer="" then
                            'Cancelled	
                        else
                            'Set Preferred DNS
                            errDNS = objNetAdapter.SetDNSServerSearchOrder(strDNSServer)
                            
                            If errDNS=0 Then
                                'Preferred DNS successfully set, set alternate
                                msgbox L_Msg101_Text,vbInformation,L_Msg097_Text
                                wscript.StdOut.Write L_Msg102_Text
                                altDNSServer = wscript.StdIn.ReadLine	
                                strDNSServer=Array(DNSServer,altDNSServer)
                            
                                if altDNSServer="" then
                                    'skip entering alternate DNS
                                else
                                    errDNS = objNetAdapter.SetDNSServerSearchOrder(strDNSServer)
                                    If errDNS=0 Then
                                    'Alternate DNS successfully set
                                        msgbox L_Msg103_Text,vbInformation,L_Msg097_Text
                                        wscript.echo L_Msg103_Text
                                    else
                                        msgbox L_Msg104_Text,vbCritical,L_Msg097_Text
                                        wscript.echo L_Msg104_Text
                                    end If 	
                                end if		
                            else
                                msgbox L_Msg105_Text,vbCritical,L_Msg097_Text
                            end If  		
                        end if		
                        
                        
                        
                Case "3"   ' Remove DNS	server settings
                
                        'clear out all entries and reset
                        arrDNSServers = Array()
                        errDNS = objNetAdapter.SetDNSServerSearchOrder(arrDNSServers)
                        If errDNS=0 Then
                            'DNS successfully cleared
                            msgbox L_Msg106_Text,vbInformation,L_Msg097_Text
                            wscript.echo L_Msg106_Text			
                        else
                            msgbox L_Msg107_Text,vbCritical,L_Msg097_Text
                            wscript.echo L_Msg107_Text
                        end If 	
                    
                Case "4" ' return to Main Menu
                
                Case else 	
            end Select
            
        Loop Until NIC_option="4" or NIC_option=""
    end if
        
end sub

Sub ConfigureRemoteManagement()

  do
    wscript.echo 
    wscript.echo L_Msg072_Text 
    wscript.echo L_Msg179_Text 
    wscript.echo L_Msg072_Text
    wscript.echo
    wscript.echo
    wscript.echo

    resultGet=oShell.Run("configure-smremoting.exe -get",7,TRUE)

    if resultGet=0 or resultGet=2 then
        wscript.echo L_Msg210_Text
    else
        if resultGet=1 or resultGet=3 then
            wscript.echo L_Msg211_Text
        else
            wscript.echo L_Msg212_Text
        end if
    end if

    wscript.echo
    wscript.echo L_Msg157_Text ' 1 Enable Remote Management
    wscript.echo L_Msg158_Text ' 2 Disable Remote Management
    wscript.echo L_Msg188_Text ' 3 Ping
    wscript.echo
    wscript.echo L_Msg161_Text ' 4 Return
    wscript.echo
    
    wscript.StdOut.Write L_Msg056_Text
    RemoteOption = Wscript.StdIn.ReadLine	

    select case RemoteOption
        
        Case "1"	' Enable Remote Management
            if resultGet=2 or resultGet=3 then
                msgbox L_Msg213_Text,,L_Msg179_Text
            else
                wscript.echo
                wscript.echo L_Msg204_Text
            
                'Enable Remote Management
                result=oShell.Run("configure-smremoting.exe -enable",7,TRUE)

                if result=0 then 
                    msgbox L_Msg206_Text,,L_Msg179_Text
                else
                    msgbox L_Msg207_Text,,L_Msg179_Text
                end if
            end if

        Case "2"	' Disable Remote Management
            if resultGet=2 or resultGet=3 then
                msgbox L_Msg213_Text,,L_Msg179_Text
            else
                wscript.echo
                wscript.echo L_Msg205_Text
            
                'Enable Remote Management
                result=oShell.Run("configure-smremoting.exe -disable",7,TRUE)

                if result=0 then 
                    msgbox L_Msg208_Text,,L_Msg179_Text
                else
                    msgbox L_Msg209_Text,,L_Msg179_Text
                end if
            end if

        Case "3"  'Allow/Disallow Ping
            wscript.echo
            
            'Allow Ping?
            confirm = msgbox(L_Msg189_Text,VBYesNo,L_Msg179_Text) 
            if confirm=vbYes then
                ' Allow Ping
                result=oShell.Run("netsh firewall set icmpsetting 8",7,TRUE)			
                if result=0 then 
                    wscript.echo L_Msg190_Text 'Successfully allow ping
                    msgbox L_Msg190_Text,,L_Msg179_Text
                else
                    wscript.echo L_Msg175_Text  'Failure
                    msgbox L_Msg165_Text,vbCritical,L_Msg179_Text
                end if				
            else 
                'Disallow Ping
                result=oShell.Run("netsh firewall set icmpsetting 8 disable",7,TRUE)
                if result=0 then 
                    wscript.echo L_Msg191_Text   'Disallow Ping successfully set
                    msgbox L_Msg191_Text,,L_Msg179_Text
                else
                    wscript.echo L_Msg175_Text  'Failure
                    msgbox L_Msg165_Text,vbCritical,L_Msg179_Text
                end if
            end if		
            
        Case else

    end Select

  loop while RemoteOption="1" or RemoteOption="2" or RemoteOption="3"

end sub



sub ChangeComputerName()

    Wscript.echo L_Msg034_Text
    Wscript.echo 

    wscript.StdOut.Write L_Msg033_Text
    NewComputerName = Wscript.StdIn.ReadLine
        
    if NewComputerName<>"" then
                                    
        wscript.echo L_Msg035_Text
        wscript.echo 
        
        InDomain = GetDomainStatus()
    
        if not InDomain then
          'In workgroup 		  			 				  	
           result = oShell.Run("netdom renamecomputer %computername% /force /NewName:" & NewComputerName,7,TRUE)			  											  
        else
          'In Domain
          wscript.StdOut.Write L_Msg026_Text
          domainuser = Wscript.StdIn.ReadLine		  
          result = oShell.Run("netdom renamecomputer %computername% /force /NewName:" & NewComputerName & " /userd:" & domainuser & " /passwordd:*",1,TRUE)
        end if

        if result=0 then
           confirm = msgbox(L_Msg028_Text & vbCRLF & L_Msg029_Text, VBYesNo,L_Msg030_Text)
           if confirm=vbYes then oShell.Run "shutdown /r /t 0",1
        else
           DomainAccessErrorMsg(result)				
        end if

    end if

end sub

sub JoinWorkgroup
    group_type= L_Msg023_Text
    
    wscript.StdOut.Write L_Msg125_Text
    NewGroupName = Wscript.StdIn.ReadLine
        
    wscript.echo
    wscript.echo L_Msg126_Text & NewGroupName & L_Msg127_Text	 
    
    targetstr = "Wmic computersystem where name=" & chr(34) & "%computername%" & chr(34) & " call joindomainorworkgroup name=" & chr(34) & NewGroupName & chr(34)
            
    returncode = oShell.Run(targetstr,7,TRUE)
    if returncode<>0 then 
        msgbox L_Msg108_Text,VBCritical,L_Msg023_Text
    else
        msgbox L_Msg109_Text & NewGroupName,vbInformation,L_Msg023_Text
    end if
end sub

Sub GetInitialStatusValues()
    
    wscript.echo L_Msg111_Text
    wscript.echo

    on error resume next
    
    'Determine if Hyper-V Server SKU
    HVS_SKU= VerifyHVS()
    
    ' Get update settings status
    AutoPatch = oShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AUOptions")
    
    if AutoPatch=4 then 
        Update_schedule = L_Msg045_Text 
    else 
        Update_schedule = L_Msg048_Text 
    end if 
    
    Set nics = objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration where IPenabled=TRUE")
    
    ' Try to select the first NIC with an active IP	
    if MgmtNIC="" then		
        DisplayIP = L_Msg001_Text		
        for each n in nics
            MgmtNIC= n.index
            Set objNetAdapter = GetObject("winmgmts:Win32_NetworkAdapterConfiguration=" & MgmtNIC)
            exit for
        next	
    end if	

    if MgmtNIC="" then
        'Display no active NIC message
        DisplayIP = L_Msg003_Text
        Msgbox DisplayIP,vbExclamation,L_Msg004_Text
    end if
    

End Sub



function GetCmdLineOutput()

    Set objStdOut = objWshScriptExec.StdOut
    GetCmdLineOutput = objStdOut.ReadAll

end function


Function CheckStaticIP(ip)

    on error resume next
    IPstart = left(ip,instr(ip,".")-1)
    on error goto 0
    
    if IPstart>=1 and IPstart<224 then 
    	CheckStaticIP=TRUE
    else
    	msgbox L_Msg112_Text,vbCritical,L_Msg097_Text
    	CheckStaticIP=FALSE
    end if
    
    if IPstart=127 then 
    	CheckStaticIP=FALSE
    	msgbox L_Msg113_Text,vbCritical,L_Msg097_Text
    end if
    
end function

Function IdentifyIPv4(ip)
    IdentifyIPv4= TRUE

end function


Function DefaultNetmask(ip)

    DefaultNetmask=""
    on error resume next
    IPstart = left(ip,instr(ip,".")-1)
    on error goto 0
    

    if IPstart>=0 and IPstart <127 then 
        DefaultNetmask="255.0.0.0"
    end if
    
    if IPstart>127 and IPstart <224 then 
        DefaultNetmask="255.255.255.0"	
    end if


end function


Sub DomainAccessErrorMsg(result)
    Select Case result
        Case 5 strErrorDescription = L_Msg114_Text
        Case 87 strErrorDescription = L_Msg115_Text
        Case 110 strErrorDescription = L_Msg116_Text
        Case 1323 strErrorDescription = L_Msg117_Text
        Case 1326 strErrorDescription = L_Msg118_Text
        Case 1355 strErrorDescription = L_Msg119_Text
        Case 2224 strErrorDescription = L_Msg120_Text
        Case 2691 strErrorDescription = L_Msg121_Text
        Case 2692 strErrorDescription = L_Msg122_Text
        Case else strErrorDescription = L_Msg123_Text
    End Select				
    msgbox strErrorDescription,vbCritical,L_Msg022_Text	

end sub


Function GetDomainStatus()

    Set colItems = objWMIService.ExecQuery( "Select * from Win32_ComputerSystem", , 48 )
    
    For Each objItem in colItems
        pcname = objItem.Name
        strComputerDomain = objItem.Domain 
        
        If objItem.PartOfDomain Then
            group_type= L_Msg022_Text
            groupname= strComputerDomain
            GetDomainStatus=TRUE
        Else
            group_type= L_Msg023_Text
            groupname= strComputerDomain
            GetDomainStatus=FALSE      
        End If
    Next

end Function

Function VerifyHVS()
    on error resume next
    OStype = oShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\EditionID")
    on error goto 0

    if Instr(OStype,"ServerHyper") then 
        VerifyHVS=TRUE 
    else
        VerifyHVS=FALSE
    end if

end Function


sub AddToAdminGroup()
    wscript.echo L_Msg037_Text

    Set colAccounts = objWMIService.ExecQuery _
        ("Select * From Win32_Group Where Domain = '" & pcname & "' AND SID = 'S-1-5-32-544'")
                
    For Each objAccount in colAccounts
        admingroupname = objAccount.Name
    Next	
            
    targetstr= "net localgroup " & admingroupname & " /add " & AddUserAcct		
    RunShowOutput(targetstr)
end sub

sub RunShowOutput(strCommand)
    Set objWshScriptExec = oShell.Exec("cmd /C " & strCommand & " 2>&1")
    strStdOut = objWshScriptExec.stdout.readall
    msgbox strStdOut,,L_Msg040_Text
    Set objWshScriptExec=nothing
end sub


sub CheckCEIPstatus()
    'Check for policy
    on error resume next
    CEIP_Value1= oShell.RegRead("HKLM\Software\Policies\Microsoft\SQMClient\Windows\CEIPEnable")
    on error goto 0	

    if CEIP_Value1="" then
        'Check for local
        on error resume next
        CEIP_Value2= oShell.RegRead("HKLM\Software\Microsoft\SQMClient\Windows\CEIPEnable")
        if CEIP_Value2="" then CEIP_Value2=0
        on error goto 0

        if CEIP_Value2=1 then
            CEIP_Status= L_Msg110_Text 'Participating
        else
            CEIP_Status= L_Msg198_Text 'Not Participating
        end if
    else
        if CEIP_Value1=1 then
            CEIP_Status= L_Msg110_Text 'Participating
        else
            CEIP_Status= L_Msg198_Text 'Not Participating
        end if
    end if
end sub

sub CheckRemoteManagementStatus()
    resultGet=oShell.Run("configure-smremoting.exe -get",0,TRUE)

    if resultGet=0 or resultGet=2 then
        RemoteManagementStatus= L_Msg145_Text 'Enabled
    else
        if resultGet=1 or resultGet=3 then
            RemoteManagementStatus= L_Msg146_Text 'Disabled
        else
            RemoteManagementStatus= L_Msg215_Text 'Unknown
        end if
    end if
end sub



sub DisplayCEIPdialog()
        on error resume next
            CEIP_Value1= oShell.RegRead("HKLM\Software\Policies\Microsoft\SQMClient\Windows\CEIPEnable")
        on error goto 0


	if HVS_SKU then 
          'Show Hyper-V Server CEIP text
          confirm = msgbox(L_Msg217_Text & vbCrLf & vbCrLf & L_Msg194_Text & vbCrLf & vbCrLf & L_Msg195_Text & vbCrLf & vbCrLf & L_Msg218_Text & vbCrLf & vbCrLf & L_Msg199_Text,vbYesNo+vbDefaultButton2,L_Msg200_Text ) 
	else
	  'Show Windows Server CEIP text
	   confirm = msgbox(L_Msg193_Text & vbCrLf & vbCrLf & L_Msg194_Text & vbCrLf & vbCrLf & L_Msg195_Text & vbCrLf & vbCrLf & L_Msg196_Text & vbCrLf & vbCrLf & L_Msg199_Text,vbYesNo+vbDefaultButton2,L_Msg200_Text ) 
	end if

        if CEIP_Value1<>"" then
            msgbox L_Msg202_Text,,L_Msg200_Text
        else 
            if confirm=vbYes then 	
                oShell.Exec("%ComSpec% /C serverCEIPOptin /enable")	
                msgbox L_Msg110_Text,,L_Msg145_Text

            else
                oShell.Exec("%ComSpec% /C serverCEIPOptin /disable")	
                msgbox L_Msg198_Text,,L_Msg146_Text
            end if
        end if
        
end sub

Sub ActivateInstall()
        
do	
    wscript.echo 
    wscript.echo L_Msg201_Text
    wscript.echo
    wscript.echo L_Msg150_Text '1) Display License info
    wscript.echo L_Msg151_Text '2) Activate Windows
    wscript.echo L_Msg153_Text '3) Install Product key		
    wscript.echo L_Msg155_Text '4) Exit
    wscript.echo
    wscript.StdOut.Write L_Msg056_Text 'Enter selection:
    OptionSelection = Wscript.StdIn.ReadLine
    
    Select case OptionSelection
        Case "1"
            'Display License information
            oShell.Run ("%ComSpec% /K cscript %windir%\system32\slmgr.vbs /dli")
    
        Case "2"
            'Activate Windows
            oShell.Run ("%ComSpec% /K cscript %windir%\system32\slmgr.vbs /ato")	

        Case "3"
            'Install Product key
            pid= inputbox(L_Msg216_Text, L_Msg216_Text)
            if pid <> "" then
                oShell.Run ("%ComSpec% /K cscript %windir%\system32\slmgr.vbs /ipk " & pid)
            end if
                        
        Case else	
            
    end select

loop Until OptionSelection="4"	
            
end sub