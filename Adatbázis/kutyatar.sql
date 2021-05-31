CREATE DATABASE kutyak
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;




 #esemenyek tabla l�trejoz�sa
CREATE TABLE kutyak.esemenyek (
  esemenyId INT(11) NOT NULL AUTO_INCREMENT,
  esemeny VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (esemenyId)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

 #fajtak tabla l�trejoz�sa
CREATE TABLE kutyak.fajtak (
  fajtaId INT(11) NOT NULL AUTO_INCREMENT,
  fajta VARCHAR(50) NOT NULL,
  fajtaLeiras LONGTEXT DEFAULT NULL,
  gondozas LONGTEXT DEFAULT NULL,
  fajtaFoto VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (fajtaId)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;


 #kutyak tabla l�trejoz�sa
CREATE TABLE kutyak.kutyak (
  kutyaId INT(11) NOT NULL AUTO_INCREMENT,
  nev VARCHAR(50) NOT NULL,
  fajtaId INT(11) DEFAULT NULL,
  szuletes DATE DEFAULT NULL,
  suly DECIMAL(10, 2) DEFAULT NULL,
  magassag INT(11) DEFAULT NULL,
  foto VARCHAR(255) DEFAULT NULL,
  ertek DECIMAL(10, 0) DEFAULT NULL,
  PRIMARY KEY (kutyaId)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE kutyak.kutyak 
  ADD CONSTRAINT FK_kutyak_fajtak_fajtaId FOREIGN KEY (fajtaId)
    REFERENCES kutyak.fajtak(fajtaId) ON DELETE NO ACTION ON UPDATE NO ACTION;



 #kutyanaplo tabla l�trejoz�sa
CREATE TABLE kutyak.kutyanaplo (
  kutyaNaploId INT(11) NOT NULL AUTO_INCREMENT,
  kutyaId INT(11) NOT NULL,
  datum DATE NOT NULL,
  esemenyId INT(11) NOT NULL,
  PRIMARY KEY (kutyaNaploId)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE kutyak.kutyanaplo 
  ADD CONSTRAINT FK_kutyanaplo_esemenyek_esemenyId FOREIGN KEY (esemenyId)
    REFERENCES kutyak.esemenyek(esemenyId) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE kutyak.kutyanaplo 
  ADD CONSTRAINT FK_kutyanaplo_kutyak_kutyaId FOREIGN KEY (kutyaId)
    REFERENCES kutyak.kutyak(kutyaId) ON DELETE NO ACTION ON UPDATE NO ACTION;


#kutyakoltasok tabla l�trejoz�sa
CREATE TABLE kutyak.kutyakoltasok (
  kutyaId INT(11) DEFAULT NULL,
  oltasId INT(11) DEFAULT NULL
)
ENGINE = INNODB;


#koltasok tabla l�trejoz�sa
CREATE TABLE kutyak.oltasok (
  oltasId INT(11) NOT NULL AUTO_INCREMENT,
  oltasneve VARCHAR(55) DEFAULT NULL,
  PRIMARY KEY (oltasId)
)
ENGINE = INNODB;


#bejelentkez�s t�bla l�trehoz�sa
CREATE TABLE kutyak.bejelentkezes (
  loginId INT(11) NOT NULL AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  jogosultsag TINYINT(4) DEFAULT 1,
  PRIMARY KEY (loginId)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;





#-Tesztadatok
#--t�bl�k t�rl�se
DELETE FROM kutyanaplo;
DELETE FROM esemenyek;
DELETE FROM kutyak;
DELETE FROM fajtak;
DELETE FROM kutyakoltasok;
DELETE FROM oltasok;
DELETE FROM bejelentkezes;


INSERT INTO esemenyek
  (esemenyId,esemeny)
  VALUES
  (1,'olt�s'),(2,'�gyess�gi verseny'),(3,'kozmetika'),(4,'orvos'),(5,'kutya iskola'),(6,'f�rdet�s');

INSERT INTO fajtak
  (fajtaId,fajta,fajtaFoto,fajtaLeiras,gondozas)
  VALUES
  (1,'puli','puliFajta.jpg','A puli k�zepes termetu, n�gyzetes fel�p�t�su kutya. A m�rs�kelten hossz�, izmos nyak sim�n hajlik �t a h�t vonal�ba. Teste kvadrikus, azaz a test�nek hossza ugyanakkora, mint a marmagass�ga.A kanok marmagass�ga 40-44 cm, a szuk�� 37-41 cm. A pulik t�bbs�ge fekete, de vannak feh�r (gy�ngyfeh�r), illetve sz�rke. V�rhat� �lettartama: 12-14 �v','A puha aljszorzet sz�lai �sszeakadnak a durv�bb tapint�s�, hosszabb fedoszorzettel, �s ez megind�tja a tincsekk� �ssze�ll�s folyamat�t. A mag�t�l kialakult tincseket kell �vente k�tszer korrig�lni, p�ld�ul a h�t �s farok tal�lkoz�sn�l. A felnott puli sohasem hullatja a szor�t, �s egy�ves kora ut�n sem kef�lni, sem f�s�lni nem kell, viszont a szor�t gyakran v�gni kell, hogy ne botoljon bele.A puli mozg�sig�nye �tlagos, de ahhoz is j�l alkalmazkodik, ha n�ha a megszokottn�l r�videbb ideig tart a s�ta. �ltal�ban szeret labd�zni �s apport�rozni is.'), 
  (2,'pumi','pumiFajta.jpg','A pumi k�zepes nagys�g�, sz�gletes testfel�p�t�su kutya. Marja kiemelkedik a h�trafel� lejto h�tvonal�b�l, hasa pedig felfel� emelkedik. Magasan tuz�tt fark�t felkunkor�tva tartja; ha a k�ly�k kurta farokkal sz�letik, az is elfogadhat�.A kanok marmagass�ga 41-47 cm, a szuk�k� 38-44 cm. Leggyakoribbak a s�rg�sfeh�r �s a sz�rke egyedek, b�r a fekete, a feh�r �s a v�r�ses sz�n is megengedett.V�rhat� �lettartama: 12-14 �v','A szorzet�t el�g n�ha-n�ha �tkef�lni. A hall�j�ratokb�l k�zzel c�lszeru kit�pkedni a felesleges szorsz�lakat. A ki�ll�t�son versenyeztetett pumit �ltal�ban megny�rj�k �s kef�lik � de csak m�rt�kkel.Ez a vakmero �s f�rge kutya akkor �rzi igaz�n j�l mag�t, ha nagyon sokat mozoghat, ez�rt nem val� olyan szem�lyeknek, akik mindenn�l t�bbre �rt�kelik a nyugalmas �letet. A mindennapos s�t�k mellet rendszeresen lehetos�get kell adni neki arra is, hogy p�r�z n�lk�l hanc�rozzon. Nem hajlamos a csavarg�sra.'), 
  (3,'ag�r','agarFajta.jpg','Eros csontozat�, de karcs� kutya. T�rzse hossz�, izmos. Farka a cs�nkj�ig �r. V�gtagjai inasak, izmosak. A kan marmagass�ga 65-70 cm, a szuka marmagass�ga 62-67 cm. Sz�ne fekete vagy fak�, de lehet cs�kos, ordas, barna foltos, illetve minden alapsz�nnek van foltos v�ltozata is (feh�r alapon az alapsz�n) � egysz�val a legt�bb ag�rsz�nben teny�sztik.V�rhat� �lettartama: 12-14 �v','Vad�sz-, �s falkaeb, mely szemre vad�szik. Figyelemrem�lt� a szagl�sa. Vad�szatra csak k�l�n enged�llyel lehet haszn�lni oket.P�lyaversenyz�sre �s coursingra kiv�l�an alkalmas, k�l�n�sen hosszabb t�von v�lt be. Nagyon j� k�s�ro, �s hus�ges jelzokutya.'), 
  (4,'tacsk�','tacsk�Fajta.jpg','A tacsk�nak hossz� teste, magas marja, v�zszintes h�ta, enyh�n �velt l�gy�ka, hossz�, sz�les �s izmos fara van. A test �s a marmagass�g ar�nya ide�lis esetben 1:1,18. A marmagass�g felso k�tharmad�t maga a mellkas, als� egyharmad�t a mellkas �s a talaj k�zti t�vols�g teszi ki. A farok a h�t vonal�ban folytat�dik, �s nem lehet t�l �velt. Hasa m�rs�kelten felh�zott. Test�nek el�lso r�sze izmos, sz�les �s alacsony; a mellkas szembol n�zve ov�lis alak�. A j�l fejlett mellkas legm�lyebb pontja pontosan a mellso l�b m�g� esik.A marmagass�g minimum 16 cm,a mrmagass�g maximum: 25 cm.Sz�nei: A tacsk�kat sz�mos k�l�nb�zo sz�nben teny�sztik:Egysz�nu v�r�s,K�tsz�nu. Fekete vagy barna az alapsz�ne, Foltos vagy cs�kos.V�rhat� �lettartama: 10-14 �v', 'A r�vid szoru tacsk� szorzete nem k�l�n�sebben ig�nyes a gondoz�s szempontj�b�l. El�g idorol idore �td�rzs�lni egy gumikef�vel, vagy egy gumis kop�kesztyuvel, ami j�l elt�vol�tja az elhalt �s kilazult szorsz�lakat. A sz�lk�s szoru tacsk� szorzet�t �vente �tlagosan k�tszer kell trimmelni � a gyakoris�g a szorzet �llapot�t�l is f�gg. A fej szorzet�nek min�l r�videbbnek kell lennie. A szorzetet v�gni kiz�r�lag a l�bujjak k�z�tt szabad. A szorzet kiszed�se mellett idonk�nt �t kell kef�lni az �llatot egy eros s�rt�ju kef�vel. A hossz� szoru tacsk�t el�g idonk�nt �tkef�lni, fok�nt, a gubancol�d�sra hajlamos ter�leteken. A hossz� szoru �s a sz�lk�s szoru v�ltozatokn�l idonk�nt idonk�nt le kell ny�rni a talpp�rn�k k�z�tti szort is, mivel abban megakadhatnak a t�sk�k �s az apr�bb k�vek.Noha ez a kutya sz�vesen k�s�ri el gazd�j�t hosszabb s�t�kra is, �ltal�ban j�l alkalmazkodik a k�r�lm�nyekhez. Aj�nlatos gondoskodni arr�l, hogy sokat mozogjon, mivel ez seg�t kond�ci�ja megorz�s�ben.'), 
  (5,'mudi','mudiFajta.jpg','A mudi k�zepes nagys�g� kutya, j�l kirajzol�d� marral �s r�vid, egyenes h�ttal. A l�gy�ka m�rs�kelten sz�les, enyh�n lejt �s viszonylag r�vid. Mellkasa m�ly, ov�lis keresztmetszetu, a szegycsontja kiugr�. Egyenes l�bain j�l kirajzol�dnak az �z�letek; mancsai k�r alak�ak, szorosan z�rt ujjakkal.M�rete a standard szerint 38-47 cm k�z�tti, a val�s�gban enn�l is nagyobb kb. 35-50 cm k�z�tti v�ltozatoss�got mutat. A mudi legismertebb sz�ne a fekete, de ezen k�v�l m�g �t elfogadott sz�ne van: hamvas (k�k), cifra (blue merle), feh�r, barna, fak� (s�rga). A standardban elfogadott sz�nek term�szetes kombin�ci�i (barna-cifra, hamvas-cifra, hamvasbarna) idonk�nt elofordulnak a teny�szt�s sor�n.V�rhat� �lettartama: 14-16 �v','Szorzete nem ig�nyel t�l sok t�rod�st, j� �llapotban tart�s�hoz el�g, ha idonk�nt kikef�lik vagy kif�s�lik. A rendszeres f�s�l�stol t�nkremegy a szore, elvesz�ti a fajtajellegzetess�gk�nt l�nyeges csig�ss�got.A karmait r�viden kell tartani.Ez a csupa energia kutya �r�kon �t k�pes f�radhatatlanul szaladg�lni �s dolgozni, de j�l tud alkalmazkodni a nyugodtabb �letvitelhez is. Nagyon szereti a labdaj�t�kokat, valamint a p�r�z n�lk�l val� hanc�roz�st.'),
  (6,'komondor','komondorFajta.jpg','A komondor teste t�glalap alak�, a t�rzshossza a marmagass�g�nak 104-110%-a. A marja telt �s j�l l�that� a r�vid h�ton; a l�gy�ka k�zepesen hossz�, ak�rcsak az enyh�n lejtos, sz�les far. A kutya eg�sz h�tvonala igen eros. Alacsonyan tuz�tt farka lel�g, de a v�ge visszakunkorodik. J�r�s k�zben, vagy ha a komondor figyel valamire, a fark�t a h�tvonal f�l� emelheti, noha elm�letben ez hib�nak sz�m�t. A legjobb az ha egy�ltal�n nem emeli a h�tfonala f�l�. Hord�szeru mellkasa m�rs�kelten m�ly �s el�gg� hossz�, sz�gye sz�les �s igen izmos. V�llai meglehetosen ferd�k, de nem laz�k. L�bai egyenesek �s eros csont�ak; a combjai hossz�ak. Mancsai nagyok �s el�gg� vaskosak, a h�ts� mancsok sokszor valamivel hosszabbak az elsokn�l. A kanok minim�lis marmagass�ga 70 cm, a szuk�k� 65 cm. A komondor szore mindig feh�r, a bore pedig palasz�rke. Az orra, a szemei pereme �s az ajkai feket�k, a karmai viszont sz�rk�k.V�rhat� �lettartama: 12-14 �v',' A komondort soha nem kef�lik vagy f�s�lik, mivel az lehetetlenn� tenn� szorzete nemezed�s�t. A zsin�rok �ppen az�rt alakulnak ki, mert az aljszorzet puha sz�lai nem hullanak ki, hanem megakadnak a durv�bb, hosszabb fedoszorsz�lak k�z�tt. A nemezes zsin�rok kialakul�sa n�mi k�zi munk�val eloseg�theto. A jellegzetes komondorszorzet kialakul�sa ut�n m�r alig ig�nyel �pol�st, �s a lak�sban az eb szinte egy�ltal�n nem hullat szor�ket.E fajta mozg�sig�nye �tlagos, viszont nagyon szert a szabadban lenni. A rossz ido nem zavarja, m�g a fagyot is j�l turi, hiszen suru szorzete rendk�v�l j� v�delmet ny�jt. J� n�h�ny komondor �lland�an a szabadban �l, �s ha �gy is elegendo figyelmet kapnak, akkor ebben nincs is semmi rossz. '),
  (7,'kuvasz','kuvaszFajta.jpg','A kuvasz nagy, eros, nemes megjelen�su fajta, amelynek testalkata eroteljes, an�lk�l, hogy k�z�ns�gesnek tunne. Test�nek hossza valamivel meghaladja a magass�g�t; h�ta k�zepesen hossz�, l�gy�ka r�vid �s eros, fara pedig sz�les, eros, enyh�n lejtos. A far d�s szorzete miatt a kutya kiss� t�ls�lyosnak tunhet. A marja hosszabb �s magasabb, mint a h�ta. A lel�g� farka alacsonyan tuz�tt, eg�szen a cs�nkig �r, �s a v�ge kiss� felfel� g�rb�l. Mellkasa m�ly, el�lso r�sze az izmok �s a szegycsont miatt felfel� �velt.A kanok 71-75 cm, a szuk�k 66-70 cm magasak.A kuvasz kiz�r�lag feh�r sz�nben ismert. Bore palasz�rke, az orra, a szeme pereme �s az ajkai feket�k, a szeme pedig s�t�tbarna.V�rhat� �lettartama: 12-14 �v','Igen suru szorzete minden idoj�r�sban megfelelo v�delmet ny�lt a kuvasz sz�m�ra. Vedl�s idej�n elengedhetetlen az alapos, naponk�nti kef�l�s. A: �v t�bbi r�sz�ben hetente egyszer is el�g �tkef�lni, lehetoleg dr�tos kef�vel. A karmait rendszeresen kell v�gni! A kuvasz mozg�sig�nye �tlagos; egy nagym�retu, beker�tett kertben mag�t�l is eleget mozog. Szereti naponta t�bbsz�r is ellenorizni territ�riuma hat�rait � ha ez nem lehets�ges, gyakrabban kell s�t�lni vinni. Fizikai �s szellemi �rtelemben is t�gas helyre van sz�ks�ge.'),
  (8,'angol bulldog','bulldogFajta.jpg','Az angol bulldog sz�les, eros, z�m�k fel�p�t�su kutya. L�bai meglehetosen r�videk. A r�vid, eroteljes h�t a v�lln�l a legsz�lesebb, majd a l�gy�k fel� elkeskenyedik. Oldalr�l n�zve a h�t a v�ll m�g�tt lejtos, azt�n a l�gy�kn�l megemelkedik, majd a farn�l ism�t lejt. A h�t legmagasabb pontja ugyanolyan magasan van, mint a l�gy�k teteje. Mellkasa t�gas, g�mb�lyded �s igen m�ly, m�lyen bel�g a mellso l�bak k�z�. A j�l lekerek�tett bord�k messze h�trany�lnak, a has felh�zott. A m�rs�kelten hossz�, m�lyen tuz�tt farok a t�v�n�l meglehetosen egyenesen ki�ll� �s vaskos, majd ut�na lefel� �velo, �s hirtelen finom v�gben elkeskenyedo. Marmagass�ga: �tlagosan a kan 35-45 cm, szuka 34-44 cm.Az angol bulldog k�tf�le sz�nezetben ismert: v�r�s �s tigriscs�kos. A v�r�s a b�zstol a s�t�t ozbarn�ig, illetve a halv�nybarn�ig terjedhet. Feh�r rajzolata �s/vagy fekete maszkja is lehet.V�rhat� �lettartama: 9-11 �v','Ez a kutya nem ig�nyel t�l sok szorzet�pol�st. Vedl�s idej�n gumikef�vel lehet a legegyszerubben elt�vol�tani az elhalt �s kilazult szorsz�lakat. Sz�ks�g eset�n az arc redoit � fok�nt a szem alattiakat � erre szolg�l� oldattal kell megtiszt�tani. Az angol bulldognak huzatmentes, puha, sz�raz helyre van sz�ks�ge � a ridegen tart�s teh�t nem megfelelo a sz�m�ra. Bore nagyon �rz�keny a nedvess�gre, mindig sz�razra kell t�r�lni.A fajta nem ig�nyel hossz� s�t�kat, be�ri napi h�rom r�vid kiruccan�ssal. A nap fennmarad� r�sz�t sz�vesen t�lti a lak�sban vagy a kertben, felt�ve, hogy a csal�d is a k�zelben van. E tulajdons�gai miatt ide�lis t�rs az otthon�lo emberek sz�m�ra.');


#kutyak
  INSERT INTO kutyak
  (kutyaId,nev,fajtaId,ertek,suly,magassag,szuletes,foto)
  VALUES
  (1,'palk�',1,25000,13,39,VeletlenDatum(),'puli1.jpg'), (2,'peti',2,20000,9,40,VeletlenDatum(),'pumi1.jpg'), (3,'bog�ncs',3,70000,24,66,VeletlenDatum(),'agar1.jpg'), (4,'zoli',4,150000,6,31,VeletlenDatum(),'tacsk�1.jpg'), (5,'mancs',5,40000,12,41,VeletlenDatum(),'mudi1.jpg'),(6,'pamacs',1,25000,15,43,VeletlenDatum(),'puli2.jpg'), (7,'matyi',2,20000,11,45,VeletlenDatum(),'pumi2.jpg'), (8,'rozi',3,70000,27,62,VeletlenDatum(),'agar2.jpg'), (9,'buli',4,150000,5,34,VeletlenDatum(),'tacsk�2.jpg'), (10,'bing�',5,40000,12,42,VeletlenDatum(),'mudi2.jpg'), (11,'abu',1,25000,14,38,VeletlenDatum(),'puli3.jpg'), (12,'zo�',2,20000,9,45,VeletlenDatum(),'pumi3.jpg'), (13,'pixel',3,70000,29,69,VeletlenDatum(),'agar3.jpg'), (14,'masni',4,150000,7,33,VeletlenDatum(),'tacsk�3.jpg'), (15,'panka',5,40000,8,40,VeletlenDatum(),'mudi3.jpg'), (16,'rita',1,25000,13,43,VeletlenDatum(),'puli4.jpg'), (17,'miki',2,20000,11,42,VeletlenDatum(),'pumi4.jpg'), (18,'sapka',3,70000,26,65,VeletlenDatum(),'agar4.jpg'), (19,'tepsi',4,150000,6,30,VeletlenDatum(),'tacsk�4.jpg'), (20,'lola',6,50000,45,66,VeletlenDatum(),'komondor1.jpg'), (21,'d�zi',6,50000,52,68,VeletlenDatum(),'komondor2.jpg'), (22,'sanyi',6,50000,42,65,VeletlenDatum(),'komondor3.jpg'), (23,'cs�zli',6,50000,53,70,VeletlenDatum(),'komondor4.jpg'), (24,'tipli',6,50000,50,67,VeletlenDatum(),'komondor5.jpg'), (25,'kef�r',7,80000,42,70,VeletlenDatum(),'kuvasz1.jpg'), (26,'�gas',7,80000,42,67,VeletlenDatum(),'kuvasz2.jpg'), (27,'bende',7,80000,48,73,VeletlenDatum(),'kuvasz3.jpg'), (28,'fabio',7,80000,50,69,VeletlenDatum(),'kuvasz4.jpg'), (29,'max',7,80000,46,72,VeletlenDatum(),'kuvasz5.jpg'), (30,'obama',7,80000,49,66,VeletlenDatum(),'kuvasz6.jpg'),(31,'beni',8,90000,25,40,VeletlenDatum(),'bulldog1.jpg'),(32,'d�rmi',8,90000,22,36,VeletlenDatum(),'bulldog2.jpg');

#kutyanaplo
  INSERT INTO kutyanaplo
  (kutyaNaploId,kutyaId,datum,esemenyId)
  VALUES
  (1,1,'2020.01.03',1), (2,2,'2020.10.03',2), (3,3,'2020.12.03',3), (4,4,'2020.08.15',4), (5,5,'2020.03.25',5),(6,9,'2017.05.11',6),(7,13,'2018.07.09',1),(8,19,'2019.09.29',2),(9,22,'2021.04.18',3),(10,28,'2018.11.13',4),(11,32,'2019.12.15',5),(12,21,'2021.02.25',6);

#oltasok
  INSERT INTO oltasok
  (oltasId,oltasneve)
  VALUES
  (1,'parvov�rusos b�lgyullad�s elleni olt�s'), (2,'fertozo betegs�gek elleni kombin�lt olt�s'), (3,'veszetts�g elleni olt�s'), (4,'kombin�lt �s veszetts�g elleni olt�s');

#kutyakoltasok
  INSERT INTO kutyakoltasok
  (kutyaId,oltasId)
  VALUES
  (1,1), (2,1), (3,1), (4,1), (5,1), (6,1), (7,1), (8,2), (9,2), (10,2), (11,2), (12,2), (13,2), (14,2), (15,3), (16,3), (17,3), (18,3), (19,3), (20,3), (21,3), (22,4), (23,4), (24,4), (25,4), (26,4), (27,4), (28,4), (29,2), (30,3),(31,1),(32,3);


#bejelentkezes
  INSERT INTO bejelentkezes
  (loginId, email, password, jogosultsag)
  VALUES 
  (1, 'mario@gmail.com','$2y$10$/AH8IZ6vAJB6L3wQmZ8LJOJKebkq3aGY4JZVivr26M.8I0ED5nYfm',2),
  (2, 'katalin@gmail.com','$2y$10$Dr9LB7MjRIftat/DgJTa3e6DGjW5X4Jnm10B8Vy4Lut.05MB/BZRe',1),
  (3, 'almafa@gmail.com','$2y$10$DtyEo4/R5JpD1l9ldgAu9uATc.yI6K.vWbkhKYOPY3LhS3bewmyCO',1),
  (4, 'deres@gmail.com','$2y$10$4E0B0kjXUyHxdamUCx5X3e6joNxToEmaWtfeFedvBLu/KYHRc8kpC',1),
  (5, 'j�zmin23@gmail.com','$2y$10$sgm6pJ9reXkeIX2AD4lSCuAxR6GELW5vvVg1V3g.unpvytdV/UjcK',1),
  (6, 'dobosH@gmail.com','$2y$10$fWWh3KPIuIELpG.jBEpSDexkgqPYTEmYa8R6L2nKYlEKD6S9Iq/Bm',1),
  (7, 'daniel@gmail.com','$2y$10$wmzOdwngwq8u6ch.jYD7LeBBoOGH3n5521WV9CrPiJ9awJ2.HeO1a',1),
  (8,  'ad�m@gmail.com','$2y$10$m8F/95il9bLts6Y/A4Biwu3ELXMAK/i.QNlIrvXofn5fM9s80jxQ2',1),
  (9, 'kov�csJ25@gmail.com','$2y$10$TSmd6s7rGy/pbJGV5lUAGu7zU3PPNkMSWm5/RgGqohlzgi8KM4Yri',1),
  (10, 'edina@gmail.com','$2y$10$JGUKxwRII1MZv.CwJKLIte2XB003PXu7Qbzj5ofoe7hJfuwfLaeeG',1),
  (11, 't�th999@gmail.com','$2y$10$LEfVjdWb0UgIwsJ6Q2shluqr8iBJnua9EMpztlRggH69aui32GGHS',1);



#T�rolt elj�r�s k�sz�t�se (v�letlen d�tum)
  UPDATE kutyak SET szuletes = VeletlenDatum() WHERE kutyaId = 2;

#-Lek�rsez�sek
#--T�bl�k
#EsemenyekTabla
SELECT * FROM esemenyek;
#FajtakTabla
SELECT * FROM fajtak;
#KutyakTabla
SELECT * FROM kutyak;
#KutyanaplokTabla
SELECT * FROM kutyanaplo;
#oltasokTabla
SELECT * FROM oltasok;
#kutyaoltasokTabla
SELECT * FROM kutyakoltasok;
#bejelentkezesTabla
SELECT * FROM bejelentkezes;


#--Kimutat�sok
  #25 db kutyaadat + random d�tum
  #weboldal keres�se


#�sszes kutya adata
  SELECT * FROM kutyanaplo kn
    INNER JOIN kutyak k on k.kutyaId = kn.kutyaId
    INNER JOIN fajtak f on k.fajtaId = f.fajtaId;

  #h�ny kutya van, 
  SELECT COUNT(*) AS Count FROM kutyak;

  #mennyi az �rt�k,
  SELECT SUM(kutyak.ertek) AS Sum FROM kutyak;

  #kutyaadatlap
  SELECT kn.kutyaNaploId,k.nev ,kn.datum,e.esemeny FROM kutyanaplo kn
  INNER JOIN kutyak k on k.kutyaId = kn.kutyaId
  INNER JOIN esemenyek e on e.esemenyId = kn.esemenyId
  WHERE k.kutyaId = 1;




#FajtakABC
SELECT fajta,fajtaId FROM fajtak
  ORDER BY fajta;
#KutyanaplokABC
SELECT kutyaNaploId FROM kutyanaplo
  ORDER BY kutyaId;
#KutyakABC
SELECT kutyaId FROM kutyak
  ORDER BY nev;
#EsemenyekABC
SELECT esemenyId FROM esemenyek
  ORDER BY esemeny;


#-T�bla sor hozz�fuz�se
  INSERT INTO esemenyek(esemeny) VALUE(?);
  INSERT INTO fajtak(fajta,fajtaLeiras,gondozas) VALUE(?,?,?);
  INSERT INTO kutyak(nev,fajtaId,szuletes,suly,magassag,foto,ertek) VALUE(?,?,?,?,?,?,?);
  INSERT INTO kutyanaplo(kutyaId,datum,esemenyId) VALUE(?,?,?);
  INSERT INTO oltasok(oltasneve) VALUE(?);
  INSERT INTO kutyakoltasok(kutyaId,oltasId) VALUE(?,?);

#-T�bl�k m�dos�t�sa
  UPDATE esemenyek SET esemeny = ? WHERE esemenyId = ?;
  UPDATE fajtak SET fajta = ?, fajtaLeiras = ?, gondozas = ? WHERE fajtaId = ?;
  UPDATE kutyak SET nev = ?,fajtaId = ?, szuletes = ?,suly = ?,magassag = ?, foto = ?,ertek = ? WHERE kutyaId = ?;
  UPDATE kutyanaplo SET kutyaId = ?, datum = ?, esemenyId = ? WHERE kutyaNaploId = ?;
  UPDATE oltasok SET oltasneve = ? WHERE oltasId = ?;
  UPDATE kutyakoltasok SET kutyaId = ? AND oltasId = ? WHERE kutyaId = ? AND oltasId = ?;



#-T�blasor t�rl�se
  DELETE FROM esemenyek WHERE esemenyId = ?;
  DELETE FROM fajtak WHERE fajtaId = ?;
  DELETE FROM kutyak WHERE kutyaId = ?;
  DELETE FROM kutyanaplo WHERE kutyaNaploId = ?;
  DELETE FROM oltasok WHERE oltasId = ?;
  DELETE FROM kutyakoltasok WHERE kutyaId = ? AND oltasId = ?;

  #KutyakTabla
  SELECT k.kutyaId,k.nev,k.fajtaId, f.fajta, o.oltasId,o.oltasneve, k.szuletes,k.suly,k.magassag, k.foto, k.ertek FROM kutyak k
    INNER JOIN fajtak f on f.fajtaId = k.fajtaId
    INNER JOIN kutyakoltasok ko on ko.kutyaId = k.kutyaId
    INNER JOIN oltasok o on o.oltasId = ko.oltasId;

  #KutyaNapl�T�bla
    SELECT kn.kutyaNaploId,k.nev,kn.datum, e.esemeny FROM kutyanaplo kn
      INNER JOIN kutyak k ON k.kutyaId = kn.kutyaId
      INNER JOIN esemenyek e on e.esemenyId = kn.esemenyId;

    #Fajtakeres�s
  SELECT * FROM fajtak f
    WHERE f.fajta LIKE ?;

  #Kutyakeres�s
    SELECT * FROM kutyak k 
      WHERE k.nev LIKE ?;
