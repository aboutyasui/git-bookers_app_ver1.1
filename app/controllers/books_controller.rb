class BooksController < ApplicationController
  def index
    # Viewへ渡すためのインスタンス変数(@book)に空のModelオブジェクト(Book.all)を生成する。
   @books = Book.all
   @book=Book.new
  end
    # 保存機能(create)を追加
   def create
    @books = Book.all
    @book = Book.new(book_params)#n番目データを送信
    if @book.save#n番目のデータを保存
    flash[:notice] = "Book was successfully created." #フラッシュメッセージ
    # トップ画面へリダイレクト
     redirect_to book_path(@book.id)
    else#何も入力せず更新ボタンを押した場合、一覧ページに飛ぶ（そのための定義文）
     render :index
     #render :同じコントローラ内の別アクションのViewを表示できます(今回の場合indexを表示)
    end
   end


  def show
    @book = Book.find(params[:id]) #IDを検索する処理を記載
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if
     @book.update(book_params)
     flash[:notice] = "Book was successfully created."#フラッシュメッセージ
     redirect_to book_path(@book.id)
    else
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path # 投稿一覧画面へリダイレクト（最後の「_path」の付け忘れに）
  end
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
