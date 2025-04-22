require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square_calc)
end 

get("/square/new") do
  erb(:new_square_calc)
end 

get("/square/results") do
  @the_num= params.fetch("user_number")

  @the_result= @the_num.to_f ** 2

  erb(:square_results)
end 

get("/square_root/new") do
  erb(:new_square_root_calc)
end 

get("/square_root/results") do
  @the_num = params.fetch("user_number")

  @the_result = @the_num.to_f ** 0.5

  erb(:square_root_results)
end 

get("/payment/new") do
  erb(:new_payment_calc)
end 

get("/payment/results") do
  @apr_display = params.fetch("user_apr").to_f.to_fs(:percentage, {:precision => 4})

  @years_display = params.fetch("user_years")

  @principal_display = params.fetch("user_principal").to_f.to_fs(:currency, {:precision => 2})

  @apr = (params.fetch("user_apr").to_f/100)/12

  @principal = params.fetch("user_principal").to_f

  @loan_term = params.fetch("user_years").to_f*12

  @numerator_result = @apr*@principal 

  @denominator_result = 1- ((1+@apr)**(-@loan_term))

  @the_result = (@numerator_result/@denominator_result)
  
  @the_result_display = @the_result.to_fs(:currency, {:precision => 2})

  erb(:payment_results)
end 

get("/random/new") do
  erb(:new_random_calc)
end 

get("/random/results") do 
 
  @min= params.fetch("user_number_min").to_f

  @max = params.fetch("user_number_max").to_f

  @the_result= rand(@min..@max)

  erb(:random_results)
end 
