--
-- Data for Name: users_to_repos_votes; Type: TABLE DATA; Schema: public; Timestamp: 2022-12-19T01:04:09.999Z
-- COPY users_to_repos_votes(id, user_id, repo_id, created_at, updated_at, deleted_at) FROM 'users_to_repos_votes.csv' WITH DELIMITER ',' CSV HEADER;
--

INSERT INTO users_to_repos_votes(id, user_id, repo_id, created_at, updated_at, deleted_at) VALUES
(196, 54102389, 357728969, '2022-08-06T18:14:44.381058+00:00', '2022-08-06T18:14:44.381058+00:00', null),
(197, 54102389, 13491895, '2022-08-06T18:14:52.151632+00:00', '2022-08-06T18:14:52.151632+00:00', null),
(198, 54102389, 21737465, '2022-08-06T18:14:55.772791+00:00', '2022-08-06T18:14:55.772791+00:00', null),
(199, 54102389, 426820139, '2022-08-06T18:15:44.884366+00:00', '2022-08-06T18:15:44.884366+00:00', null),
(200, 54102389, 119811010, '2022-08-06T18:18:33.639689+00:00', '2022-08-06T18:18:33.639689+00:00', null),
(201, 54102389, 28457823, '2022-08-06T18:18:37.951491+00:00', '2022-08-06T18:18:37.951491+00:00', null),
(5004, 37635083, 119811010, '2022-11-30T08:04:52.570536+00:00', '2022-11-30T08:04:52.570536+00:00', '2022-11-30T08:10:59.492+00:00'),
(5005, 237133, 119811010, '2022-11-30T17:07:35.035163+00:00', '2022-11-30T17:07:35.035163+00:00', '2022-11-30T17:08:05.063+00:00'),
(3, 11777161, 426820139, '2022-05-17T01:53:24.247808+00:00', '2022-05-17T01:53:24.247808+00:00', null),
(5, 11777161, 135786093, '2022-05-17T01:53:24.2554+00:00', '2022-05-17T01:53:24.2554+00:00', null),
(82, 46192266, 13491895, '2022-06-11T10:18:05.774173+00:00', '2022-06-11T10:18:05.774173+00:00', null),
(83, 46192266, 21737465, '2022-06-11T10:18:07.821285+00:00', '2022-06-11T10:18:07.821285+00:00', null),
(12, 11777161, 62607227, '2022-05-17T01:53:24.278184+00:00', '2022-05-17T01:53:24.278184+00:00', null),
(13, 11777161, 20929025, '2022-05-17T01:53:24.280561+00:00', '2022-05-17T01:53:24.280561+00:00', null),
(85, 46192266, 118695306, '2022-06-11T10:18:45.487646+00:00', '2022-06-11T10:18:45.487646+00:00', null),
(17, 11777161, 25304276, '2022-05-17T01:53:24.296364+00:00', '2022-05-17T01:53:24.296364+00:00', null),
(86, 46192266, 28457823, '2022-06-16T18:21:56.084111+00:00', '2022-06-16T18:21:56.084111+00:00', null),
(87, 46192266, 177736533, '2022-06-16T18:22:10.554762+00:00', '2022-06-16T18:22:10.554762+00:00', null),
(88, 46192266, 10270250, '2022-06-16T18:22:16.272263+00:00', '2022-06-16T18:22:16.272263+00:00', null),
(89, 46192266, 6498492, '2022-06-17T22:00:59.743328+00:00', '2022-06-17T22:00:59.743328+00:00', null),
(90, 46192266, 2325298, '2022-06-17T22:01:40.559136+00:00', '2022-06-17T22:01:40.559136+00:00', null),
(100, 3792749, 41881900, '2022-07-06T01:35:12.587042+00:00', '2022-07-06T01:35:12.587042+00:00', null),
(35, 11777161, 41881900, '2022-05-17T01:53:24.351108+00:00', '2022-05-17T01:53:24.351108+00:00', null),
(120, 37635083, 14440270, '2022-07-25T22:14:33.507442+00:00', '2022-07-25T22:14:33.507442+00:00', null),
(184, 37635083, 28457823, '2022-07-31T12:23:54.971277+00:00', '2022-07-31T12:23:54.971277+00:00', null),
(4986, 5713670, 83222441, '2022-09-01T23:17:20.226076+00:00', '2022-09-01T23:17:20.226076+00:00', null),
(5006, 52013393, 119811010, '2022-12-01T13:21:59.701885+00:00', '2022-12-01T13:21:59.701885+00:00', null),
(5007, 52013393, 569700624, '2022-12-01T15:33:29.047459+00:00', '2022-12-01T15:33:29.047459+00:00', null),
(4987, 79809121, 28457823, '2022-10-15T16:29:08.623508+00:00', '2022-10-15T16:29:08.623508+00:00', null),
(4988, 79809121, 426820139, '2022-10-15T16:29:14.568497+00:00', '2022-10-15T16:29:14.568497+00:00', null),
(5008, 52013393, 571688579, '2022-12-01T15:34:02.465224+00:00', '2022-12-01T15:34:02.465224+00:00', null),
(4989, 52013393, 28457823, '2022-10-23T13:44:46.757898+00:00', '2022-10-23T13:44:46.757898+00:00', '2022-11-29T20:32:11.778+00:00'),
(5009, 52013393, 566471132, '2022-12-01T15:47:51.400955+00:00', '2022-12-01T15:47:51.400955+00:00', null),
(4990, 52013393, 177736533, '2022-10-23T13:48:57.173129+00:00', '2022-10-23T13:48:57.173129+00:00', '2022-11-29T20:31:59.587+00:00'),
(5010, 5713670, 20929025, '2022-12-02T22:30:34.524771+00:00', '2022-12-02T22:30:34.524771+00:00', null),
(5011, 5713670, 41881900, '2022-12-02T22:30:46.423548+00:00', '2022-12-02T22:30:46.423548+00:00', null),
(4991, 52013393, 426820139, '2022-10-24T19:15:16.754107+00:00', '2022-10-24T19:15:16.754107+00:00', '2022-11-29T21:19:41.355+00:00'),
(5012, 5713670, 574116196, '2022-12-12T23:28:21.925126+00:00', '2022-12-12T23:28:21.925126+00:00', null),
(5013, 5713670, 574199357, '2022-12-12T23:28:24.398276+00:00', '2022-12-12T23:28:24.398276+00:00', null),
(4992, 5713670, 554731544, '2022-10-25T22:07:43.740932+00:00', '2022-10-25T22:07:43.740932+00:00', null),
(5014, 5713670, 574190840, '2022-12-12T23:28:26.007494+00:00', '2022-12-12T23:28:26.007494+00:00', null),
(4993, 37635083, 426820139, '2022-10-28T06:39:59.227077+00:00', '2022-10-28T06:39:59.227077+00:00', null),
(5015, 5713670, 574606585, '2022-12-12T23:30:50.518905+00:00', '2022-12-12T23:30:50.518905+00:00', null),
(4994, 5713670, 426820139, '2022-11-02T11:49:04.100448+00:00', '2022-11-02T11:49:04.100448+00:00', null),
(4995, 5713670, 357728969, '2022-11-02T11:49:17.564109+00:00', '2022-11-02T11:49:17.564109+00:00', null),
(4996, 5713670, 119811010, '2022-11-02T11:49:19.068596+00:00', '2022-11-02T11:49:19.068596+00:00', null),
(4997, 5713670, 546421604, '2022-11-02T11:57:50.218467+00:00', '2022-11-02T11:57:50.218467+00:00', null),
(5016, 5713670, 501028599, '2022-12-17T04:51:56.230367+00:00', '2022-12-17T04:51:56.230367+00:00', null),
(5003, 37635083, 357728969, '2022-11-30T08:04:07.229571+00:00', '2022-11-30T08:04:07.229571+00:00', '2022-11-30T08:05:02.779+00:00');
