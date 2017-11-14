class SignUpSection < SitePrism::Section
# -- field --
  element :username_field, '#signupUsername'
  element :password_field, '#signupPassword'

# -- checkbox --
  element :admin_checkbox, '#isAdmin'

# -- button --
  element :create_user_button, '#signupButton'
end


class LoginSection < SitePrism::Section
# -- field --
  element :username_field, '#loginUsername'
  element :password_field, '#loginPassword'

# -- button --
  element :login_button, '#loginButton'
end


class MainPage < SitePrism::Page
  set_url '/'

  section :sign_up_section, SignUpSection, '#signup'
  section :login_section, LoginSection, '#login'

  def sign_up_as(usr)
    user = get_user_info usr
    sign_up_section.username_field.set user['username']
    sign_up_section.password_field.set user['password']
    sign_up_section.admin_checkbox.set true if usr == 'admin'
    sign_up_section.create_user_button.click
  end

  def login_as(usr)
    user = get_user_info usr
    login_section.username_field.set user['username']
    login_section.password_field.set user['password']
    login_section.login_button.click
  end
end
