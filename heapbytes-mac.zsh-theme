#Author : Heapbytes <Gourav> (https://github.com/heapbytes)

PROMPT='
┌─[%F{blue} %~%f] [%F{green} $(get_ip_address)%f] $(git_prompt_info)
└─➜ '

RPROMPT='[%F{red}%?%f]'

# https://apple.stackexchange.com/questions/226871/how-can-i-get-the-list-of-all-active-network-interfaces-programmatically/226880#226880
get_ip_address() {
  ipAddress="$(ipconfig getifaddr $(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}'))"
  if [[ -n ipAddress ]]; then
    echo "%{$fg[green]%}$ipAddress"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

