class UserssController < ApplicationController
    def show(name)
        @user = User.find_by(nombre: name)
    end
end