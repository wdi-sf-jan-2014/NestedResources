<%= form_for [@post, @comment] do |f| %>
  <%= f.text_area :body %>
  <%= f.submit %>
<% end %>