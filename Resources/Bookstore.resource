*** variables ***
${URL}                            https://demoqa.com
${BROWSER}                        chrome
${USERNAME_FIELD}                 id=userName
${PASSWORD_FIELD}                 id=password
${USERNAME}                       frcademartori
${PASSWORD}                       Password@123
${LOGIN_BUTTON}                   id=login
${GOTOSTORE}                      id=gotoStore
${BOOK}                           xpath=//*[@id="app"]/div/div/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div/div[2]
${PROFILE}                        id=item-3
${BOOK_TITLE}                     css=#userName-value
${ADD_TO_COLLECTION}              css=#app > div > div > div.row > div.col-12.mt-4.col-md-6 > div.books-wrapper > div.profile-wrapper > div.mt-2.fullButtonWrap.row > div.text-right.fullButton
${DELETE}                         css=.di > #submit
${DELETE_CONFIRMATION_WARNING}    css=body > div.fade.modal.show > div > div > div.modal-body
${DELETE_CONFIRMATION}            id=closeSmallModal-ok

*** keywords ***
Open DEMOQA's Bookstore App's login page
  Open Browser  ${URL}/login      ${BROWSER}
  Maximize Browser Window

Log in with credentials - LOGIN: ${USERNAME} PASSWORD: ${PASSWORD}
  Input Text    ${USERNAME_FIELD}   ${USERNAME}
  Input Text    ${PASSWORD_FIELD}   ${PASSWORD}
  Carefully Click Element           ${LOGIN_BUTTON}

Go to Book Store, select the first result on the list and add to collection: ${BOOK_TITLE_TEXT}
  Sleep  2
  Click dealing with Google Ads     ${GOTOSTORE}
  Go To                             ${URL}/books?book=9781449325862
  Click dealing with Google Ads     ${ADD_TO_COLLECTION}
  Handle Alert

Go to Profile and verify that ${BOOK_TITLE_TEXT} is shown on user's collection
  Go To                             ${URL}/profile
  Wait Until Element is Visible     ${BOOK}
  Element Should Contain            ${BOOK}               Git Pocket Guide

Delete all the books from user's collection
  Click dealing with Google Ads     ${DELETE}
  Element Should Contain            ${DELETE_CONFIRMATION_WARNING}  Do you want to delete all books?
  Carefully Click Element           ${DELETE_CONFIRMATION}
  Handle alert

API user login validation
  create session  AddData           ${URL}
  &{BODY} =  Create Dictionary  userName=frcademartori  password=Password@123
  ${RESPONSE} =  POST On Session  AddData  /Account/v1/Authorized  data=${BODY}  expected_status=200

Get Request's code should be 200 (Ok)
  ${RESPONSE} =  GET  ${URL}/BookStore/v1/Books  expected_status=200
  
Carefully Click Element
  [Arguments]  ${CLICKELEMENT}
  Wait Until Element is Visible     ${CLICKELEMENT}
  Wait Until Element is Enabled     ${CLICKELEMENT}
  Click Element                     ${CLICKELEMENT}

Click dealing with Google Ads 
  [Arguments]                       ${SCROLLANDCLICK}
  Execute Javascript                window.scrollTo(0, 600)
  Wait Until Element is Visible     ${SCROLLANDCLICK}
  Wait Until Element is Enabled     ${SCROLLANDCLICK}
  Click Element                     ${SCROLLANDCLICK}

Carefully Input Text
  [Arguments]  ${INPUTTEXT}  ${TEXT}
  Wait Until Element is Visible     ${INPUTTEXT}
  Wait Until Element is Enabled     ${INPUTTEXT}
  Input Text                        ${INPUTTEXT}  ${TEXT}