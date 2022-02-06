SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `massvaccapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `date`
--

CREATE TABLE `date` (
  `DateID` int(255) NOT NULL,
  `Date` date NOT NULL,
  `Available` tinyint(1) NOT NULL,
  `LocationID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `LocationID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Latitude` double(13,10) NOT NULL,
  `Longitude` double(13,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shots`
--

CREATE TABLE `shots` (
  `ShotsID` int(255) NOT NULL,
  `VaccID` int(255) NOT NULL,
  `UserID` int(255) NOT NULL,
  `LocationID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `TimeID` int(255) NOT NULL,
  `Time` time(6) NOT NULL,
  `Available` tinyint(1) NOT NULL,
  `DateID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `OIB` varchar(255) NOT NULL,
  `Language` varchar(255) NOT NULL,
  `UserType` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vacine`
--

CREATE TABLE `vacine` (
  `VaccId` int(255) NOT NULL,
  `VaccName` varchar(255) NOT NULL,
  `VaccInfo` varchar(255) NOT NULL,
  `VaccDuration` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`DateID`),
  ADD KEY `LocationDateFK` (`LocationID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `shots`
--
ALTER TABLE `shots`
  ADD PRIMARY KEY (`ShotsID`),
  ADD KEY `LocationShotsFK` (`LocationID`),
  ADD KEY `UserShotsFK` (`UserID`),
  ADD KEY `VaccShotsFK` (`VaccID`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`TimeID`),
  ADD KEY `DateTimeFK` (`DateID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `vacine`
--
ALTER TABLE `vacine`
  ADD PRIMARY KEY (`VaccId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `date`
--
ALTER TABLE `date`
  MODIFY `DateID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `LocationID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shots`
--
ALTER TABLE `shots`
  MODIFY `ShotsID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `TimeID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacine`
--
ALTER TABLE `vacine`
  MODIFY `VaccId` int(255) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `date`
--
ALTER TABLE `date`
  ADD CONSTRAINT `LocationDateFK` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`LocationID`);

--
-- Constraints for table `shots`
--
ALTER TABLE `shots`
  ADD CONSTRAINT `LocationShotsFK` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`LocationID`),
  ADD CONSTRAINT `UserShotsFK` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserId`),
  ADD CONSTRAINT `VaccShotsFK` FOREIGN KEY (`VaccID`) REFERENCES `vacine` (`VaccId`);

--
-- Constraints for table `time`
--
ALTER TABLE `time`
  ADD CONSTRAINT `DateTimeFK` FOREIGN KEY (`DateID`) REFERENCES `date` (`DateID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
