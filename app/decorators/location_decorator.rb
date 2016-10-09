class LocationDecorator < Draper::Decorator
  delegate_all

  def check_for_current_position(current_user_location)
    h.content_tag :div, class: 'current_position' do
      h.image_tag 'locations/point.png' if current_user_location == self.slug
    end
  end

  def background_image
    h.image_tag "locations/wayward_pines/cells-bg/#{self.name}.jpg", class: 'center'
  end
end