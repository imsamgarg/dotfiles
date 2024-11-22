function freeport
    lsof -i ":$argv[1]" | tail -n1 | awk '{print $2}' | xargs kill -9
end
