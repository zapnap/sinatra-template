class Profile < CouchRest::ExtendedDocument
  include CouchRest::Validation
  use_database CouchRest.database!((SiteConfig.url_base_db || '') + SiteConfig.db_name)

  property :name
  timestamps!

  validates_present :name

  view_by :name
  # view_by :created_at, :descending => true
end
