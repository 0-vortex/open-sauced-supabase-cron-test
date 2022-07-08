--
-- Data for Name: users_to_repos_votes; Type: TABLE DATA; Schema: public; Timestamp: 2022-07-08T06:48:19.112Z
-- COPY users_to_repos_votes(id, user_id, repo_id, created_at) FROM 'users_to_repos_votes.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_votes(id, user_id, repo_id, created_at) VALUES
(3, 11777161, 426820139, '2022-05-17T01:53:24.247808+00:00'),
(79, 237133, 177736533, '2022-05-19T22:10:55.958019+00:00'),
(5, 11777161, 135786093, '2022-05-17T01:53:24.2554+00:00'),
(6, 237133, 426820139, '2022-05-17T01:53:24.25606+00:00'),
(82, 46192266, 13491895, '2022-06-11T10:18:05.774173+00:00'),
(83, 46192266, 21737465, '2022-06-11T10:18:07.821285+00:00'),
(11, 237133, 257485422, '2022-05-17T01:53:24.275087+00:00'),
(12, 11777161, 62607227, '2022-05-17T01:53:24.278184+00:00'),
(13, 11777161, 20929025, '2022-05-17T01:53:24.280561+00:00'),
(85, 46192266, 118695306, '2022-06-11T10:18:45.487646+00:00'),
(16, 237133, 73648678, '2022-05-17T01:53:24.285327+00:00'),
(17, 11777161, 25304276, '2022-05-17T01:53:24.296364+00:00'),
(86, 46192266, 28457823, '2022-06-16T18:21:56.084111+00:00'),
(87, 46192266, 177736533, '2022-06-16T18:22:10.554762+00:00'),
(88, 46192266, 10270250, '2022-06-16T18:22:16.272263+00:00'),
(89, 46192266, 6498492, '2022-06-17T22:00:59.743328+00:00'),
(90, 46192266, 2325298, '2022-06-17T22:01:40.559136+00:00'),
(100, 3792749, 41881900, '2022-07-06T01:35:12.587042+00:00'),
(35, 11777161, 41881900, '2022-05-17T01:53:24.351108+00:00'),
(50, 237133, 191051391, '2022-05-17T01:53:24.426045+00:00'),
(51, 237133, 14440270, '2022-05-17T01:53:24.427061+00:00'),
(53, 237133, 21737465, '2022-05-18T01:42:36.410571+00:00'),
(54, 237133, 118695306, '2022-05-18T01:42:37.709512+00:00'),
(55, 237133, 169677297, '2022-05-18T01:42:39.306744+00:00'),
(56, 237133, 145050544, '2022-05-18T01:43:37.496807+00:00'),
(62, 237133, 28457823, '2022-05-19T21:57:28.642877+00:00'),
(76, 237133, 13491895, '2022-05-19T21:57:53.344964+00:00');
