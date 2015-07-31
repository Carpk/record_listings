require 'grape'

module Routes
  class API < Grape::API
    version 'v1', using: :header, vendor: 'record list'
    format :json
    prefix :api

    resource :records do
      desc "Return gender ordered records."
      get :gender do
        RecordList.new.load_by_gender
      end

      desc "Return birthdate ordered records."
      get :birthdate do
        RecordList.new.load_by_birthdate
      end

      desc "Return last name ordered records."
      get :name do
        RecordList.new.load_by_lastname
      end
    end
  end
end
