--
-- Data for Name: users_to_repos_submissions; Type: TABLE DATA; Schema: public; Timestamp: 2022-08-25T06:53:55.126Z
-- COPY users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at) FROM 'users_to_repos_submissions.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at) VALUES
(1, 237133, 39769, '2022-08-19T19:05:34.036125+00:00', '2022-08-19T19:05:34.036125+00:00', null);
