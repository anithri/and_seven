class PagesController < ApplicationController
  def home
    @initial_state = initial_state.data
  end

  def initial_state
    ReactInitialState.new(current_user)
  end
end
