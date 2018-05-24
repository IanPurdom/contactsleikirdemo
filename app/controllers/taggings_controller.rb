class TaggingsController < ApplicationController

  def create

    @tag = tagging_params[:tag].downcase.capitalize

    if Tag.where(name: @tag) == []
      new_tag = Tag.create!(name: @tag)
      Tagging.create!(tag_id: new_tag.id, contact_id: params[:contact_id])
    else
      Tagging.create!(tag_id: Tag.find_by(name: @tag).id, contact_id: params[:contact_id])
    end

    redirect_to contacts_path(page: tagging_params[:page], limit: tagging_params[:limit])

  end

  def delete
  end

  private

  def tagging_params
    params.require(:tagging).permit(:tag, :page, :limit)
  end

end
