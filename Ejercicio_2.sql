USE stackoverflow;

SHOW tables;

/*PRIMER SELECT*/
SELECT * FROM post_history_type;
SELECT * FROM posthistory;
SELECT * FROM posts;
SELECT * FROM postlinks;
SELECT count(LastEditorDisplayName), count(FavoriteCount) FROM posts;
SELECT p.Id AS posts_ID, p.PostTypeId, p.ParentId, p.AcceptedAnswerId, p.CreationDate,
p.Score, p.ViewCount, p.Body, p.OwnerUserId, p.LastEditorUserId, p.LastEditorDisplayName, p.LastEditDate,
p.LastActivityDate, p.CommunityOwnedDate, p.ClosedDate, p.Title, p.Tags, p.AnswerCount,
p.CommentCount, p.FavoriteCount, po.Id AS ID_posthistory, po.RevisionGUID, pot.Id AS ID_post_history_type, pot.Name,
pot.Description
FROM posts AS p
LEFT JOIN posthistory AS po
ON p.id = po.PostId
LEFT JOIN post_history_type AS pot
ON po.PostHistoryTypeId = pot.Id;
SHOW WARNINGS;

/*SEGUNDO SELECT*/
SELECT * FROM comments;
SELECT * FROM posts;

SELECT PostId, count(PostId) AS cuenta FROM comments
GROUP BY PostId;

SELECT p.Id AS ID_post, p.PostTypeId, p.ParentId, p.AcceptedAnswerId, p.CreationDate, p.Score,
p.ViewCount, p.Body, p.OwnerUserId, p.LastEditorUserId, p.LastEditorDisplayName, p.LastEditDate,
p.LastActivityDate, p.CommunityOwnedDate, p.ClosedDate, p.Title, p.Tags, p.AnswerCount, p.CommentCount,
p.FavoriteCount, c.Id AS Id_comentario, c.Score, c.`Text`, c.CreationDate, c.UserId
FROM posts AS p
LEFT JOIN comments AS c ON p.Id = c.PostId;


/*TERCER SELECT*/
SELECT * FROM votes;
SELECT * FROM vote_type;
SELECT * FROM posts;
SELECT * FROM users;

SELECT v.Id, v.CreationDate, v.BountyAmount, vt.Id AS ID_VoteType, vt.`Name` AS VoteType_Name, 
p.Id,p.ParentId, p.AcceptedAnswerId, p.CreationDate, p.Score, p.ViewCount, p.Body, p.OwnerUserId,
p.LastEditorUserId, p.LastEditorDisplayName, p.LastEditDate, p.LastActivityDate, p.CommunityOwnedDate,
p.ClosedDate, p.Title, p.Tags, p.AnswerCount, p.CommentCount, p.FavoriteCount, u.Id AS Id_Users,
u.Reputation, u.CreationDate, u.DisplayName, u.LastAccessDate, u.WebsiteUrl, u.Location, u.Age,
u.AboutMe, u.Views, u.UpVotes, u.DownVotes
FROM votes AS v
LEFT JOIN vote_type AS vt ON v.VoteTypeId = vt.Id
LEFT JOIN  posts AS p ON v.PostId = p.Id
LEFT JOIN users AS u ON v.UserId = u.Id
LIMIT 10;


/*CUARTO SELECT*/

SELECT * FROM badges;
SELECT * FROM users;
SELECT u.Id AS Id_Users, u.Reputation, u.CreationDate, u.DisplayName, 
u.LastAccessDate, u.WebsiteUrl, u.Location, u.Age,
u.AboutMe, u.Views, u.UpVotes, u.DownVotes, ba.`Name` AS Name_badge, ba.Date AS Date_badge
FROM badges AS ba
LEFT JOIN users AS u ON ba.UserId = u.Id
LIMIT 10;


/*QUINTO SELECT*/
SELECT * FROM posts;
SELECT * FROM posthistory;
SELECT * FROM post_history_type;
SELECT * FROM postlinks WHERE PostId = 228;
SELECT * FROM comments;
SELECT * FROM votes;

SELECT p.Id AS postID,p.ParentId, p.AcceptedAnswerId, p.CreationDate, p.Score, p.ViewCount, p.Body, p.OwnerUserId,
p.LastEditorUserId, p.LastEditorDisplayName, p.LastEditDate, p.LastActivityDate, p.CommunityOwnedDate,
p.ClosedDate, p.Title, p.Tags, p.AnswerCount, p.CommentCount, p.FavoriteCount, ph.Id AS ID_posthistory, ph.RevisionGUID 
AS posthistory_RevisionGUID, pht.`Name` AS Name_post_history_type, pht.Description AS Description_post_history_type,
pl.Id AS Id_postlinks, pl.CreationDate, pl.RelatedPostId, pl.LinkTypeId,c.Id AS Id_comentario, c.Score, c.`Text`, 
c.CreationDate, c.UserId, v.Id, v.CreationDate, v.BountyAmount, pl.RelatedPostId, pos.title as relatedPost
FROM posts AS p
LEFT JOIN posthistory AS ph ON p.Id = ph.PostId
LEFT JOIN post_history_type AS pht ON ph.PostHistoryTypeId = pht.Id
LEFT JOIN postlinks AS pl ON p.Id = pl.PostId
LEFT JOIN comments AS c ON p.Id = c.PostId
LEFT JOIN votes AS v ON p.Id = v.PostId
LEFT JOIN posts AS pos ON pos.Id = pl.RelatedPostId
WHERE p.ID = 228;

use movies;
show tables;

SELECT * FROM postlinks WHERE PostId = 228;
select id,title from posts where id in(228,225);
















