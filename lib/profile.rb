class Profile < CouchRest::Model::Base

  use_database CouchRest.database!((SiteConfig.url_base_db || '') + SiteConfig.db_name)

  property :name
  timestamps!

  #validates_presence_of :name

  view_by :name
  # view_by :created_at, :descending => true
end
