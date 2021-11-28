require 'rails_helper'

describe 'Seats reservation page', type: :system do
  describe 'Seats selection' do
    it 'should allow selection and seat reservation' do
      sign_in
      visit cinema_path(1)
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      find('#B5').click
      sleep(0.2)
      find('#B6').click
      sleep(0.2)
      find('#B7').click
      sleep(0.2)
      find('button#reserve').click
      sleep(1)
      expect(page).to have_current_path cinema_path(1)

      find("a[href='#{room_path(1)}?scheduleId=2']").click
      sleep(1)
      expect(page).to have_css('.grid-item.taken', :count => 3)
      expect(page).to have_css('#B5.grid-item.taken')
      expect(page).to have_css('#B6.grid-item.taken')
      expect(page).to have_css('#B7.grid-item.taken')
    end

    it 'should unselect a current selection' do
      sign_in
      visit cinema_path(1)
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      find('#A1').click
      sleep(0.2)
      find('#A2').click
      sleep(0.2)
      find('#A2').click
      sleep(0.2)
      find('button#reserve').click
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      sleep(1)
      expect(page).to have_css('#A1.grid-item.taken')
      expect(page).not_to have_css('#A2.grid-item.taken')
    end

    it 'should not allow selection of a reserved seat' do
      sign_in
      visit cinema_path(1)
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      find('#C7').click
      sleep(0.2)
      find('button#reserve').click
      sleep(1)
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      sleep(1)
      find('#C7').click
      sleep(0.2)
      find('button#reserve').click
      expect(page).to have_current_path "#{room_path(1)}?scheduleId=2"
    end

    it 'should not allow selection of seats in multiple rows' do
      sign_in
      visit cinema_path(1)
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      find('#D3').click
      sleep(0.2)
      find('#D4').click
      sleep(0.2)
      find('#C4').click
      find('#C4').click
      sleep(0.2)
      find('button#reserve').click
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      sleep(1)

      expect(page).to have_css('#C4.grid-item.taken')
      expect(page).not_to have_css('#D3.grid-item.taken')
      expect(page).not_to have_css('#D4.grid-item.taken')
    end
  end
end