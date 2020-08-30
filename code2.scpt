on getAllNotesFromAccountNamed(targetAccountName)
    tell application "Notes"
	set the matchingNotes to {}
	repeat with i from 1 to the count of notes
	    set thisNote to note i
	    set thisItem to thisNote
	    -- walk up the container chain until the account container is reached
	    repeat
		set thisContainer to the container of thisItem
		if (the class of thisContainer) is account then
		    if the name of thisContainer is targetAccountName then
			set the end of matchingNotes to thisNote
		    end if
		    exit repeat
		else
		    set thisItem to thisContainer
		end if
	    end repeat
	end repeat
	return matchingNotes
    end tell
end getAllNotesFromAccountNamed

set names to {}
set bodies to {}
tell application "Notes"
    set notes to (getAllNotesFromAccountNamed("iCloud"))
    repeat with i from 1 to the count of notes
	set thisNote to note i
	set thisItem to thisNote
	set thename to the name of thisItem
	set thebody to the body of thisItem
    end repeat
end tell
