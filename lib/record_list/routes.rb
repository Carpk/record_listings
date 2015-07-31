require 'grape'

module Routes
  class API < Grape::API
    format :json

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

      desc "Adds a new record to the list."
      params do
        requires :record, type: String, desc: "Your records."
      end
      post do
        puts params
      end
    end
  end
end
