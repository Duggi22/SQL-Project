#Q1 Write a query to find all posts made by users in specific locations such as 'Agra', 'Maharashtra', and 'West Bengal'.
select post_id, location, user_id from post where location in ('Agra' , 'Maharashtra' ,'West Bengal'); 

#Q2 Write a query to list the top 5 most_followed hastags on the platform
select h.hashtag_name, count(hf.user_id) as followers_count from HASHTAGS h
join HASHTAG_FOLLOW hf on h.hashtag_id = hf.hashtag_id group by h.hashtag_name order by followers_count desc limit 5; 

#Q3 Identify the top 10 most-used hashtags in posts
select h.hashtag_name, count(pt.post_id) as usage_count from hashtags h
join post_tags pt on h.hashtag_id = pt.hashtag_id
group by h.hashtag_name order by usage_count desc limit 10; 

#Q4 Write a query to find users who have never made any posts on the platform
select u.user_id, u.username from users u where u.user_id not in (select p.user_id from post p); 

#Q5 Write a query to find the posts that have received the highest number of likes. 
select p.post_id, count(pl.user_id) as like_count from post p
join post_likes pl on p.post_id = pl.post_id
group by p.post_id order by like_count desc limit 1; 

#Q6 Write a query to determine the average number of posts made by users.
select count(p.post_id) / count(distinct u.user_id) as average_posts_per_user from post p
join users u on p.user_id = u.user_id;  

#Q7 Write a query to track the total number of logins made by each user. 
select u.user_id, u.username, count(l.login_time) as total_logins from users u
join login l on u.user_id = l.user_id group by u.user_id, u.username; 

#Q8 Query to find any user who has liked every post on the platform 
select user_id from post_likes group by user_id having count(post_id) = (select count(*) from post);

#Q9 Query to find users who have never commented on any post 
select user_id, username from users where user_id not in (select distinct user_id from comments)

#Q10   Write a query to find any user who has commented on every post on the platform 
select user_id from comments group by user_id
having count(distinct post_id) = (select count(*) from post)

#Q11  Write a query to find users who are not followed by any other users
select user_id from users where user_id not in (select followee_id from follows);

#Q12 Write a query to find users who are not following anyone
select user_id from users where user_id not in (select follower_id from follows);

#Q13 Write a query to find users who have made more than five posts 
select u.user_id, u.username, count(*) as post_count from users u
join post p on u.user_id = p.user_id
group by u.user_id, u.username having count(*) > 5;

#Q14 Write a query to find users who have more than 40 followers
select u.user_id, u.username, count(*) as follower_count
from users u join follows f on u.user_id = f.followee_id
group by u.user_id, u.username having count(*) > 40;

#Q15  Write a query to find comments containing specific words like "good" or  "beautiful."
select * from comments where comment_text regexp '(good|beautiful)';

#Q16 write a query to find the posts with the longest captions. 
select post_id, caption, length(caption) as caption_length from post
order by length(caption) desc limit 10;

