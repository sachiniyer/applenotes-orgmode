set filenames to {}
set filebodies to {}

tell application "Finder"
    set fl to files of folder POSIX file "/Users/sachiniyer/docs/publish/" as list
end tell
repeat with f in fl
    set filename to name of f
    copy filename to the end of the filenames
end repeat

repeat with f in filenames
    set filename to "/Users/sachiniyer/docs/publish/" & f
    set fp to POSIX file filename
    set notebody to read file fp
    copy notebody to the end of filebodies
end repeat

tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
    if frontApp is "Emacs-x86_64-10_14"
	tell application "Notes"
	    tell account "iCloud"
		tell folder "orgnotes"
		    delete every note
		end tell
	    end tell
	end tell

	tell application "Notes"
	    tell account "iCloud"
		tell folder "Recently Deleted"
		    delete every note
		end tell
	    end tell
	end tell

	set filenum to 1
	set filenumber to count of filenames
	repeat filenumber times
	    set filename to item filenum of filenames
	    set filebody to item filenum of filebodies
	    tell application "Notes"
		tell account "iCloud"
		    make new note at folder "orgnotes" with properties {name:filename,body:filebody}
		end tell
	    end tell
	    set filenum to filenum + 1
	end repeat
    end if
end tell
