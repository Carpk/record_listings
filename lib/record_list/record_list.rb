require 'grape'

module RecordList
  class API < Grape::API
    format :json

    resource :records do
      desc "Return gender ordered records."
      get :gender do
        PortalRecord.sort_by(:gender)
      end

      desc "Return birthdate ordered records."
      get :birthdate do
        PortalRecord.sort_by(:birthdate)
      end

      desc "Return last name ordered records."
      get :lastname do
        PortalRecord.sort_by(:lastname)
      end

      desc "Adds a new record to the list."
      params do
        requires :record, type: String, desc: "Your records."
      end
      post do
        PortalRecord.add_to_list(params[:record])
      end
    end
  end
end
