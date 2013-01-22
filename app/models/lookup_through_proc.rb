class LookupThroughProc < ActiveRecord::Base
  # optional approach which I considered using.  the find_by_sql was a much simpler approach.  This might be good for using active record caching.
  def self.fetch_db_records(reference_id)
    connection.select_all("exec ")
  end
end
