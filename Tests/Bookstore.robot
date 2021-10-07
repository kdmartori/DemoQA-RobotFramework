#Developed by Fernanda Cademartori

*** Settings ***
Library               SeleniumLibrary
Library               RequestsLibrary
Library               JSONLibrary
Library               Collections
Resource              ../resources/Bookstore.resource
Test teardown         Close Browser

*** Test Cases ***
Bookstore App UI Validation
  Open DEMOQA's Bookstore App's login page
  Log in with credentials - LOGIN: frcademartori PASSWORD: Password@123
  Go to Book Store, select the first result on the list and add to collection: Git Pocket Guide
  Go to Profile and verify that Git Pocket Guide is shown on user's collection
  Delete all the books from user's collection

Bookstore App API Validation
  Get Request's code should be 200 (Ok)
  API user login validation