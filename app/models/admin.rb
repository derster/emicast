class Admin < ActiveRecord::Base
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nom, presence: true
  validates :nom_radio, presence: true
  validates :bande_fm, presence: true

  validates :description, presence: true

  has_many :emissions

  has_many :categories

  has_attached_file :logo_radio, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo_radio, content_type: /\Aimage\/.*\Z/

  has_attached_file :cover_radio, styles: { medium: "1152x368>", thumb: "384x256>" }
  validates_attachment_content_type :cover_radio, content_type: /\Aimage\/.*\Z/
end
