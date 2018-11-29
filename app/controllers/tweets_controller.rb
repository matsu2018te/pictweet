class TweetsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index #ツイート一覧画面
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")#allなくてもいい
  end

  def method_name

  end

  def new #ツイート新規投稿
  end

  def create #新規ツイート保存
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit#ツイート編集
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
