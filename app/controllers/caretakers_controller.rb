class CaretakersController < ApplicationController
    layout 'caretakers'
    before_action :authenticate_caretaker!
end