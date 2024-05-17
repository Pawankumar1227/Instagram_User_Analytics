/**Identify the five oldest users on Instagram from the provided database.**/

select  * from users
order by created_at
limit 5 ;

/**Identify users who have never posted a single photo on Instagram.**/

 select users.id,username from users
 left join photos
 on photos.user_id = users.id
 where user_id is null;
 
 /**Determine the winner of the contest and provide their details to the team.**/
 show tables;
 select * from photos;
 select * from likes;
 select photos.user_id,photos.id,count(likes.user_id) as num_likes from photos
 inner join likes
 on photos.id = likes.photo_id
 group by photos.id
 order by num_likes desc;
 
/**: Identify and suggest the top five most commonly used hashtags on the platform.**/
show tables;

select * from tags;
select * from photo_tags;
 
 select tag_name, count(tag_name) as tag_use_num from tags
 inner join photo_tags
 on tags.id = photo_tags.tag_id
 group by tag_name
order by tag_use_num desc
limit 5;

/**: Determine the day of the week when most users register on Instagram. 
Provide insights on when to schedule an ad campaign.**/

select * from users;
select dayname(created_at) as week_day,count(id) as num_id
from users
group by week_day;

/**Calculate the average number of posts per user on Instagram. 
Also, provide the total number of photos on Instagram divided by the total number of users.**/
select count(photos.id)/count(users.id) from photos
right join users
on photos.user_id = users.id;

/**Identify users (potential bots) who have liked every single photo on the site,
 as this is not typically possible for a normal user.**/
 select * from users;
 show tables;
select users.id,username,count(likes.user_id) as total_like from likes 
inner join users
on likes.user_id = users.ID
group by users.id
order by total_like desc;
