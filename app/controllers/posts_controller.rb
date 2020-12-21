class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end
  
  def checked
    post = Post.find(params[:id])
    #設定したURLパラメーターから既読したメモのidが
    #渡されるように設定するのでそのidを使用して該当する
    #レコードを取得している
    if post.checked
      #if文でpost.checkedという既読であるか否かを
      #判定するプロパティを指定し
      post.update(checked: false)
      #既読であれば既読を解除するためにfalseへ変更し
      #既読でなければ既読にするためtrueへ変更する  
      #このときはupdateというActiveRecordのメソッドを
      #使用して更新している  
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    #最後に、更新したレコードをitem =
    #Post.find(params[:id])で取得し直し
    #render json: { post: item }でJSON形式として
    #checked.jsに返却している
    render json: { post: item }
  end
end
