require 'test_helper'

class ListOfUsersTest < Capybara::Rails::TestCase
  test 'user#index page contains heading' do
    visit users_path
    assert_content page, 'Users'
    refute_button page, 'load info'
  end

  test 'user#index page contains button load info' do
    Capybara.current_driver = Capybara.javascript_driver
    visit users_path
    save_screenshot('list_of_users_screenshot.png', full: true)
    assert_content page, 'Users'
    assert_button page, 'load info'
    # puts "\nconsole.log said:"
    # puts page.driver.console_messages
  end

  test 'user#new shouldn\'t create a new user cause invalid data' do
    Capybara.current_driver = Capybara.javascript_driver
    visit new_user_path

    fill_in('user[first_name]', :with => 'John')
    fill_in('user[last_name]', :with => 'Doe')
    fill_in('user[no_stars]', :with => '3')

    save_screenshot('create_new_screenshot_invalid.png', full: true)

    click_button('Create User')


    assert_content page, 'Middle initial can\'t be blank'
  end

  test 'user#new should create a new user when giving valid data' do
    Capybara.current_driver = Capybara.javascript_driver
    visit new_user_path

    fill_in('user[first_name]', :with => 'John')
    fill_in('user[last_name]', :with => 'Doe')
    fill_in('user[middle_initial]', :with => 'Harambe')
    fill_in('user[no_stars]', :with => '2')

    save_screenshot('create_new_screenshot_valid.png', full: true)

    click_button('Create User')

    assert_content page, 'User was successfully created.'
    assert_content page, 'John'
  end

  test 'user#show should create a new user when giving valid data' do

  end
end
