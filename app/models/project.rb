class Project < ActiveRecord::Base

  belongs_to :type
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :standards
  has_many :project_attachments, dependent: :destroy
  has_many :slider_objects, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :project_attachments, allow_destroy: true, reject_if: :all_blank

  mount_uploader :featured_image, FeaturedImageUploader

  scope :publications, -> { where(status: STATUSES.index('Published')) }
  scope :drafts, -> { where(status: STATUSES.index('Draft')) }
  scope :pending_review, -> { where(status: STATUSES.index('Pending Review')) }


  if Rails.env.development?
    searchable do
      text :name, :content, :author_name, :history, :extensions

      text :tags do
        tags.map { |tag| tag.name }
      end
    end
  else
    def search

    end
  end

  STATUSES = ['Draft', 'Pending Review', 'Published']
end
