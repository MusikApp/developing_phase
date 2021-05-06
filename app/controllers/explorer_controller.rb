class ExplorerController < ApplicationController
    def index
        @demos = Demo.all.reverse

        @q = params[:query]
    
        if @q
            if Demo.where("content ~* ?", @q).count > 0
                @demos = Demo.where("content ~* ?", @q).page(params[:page]).reverse
            elsif User.where("username ~* ?", @q).count > 0
                @demos = User.where("username ~* ?", @q).map{|user| user.demos}.flatten.reverse
            elsif Comment.all.where("content ~* ?", @q).count > 0
                @demos = Comment.all.where("content ~* ?", @q).map{|comment| comment.demo}.reverse
            else
                @demos = Demo.all.reverse
            end

        end
    end
end