echo "Starting game server"
cd Server
start node "server.js"
cd ..

echo "Starting vite web server / builder"
cd Game
start npx "vite --port 8070"
cd ..

echo "Opening chrome"
Start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://localhost:8070/index.html"

echo "Opening vim"
start "C:\Program Files (x86)\Vim\vim82\gvim.exe" "Game/game.js"

echo "Opening powershell window so you can run git"
start powershell
