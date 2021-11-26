*** Settings ***

Library     Browser

*** Variables ***

#Titles
${product_labsonesie_title}        xpath=//*[@id='item_2_title_link']/div
${product_tshirt_title}            xpath=//*[@id='item_3_title_link']/div
${logo_finish}                     css=img[src="/static/media/pony-express.46394a5d.png"]      

##Aux
${product_labsonesie_aux}          Sauce Labs Onesie
${product_t-shirt_aux}             Test.allTheThings() T-Shirt (Red)
${first_name_aux}                  Teste
${last_name_aux}                   Automatizado
${postal_code_aux}                 59275000
${sort_aux}                        lohi
${number_products_aux}             2
    
#Inputs
${first_name_input}                data-test=firstName
${last_name_input}                 data-test=lastName
${postal_code_input}               data-test=postalCode

#Selects
${sort_select}                     data-test=product_sort_container
${sort_price_select}               data-test=product_sort_container
#Buttons
${product_labsonesie_button}       data-test=add-to-cart-sauce-labs-onesie
${product_tshirt_button}           data-test=add-to-cart-test.allthethings()-t-shirt-(red)
${remove_labsonesie_button}        data-test=remove-sauce-labs-onesie
${remove_tshirt_button}            data-test=remove-test.allthethings()-t-shirt-(red)
${checkout_button}                 data-test=checkout
${continue_button}                 data-test=continue
${finish_button}                   data-test=finish

##Icons
${cart_icon}                        id=shopping_cart_container
${cart_counter}                     xpath=//*[@class='shopping_cart_link']

*** Keywords ***

Search

    Wait For Elements State        ${sort_select}                 visible    10
    Click                          ${sort_select}   
    Select Options By              ${sort_price_select}           value      ${sort_aux} 
    Wait For Elements State        ${product_labsonesie_button}   visible    10
    Click                          ${product_labsonesie_button}   
    Wait For Elements State        ${product_tshirt_button}       visible    10
    Click                          ${product_tshirt_button}  
    Wait For Elements State        ${remove_labsonesie_button}    visible    10
    Wait For Elements State        ${remove_tshirt_button}        visible    10  
    Get Text                       ${cart_counter}                contains   ${number_products_aux}    

Finish Order
    
    Wait For Elements State        ${cart_icon}                   visible         10
    Click                          ${cart_icon}   
    Get Text                       ${product_labsonesie_title}    contains        ${product_labsonesie_aux}  
    Get Text                       ${product_tshirt_title}        contains        ${product_t-shirt_aux}   
    Wait For Elements State        ${checkout_button}             visible         10
    Click                          ${checkout_button}   
    Wait For Elements State        ${first_name_input}            visible    10
    Fill Text                      ${first_name_input}            ${first_name_aux}    
    Wait For Elements State        ${last_name_input}             visible    10
    Fill Text                      ${last_name_input}             ${last_name_aux}     
    Wait For Elements State        ${postal_code_input}           visible    10
    Fill Text                      ${postal_code_input}           ${postal_code_aux}  
    Wait For Elements State        ${continue_button}             visible    10
    Click                          ${continue_button}             
    Get Text                       ${product_labsonesie_title}    contains        ${product_labsonesie_aux}  
    Get Text                       ${product_tshirt_title}        contains        ${product_t-shirt_aux}   
    Wait For Elements State        ${finish_button}               visible         10
    Click                          ${finish_button}      
    Wait For Elements State        ${logo_finish}                 visible         10
  