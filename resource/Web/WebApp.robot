*** Settings ***
Resource  ../Web/Login.robot
Resource  ../Web/Common.robot
Resource  ../Web/PO/Product.robot



*** Keywords ***

Order Success    

  Product.Search
  Product.Finish Order
