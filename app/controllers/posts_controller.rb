class PostsController < ApplicationController
  def show
    @posts = Post.all.order('date DESC')
    @post = Post.find(params[:id])
  end
end
