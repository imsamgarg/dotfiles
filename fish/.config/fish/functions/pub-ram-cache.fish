function pub-ram-cache
    set cachePath ~/.ram/pub-cache
    if [ "$argv[1]" ]
        if [ $argv[1] = init ]
            sudo mkdir $cachePath ||
                sudo mount -t tmpfs -o size=1g tmpfs $cachePath &&
                sudo cp -r ~/.pub-cache/* $cachePath
        else if [ $argv[1] = flush ]
            sudo cp -rf $cachePath/* ~/.pub-cache
        else if [ $argv[1] = remove ]
            sudo rm -rf $cachePath/*
        end
    else
        echo usage
        echo "init: Initialize Ram Pub Cache"
        echo "flush: Persist Data"
    end
end
