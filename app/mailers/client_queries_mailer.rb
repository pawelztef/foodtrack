class ClientQueriesMailer < ApplicationMailer

  def client_query(query)
    @query = query
    mail to: "mypizzatrack@gmail.com", subject: "Dostałeś zapytanie od: #{query.fullname}"
  end
end
