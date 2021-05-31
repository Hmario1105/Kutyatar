CREATE DATABASE kutyak
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;




 #esemenyek tabla létrejozása
CREATE TABLE kutyak.esemenyek (
  esemenyId INT(11) NOT NULL AUTO_INCREMENT,
  esemeny VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (esemenyId)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

 #fajtak tabla létrejozása
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


 #kutyak tabla létrejozása
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



 #kutyanaplo tabla létrejozása
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


#kutyakoltasok tabla létrejozása
CREATE TABLE kutyak.kutyakoltasok (
  kutyaId INT(11) DEFAULT NULL,
  oltasId INT(11) DEFAULT NULL
)
ENGINE = INNODB;


#koltasok tabla létrejozása
CREATE TABLE kutyak.oltasok (
  oltasId INT(11) NOT NULL AUTO_INCREMENT,
  oltasneve VARCHAR(55) DEFAULT NULL,
  PRIMARY KEY (oltasId)
)
ENGINE = INNODB;


#bejelentkezés tábla létrehozása
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
#--táblák törlése
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
  (1,'oltás'),(2,'ügyességi verseny'),(3,'kozmetika'),(4,'orvos'),(5,'kutya iskola'),(6,'fürdetés');

INSERT INTO fajtak
  (fajtaId,fajta,fajtaFoto,fajtaLeiras,gondozas)
  VALUES
  (1,'puli','puliFajta.jpg','A puli közepes termetu, négyzetes felépítésu kutya. A mérsékelten hosszú, izmos nyak simán hajlik át a hát vonalába. Teste kvadrikus, azaz a testének hossza ugyanakkora, mint a marmagassága.A kanok marmagassága 40-44 cm, a szukáé 37-41 cm. A pulik többsége fekete, de vannak fehér (gyöngyfehér), illetve szürke. Várható élettartama: 12-14 év','A puha aljszorzet szálai összeakadnak a durvább tapintású, hosszabb fedoszorzettel, és ez megindítja a tincsekké összeállás folyamatát. A magától kialakult tincseket kell évente kétszer korrigálni, például a hát és farok találkozásnál. A felnott puli sohasem hullatja a szorét, és egyéves kora után sem kefélni, sem fésülni nem kell, viszont a szorét gyakran vágni kell, hogy ne botoljon bele.A puli mozgásigénye átlagos, de ahhoz is jól alkalmazkodik, ha néha a megszokottnál rövidebb ideig tart a séta. Általában szeret labdázni és apportírozni is.'), 
  (2,'pumi','pumiFajta.jpg','A pumi közepes nagyságú, szögletes testfelépítésu kutya. Marja kiemelkedik a hátrafelé lejto hátvonalából, hasa pedig felfelé emelkedik. Magasan tuzött farkát felkunkorítva tartja; ha a kölyök kurta farokkal születik, az is elfogadható.A kanok marmagassága 41-47 cm, a szukáké 38-44 cm. Leggyakoribbak a sárgásfehér és a szürke egyedek, bár a fekete, a fehér és a vöröses szín is megengedett.Várható élettartama: 12-14 év','A szorzetét elég néha-néha átkefélni. A hallójáratokból kézzel célszeru kitépkedni a felesleges szorszálakat. A kiállításon versenyeztetett pumit általában megnyírják és kefélik – de csak mértékkel.Ez a vakmero és fürge kutya akkor érzi igazán jól magát, ha nagyon sokat mozoghat, ezért nem való olyan személyeknek, akik mindennél többre értékelik a nyugalmas életet. A mindennapos séták mellet rendszeresen lehetoséget kell adni neki arra is, hogy póráz nélkül hancúrozzon. Nem hajlamos a csavargásra.'), 
  (3,'agár','agarFajta.jpg','Eros csontozatú, de karcsú kutya. Törzse hosszú, izmos. Farka a csánkjáig ér. Végtagjai inasak, izmosak. A kan marmagassága 65-70 cm, a szuka marmagassága 62-67 cm. Színe fekete vagy fakó, de lehet csíkos, ordas, barna foltos, illetve minden alapszínnek van foltos változata is (fehér alapon az alapszín) – egyszóval a legtöbb agárszínben tenyésztik.Várható élettartama: 12-14 év','Vadász-, és falkaeb, mely szemre vadászik. Figyelemreméltó a szaglása. Vadászatra csak külön engedéllyel lehet használni oket.Pályaversenyzésre és coursingra kiválóan alkalmas, különösen hosszabb távon vált be. Nagyon jó kíséro, és huséges jelzokutya.'), 
  (4,'tacskó','tacskóFajta.jpg','A tacskónak hosszú teste, magas marja, vízszintes háta, enyhén ívelt lágyéka, hosszú, széles és izmos fara van. A test és a marmagasság aránya ideális esetben 1:1,18. A marmagasság felso kétharmadát maga a mellkas, alsó egyharmadát a mellkas és a talaj közti távolság teszi ki. A farok a hát vonalában folytatódik, és nem lehet túl ívelt. Hasa mérsékelten felhúzott. Testének elülso része izmos, széles és alacsony; a mellkas szembol nézve ovális alakú. A jól fejlett mellkas legmélyebb pontja pontosan a mellso láb mögé esik.A marmagasság minimum 16 cm,a mrmagasság maximum: 25 cm.Színei: A tacskókat számos különbözo színben tenyésztik:Egyszínu vörös,Kétszínu. Fekete vagy barna az alapszíne, Foltos vagy csíkos.Várható élettartama: 10-14 év', 'A rövid szoru tacskó szorzete nem különösebben igényes a gondozás szempontjából. Elég idorol idore átdörzsölni egy gumikefével, vagy egy gumis kopókesztyuvel, ami jól eltávolítja az elhalt és kilazult szorszálakat. A szálkás szoru tacskó szorzetét évente átlagosan kétszer kell trimmelni – a gyakoriság a szorzet állapotától is függ. A fej szorzetének minél rövidebbnek kell lennie. A szorzetet vágni kizárólag a lábujjak között szabad. A szorzet kiszedése mellett idonként át kell kefélni az állatot egy eros sörtéju kefével. A hosszú szoru tacskót elég idonként átkefélni, foként, a gubancolódásra hajlamos területeken. A hosszú szoru és a szálkás szoru változatoknál idonként idonként le kell nyírni a talppárnák közötti szort is, mivel abban megakadhatnak a tüskék és az apróbb kövek.Noha ez a kutya szívesen kíséri el gazdáját hosszabb sétákra is, általában jól alkalmazkodik a körülményekhez. Ajánlatos gondoskodni arról, hogy sokat mozogjon, mivel ez segít kondíciója megorzésében.'), 
  (5,'mudi','mudiFajta.jpg','A mudi közepes nagyságú kutya, jól kirajzolódó marral és rövid, egyenes háttal. A lágyéka mérsékelten széles, enyhén lejt és viszonylag rövid. Mellkasa mély, ovális keresztmetszetu, a szegycsontja kiugró. Egyenes lábain jól kirajzolódnak az ízületek; mancsai kör alakúak, szorosan zárt ujjakkal.Mérete a standard szerint 38-47 cm közötti, a valóságban ennél is nagyobb kb. 35-50 cm közötti változatosságot mutat. A mudi legismertebb színe a fekete, de ezen kívül még öt elfogadott színe van: hamvas (kék), cifra (blue merle), fehér, barna, fakó (sárga). A standardban elfogadott színek természetes kombinációi (barna-cifra, hamvas-cifra, hamvasbarna) idonként elofordulnak a tenyésztés során.Várható élettartama: 14-16 év','Szorzete nem igényel túl sok törodést, jó állapotban tartásához elég, ha idonként kikefélik vagy kifésülik. A rendszeres fésüléstol tönkremegy a szore, elveszíti a fajtajellegzetességként lényeges csigásságot.A karmait röviden kell tartani.Ez a csupa energia kutya órákon át képes fáradhatatlanul szaladgálni és dolgozni, de jól tud alkalmazkodni a nyugodtabb életvitelhez is. Nagyon szereti a labdajátékokat, valamint a póráz nélkül való hancúrozást.'),
  (6,'komondor','komondorFajta.jpg','A komondor teste téglalap alakú, a törzshossza a marmagasságának 104-110%-a. A marja telt és jól látható a rövid háton; a lágyéka közepesen hosszú, akárcsak az enyhén lejtos, széles far. A kutya egész hátvonala igen eros. Alacsonyan tuzött farka lelóg, de a vége visszakunkorodik. Járás közben, vagy ha a komondor figyel valamire, a farkát a hátvonal fölé emelheti, noha elméletben ez hibának számít. A legjobb az ha egyáltalán nem emeli a hátfonala fölé. Hordószeru mellkasa mérsékelten mély és eléggé hosszú, szügye széles és igen izmos. Vállai meglehetosen ferdék, de nem lazák. Lábai egyenesek és eros csontúak; a combjai hosszúak. Mancsai nagyok és eléggé vaskosak, a hátsó mancsok sokszor valamivel hosszabbak az elsoknél. A kanok minimális marmagassága 70 cm, a szukáké 65 cm. A komondor szore mindig fehér, a bore pedig palaszürke. Az orra, a szemei pereme és az ajkai feketék, a karmai viszont szürkék.Várható élettartama: 12-14 év',' A komondort soha nem kefélik vagy fésülik, mivel az lehetetlenné tenné szorzete nemezedését. A zsinórok éppen azért alakulnak ki, mert az aljszorzet puha szálai nem hullanak ki, hanem megakadnak a durvább, hosszabb fedoszorszálak között. A nemezes zsinórok kialakulása némi kézi munkával elosegítheto. A jellegzetes komondorszorzet kialakulása után már alig igényel ápolást, és a lakásban az eb szinte egyáltalán nem hullat szoröket.E fajta mozgásigénye átlagos, viszont nagyon szert a szabadban lenni. A rossz ido nem zavarja, még a fagyot is jól turi, hiszen suru szorzete rendkívül jó védelmet nyújt. Jó néhány komondor állandóan a szabadban él, és ha így is elegendo figyelmet kapnak, akkor ebben nincs is semmi rossz. '),
  (7,'kuvasz','kuvaszFajta.jpg','A kuvasz nagy, eros, nemes megjelenésu fajta, amelynek testalkata eroteljes, anélkül, hogy közönségesnek tunne. Testének hossza valamivel meghaladja a magasságát; háta közepesen hosszú, lágyéka rövid és eros, fara pedig széles, eros, enyhén lejtos. A far dús szorzete miatt a kutya kissé túlsúlyosnak tunhet. A marja hosszabb és magasabb, mint a háta. A lelógó farka alacsonyan tuzött, egészen a csánkig ér, és a vége kissé felfelé görbül. Mellkasa mély, elülso része az izmok és a szegycsont miatt felfelé ívelt.A kanok 71-75 cm, a szukák 66-70 cm magasak.A kuvasz kizárólag fehér színben ismert. Bore palaszürke, az orra, a szeme pereme és az ajkai feketék, a szeme pedig sötétbarna.Várható élettartama: 12-14 év','Igen suru szorzete minden idojárásban megfelelo védelmet nyúlt a kuvasz számára. Vedlés idején elengedhetetlen az alapos, naponkénti kefélés. A: év többi részében hetente egyszer is elég átkefélni, lehetoleg drótos kefével. A karmait rendszeresen kell vágni! A kuvasz mozgásigénye átlagos; egy nagyméretu, bekerített kertben magától is eleget mozog. Szereti naponta többször is ellenorizni territóriuma határait – ha ez nem lehetséges, gyakrabban kell sétálni vinni. Fizikai és szellemi értelemben is tágas helyre van szüksége.'),
  (8,'angol bulldog','bulldogFajta.jpg','Az angol bulldog széles, eros, zömök felépítésu kutya. Lábai meglehetosen rövidek. A rövid, eroteljes hát a vállnál a legszélesebb, majd a lágyék felé elkeskenyedik. Oldalról nézve a hát a váll mögött lejtos, aztán a lágyéknál megemelkedik, majd a farnál ismét lejt. A hát legmagasabb pontja ugyanolyan magasan van, mint a lágyék teteje. Mellkasa tágas, gömbölyded és igen mély, mélyen belóg a mellso lábak közé. A jól lekerekített bordák messze hátranyúlnak, a has felhúzott. A mérsékelten hosszú, mélyen tuzött farok a tövénél meglehetosen egyenesen kiálló és vaskos, majd utána lefelé ívelo, és hirtelen finom végben elkeskenyedo. Marmagassága: Átlagosan a kan 35-45 cm, szuka 34-44 cm.Az angol bulldog kétféle színezetben ismert: vörös és tigriscsíkos. A vörös a bézstol a sötét ozbarnáig, illetve a halványbarnáig terjedhet. Fehér rajzolata és/vagy fekete maszkja is lehet.Várható élettartama: 9-11 év','Ez a kutya nem igényel túl sok szorzetápolást. Vedlés idején gumikefével lehet a legegyszerubben eltávolítani az elhalt és kilazult szorszálakat. Szükség esetén az arc redoit – foként a szem alattiakat – erre szolgáló oldattal kell megtisztítani. Az angol bulldognak huzatmentes, puha, száraz helyre van szüksége – a ridegen tartás tehát nem megfelelo a számára. Bore nagyon érzékeny a nedvességre, mindig szárazra kell törölni.A fajta nem igényel hosszú sétákat, beéri napi három rövid kiruccanással. A nap fennmaradó részét szívesen tölti a lakásban vagy a kertben, feltéve, hogy a család is a közelben van. E tulajdonságai miatt ideális társ az otthonülo emberek számára.');


#kutyak
  INSERT INTO kutyak
  (kutyaId,nev,fajtaId,ertek,suly,magassag,szuletes,foto)
  VALUES
  (1,'palkó',1,25000,13,39,VeletlenDatum(),'puli1.jpg'), (2,'peti',2,20000,9,40,VeletlenDatum(),'pumi1.jpg'), (3,'bogáncs',3,70000,24,66,VeletlenDatum(),'agar1.jpg'), (4,'zoli',4,150000,6,31,VeletlenDatum(),'tacskó1.jpg'), (5,'mancs',5,40000,12,41,VeletlenDatum(),'mudi1.jpg'),(6,'pamacs',1,25000,15,43,VeletlenDatum(),'puli2.jpg'), (7,'matyi',2,20000,11,45,VeletlenDatum(),'pumi2.jpg'), (8,'rozi',3,70000,27,62,VeletlenDatum(),'agar2.jpg'), (9,'buli',4,150000,5,34,VeletlenDatum(),'tacskó2.jpg'), (10,'bingó',5,40000,12,42,VeletlenDatum(),'mudi2.jpg'), (11,'abu',1,25000,14,38,VeletlenDatum(),'puli3.jpg'), (12,'zoé',2,20000,9,45,VeletlenDatum(),'pumi3.jpg'), (13,'pixel',3,70000,29,69,VeletlenDatum(),'agar3.jpg'), (14,'masni',4,150000,7,33,VeletlenDatum(),'tacskó3.jpg'), (15,'panka',5,40000,8,40,VeletlenDatum(),'mudi3.jpg'), (16,'rita',1,25000,13,43,VeletlenDatum(),'puli4.jpg'), (17,'miki',2,20000,11,42,VeletlenDatum(),'pumi4.jpg'), (18,'sapka',3,70000,26,65,VeletlenDatum(),'agar4.jpg'), (19,'tepsi',4,150000,6,30,VeletlenDatum(),'tacskó4.jpg'), (20,'lola',6,50000,45,66,VeletlenDatum(),'komondor1.jpg'), (21,'dézi',6,50000,52,68,VeletlenDatum(),'komondor2.jpg'), (22,'sanyi',6,50000,42,65,VeletlenDatum(),'komondor3.jpg'), (23,'csúzli',6,50000,53,70,VeletlenDatum(),'komondor4.jpg'), (24,'tipli',6,50000,50,67,VeletlenDatum(),'komondor5.jpg'), (25,'kefír',7,80000,42,70,VeletlenDatum(),'kuvasz1.jpg'), (26,'ágas',7,80000,42,67,VeletlenDatum(),'kuvasz2.jpg'), (27,'bende',7,80000,48,73,VeletlenDatum(),'kuvasz3.jpg'), (28,'fabio',7,80000,50,69,VeletlenDatum(),'kuvasz4.jpg'), (29,'max',7,80000,46,72,VeletlenDatum(),'kuvasz5.jpg'), (30,'obama',7,80000,49,66,VeletlenDatum(),'kuvasz6.jpg'),(31,'beni',8,90000,25,40,VeletlenDatum(),'bulldog1.jpg'),(32,'dörmi',8,90000,22,36,VeletlenDatum(),'bulldog2.jpg');

#kutyanaplo
  INSERT INTO kutyanaplo
  (kutyaNaploId,kutyaId,datum,esemenyId)
  VALUES
  (1,1,'2020.01.03',1), (2,2,'2020.10.03',2), (3,3,'2020.12.03',3), (4,4,'2020.08.15',4), (5,5,'2020.03.25',5),(6,9,'2017.05.11',6),(7,13,'2018.07.09',1),(8,19,'2019.09.29',2),(9,22,'2021.04.18',3),(10,28,'2018.11.13',4),(11,32,'2019.12.15',5),(12,21,'2021.02.25',6);

#oltasok
  INSERT INTO oltasok
  (oltasId,oltasneve)
  VALUES
  (1,'parvovírusos bélgyulladás elleni oltás'), (2,'fertozo betegségek elleni kombinált oltás'), (3,'veszettség elleni oltás'), (4,'kombinált és veszettség elleni oltás');

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
  (5, 'jázmin23@gmail.com','$2y$10$sgm6pJ9reXkeIX2AD4lSCuAxR6GELW5vvVg1V3g.unpvytdV/UjcK',1),
  (6, 'dobosH@gmail.com','$2y$10$fWWh3KPIuIELpG.jBEpSDexkgqPYTEmYa8R6L2nKYlEKD6S9Iq/Bm',1),
  (7, 'daniel@gmail.com','$2y$10$wmzOdwngwq8u6ch.jYD7LeBBoOGH3n5521WV9CrPiJ9awJ2.HeO1a',1),
  (8,  'adám@gmail.com','$2y$10$m8F/95il9bLts6Y/A4Biwu3ELXMAK/i.QNlIrvXofn5fM9s80jxQ2',1),
  (9, 'kovácsJ25@gmail.com','$2y$10$TSmd6s7rGy/pbJGV5lUAGu7zU3PPNkMSWm5/RgGqohlzgi8KM4Yri',1),
  (10, 'edina@gmail.com','$2y$10$JGUKxwRII1MZv.CwJKLIte2XB003PXu7Qbzj5ofoe7hJfuwfLaeeG',1),
  (11, 'tóth999@gmail.com','$2y$10$LEfVjdWb0UgIwsJ6Q2shluqr8iBJnua9EMpztlRggH69aui32GGHS',1);



#Tárolt eljárás készítése (véletlen dátum)
  UPDATE kutyak SET szuletes = VeletlenDatum() WHERE kutyaId = 2;

#-Lekérsezések
#--Táblák
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


#--Kimutatások
  #25 db kutyaadat + random dátum
  #weboldal keresése


#összes kutya adata
  SELECT * FROM kutyanaplo kn
    INNER JOIN kutyak k on k.kutyaId = kn.kutyaId
    INNER JOIN fajtak f on k.fajtaId = f.fajtaId;

  #hány kutya van, 
  SELECT COUNT(*) AS Count FROM kutyak;

  #mennyi az érték,
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


#-Tábla sor hozzáfuzése
  INSERT INTO esemenyek(esemeny) VALUE(?);
  INSERT INTO fajtak(fajta,fajtaLeiras,gondozas) VALUE(?,?,?);
  INSERT INTO kutyak(nev,fajtaId,szuletes,suly,magassag,foto,ertek) VALUE(?,?,?,?,?,?,?);
  INSERT INTO kutyanaplo(kutyaId,datum,esemenyId) VALUE(?,?,?);
  INSERT INTO oltasok(oltasneve) VALUE(?);
  INSERT INTO kutyakoltasok(kutyaId,oltasId) VALUE(?,?);

#-Táblák módosítása
  UPDATE esemenyek SET esemeny = ? WHERE esemenyId = ?;
  UPDATE fajtak SET fajta = ?, fajtaLeiras = ?, gondozas = ? WHERE fajtaId = ?;
  UPDATE kutyak SET nev = ?,fajtaId = ?, szuletes = ?,suly = ?,magassag = ?, foto = ?,ertek = ? WHERE kutyaId = ?;
  UPDATE kutyanaplo SET kutyaId = ?, datum = ?, esemenyId = ? WHERE kutyaNaploId = ?;
  UPDATE oltasok SET oltasneve = ? WHERE oltasId = ?;
  UPDATE kutyakoltasok SET kutyaId = ? AND oltasId = ? WHERE kutyaId = ? AND oltasId = ?;



#-Táblasor törlése
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

  #KutyaNaplóTábla
    SELECT kn.kutyaNaploId,k.nev,kn.datum, e.esemeny FROM kutyanaplo kn
      INNER JOIN kutyak k ON k.kutyaId = kn.kutyaId
      INNER JOIN esemenyek e on e.esemenyId = kn.esemenyId;

    #Fajtakeresés
  SELECT * FROM fajtak f
    WHERE f.fajta LIKE ?;

  #Kutyakeresés
    SELECT * FROM kutyak k 
      WHERE k.nev LIKE ?;
