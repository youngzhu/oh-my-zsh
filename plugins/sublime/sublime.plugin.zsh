# Sublime Text 2 Aliases

if [[ $('uname') == 'Linux' ]]; then
    local _sublime_linux_paths > /dev/null 2>&1
    _sublime_linux_paths=(
        # 我的 sublime 安装路径
        "/opt/Sublime/sublime_text"
        "$HOME/bin/sublime_text"
        "/opt/sublime_text/sublime_text"
        "/usr/bin/sublime_text"
        "/usr/local/bin/sublime_text"
        "/usr/bin/subl"
    )
    # 为了能在 sublime 中输入中文
    # 首先要判断文件是否存在
    path1=/opt/Sublime/lib/libsublime-imfix.so 
    if [ -e $path1 ]
    then
	#echo $path1
	export LD_PRELOAD="$path1"
    fi
    for _sublime_path in $_sublime_linux_paths; do
        if [[ -a $_sublime_path ]]; then
            st_run() { $_sublime_path $@ >/dev/null 2>&1 &| }
            alias st=st_run
            break
        fi
    done

elif  [[ "$OSTYPE" = darwin* ]]; then
    local _sublime_darwin_paths > /dev/null 2>&1
    _sublime_darwin_paths=(
        "/usr/local/bin/subl"
        "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
        "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
        "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
        "$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
        "$HOME/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
        "$HOME/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
    )

    for _sublime_path in $_sublime_darwin_paths; do
        if [[ -a $_sublime_path ]]; then
            alias subl="'$_sublime_path'"
            alias st=subl
            break
        fi
    done
fi

alias stt='st .'
