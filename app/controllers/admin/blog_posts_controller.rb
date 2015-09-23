module Admin
	class BlogPostsController < AdminController
		before_action :validate_user

		def index
			@blog_posts = Post.all.order('date DESC')
		end

		def edit
			set_blog_post
		end

		def new
			@blog_post = Post.new
		end

		def update
			set_blog_post
			@blog_post.page_id = 2

			if @blog_post.update(blog_post_params)
				flash[:notice] = "Blog post has been updated."
				redirect_to action: 'index'
			else
				render action: 'edit', id: @blog_post.id
			end
		end

		def create
			@blog_post = Post.new(blog_post_params)
			@blog_post.page_id = 2

			if @blog_post.save
				flash[:notice] = "Blog post was created."
				redirect_to action: 'index'
			else
				render action: 'new'
			end
		end

		def save
			set_blog_post
		end

		def destroy
      blog_post = Post.find(params[:blog_post_id])
      blog_post.destroy

      redirect_to action: 'index'
    end

		private

		def set_blog_post
			@blog_post = Post.find(params[:id])
		end

		def validate_user
    	unless User::CAN_ACCESS_BLOG_POSTS == :true || current_user.id == 1
    		flash[:alert] = "You do not have access."
    		redirect_to '/admin'
    	end
    end

		def blog_post_params
    	params.require(:post).permit(
    		:page_id,
    		:date,
    		:name, 
    		:description,
    		:keywords,
    		:body,
    		:bootsy_image_gallery_id
    	)
  	end
	end
end