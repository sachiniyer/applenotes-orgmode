set fl to POSIX file "/Users/sachiniyer/docs/publish/quarantine_todo.html"
set notebody to read file fl

set fl2 to POSIX file "/Users/sachiniyer/docs/publish/email.html"
set notebody2 to read file fl2
tell application "Notes"
    tell account "iCloud"
	make new note at folder "tester" with properties {name:"test", body:notebody}
    end tell
end tell

tell application "Notes"
    tell account "iCloud"
	make new note at folder "tester" with properties {name:"test2", body:notebody2}
    end tell
end tell
