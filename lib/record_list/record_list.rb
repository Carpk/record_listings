require 'grape'

module RecordList
  class API < Grape::API
    format :json

    resource :records do
      desc "Return gender ordered records."
      get :gender do
        puts params
        Record.new.by_gender
      end

      desc "Return birthdate ordered records."
      get :birthdate do
        Record.new.by_birthdate
      end

      desc "Return last name ordered records."
      get :lastname do
        Record.new.by_lastname
      end

      desc "Adds a new record to the list."
      params do
        requires :record, type: String, desc: "Your records."
      end
      post do
        Record.new.add_to_list(params[:record])
      end
    end
  end
end
