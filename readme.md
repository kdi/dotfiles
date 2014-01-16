kdi::dotfiles
=========

This is the common configuration files on the machines of developers at K&D interactive 

Also contains the executable 'kdi' which encapsulates common procedures.

## Some common and useful aliases

### Easier navigation:

.. = "cd .."

... = "cd ../.."

.... = "cd ../../.."

..... = "cd ../../../.."

### GIT STUFF
g = "git"
undopush = "git push -f origin HEAD^:master"

### Node.js
alias nose="sudo node server.js"
alias node-env="export NODE_ENV=$1 | echo Node environment set to $1"

### Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

myip="ifconfig | grep inet  | grep -v 127.0.0.1 | cut -d\   -f2"

### Less commands
lesscss = "lessc assets/less/main.less assets/css/main.css"
lessmin = "lessc -x assets/less/main.less assets/css/main.min.css"

For a complete list visit [aliases](https://github.com/kdi/dotfiles/blob/master/.aliases)



## Credits

Assembled by [Makis Tracend](http://github.com/tracend) 

Thanks to [Paul Irish](https://github.com/paulirish), [Zach Holman](https://github.com/holman), [Mathias Bynens](https://github.com/mathiasbynens), [Ory Band](http://github.com/oryband) for their contributions to the [dotfiles](http://dotfiles.github.com) repositories. 

Also thanks to Github for hosting, actively supporting and adding valuable resourses [1](https://help.github.com/articles/dealing-with-line-endings)...

