function fish_prompt
    # Display the current directory
    set_color $fish_color_cwd
    echo -n (prompt_pwd) '>'
    set_color normal
end