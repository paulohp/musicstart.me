class Project < ActiveRecord::Base
  attr_accessible :category, :decription, :headline, :name, :price, :soundcloud_url, :user_id, :approved
end
