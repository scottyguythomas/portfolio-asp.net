use master;
go
DROP DATABASE IF EXISTS mssql_portfolio;
go
CREATE DATABASE mssql_portfolio;
go
USE mssql_portfolio;
go

CREATE TABLE contactform 
(
  CID integer NOT NULL IDENTITY,
  name varchar(64) NOT NULL,
  email varchar(64) NOT NULL,
  phoneNumber varchar(16) DEFAULT NULL,
  message varchar(1024) DEFAULT NULL,
  PRIMARY KEY (CID)
)

INSERT INTO contactform (name, email, phoneNumber, message) VALUES
	('Edwin Johnson', 'satabi@hieh.tw', '5240676157', 'hearing salmon coal brick nearly donkey manufacturing lot she shoot voyage leaving peace smallest personal account separate pack stiff combine captured growth driven climb'),
	('Harriet Medina', 'keb@napev.nr', '1179509895', 'pitch love any chose harder car youth shinning distant young anything difficulty bat neck movement naturally passage function center baseball tool putting use service'),
	('John Holloway', 'zu@atamugub.cy', '8406282792', 'kitchen beginning bee afternoon ice huge driving remarkable enemy affect nine finger throat they post run calm air log author usually taste table nobody'),
	('Isabella Herrera', 'fa@dojnehe.tj', '8130024105', 'led rear brass shelter finally substance wooden hall within indicate point rate select prize two fifteen cabin stand final model consist lesson baseball prevent'),
	('Willie Casey', 'to@so.kw', '9183079482', 'sent imagine written potatoes we blanket tax satellites page excitement native event hearing hour future would steady her west reach sport difficulty actually given'),
	('Jim Curtis', 'jiz@goudicut.ss', '1367757024', 'twenty salt save willing nobody see outside usually highest include breakfast sweet he hour door stranger quarter too composition further property scientific actually track'),
	('Alvin Silva', 'veskekud@efirah.lt', '2141644925', 'remain moon where foreign audience closely lake shadow property perfectly chapter ground color situation ran add leader diameter perfect excellent tune buried pond tool'),
	('Winnie Shelton', 'tu@ginsaz.io', '6623011410', 'simplest queen truck volume replied clock where ring correctly drew country goes habit creature almost knowledge picture film one front worry refused anything dozen'),
	('Alfred Simon', 'dekinon@vel.bv', '8784585778', 'least grass fish dream task equipment plenty powder union farm dropped somebody traffic allow fuel track wing ready giving green managed additional creature larger'),
	('Carlos Walton', 'cojzug@mu.ae', '8141002407', 'hollow done facing basis did rabbit fell myself rhythm eager food softly ate sea ready fourth movie machinery donkey wolf movement wear surrounded red'),
	('Lydia Boone', 'penbos@jo.om', '5117647224', 'wide tiny comfortable shoot arrange further told attached vessels customs compass across examine today gasoline away picture shore special record farmer due motion neighborhood'),
	('Martha Graham', 'li@iciwo.fi', '9168822764', 'design porch war house master more tight farther nearly prize gift rising task valuable party highest feet burn story said look increase calm badly'),
	('Benjamin Gray', 'rofub@leliz.net', '7182820647', 'fifty sudden quiet real mistake spend gulf bank organization several date favorite because climb follow related final potatoes perfect roar usual leaving whatever replied'),
	('Danny Todd', 'aveel@venkamzob.kp', '2476279814', 'get sold busy progress desk finger function happened wind tape may news pine attempt important summer saw parts pick chapter research wagon make cabin'),
	('Nannie Tate', 'buz@jawkum.to', '1972666068', 'official prove mice been potatoes mathematics stiff loose noun happily on charge heading saw slide daily carefully solar stream safe found whatever friend chamber'),
	('Carl Fields', 'lo@tutirkuc.jo', '8692785555', 'common felt many him second far memory slide iron airplane friendly matter through smallest finish wealth engine taste dress game function more won difficulty'),
	('Alma Sanders', 'efugof@viucda.so', '9037877483', 'nervous hollow screen basket wooden species roof shoot plenty old fourth eight alone being will everybody twice egg inch line family sky else common'),
	('Joseph Dean', 'mok@liime.af', '9981576052', 'there official carbon machine minute music wolf stranger shirt fight fierce already hope factory climb model look student cent wind mice late done chain'),
	('Sadie Bailey', 'sociv@ta.sl', '2698189137', 'certain away powerful slight add hall door once process frequently balloon outline hollow greatly congress after bridge room round food dozen roof swept applied'),
	('Jeremy Pittman', 'vupcurom@hilzeasa.ls', '9267972540', 'type village metal mile goes mountain log frighten planning war more sure lamp chest weather face turn result official hardly arrangement journey who brain'),
	('saf', 'sdf@gam.c', '1234', '12315');