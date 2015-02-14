class TacticsController < ApplicationController
  before_action :authenticate_user!

  def update
    @tactic = current_user.team.tactic
    @tactic.update(tactic_params)
    redirect_to tactic_path, notice: 'Tactic updated'
  end

  private

    def tactic_params
      params.require(:tactic).permit(:gk_id_id, :d1_id, :d2_id, :d3_id, :d4_id, :dm1_id, :dm2_id, :am1_id, :am2_id, :s1_id, :s2_id)
    end
end
