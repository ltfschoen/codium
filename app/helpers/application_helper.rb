module ApplicationHelper
	def image_for_user(user, options = {})
	  if user.image.exists?
	    image_tag(user.image.url, options)
	  else
	    image_tag('placeholder.png', options)
	  end
	end

	def image_for_project(project,options={})
		if project.image.exists?
			image_tag(project.image.url, options)
		else
			image_tag('placeholder.png', options)
		end
	end
end
