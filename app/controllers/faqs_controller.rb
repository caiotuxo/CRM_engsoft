class FaqsController < ApplicationController
  before_filter :find_subject
  before_filter :all_subjects
  
  def faqs_viewer
    @faqs = Faq.all
  end

  def index
    @faqs = Faq.all
    if @subject
      @faqs = @faqs.where(:assunto_id => @subject.id)
    end
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new 
    @faq = Faq.new
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'FAQ criada com sucesso.' }
      else
        @subjects = Assunto.all
        format.html { render action: "new" }
      end
    end
  end

  def update
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        format.html { redirect_to @faq, notice: 'FAQ atualizada com sucesso.' }
      else
        @subjects = Assunto.all
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to faqs_url }
    end
  end

  def delete
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to faqs_url }
    end
  end

  private

  def find_subject
    if params[:subject_id]
      @subject = Assunto.find_by_id(params[:assunto_id])
    end
  end

  def all_subjects
    @subjects = Assunto.all
  end
end
