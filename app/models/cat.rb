class Cat < ActiveRecord::Base
	mount_uploader :photo, MainUploader

end

