# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"select p.title, SUM(pl.amount) from projects p JOIN pledges pl on p.id = pl.project_id GROUP by 1 ORDER by 1;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"select u.name, u.age, SUM(pl.amount) from users u JOIN pledges pl on u.id = pl.user_id GROUP by 1 ORDER by 1;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"""
select p.title, (tf.total - p.funding_goal) as amount_over_goal
from projects p
join
(select project_id, sum(amount) as total from pledges GROUP by 1) tf
on p.id = tf.project_id
where tf.total >= p.funding_goal;
"""
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
  """
  select u.name, tf.total amount_of_all_pledges
  from users u
  join
  (select user_id, sum(amount) as total from pledges GROUP by 1) tf
  on u.id = tf.user_id
  ORDER by 2, 1;
  """
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  """
  select p.category, pl.amount
  from projects p
  join
  pledges pl
  on p.id = pl.project_id where p.category = 'music';
  """
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  """
  select p.category, sum(pl.amount)
  from projects p
  join
  pledges pl
  on p.id = pl.project_id where p.category = 'books' GROUP by 1;
  """
end
