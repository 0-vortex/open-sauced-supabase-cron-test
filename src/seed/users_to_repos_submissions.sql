--
-- Data for Name: users_to_repos_submissions; Type: TABLE DATA; Schema: public; Timestamp: 2022-11-12T18:47:24.437Z
-- COPY users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at, is_accepted) FROM 'users_to_repos_submissions.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_submissions(id, user_id, repo_id, created_at, updated_at, deleted_at, is_accepted) VALUES
(5, 3792749, 3544424, '2022-11-03T17:31:14.321495+00:00', '2022-11-03T17:31:14.321495+00:00', null, false);
