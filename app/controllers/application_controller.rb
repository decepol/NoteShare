class ApplicationController < ActionController::Base
  protect_from_forgery

  # akcja gry nie mamy autoryzacji, podnoszony jest wyjatek i robione przekierowanie
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Szpak mowi nie!"
    redirect_to root_path
  end
end
