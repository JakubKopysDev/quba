module ApplicationHelper

	# Returns tje full title.
	def full_title(page_title = '')
		base_title = "Quba"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

end
