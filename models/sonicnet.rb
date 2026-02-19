class Sonicnet < Oxidized::Model
  using Refinements

  # match shell prompt
  prompt /^[a-zA-Z0-9._-]+\@[a-zA-Z0-9._-]+\:(?:~|[\/a-zA-Z0-9._-]+)\s?[#$]\s*$/

  # read config from json file
  cmd 'cat /etc/sonic/config_db.json' do |cfg|
    cfg = cfg.lines[1..-2].join  # remove first (command) & last (prompt)
    cfg
  end

  cfg :ssh do
    pre_logout 'exit'
  end
end
