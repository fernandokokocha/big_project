class LeaguesController < ApplicationController
  respond_to :html

  def list
    render 'index'
  end
end
