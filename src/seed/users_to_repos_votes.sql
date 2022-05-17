--
-- Data for Name: users_to_repos_votes; Type: TABLE DATA; Schema: public; Timestamp: 2022-05-17T18:47:19.796Z
-- COPY users_to_repos_votes(id, user_id, repo_id, created_at) FROM 'users_to_repos_votes.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_votes(id, user_id, repo_id, created_at) VALUES
(3, 11777161, 426820139, '2022-05-17T01:53:24.247808+00:00'),
(5, 11777161, 135786093, '2022-05-17T01:53:24.2554+00:00'),
(6, 237133, 426820139, '2022-05-17T01:53:24.25606+00:00'),
(11, 237133, 257485422, '2022-05-17T01:53:24.275087+00:00'),
(12, 11777161, 62607227, '2022-05-17T01:53:24.278184+00:00'),
(13, 11777161, 20929025, '2022-05-17T01:53:24.280561+00:00'),
(16, 237133, 73648678, '2022-05-17T01:53:24.285327+00:00'),
(17, 11777161, 25304276, '2022-05-17T01:53:24.296364+00:00'),
(35, 11777161, 41881900, '2022-05-17T01:53:24.351108+00:00'),
(50, 237133, 191051391, '2022-05-17T01:53:24.426045+00:00'),
(51, 237133, 14440270, '2022-05-17T01:53:24.427061+00:00');
