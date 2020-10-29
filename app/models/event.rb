#
# Table Schema
# ------------
# id            - int(11)      - default NULL
# host_name     - varchar(255) - default NULL
# host_email    - varchar(255) - default NULL
# numgsts       - int(11)      - default NULL
# guest_names   - text         - default NULL
# venue         - varchar(255) - default NULL
# location      - varchar(255) - default NULL
# theme         - varchar(255) - default NULL
# starts_at     - datetime     - default NULL
# ends_at       - datetime     - default NULL
# descript      - text         - default NULL
#
class Event < ActiveRecord::Base

  validate :validations

  def validations

    if numgsts.nil?
      numgsts = 0
    end
    if venue.length > 0 && location.length < 0
      errors.add(:location,"Where is the event?")
    end

  end

  def after_save
    # clean "Harry S. Truman" guest name to "Harry S._Truman"
    # clean "Roger      Rabbit" guest name to "Roger Rabbit"
    gnames = []
    guest_names.split(',').each do |g|
      g.squeeze!
      names=g.split(' ')
      gnames << "#{names[0]} #{names[1..-1].join('_')}"
    end
    guest_names = gnames
    save!
  end
end
