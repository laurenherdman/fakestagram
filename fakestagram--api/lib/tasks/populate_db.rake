namespace :populate_db do
  desc "populate database from data.json"
  task populate: :environment do
    image_list = JSON.parse(File.read('data.json'), object_class: OpenStruct)

    image_list.each do |image|
      user = User.create(image.user.to_h)
      i = Image.create(picture: image.picture, user_id: user.id)
      image.tags.each do |tag|
        t = Tag.find_or_create_by(name: tag)
        ImageTag.create(tag_id: t.id, image_id: i.id)
      end
    end
  end
end
