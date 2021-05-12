class StatisticsController < ApplicationController
    def index
        @user_comments = Comment.all.where(user_id: current_user.id).group_by_week(:created_at, time_zone: "Pacific Time (US & Canada)").count
        @user_posts = Post.all.where(user_id: current_user.id).group_by_week(:created_at, time_zone: "Pacific Time (US & Canada)").count
        @user_demos = Demo.all.where(user_id: current_user.id).group_by_week(:created_at, time_zone: "Pacific Time (US & Canada)").count
    end
end
