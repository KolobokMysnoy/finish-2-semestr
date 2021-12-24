# frozen_string_literal: true

class MainController < ApplicationController
  before_action :parse_params, only: %i[show]

  def view; end

  def show
    @posts_to_show = what_to_answer(@what_to_show)

    respond_to do |format|
      format.html do
        render html: { value: 'Error' }
      end
      format.json do
        render json: { type: @posts_to_show.class.to_s, value: @posts_to_show }
      end
    end
  end

  private

  def parse_params
    # What to show when
    # All is false
    # only mine is true
    # get string
    @what_to_show = params[:what_to_show]
  end

  def what_to_answer(indicator)
    to_return = []

    if indicator == 'true'
      Post.all.each do |post|
        next unless post.user == current_user

        local_dat = { title: post.head, bod: post.body, user: "#{t '.created_by'} #{post.user.username}" }
        to_return.push(local_dat)
      end
    else

      Post.all.each do |post|
        p("#{t '.created_by'} #{post.user.username}")
        local_dat = { title: "#{t '.title'} #{post.head}", bod: "#{t '.body'} #{post.body}",
                      user: "#{t '.created_by'} #{post.user.username}".to_s }
        to_return.push(local_dat)
      end
    end

    to_return
  end
end
