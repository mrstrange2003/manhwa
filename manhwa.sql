-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2025 at 10:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manhwa`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`) VALUES
(30, 8, 16, 1, '2025-07-27 07:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('COD','Credit Card') NOT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `product_id`, `quantity`, `total_price`, `payment_method`, `payment_status`, `order_date`) VALUES
(10, 4, 11, 1, 2859.98, 'COD', 'pending', '2025-04-17 05:47:43'),
(11, 4, 12, 1, 2859.98, 'COD', 'pending', '2025-04-17 05:47:43'),
(12, 4, 11, 2, 4059.97, 'COD', 'pending', '2025-04-25 04:44:42'),
(13, 4, 12, 1, 4059.97, 'COD', 'pending', '2025-04-25 04:44:42'),
(19, 4, 12, 1, 1659.99, '', '', '2025-04-28 05:07:07'),
(20, 4, 22, 1, 1689.99, '', '', '2025-04-28 05:07:07'),
(21, 4, 14, 2, 1959.98, 'COD', 'pending', '2025-05-01 23:40:48'),
(22, 8, 11, 1, 1199.99, 'COD', 'pending', '2025-07-27 04:25:46'),
(23, 8, 12, 1, 1659.99, 'COD', 'pending', '2025-07-27 04:25:46'),
(24, 8, 13, 1, 1399.99, 'COD', 'pending', '2025-07-27 04:25:46'),
(25, 8, 14, 1, 979.99, 'COD', 'pending', '2025-07-27 04:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`) VALUES
(11, 'Solo Leveling', 1199.99, '10 years ago, after “the Gate” that connected the real world with the monster world opened, some of the ordinary, everyday people received the power to hunt monsters within the Gate. They are known as “Hunters”. However, not all Hunters are powerful. My name is Sung Jin-Woo, an E-rank Hunter. I’m someone who has to risk his life in the lowliest of dungeons, the “World’s Weakest”. Having no skills whatsoever to display, I barely earned the required money by fighting in low-leveled dungeons… at least until I found a hidden dungeon with the hardest difficulty within the D-rank dungeons! In the end, as I was accepting death, I suddenly received a strange power, a quest log that only I could see, a secret to...\r\n\r\nArtists: Jang Sung-Rak (장성락), REDICE Studio\r\nAuthors: Chugong (추공), h-goon (현군), Gi So-Ryeon (기소령)\r\nGenres: Action, Adventure, Drama, Fantasy\r\nTheme: Supernatural, Magic, Monsters\r\nFormat: Award Winning, Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: kakao, Daum, D&C Media, Label RED', 'images/sololeveling.jpg'),
(12, 'Omniscient Reader\'s Viewpoint', 1659.99, 'Dokja was an average office worker whose sole interest was reading his favorite web novel \"Three Ways to Survive the Apocalypse.\" But when the novel suddenly becomes reality, he is the only person who knows how the world will end. Armed with this realization, Dokja uses his understanding to change the course of the story, and the world, as he knows it.\r\n\r\nArtists: Sleepy-C (슬리피-C)\r\nAuthors: sing N song (싱송), UMI\r\nGenres: Action, Adventure, Fantasy\r\nTheme: Supernatural, Magic, Monsters, Post-Apocalyptic, Reincarnation, Survival\r\nFormat: Award Winning, Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: Naver, 3B2S, L7, Label RED, Atempo Media', 'images/orv.jpg'),
(13, 'Trash of The Count\'s Family', 1399.99, 'Kim Roksu has one life motto: “Let’s not get beat up.”\r\n\r\nBut after dozing off somewhere midway through the novel \"Birth of a Hero,\" he wakes up as Cale Henituse - one of the minor villains in the novel who gets the beating of a lifetime from soon-to-be hero Choi Han.\r\nOnly time will tell how much longer he has before that dreadful encounter. Can Kim Roksu change the course of this story so he can enjoy a long and lavish life free of the soon-to-be hero?\r\n\r\nMore Info\r\nArtists: PAN4\r\nAuthors: Yu Ryeo Han (유려한), PING (별나라)\r\nGenres: Action, Adventure, Comedy, Fantasy, Isekai\r\nTheme: Magic, Monsters, Reincarnation, Survival\r\nFormat: Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: COPIN, kakao, Daum', 'images/trashofthecountsfamily.jpg'),
(14, 'Villains Are Destined to Die', 979.99, 'Penelope Eckart reincarnated as the adopted daughter of Duke Eckart and the villainess of a reverse harem dating sim. The problem is, she entered the game at its hardest difficulty, and no matter what she does, death awaits her at every ending! Before the \"real daughter\" of Duke Eckart appears, she must choose one of the male leads and reach a happy ending in order to survive. But the two brothers always pick a fight with her over every little thing, as well as a crazy crown prince, whose routes all lead to death. There\'s even a magician who\'s enamoured with the female lead, and a loyal slave knight! But somehow, the favourability meters of the male leads increase the more she crosses the line.\r\n\r\nMore Info\r\nvillains are destined to die\r\nArtists: SUOL\r\nAuthors: Gwon Gyeoeul\r\nGenres: Drama, Fantasy, Romance, Isekai\r\nTheme: Video Games, Magic, Reincarnation, Reverse Harem, Villainess\r\nFormat: Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: kakao, Daum, D&C Media', 'images/villainsaredestinedtodie.jpg'),
(15, 'Solo Max-Level Newbie', 1199.59, 'Kang Jinhyeok, a gaming streamer and content creator, is the only person who has cleared the game, Tower of Trials. However, as the game\'s popularity declines, it becomes increasingly difficult for him to continue making a living as a content creator.\r\n\r\nJinhyeok prepares to end his 11-year-long relationship with the game and say goodbye to his humble group of subscribers. But on that very day, the Tower of Trials appears in reality with a message saying that humanity will perish unless all players clear each floor within 90 days.\r\n\r\nJinhyeok, who knows the game better than anyone, decides to use his knowledge to his advantage and…\r\n\r\nArtists: REDICE Studio, Swing Bat (스윙뱃)\r\nAuthors: Maslow (메슬로우), WAN.Z\r\nGenres: Action, Adventure, Fantasy, Superhero\r\nTheme: Supernatural, Video Games, Magic, Monsters, Survival, Virtual Reality\r\nFormat: Long Strip, Adaptation, Full Color\r\nPublishers: Naver, Label RED', 'images/solomaxlevelnewbie.jpg'),
(16, 'The Greatest Estate Developer', 1029.99, 'When civil engineering student Suho Kim falls asleep reading a fantasy novel, he wakes up as a character in the book.\r\n\r\nSuho is now in the body of Lloyd Frontera, a lazy noble who loves to drink, and whose family is in a mountain of debt. Using his engineering knowledge, Suho designs inventions to avert the terrible future that lies in wait for him.\r\n\r\nWith the help of a giant hamster, a knight, and the world’s magic, can Suho dig his new family out of debt and build a better future?\r\n\r\nArtists: Kim Hyun-Soo\r\nAuthors: Moon Baek Kyung, Lee Hyunmin\r\nGenres: Action, Adventure, Comedy, Fantasy, Isekai\r\nTheme: Magic, Monsters, Reincarnation\r\nFormat: Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: Naver, JQ Comics, Moon Phase', 'images/greatestrealestatedev.jpg'),
(17, 'Return of the 8th Class Magician', 1379.99, 'As a powerful 8th class mage, Ian Paige took countless innocent lives under the orders of Emperor Ragnar, a close friend and ruler of the Greenriver Empire. Yet despite their closeness, Ragnar views Ian as a threat and subsequently poisons him.\r\n\r\nUsing time magic, Ian saves himself and returns 30 years to the past. Now a young boy, Ian joins an elite order of mages to hone his abilities once again.\r\n\r\nThis time, he’ll get revenge on the emperor who betrayed him and reclaim glory as an 8th class mage!\r\n\r\nMore Info\r\nArtists: Tess (테스)\r\nAuthors: Ryu Song (류송)\r\nGenres: Action, Adventure, Fantasy\r\nTheme: Magic, Time Travel\r\nFormat: Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: kakao, Daum, kwbooks', 'images/returnof8thmage.jpg'),
(18, 'Wait Where The Shooting Star Fails', 869.29, 'The tale of a witch and a cat pursuing the whereabouts of a missing shooting star.\r\n\r\nArtists: Manmulsang\r\nAuthors: Manmulsang\r\nGenres: Adventure, Fantasy, Mystery, Romance\r\nTheme: Supernatural\r\nFormat: Long Strip, Web Comic, Full Color\r\nPublishers: kakao, Daum, Funnism', 'images/shootingstar.jpg'),
(19, 'Egret The Great Sage', 1349.99, 'A master elementalist, Egret lived his entire life in the company of elemental spirits, having felt shunned by human society for his immense power. After his death, he is reborn as the young prince Judas, a social outcast bullied for his quietness and small frame. With his trusty spirits by his side, Egret enters the elite academy Ruvar-H, where he must make friends and turn Judas’ reputation around. But with danger from his past life following him, can this great sage make it in the real world?\r\n\r\nArtists: MAJI (진심)\r\nAuthors: GongDeunTop (공든탑)\r\nGenres: Action, Adventure, Drama, Fantasy\r\nTheme: School Life, Supernatural, Magic, Reincarnation\r\nFormat: Long Strip, Adaptation, Web Comic, Full Color\r\nPublishers: kakao, Daum, kwbooks', 'images/egret.jpg'),
(20, 'A Wicked Tale of Cinderella\'s Stepmom', 999.99, 'There is a famous fairytale. A kindhearted girl whose father and stepmother got married and became a family of five with her two stepsisters. The poor girl who was condemned by her stepmother and stepsisters when her father died. The very fairytale, Cinderella. But I am not Cinderella, I am the stepmother. At the age of thirty-seven, already married twice, been widowed twice and is raising three daughters!\r\n\r\nDaniel Walford, a man who keeps approaching me while I’m busy trying to raise my three daughters.\r\n“Can I kiss you?”\r\nAs a son-in-law, I think he’s a little bit older but why...\r\n\r\nArtists: Sunset\r\nAuthors: Kiarne\r\nGenres: Drama, Fantasy, Romance, Isekai\r\nTheme: Magic, Reincarnation, Villainess\r\nFormat: Long Strip, Adaptation, Full Color\r\nPublishers: Dream Toon, kakao, Daum\r\n', 'images/cinderellasstepmom.jpg'),
(21, 'Until the Tragic Male Lead Walks Again', 1149.69, 'I got reincarnated in a tragedy novel. Just before my favourite character turns into the villain! If this goes on like this, my favourite character will turn into the villain and die. I can’t just let my favourite character die like that, I’ll try my best to save him. But how? By getting married!  \r\n\r\nCountless marriage proposal rejections are nothing for Lamille Claude, a newly reincarnated character in the dark fantasy novel \"The Broken Sword\". Her mission is to prevent the male lead, Roel Arnen, from succumbing to all his misery and becoming the story’s villain. To do so, she’ll need to bring him under her protection as her husband until he regains the ability to use his legs and reclaims his former glory. But it isn’t easy considering Roel’s reluctance to accept Lamille’s confessions of love. Will Lamille be able to win Roel’s heart in time to save him from his tragic fate?  \r\n\r\nArtists: MARU COMICS, IIIEI 남라북, 지구분사랑  \r\nAuthors: IIIEI 남라북, 지구분사랑  \r\nGenres: Comedy, Fantasy, Romance, Isekai  \r\nTheme: Magic, Reincarnation  \r\nFormat: Long Strip, Adaptation, Full Color  \r\nPublishers: Navet, Maru Comics', 'images/tragicmalelead.jpg'),
(22, 'Concubine Walkthrough', 1689.99, 'At first, Yona gave some major side-eye to the popular game \"Concubine Walkthrough\" until she got sucked into it—literally! Now stuck as the villain, she has her hands full facing the infamously cruel emperor, shaking off scheming concubines, and befriending NPCs. There\'s only one way the Game Master will let her out and that\'s to become the Empress! Will she be able to stay true to her honest and straightforward self despite the palace\'s intrigues? One extra problem: she\'s got competition...  \r\n\r\nArtists: Bong Bong  \r\nAuthors: Bong Bong  \r\nGenres: Comedy, Fantasy, Romance  \r\nTheme: Reincarnation, Reverse Harem, Traditional Games, Virtual Reality  \r\nFormat: Long Strip, Web Comic, Full Color  \r\nPublishers: kakao, Daum ', 'images/concubinewalkthrough.jpg'),
(23, 'The Beginning After The End', 1239.89, 'King Grey has unrivaled strength, wealth, and prestige in a world governed by martial ability. However, solitude lingers closely behind those with great power. Beneath the glamorous exterior of a powerful king lurks the shell of a man, devoid of purpose and will.  \r\n\r\nReincarnated into a new world filled with magic and monsters, the king has a second chance to relive his life. Correcting the mistakes of his past will not be his only challenge, however. Underneath the peace and prosperity of the new world is an undercurrent threatening to destroy everything he has worked for, questioning his role and reason for being born again.  \r\n \r\nArtists: Fuyuki23, Eginhardt, Wudijurenwang, 333335, YOYO  \r\nAuthors: TurtleMe  \r\nGenres: Action, Adventure, Fantasy, Tragedy, Isekai, Gore  \r\nTheme: School Life, Demons, Magic, Monsters, Reincarnation  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: Tapas, Kisai Entertainment ', 'images/beginningafterend.jpg'),
(24, 'Second Life of a Trash Princess', 1179.99, 'After losing her father, bratty brother, and the Elias Empire to her traitorous fiancé\'s schemes, Princess Regina makes a wish upon a magic ancestral stone and returns to when she was fifteen. With one last chance to right everything, she comes up with a plan: train her spoiled sibling to be the next ruler by becoming an even bigger brat, and get Aaron Vestein, the most beautiful man in the empire, to replace her fiancé! But will just wits, resolve, and a new suitor be enough? The main culprit, Regina declares that she will become a bigger brat than her younger brother and a lower-rested fool.\r\n\r\nArtists: Jonadan  \r\nAuthors: Wheedrian, Haein  \r\nGenres: Drama, Fantasy, Romance  \r\nTheme: Magic  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: COPIN, kakao, Daum', 'images/trashprincess.jpg'),
(25, 'Revenge Of The Baskerville Bloodhound', 999.99, 'Raised to kill like a pack of loyal hounds, the Baskerville children took countless lives as a band of fearsome assassins.\r\n\r\nDespite being the shunned illegitimate son of the brood, Vikir served his family faithfully, only to meet his untimely demise at his father\'s hands. But when he is inexplicably reborn with a second chance at life, Vikir, armed with the memories and knowledge of his past, swears to rise above the pack and take his revenge.\r\n\r\nThis time, he\'s ready to bite the hand that feeds.\r\n \r\nArtists: REDICE Studio, 이산척  \r\nAuthors: Seol Arang, 십이랑  \r\nGenres: Action, Adventure, Fantasy, Mystery  \r\nTheme: Harem, Magic, Time Travel  \r\nFormat: Long Strip, Adaptation, Full Color  \r\nPublishers: kakao, Daum, Label RED', 'images/baskervillebloodhound.jpg'),
(26, 'Pick Me Up, Infinite Gacha', 1029.99, '1-Star heroes are just fodder for learning a boss\' attack patterns.\r\n\r\nThat was Seojin Han\'s philosophy when playing the notoriously difficult game Pick Me Up. But after being transported into the game as one of those 1-star heroes, he\'s got no choice but to rise in rank and defeat the player controlling him and his party.\r\n\r\nCan a gacha game character hope to defeat a player akin to being his god?\r\n  \r\nArtists: REDICE Studio, Wasakbasak (REDICE STUDIO)  \r\nAuthors: Hermod (利旦見三), U-Ne Cho (五斗山)  \r\nGenres: Action, Adventure, Fantasy, Isekai  \r\nTheme: Magic, Reincarnation  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: kakao, Daum, Atempo Media', 'images/pickmeup.jpg'),
(27, 'Kill The Villainess', 869.79, 'Eris Miserian just wants to die.\r\n\r\nBeing overworked and underappreciated in the real world wasn\'t great, but living as the villainess in a romance novel is even worse. If Eris can die in the novel, she might be able to return to reality, but the story won\'t let her. Desperate to escape a life as the protagonist\'s tormentor, she sets off on a journey with the help of a witch, a knight, and a high priest. Can she find her way back to her friends and family, or is Eris doomed to a fictional future?\r\n\r\nArtists: Haegi  \r\nAuthors: Woi-Saeng Sa  \r\nGenres: Drama, Fantasy, Psychological, Romance, Tragedy, Isekai  \r\nTheme: Magic, Reincarnation, Survival, Villainess  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: kakao, D&C Media', 'images/killthevillainess.jpg'),
(28, 'SSS-Class Revival Hunter', 1299.99, 'In the mysterious, RPG dungeon-like Tower, Gongja Kim lives a mundane existence, envying all the star hunters. One day, his wish for more is granted with a legendary skill to copy others\' abilities... at the cost of his life. Before he can make sense of it, he\'s killed by the #1 hunter, the Flame Emperor! But this activates his skill and now he\'s copied a new one, the ability to travel back in time upon death.\r\n\r\nHow will Gongja use these skills to outplay the competition and rise to the top?\r\n  \r\nArtists: Bill K  \r\nAuthors: Shin Noah (신노아), Neida (네이다)  \r\nGenres: Action, Adventure, Comedy, Drama, Fantasy, Psychological, Romance, Tragedy, Isekai  \r\nTheme: Martial Arts, Supernatural, Magic, Monsters, Time Travel  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: kakao, Daum, FANSIA', 'images/sssclasshunter.jpg'),
(29, 'I Shall Master This Family', 1069.79, 'I\'ve reincarnated as Firentia Lombardy, the illegitimate daughter of the wealthiest and most influential family in the Empire. I thought I was all set to have a comfortable and luxurious life... but it wasn\'t long before my beloved father died, my relatives kicked me out, and our family went bankrupt!  \r\nBut as if that wasn\'t already shocking enough, the 2nd prince, our family\'s once sworn enemy, was now following me around like a dog!\r\n\r\nNow that I\'ve been given a second chance at life, I\'ll take things into my own hands and claim both the 2nd prince and my family for myself!\r\n\r\nArtists: Gammon  \r\nAuthors: Ant Studio, Kim Roah  \r\nGenres: Drama, Fantasy, Romance, Isekai  \r\nTheme: Reincarnation  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: kakao, Daum, Ant Studio, D&C Media', 'images/masterthisfamily.jpg'),
(30, 'Eleceed', 1349.99, 'Jiwoo is a kind-hearted young man who harnesses the lightning quick reflexes of a cat to secretly make the world a better place – one saved little child or foster pet at a time. Kayden is a secret agent on the run, who finds himself stuck in the body of a... um... decidedly fat old fluffy cat. Together, armed with Jiwoo\'s super powers and Kayden\'s uber-smarts, they\'re out to fight those forces who would let evil rule this world. That is, if they can stand each other long enough to get the job done.\r\n\r\nArtists: Zhena  \r\nAuthors: Son Jae-Ho  \r\nGenres: Action, Adventure, Comedy  \r\nTheme: Martial Arts, Supernatural, Animals  \r\nFormat: Long Strip, Full Color  \r\nPublishers: Naver, Studio JHS', 'images/eleceed.jpg'),
(31, 'I Am The Real One', 1099.99, 'A prophecy foretold that the Grand Duke would only have one water elementalist born from him. Though she lacks her father\'s affection, Keira knows she\'s destined for those powers.\r\n\r\nBut after years of doing what was right and proper of a noble, she\'s executed after the conniving Cosette appears, claiming to be the Grand Duke\'s real daughter. But then—Keira wakes up with newfound purpose: make changes, allies, and even friends before it\'s too late.\r\n\r\nWill it be enough before Cosette hatches her plot?\r\n\r\nArtists: Yuwoon  \r\nAuthors: Sam Woel, Yuwoon  \r\nGenres: Fantasy, Romance  \r\nTheme: Magic, Reincarnation, Time Travel  \r\nFormat: Long Strip, Adaptation, Full Color  \r\nPublishers: kakao, Daum, Yeondam', 'images/realone.jpg'),
(32, 'Beware the Villainess!', 1299.99, 'Sit back and take in this romantic tale of an angelic heroine and her devoted suitors as they vie for the depths of her love… or not. After an accident, a modern-day college student awakens as the story\'s villainess, Melissa Foddebrat. She\'s far from anyone\'s favorite, but she is the daughter of the duke. Determined to live it up, this new Melissa is doing things her way — antiquated society, be damned! All idiots, prepare to step aside or perish!\r\n\r\nA refreshing, unique villainess who\'s been dropped in the world of a novel, only to overthrow it all! The reason why? She couldn\'t just stand by and watch the female lead be manipulated by all four shitty male leads. The story of a pragmatic villainess who intends to throw out all the jackasses, the friendly heroine who is equally miffed at said idiots, and a wolf that only yearns for her!\r\n\r\nArtists: Blue Canna (주름간나)  \r\nAuthors: Berry (열메), Soda Ice (몰따맞스크류바)  \r\nGenres: Action, Comedy, Drama, Fantasy, Romance, Isekai  \r\nTheme: Demons, Magic, Reincarnation, Villainess  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: kakao, Epyrus, Glimtoon\r\n', 'images/bewarethevillainess.jpg'),
(33, 'The Nebula\'s Civilisation', 879.99, 'Seong-un Choi is the top-ranked player in the game \"Lost World,\" being the only player to have completed all its achievements. However, his triumph is short-lived as a mysterious message transports him to the real \"Lost World,\" transforming him from a mere gamer to a contender for godhood. Amidst others vying for divinity, will Seong-un be able to achieve true godhood and reign supreme in this new realm?  \r\n\r\nArtists: Beomgwin  \r\nAuthors: Wirae  \r\nGenres: Adventure, Fantasy  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: Naver, Blue Pic ', 'images/nebulaciviluzation.jpg'),
(34, 'Into the Light, Once Again', 1029.99, 'I was falsely accused of attempting to kill my younger sister, who was worshipped as a holy maiden. There was not a single person who believed in me, nor was there a person who stood up for me. Not even my blood-related family. I was fourteen years old, and it was winter. I, who was Edenbell\'s Fourth Princess, was miserably beheaded in front of the masses. After the end of my death, I awoke and what came was...\r\n\r\nArtists: Yuya  \r\nAuthors: Tika Tika  \r\nGenres: Drama, Fantasy, Romance  \r\nTheme: Supernatural, Magic, Reincarnation  \r\nFormat: Long Strip, Adaptation, Web Comic, Full Color  \r\nPublishers: Daiwon, kakao', 'images/intothelight.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(4, 'aditya2000', 'adi2000@gmail.com', '$2y$10$uOAU726J3kXDzdQbkIBIleR51OdDs4NSeFsk/USljRL8lE6sNOUWS', 'customer'),
(5, 'Dipu', 'dipu@gmail.com', '$2y$10$Gv9kZAtFpFNAnaRxvZalregkAq/8k4Sf0Q9y68B.Fw3w44OTKoeWe', 'customer'),
(7, 'hemant', 'hemant@gmail.com', '$2y$10$sOdTjgJwEss5BmOyuCoz1Oka2uWBbE0HUKVwEEqhWgUVYo2nEzXWu', 'customer'),
(8, 'jay', 'jay@gmail.com', '$2y$10$SqaSoDQd9awcPKFuO0WmcONYhYD2whoRO3RoCHoajj8il8HfWfFhG', 'customer'),
(13, 'admin', 'admin@gmail.com', '$2y$10$J8MzB9CMku/hnZz13XrXI.oz0CQW7arCO9XVhbR1w.KCUlN.sE24q', 'admin'),
(14, '', 'raodipayan@gmail.com', '$2y$10$xF.rjJO38lyrvNmLz0ewEO8rdht3xmD/mRftDCw2ss0ng2OcKuyLC', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `carts_ibfk_2` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `orders_ibfk_2` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
