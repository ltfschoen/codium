module ApplicationHelper
	def image_for_user(user)
	  if user.image.exists?
	    image_tag(user.image.url, size:'100x100')
	  else
	    image_tag('placeholder.png')
	  end
	end

	def image_for_project(project)
		if project.image.exists?
			image_tag(project.image.url,size:'100x100')
		else
			image_tag('placeholder.png')
		end
	end
end
