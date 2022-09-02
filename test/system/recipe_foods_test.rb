require "application_system_test_case"

class RecipeFoodsTest < ApplicationSystemTestCase
  setup do
    @recipe_food = recipe_foods(:one)
  end

  test "visiting the index" do
    visit recipe_foods_url
    assert_selector "h1", text: "Recipe Foods"
  end

  test "creating a Recipe food" do
    visit recipe_foods_url
    click_on "New Recipe Food"

    click_on "Create Recipe food"

    assert_text "Recipe food was successfully created"
    click_on "Back"
  end

  test "updating a Recipe food" do
    visit recipe_foods_url
    click_on "Edit", match: :first

    click_on "Update Recipe food"

    assert_text "Recipe food was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe food" do
    visit recipe_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe food was successfully destroyed"
  end
end
