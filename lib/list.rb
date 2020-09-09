module LoggerParser

  require_relative '../config/sequel'

  # Model of Squel ORM
  class List < Sequel::Model


    def validate
      super
      errors.add(:path, "can't be empty") if path.nil? || path.empty?
      errors.add(:visitor_id, "can't be empty") if visitor_id.nil? || visitor_id.empty?
    end


    class << self
      def group_by_path_with_count
        group_and_count(:path).order { count.desc }.all
      end
  
      def group_by_unique_visits
        query = <<-SQL
          SELECT `path`, count(DISTINCT `visitor_id`) AS `count`
          FROM `lists`
          GROUP BY 1
          ORDER BY `count` DESC
        SQL
  
        fetch(query).all
      end
    end
  end
end