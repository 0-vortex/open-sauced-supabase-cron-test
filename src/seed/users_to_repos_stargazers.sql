--
-- Data for Name: users_to_repos_stargazers; Type: TABLE DATA; Schema: public; Timestamp: 2022-11-09T13:00:04.480Z
-- COPY users_to_repos_stargazers(id, user_id, repo_id, created_at, updated_at, deleted_at) FROM 'users_to_repos_stargazers.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_stargazers(id, user_id, repo_id, created_at, updated_at, deleted_at) VALUES
(2, 237133, 39769, '2022-08-19T19:08:39.381208', '2022-08-19T19:08:39.381208', null);
