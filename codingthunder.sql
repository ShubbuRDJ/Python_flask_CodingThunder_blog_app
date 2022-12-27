-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2022 at 09:49 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(20) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `message`, `date`) VALUES
(1, 'demo', 'demo@gmail.com', '1234567890', 'demo message h ye ', '2022-12-15 10:28:59'),
(2, 'Shubham Singh', 'shubham1326thakur@gmail.com', '9140696137', 'Manage your professional list of subscribers in our contact management module. View the source of all sign-ups, whether they signed up through SMS keyword, web widget, kiosk, or if they were manually added.', NULL),
(3, 'Shubham Singh', 'shubham1326thakur@gmail.com', '9140696137', 'Manage your professional list of subscribers in our contact management module. View the source of all sign-ups, whether they signed up through SMS keyword, web widget, kiosk, or if they were manually added.\r\n\r\nBulk Text (SMS) Messaging\r\nSend to 1 group or multiple groups at once! Send messages to your customers to announce deals or discounts you want to promote which can bring in massive business.\r\n\r\n', '2022-12-15 21:37:22'),
(4, 'Akash kumar', 'aka123@gmail.com', '9090909090', 'qwqe vdfs vb vdv d vdv d  b dfbfdb d kvsdccas fdbf bk  s ddffkbfbkn\r\nfdbfb bffd k  fb b  jjkb bv bdd bdf;b gbvff f\r\nbfd b bfbk v fg nv v ', '2022-12-16 01:21:25'),
(5, 'Akash kumar', 'aka123@gmail.com', '9090909090', 'qwqe vdfs vb vdv d vdv d  b dfbfdb d kvsdccas fdbf bk  s ddffkbfbkn\r\nfdbfb bffd k  fb b  jjkb bv bdd bdf;b gbvff f\r\nbfd b bfbk v fg nv v ', '2022-12-16 01:22:49'),
(6, 'kamal Singh', 'shubham1326thakur@gmail.com', '9890878880', 'bomdbm svsdv dkvcxvdvdbb   ssdsgs cxv\r\nvs  vbdfbf aafew tb n d', '2022-12-16 01:55:12'),
(9, 'my name', 'myName@gmail.com', '8888888888', 'qwertyuiop;lkjhgfdsazxcvbnmko987ytredfg ;\'\r\nmnjhb yg7u tvtbh9 ohvg ghhvyb ybb ygi  b bhj  iby yyy viyvgy g g b ', '2022-12-16 18:53:04'),
(10, 'qwew dwe', 'qwewieqwei@gmail.com', '111111111', 'scef wfv f  v ei2dcv hffvf eefef f f ff vef  v  vofje ev  cdv d  do    dv jvdf c v f ', '2022-12-16 20:59:15'),
(11, 'Akash singh', 'akash1111123@gmail.com', '9122731732', 'I am ECE student in mmmut', '2022-12-20 16:39:43'),
(12, 'saagr gupta', 'csdncwijdi@gmail.com', '123127481', 'xjhcw dwefer efjgpr ieerfgfrfrb bgb vfbfb ff', '2022-12-20 18:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'This is my first post edited', 'first post ever ok', 'first-post', 'This is my first post and I am very excited about my first post with flask framework. yeah', 'post-bg.jpg', '2022-12-26 20:44:25'),
(2, 'Lets Learn about Stock market', 'market knowledge', 'stock-post', 'A stock market, equity market, or share market is the aggregation of buyers and sellers of stocks (also called shares), which represent ownership claims on businesses; these may include securities listed on a public stock exchange, as well as stock that is only traded privately, such as shares of private companies which are sold to investors through equity crowdfunding platforms. Investment is usually made with an investment strategy in mind.', 'about-bg.jpg', '2022-12-20 19:16:01'),
(3, 'lets learn  about jinja', 'The Jinja Context Behavior', 'third-post', 'These variables are added to the context of variables, they are not global variables. The difference is that by default these will not show up in the context of imported templates. This is partially caused by performance considerations, partially to keep things explicit.\r\n\r\nWhat does this mean for you? If you have a macro you want to import, that needs to access the request object you have two possibilities:\r\n\r\nyou explicitly pass the request to the macro as parameter, or the attribute of the request object you are interested in.\r\n\r\nyou import the macro “with context”.\r\n\r\nImporting with context looks like this:\r\n\r\n{% from \'_helpers.html\' import my_macro with context %}\r\n', '', '2022-12-20 20:16:18'),
(4, 'Lets learn about jinja controlling', 'Controlling Autoescaping', 'fourth-post', 'Autoescaping is the concept of automatically escaping special characters for you. Special characters in the sense of HTML (or XML, and thus XHTML) are &, >, <, \" as well as \'. Because these characters carry specific meanings in documents on their own you have to replace them by so called “entities” if you want to use them for text. Not doing so would not only cause user frustration by the inability to use these characters in text, but can also lead to security problems. (see Cross-Site Scripting (XSS))\r\n\r\nSometimes however you will need to disable autoescaping in templates. This can be the case if you want to explicitly inject HTML into pages, for example if they come from a system that generates secure HTML like a markdown to HTML converter.\r\n\r\nThere are three ways to accomplish that:\r\n\r\nIn the Python code, wrap the HTML string in a Markup object before passing it to the template. This is in general the recommended way.\r\n\r\nInside the template, use the |safe filter to explicitly mark a string as safe HTML ({{ myvariable|safe }})\r\n\r\nTemporarily disable the autoescape system altogether.\r\n\r\nTo disable the autoescape system in templates, you can use the {% autoescape %} block:\r\n\r\n{% autoescape false %}\r\n    <p>autoescaping is disabled here\r\n    <p>{{ will_not_be_escaped }}\r\n{% endautoescape %}', '', '2022-12-20 20:16:18'),
(5, 'Lets learn about jinja filtering', 'Registering Filters', 'fifth-post', 'If you want to register your own filters in Jinja2 you have two ways to do that. You can either put them by hand into the jinja_env of the application or use the template_filter() decorator.\r\n\r\nThe two following examples work the same and both reverse an object:\r\n\r\n@app.template_filter(\'reverse\')\r\ndef reverse_filter(s):\r\n    return s[::-1]\r\n\r\ndef reverse_filter(s):\r\n    return s[::-1]\r\napp.jinja_env.filters[\'reverse\'] = reverse_filter\r\nIn case of the decorator the argument is optional if you want to use the function name as name of the filter. Once registered, you can use the filter in your templates in the same way as Jinja2’s builtin filters, for example if you have a Python list in context called mylist:\r\n\r\n{% for x in mylist | reverse %}\r\n{% endfor %}', 'fifth.jpg', '2022-12-27 01:29:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
