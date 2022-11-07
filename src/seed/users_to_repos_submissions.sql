--
-- Data for Name: users_to_repos_submissions; Type: TABLE DATA; Schema: public; Timestamp: 2022-11-07T14:48:39.133Z
-- COPY users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at, is_accepted) FROM 'users_to_repos_submissions.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at, is_accepted) VALUES
(1, 237133, 39769, '2022-08-19T19:05:34.036125+00:00', '2022-08-19T19:05:34.036125+00:00', null, false),
(5, 3792749, 3544424, '2022-11-03T17:31:14.321495+00:00', '2022-11-03T17:31:14.321495+00:00', null, false);
