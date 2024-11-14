@echo off

rem -- Open WebBrowserPassView.exe --
start WebBrowserPassView.exe

rem -- Wait for the program to load (adjust the time if needed) --
ping 127.0.0.1 -n 3 >nul

rem -- Create the VBScript for simulating key presses --
echo Set WshShell = CreateObject("WScript.Shell") > type.vbs

rem -- Press Ctrl + A to select all --
echo WshShell.SendKeys "^a" >> type.vbs
echo WScript.Sleep 500 >> type.vbs  rem 0.5-second delay

rem -- Simulate a right-click (Shift + F10) --
echo WshShell.SendKeys "+{F10}" >> type.vbs  rem Shift + F10 to simulate right-click
echo WScript.Sleep 500 >> type.vbs  rem 0.5-second delay

rem -- Simulate pressing the down arrow key 4 times --
echo WshShell.SendKeys "{DOWN}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs
echo WshShell.SendKeys "{DOWN}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs
echo WshShell.SendKeys "{DOWN}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs
echo WshShell.SendKeys "{DOWN}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs

rem -- Press Enter to confirm --
echo WshShell.SendKeys "{ENTER}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs  rem 0.5-second delay

rem -- Simulate pressing Alt + F4 to close the window --
echo WshShell.SendKeys "%{F4}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs  rem 0.5-second delay

rem -- Simulate pressing Alt + F4 again to close the next window (if applicable) --
echo WshShell.SendKeys "%{F4}" >> type.vbs
echo WScript.Sleep 500 >> type.vbs  rem 0.5-second delay

rem -- Run the VBScript to simulate the keystrokes --
cscript //nologo type.vbs

rem -- Clean up the VBScript --
del type.vbs

end
