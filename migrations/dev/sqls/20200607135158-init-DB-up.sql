-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema best_boogeyman
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `best_boogeyman` ;

-- -----------------------------------------------------
-- Schema best_boogeyman
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `best_boogeyman` ;
USE `best_boogeyman` ;

-- -----------------------------------------------------
-- Table `best_boogeyman`.`Boogeyman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_boogeyman`.`Boogeyman` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(255) NOT NULL,
  `bio` MEDIUMTEXT NULL,
  `votes` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `best_boogeyman`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_boogeyman`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `is_admin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `best_boogeyman`.`Boogeyman_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_boogeyman`.`Boogeyman_has_user` (
  `boogeyman_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `vote` INT NOT NULL,
  PRIMARY KEY (`boogeyman_id`, `user_id`),
  INDEX `fk_boogeyman_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_boogeyman_has_user_boogeyman_idx` (`boogeyman_id` ASC),
  CONSTRAINT `fk_boogeyman_has_user_boogeyman`
    FOREIGN KEY (`boogeyman_id`)
    REFERENCES `best_boogeyman`.`Boogeyman` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boogeyman_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `best_boogeyman`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `best_boogeyman`.`migrations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `run_on` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Pinhead', 'https://www.dropbox.com/s/cfj0me8dsnw8u2u/pinhead.jpg?raw=1', 'Pinhead\'s role has varied with each Hellraiser installment. In the script for the original film, Barker describes Pinhead and the other cenobites as \"demons\" in his notes; the character himself, however, upon capturing Kirsty Cotton, identifies himself as neither explicitly angelic or demonic, stating that he and his fellow entourage are \"Explorers in the further regions of experience. Demons to some. Angels to others.\" The second film expounds on the idea of the Cenobites as demons by depicting them as denizens of a realm called Hell, a maze-like dimension ruled over by an entity known as Leviathan, where they subject their quarry to emotional and psychological torture.\n\nThe third film radically altered the original concept, making Pinhead into a purely evil demon of chaos, explained by Pinhead losing the human, \'orderly\', part of himself during the previous film. In the fourth film he is presented as a megalomaniac bent on world domination, and by the fifth he acts as a judge, punishing those who open the box for their sins by making them face their personal demons. In this film, he goes by the title of \"Engineer\", a name derived from the lead cenobite in Clive Barker\'s original novella. The seventh film reverts closer to the original film, with the Cenobites responsible for pleasure and pain, but the characters seem more demonic as in later installments.');
INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Jason Voorhees', 'https://www.dropbox.com/s/jb2bwp3o6q5f1pk/jason.jpg?raw=1', 'Jason Voorhees is the main antagonist and centerpiece of the Friday the 13th franchise and the anti-hero of the crossover film Freddy vs. Jason, He was an almost completely silent, undead and seemingly unstoppable killing machine. Jason was an iconic madman who haunts Camp Crystal Lake and the surrounding area, driven to slaughter anyone he encounters by a burning need to avenge the death of his beloved mother, Pamela Voorhees. ');
INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Freddy Krueger', 'https://www.dropbox.com/s/56pfd31z4uyfr2j/krueger.jpg?raw=1', 'Amanda Krueger was a nun working in a hospital, and was raped by over 100 psychopaths. She became pregnant with a son, who was named Freddy. Later in his life, he became a murderer in Springwood notorious for killing children. The media labeled him the Springwood Slasher. He was apprehended, but later released because of a technicality. According to the original film, it was because someone didn\'t sign the search warrant in the appropriate place. The parents of the children tracked him down and found him in the boiler room where he took his victims. The parents poured gas into the room and set him on fire, which caused his melted-like facial features. ');
INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Michael Myers', 'https://www.dropbox.com/s/ie8ygvj5nncyv1y/myers.jpg?raw=1', 'Michael Audrey Myers is the main antagonist of the Halloween franchise. As a child, Michael was admitted into a psychiatric hospital for the murder of his older sister, Judith Myers. After 15 years of captivity, Myers broke out of the asylum and started his killing spree, with the intention to murder his remaining family relatives and anyone who would get in his way. ');
INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Leatherface', 'https://www.dropbox.com/s/0no78ps9jxjm730/leatherface.jpg?raw=1', 'Leatherface (real name: Jedidiah Sawyer) is a fictional character and the main antagonist in The Texas Chainsaw Massacre horror film series. He is usually portrayed as mentally handicapped or disturbed (though Leatherface reveals that he used to be more normal, save for his temper). He wears a mask made out of human skin, which leads to his eventual name - Leatherface.\n\nThe character is loosely based on the real-life serial killer Ed Gein, who is remembered as one of the most brutal serial killers in American history, whom also happened to skin his victims alive and wear clothes made out of their skin. Leatherface is usually depicted with his iconic chainsaw, but he is also known for using a large sledgehammer to attack his victims. ');
INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Ghostface', 'https://www.dropbox.com/s/6pnpl0i4e7lu7wg/ghostface.jpg?raw=1', 'Ghostface is the main antagonist in the Scream series. An identity rather than an actual person, there have been seven people to assume the Ghostface mantle. A psychotic serial killer, he or she often dresses up as the variation of a ghost, or the Grim Reaper (The name given to his costume in the film is Father Death). He also uses a electronic device to disguise his voice; when doing so, he is voiced by Roger L. Jackson.\n\nGhostface is named after the rubber mask under which he hides his face, a mask inspired by the Edvard Munch painting The Scream. He is also known as the Woodsboro Killer, after the town where he commits his murders. Ghostface often calls his victims on the phone, taunting or threatening them before stabbing them to death with an 8 inch bowie knife or killing them any other way. He is usually known for asking their victims horror film trivia while stalking them. All ghostface people always die. ');
INSERT INTO `best_boogeyman`.`Boogeyman` (`name`, `avatar`, `bio`) VALUES ('Pyramid Head', 'https://www.dropbox.com/s/w3t7l5r7x2bcuo5/pyrami.jpg?raw=1', 'Pyramid Head is first encountered by Rose Da Silva in Midwich Elementary School, while she is looking for her daughter. Although he doesn\'t stand out among the monsters of the town, he is unaffected by attempts to stop him and displays his characteristic strength and brutality, as well as his Great Knife.\n\nPyramid Head uses the Great Knife weapon to fillet a thick steel door in a failed attempt to kill Rose and Cybil Bennett. He displays his strength when he catches Anna, holds her in the air using only one arm, tears off her dress, then grabs her chest and tears off her skin in one movement. ');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
