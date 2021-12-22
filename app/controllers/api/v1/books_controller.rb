class Api::V1::BooksController < ApplicationController
  #setting the allowed data
  ALLOWED_DATA = %[name email].freeze
  def index
    books = Book.all
    render json: books
  end

  def show
    books = Book.find(params[:id])
    render json: books, except: :id
  end

  def create
    #data = json_payload.select {|k| ALLOWED_DATA.include?(k)}
    #book = Book.new(data)  

    book = Book.new(name: params[:name], email: params[:email]) 
    if book.save
      render json: book
    else  
      render json: {"message": "encountered some error"}
    end  
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
  end
end
