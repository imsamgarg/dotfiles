function freeport
    lsof -i :3000 | tail -n1 | awk '{print $2}' | xargs kill -9
end
