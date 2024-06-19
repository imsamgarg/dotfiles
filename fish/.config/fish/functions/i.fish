function i --wraps='sudo apt install' --description 'alias i=sudo apt install'
    if [ "$argv[1]" ]
        if [ $argv[1] = vscode ]
            curl "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -L -o "vscode.deb" &&
                sudo dpkg -i vscode.deb &&
                rm vscode.deb
        else if [ $argv[1] = chrome ]
            curl "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -L -o "chrome.deb" &&
                sudo dpkg -i chrome.deb &&
                rm chrome.deb
        else if [ $argv[1] = firefox ]
            curl "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -L -o "firefox.bz2" &&
                echo "Extracting.."
            tar xjf firefox.bz2 &&
                echo "Installing.."
            sudo rm -rf /opt/firefox
            sudo mv firefox /opt &&
                sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox &&
                echo "Setting Firefox Icon..."
            sudo wget "https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop" -P /usr/local/share/applications
        else
            sudo apt install $argv
        end
    end
end
