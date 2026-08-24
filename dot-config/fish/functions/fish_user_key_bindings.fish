function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint

  for m in insert default
    bind -M $m \cj down-or-search
    bind -M $m \ck up-or-search
    bind -M $m \cg edit_command_buffer
  end

  bind -M insert \co accept-autosuggestion
end
