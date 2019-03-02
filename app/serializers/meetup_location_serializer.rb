class MeetupLocationSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :longitude,
    :latitude,
    :created_at,
    :updated_at,
    :place_name,
    :place_address,
    :date_time,
    :host_id
  )
end
