# name: user-profile-link
# about: Link to twitter, github, and steam profiles on user pages
# version: 0.2
# authors: Neil Lalonde and Kristian Kramer
# url: https://github.com/tech1k/user-profile-link

register_asset "javascripts/discourse/templates/connectors/user-profile-primary/user-profile.js.handlebars"
register_asset "stylesheets/user-profile-link.scss"

after_initialize do
  add_to_serializer(:user, :twitter_screen_name) do
    object.user_associated_accounts.find_by(provider_name: "twitter")&.info["nickname"]
  end
  add_to_serializer(:user, :include_twitter_screen_name?) do
    object.user_associated_accounts.exists?(provider_name: "twitter")
  end
  add_to_serializer(:user, :github_screen_name) do
    object.user_associated_accounts.find_by(provider_name: "github")&.info["nickname"]
  end
  add_to_serializer(:user, :include_github_screen_name?) do
    object.user_associated_accounts.exists?(provider_name: "github")
  end
  add_to_serializer(:user, :steam_screen_name) do
    object.user_associated_accounts.find_by(provider_name: "steam")&.info["nickname"]
  end
  add_to_serializer(:user, :include_steam_screen_name?) do
    object.user_associated_accounts.exists?(provider_name: "steam")
  end
end
