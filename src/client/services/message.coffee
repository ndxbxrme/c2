'use strict'

angular.module 'concerto2'
.factory 'message', ->
  messages =
    #general
    button_save: 'Save'
    button_edit: 'Edit'
    button_cancel: 'Cancel'
    placeholder_filter: 'Filter'
    #address list
    heading_address_list: 'Address list'
    button_address_list_add: 'Add address'
    heading_address_list_name: 'Location name'
    heading_address_list_address: 'Address'
    heading_address_list_city: 'Town/City'
    heading_address_list_is_main: 'Billing Address'
    heading_address_list_empty: 'No addresses to show'
    #user list
    heading_user_list: 'User list'
    button_user_list_add: 'Add user'
    heading_user_list_username: 'Username'
    heading_user_list_first_name: 'First name'
    heading_user_list_last_name: 'Last name'
    heading_user_list_email: 'Email'
    heading_user_list_empty: 'No users to show'
    #address detail
    heading_address: 'View Address'
    heading_address_adding: 'Add Address'
    heading_address_editing: 'Edit Address'
    title_address_name: 'Location Name'
    error_address_name_required: 'Please enter the location name'
    title_address_line1: 'Address Line 1'
    error_address_line1_required: 'Please enter the address line'
    title_address_line2: 'Address Line 2'
    error_address_line2_required: 'Please enter the address line'
    title_address_line3: 'Address Line 3'
    error_address_line3_required: 'Please enter the address line'
    title_address_city: 'Town/City'
    error_address_city_required: 'Please enter a town or city'
    title_address_postcode: 'Postcode'
    error_address_postcode_required: 'Please enter a postcode'
    #user detail
    heading_user: 'View User'
    heading_user_adding: 'Add User'
    heading_user_editing: 'Edit User'
    title_user_usertype: 'User Type'
    error_user_usertype_required: 'Please select a user type'
    title_user_username: 'Username'
    error_user_username_required: 'Please enter a username'
    title_user_first_name: 'First Name'
    error_user_first_name_required: 'Please enter a first name'
    title_user_last_name: 'Last Name'
    error_user_last_name_required: 'Please enter a last name'
    title_user_email: 'Email'
    error_user_email_required: 'Please enter an email address'
    error_user_email_email: 'Please enter a valid email address'
    #system owner settings
    heading_system: 'System Owner Settings'
    heading_system_editing: 'Edit System Owner Settings'
    title_system_name: 'Company Name'
    error_system_name_required: 'Please enter a company name'
    title_system_legal_name: 'Company Legal Name'
    error_system_legal_name_required: 'Please enter a company legal name'
    title_system_system_name: 'System Name'
    error_system_system_name_required: 'Please enter a system name'
    title_system_company_no: 'Company registration number'
    error_system_company_no_required: 'Please enter a company registration number'
    "error_system_company_no_ng-pattern": 'Please enter a valid registration number'
    title_system_vat_no: 'VAT number'
    error_system_vat_no_required: 'Please enter a VAT number'
    "error_system_vat_no_ng-pattern": 'Please enter a valid VAT number'
    title_system_vatper: 'VAT (%)'
    error_system_vatper_required: 'Please enter a VAT percentage'
    "error_system_vatper_msp-vat": 'Please enter a valid VAT percentage'
    title_system_payee_name: 'Payee Name'
    error_system_payee_name_required: 'Please enter a payee name'
    title_system_sort_code: 'Sort Code'
    error_system_sort_code_required: 'Please enter a sort code'
    title_system_account_number: 'Account Number'
    error_system_account_number_required: 'Please enter an account number'
    message_system_bank_title: 'Bank Details'
    message_system_bank_subtitle: 'Please note: Details provided here will be displayed on any invoices raised.'
  m = (key) ->
    if messages[key]
      return messages[key]
    if key.indexOf('placeholder') is 0
      key = key.replace 'placeholder', 'title'
      if messages[key]
        return messages[key]
    #console.log key
  m: m
.run ($rootScope, message) ->
  root = Object.getPrototypeOf $rootScope
  root.m = message.m