class Player::SettingsController < ApplicationController

  layout 'player'

  def index
    @player = current_player
  end

  def avatar
    @player = current_player
    @avatars = Avatar.not_private
  end

  def change_avatar
    @player = current_player
    avatar = Avatar.not_private.find(params[:avatar_id])
    @player.update_attribute(:avatar_id, avatar.id)
    redirect_back(fallback_location: root_path)
  end
end
