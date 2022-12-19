class FriendshipsController < ApplicationController
  def create
    friend=User.find(params[:friend])
    friendship=Friendship.create(user_id:current_user.id,friend_id:friend.id)
    if friendship.save
      flash[:notice]="Added in friends list"
    else
      flash[:alert]="There was something wrong"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship=current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice]="Stopped following"
    redirect_to my_friends_path
  end
end
