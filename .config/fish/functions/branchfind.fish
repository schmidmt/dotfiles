function branchfind --description 'Find a file or folder in given directory or in any parent'
    set cur "$PWD"
    while test cur -ne '/'
        
        set cur (dirname "$cur")
    end
end

