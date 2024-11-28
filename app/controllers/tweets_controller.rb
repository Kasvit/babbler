# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_user_tweet, only: %i[edit update destroy]

  def index
    @tweets = Tweet.all.includes(:user).ordered
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params.merge(user: current_user))
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Tweet was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      respond_to do |format|
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Tweet was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_path, notice: 'Tweet was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Tweet was successfully destroyed.' }
    end
  end

  private

  def set_user_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
