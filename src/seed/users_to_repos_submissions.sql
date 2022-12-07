--
-- Data for Name: users_to_repos_submissions; Type: TABLE DATA; Schema: public; Timestamp: 2022-12-07T20:44:28.561Z
-- COPY users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at, is_accepted) FROM 'users_to_repos_submissions.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at, is_accepted) VALUES
(5, 3792749, 3544424, '2022-11-03T17:31:14.321495+00:00', '2022-11-03T17:31:14.321495+00:00', null, false),
(8, 37635083, 426820139, '2022-11-30T07:52:50.550218+00:00', '2022-11-30T07:52:50.550218+00:00', null, false),
(9, 5713670, 208394975, '2022-12-01T02:25:42.961214+00:00', '2022-12-01T02:25:42.961214+00:00', null, false);
