class Sonicnet < Oxidized::Model
  using Refinements

  # match shell prompt
  prompt /\w+>|#/

  # read config from json file
  cmd 'cat /etc/sonic/config_db.json'

  cfg :ssh do
    pre_logout 'exit'
  end
end
