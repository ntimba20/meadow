class PagesController < ApplicationController
   def home 
   	@meetings = Meeting.all

   end 
end