tell application "Finder"
    set fl to files of folder POSIX file "/Users/sachiniyer/docs/publish/" as list
end tell
set filenames to {}
set filebodies to {""}
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

return filenames
return filebodies
