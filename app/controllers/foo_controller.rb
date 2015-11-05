class FooController < ApplicationController
	def list
		@foos = Job.all
	end
end
