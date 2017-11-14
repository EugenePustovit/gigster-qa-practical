
def get_user_info(usr)

  begin
    user = CONFIG[ 'users' ].fetch(usr)
  rescue e
    raise "No such user configured: <#{usr}> => #{e.message}"
  end

  user
end

def get_env_url
  CONFIG['environments']["#{ENV['environment']}"]['url']
end

def get_expenses_details
  CONFIG['expenses']
end

def get_report_details
  CONFIG['report']
end
