class ParentsController < ApplicationController
    layout 'parents'
    before_action :authenticate_parent!
end