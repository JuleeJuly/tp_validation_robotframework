*** Variables ***
${BROWSER}    chrome
${URL}    https://automationexercise.com
${COOKIE}    //button[@class='fc-button fc-cta-consent fc-primary-button']
${HOMEPAGE_LOGO}    //img[@alt='Website for automation practice']
${PRODUCTS_BUTTON}    //header//a[@href='/products']
${H2_TITLE}    //h2[@class='title text-center']
${SEARCH}    //input[@id='search_product']
${SUBMIT_SEARCH}    //button[@id='submit_search']
${SIGNUP_LOGIN}    //a[contains(.,'Signup / Login')]
${INPUT_NAME}    //input[@name='name']
${INPUT_EMAIL}    //div[@class='signup-form']//input[@name='email']
${BUTTON_SIGNUP}    //button[.='Signup']
${CREATE_ACCOUNT_GENDER}    //input[@value='Mrs']
${CREATE_ACCOUNT_NAME}    //input[@id='name']
${CREATE_ACCOUNT_EMAIL}    //input[@id='email']
${CREATE_ACCOUNT_PASSWORD}    //input[@id='password']
${CREATE_ACCOUNT_DAY}    //select[@id='days']
${CREATE_ACCOUNT_MONTH}    //select[@id='months']
${CREATE_ACCOUNT_YEAR}    //select[@id='years']
${CREATE_ACCOUNT_FIRSTNAME}    //input[@id='first_name']
${CREATE_ACCOUNT_LASTNAME}    //input[@id='last_name']
${CREATE_ACCOUNT_ADRESS}    id=address1
${CREATE_ACCOUNT_COUNTRY}    id=country
${CREATE_ACCOUNT_STATE}    //input[@id='state']
${CREATE_ACCOUNT_CITY}    //input[@id='city']
${CREATE_ACCOUNT_ZIP}    //input[@id='zipcode']
${CREATE_ACCOUNT_PHONE}    //input[@id='mobile_number']
${CREATE_ACCOUNT_BUTTON}    //button[.='Create Account']
${TEXT_ACOUNT_CREATED}    //b[.='Account Created!']
${TITLE_ACOUNT_CREATED}    //h2[@class='title text-center']
${ACCOUNT_CREATED}    ACCOUNT CREATED
${CONTINUE_ACCOUNT}    //a[.='Continue']
${H2}    //h2
${LAST_LI_MENU}    //header//ul//li[last()]//a//b
${ADD_TO_CART}    //button[@class='btn btn-default cart']
${CONTINUE_SHOPPING}    //button[@class='btn btn-success close-modal btn-block']
${TYPE_ADRESS}    address_delivery
${TYPE_ADRESS2}    address_invoice
${BUTTON_CART}    //ul[@class='nav navbar-nav']//a[contains(.,'Cart')]
${MENU_ACTIVE}    //li[@class='active']
${BUTTON_CHECKOUT}    //a[.='Proceed To Checkout']
${ADRESS_DELIVERY}    id=address_delivery
${DELETE_ACCOUNT}    //a[contains(.,'Delete Account')]
${ACCOUNT_DELETED}    //b[.='Account Deleted!']
${COM}    //textarea[@name='message']
${PLACE_ORDER}    //a[.='Place Order']
${CARD_NAME}    //input[@name='name_on_card']
${CARD_NUMBER}    //input[@name='card_number']
${CARD_CVC}    //input[@name='cvc']
${CARD_EXPIRY_MONTH}    //input[@name='expiry_month']
${CARD_EXPIRY_YEAR}    //input[@name='expiry_year']
${CARD_SUBMIT}    //button[@id='submit']
${DOWNLOAD_INVOICE}    //a[.='Download Invoice']
${PATH_INVOICE}    C:/Users/Administrateur/Downloads/invoice.txt
${REGISTER_LOGIN}    //u[.='Register / Login']
${CONFIRM_ORDER}    //p[.='Congratulations! Your order has been confirmed!']
