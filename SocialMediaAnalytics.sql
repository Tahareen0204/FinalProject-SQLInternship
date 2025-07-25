-- CREATE DATABASE social_media_analytics;
-- Use social_media_analytics;

/*CREATE TABLE users (user_id INT AUTO_INCREMENT PRIMARY KEY,username VARCHAR(50) UNIQUE NOT NULL,email VARCHAR(100),
joined_at DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE posts (post_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT,content TEXT,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
like_count INT DEFAULT 0,FOREIGN KEY (user_id) REFERENCES users(user_id));

CREATE TABLE likes (like_id INT AUTO_INCREMENT PRIMARY KEY,post_id INT,user_id INT,liked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (post_id) REFERENCES posts(post_id),FOREIGN KEY (user_id) REFERENCES users(user_id));

CREATE TABLE comments (comment_id INT AUTO_INCREMENT PRIMARY KEY,post_id INT,user_id INT,content TEXT,commented_at DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (post_id) REFERENCES posts(post_id),FOREIGN KEY (user_id) REFERENCES users(user_id));

INSERT INTO users (username, email) VALUES
('txhreen', 'tahareen@email.com'),
('mxdiha21', 'madiha@email.com'),
('akshada.30', 'akshada@email.com'),
('samm.13', 'samradnyi@email.com'),
('dhruv.03', 'dhruv@email.com'),
('bhaveshk', 'bhavesh@email.com'),
('arwa.m', 'arwa@email.com'),
('afroz.0810', 'afroz@email.com'),
('jissh', 'jisha@email.com'),
('aishh', 'aishwarya@email.com');

INSERT INTO posts (user_id, content) VALUES
(1, 'Loving this new feature!'),
(2, 'What do you think about this app?'),
(3, 'Check out my blog post!'),
(4, 'Sunsets are beautiful today.'),
(5, 'Productivity tips for students'),
(6, 'My latest travel vlog is up!'),
(7, 'Feeling grateful for everything'),
(8, 'Here’s a cool coding challenge'),
(9, 'Fitness update: Day 50!'),
(10, 'Join my new book club!');

INSERT INTO likes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(3, 1),
(3, 2),
(4, 6),
(4, 7),
(5, 8),
(6, 9),
(6, 2),
(7, 10),
(8, 1),
(9, 5);

INSERT INTO comments (post_id, user_id, content) VALUES
(1, 3, 'Totally agree!'),
(1, 4, 'Nice feature!'),
(2, 1, 'Looks awesome.'),
(2, 5, 'Love this!'),
(3, 2, 'Read it! Very helpful.'),
(4, 6, 'Stunning view!'),
(5, 7, 'Thanks for sharing.'),
(6, 8, 'Great vlog!'),
(7, 9, 'Stay blessed.'),
(8, 10, 'Challenge accepted!'),
(9, 3, 'Keep going!'),
(10, 4, 'I’m in!');

-- Engagement Score: likes + comments
CREATE VIEW post_engagement AS
SELECT
    p.post_id,
    u.username,
    p.content,
    COUNT(DISTINCT l.like_id) AS like_count,
    COUNT(DISTINCT c.comment_id) AS comment_count,
    (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS engagement_score
FROM posts p
LEFT JOIN users u ON p.user_id = u.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;

SELECT *,
       RANK() OVER (ORDER BY engagement_score DESC) AS engagement_rank
FROM post_engagement;

DELIMITER $$

CREATE TRIGGER update_like_count
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
    UPDATE posts
    SET like_count = like_count + 1
    WHERE post_id = NEW.post_id;
END$$

DELIMITER ;*/

SELECT * FROM post_engagement
ORDER BY engagement_score DESC
LIMIT 5;







