class DocsController < ApplicationController
  def index
    @docs = Doc.all
  end

  def create
    @doc = Doc.new(doc_params)
    if @doc.save
      flash.notice = 'Doc created successfully'
      redirect_to docs_path
    else
      flash.alert = 'Error creating Doc'
      redirect_to new_doc_poth
    end
  end

  private

  def doc_params
    params.require(:doc).permit(
      :title
    )
  end
end
