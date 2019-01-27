CREATE DATABASE XarxariaDB;

GO

-- Suppression des tables
DROP TABLE IF EXISTS Enemy;
DROP TABLE IF EXISTS Player_Item;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Page;
DROP TABLE IF EXISTS Inventory;

-- Cr�ation des tables
CREATE TABLE Enemy (
	id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	hp INT,
	force INT,
	armor INT,
	agility INT,
	luck INT,
	name VARCHAR(255),
	image VARCHAR (255)
)

CREATE TABLE Page (
	id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	title VARCHAR(255),
	text text,
	image VARCHAR(255)
)

CREATE TABLE Player (
	id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	hp INT,
	force INT,
	armor INT,
	agility INT,
	luck INT,
	name VARCHAR(255),
	inactiveLinks INT,
	idActualPage INT FOREIGN KEY REFERENCES Page(id),
)

CREATE TABLE Item (
	id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	name VARCHAR (50),
	hp int,
	force int,
	armor int,
	agility int,
	luck int
)

CREATE TABLE Player_Item (
	idPlayer INT FOREIGN KEY REFERENCES Player(id),
	idItem INT FOREIGN KEY REFERENCES Item(id),
	quantity INT
)

-- Insertion des donn�es --
INSERT INTO Page (title, text, image) VALUES
-- Page 1 --
('Introduction', 'C''est l''histoire d''un pays tranquille. Un jour, un vilain drake kidnappe une des princesses du royaume.
Le Roi, furieux, convoque tous ses chevaliers de la table ovale.
Malheureusement, tous les chevaliers sont en croisade dans le pays voisin.
Fort heureusement, il reste encore un chevalier � la cour, le fameux Sir Godfroyd de Monaco. C''est le chevalier le plus valeureux de tout le royaume.
Il a d�j� prouv� sa valeur � de nombreuse reprises en sauvant moultes princesses.
Le courageux chevalier est tr�s d�cid� � sauver la princesse disparue. Il d�pense toutes ses �conomies et ach�te le meilleur �quipement du royaume pour sa qu�te.
Quelques lieues apr�s �tre sorti du ch�teau, il est frapp� par ce qui lui semble �tre un �clair. Une grande ombre noire d�chirant les cieux � une vitesse vertigineuse le renverse. Il est violemment �ject� de la route et finit dans un caniveau boueux.
Apr�s avoir repris ses esprits, il aper�oit une b�te ail�e s''�loigner, le drake. Il se rend compte que son �quipement a enti�rement disparu. C''est sans doute l''oeuvre de la magie noire du drake.
Il a eu beaucoup de chance de s''en r�chapper vivant.
C''est l� que votre aventure commence, vous �tes ce chevalier.
<0,Continuer,3>'
, 'paysage.jpg'),

-- Page 2 --
('Liste des actions', 'Liste des actions :
0 Changement de page
1 Modifier un objet
2 Modifier les pv
3 Mettre la force
4 Modifier l armure
5 Modifier l agilit�
6 Modifier la chance

<1,Ajouter 3 pi�ces d or,14;3>
<1,Supprimer 2 pi�ces d or,14;-2>
<2,Gagner deux pv,2>
<2,Perdre un pv,-1>
<3,Mettre la force � deux,2>
<4,Ajouter 2 d''armure,2>
<4,Enlever 1 d''armure,-1>
<5,Gagner deux d agilit�,2>
<5,Perdre un d agilit�,-1>
<6,Gagner deux de chance,2>
<6,Perdre un de chance,-1>
<0,Allez � la page 3 (Le commencement,3>', 'paysageAvecPortail.jpg'),

-- Page 3 --
('Le commencement', 'Vous vous relevez avec le peu de dignit� qu''il vous reste. Pendant une seconde vous pensez retournez au ch�teau pour retrouver de l''�quipement. Mais vous vous ravisez, avec une telle d�gaine, vous ne passerez jamais les grilles du ch�teau.
Et retourner voir le Roi � peine 1 heure apr�s �tre sortit pour sauver sa fille, quel honte !
De toute fa�on vous arriverez � trouver du nouvel �quipement, apr�s tout vous �tes le meilleur chevalier du pays !
A pr�sent il vous faut du mat�riel, que voulez-vous faire ?
<0,Continuer vers le village,11>, � la sortie du ch�teau ou <0,oublier son honneur et aller au ch�teau,4>', 'villageEtChateau.jpg'),

-- Page 4 --
('Oublier son honneur et aller au ch�teau', 'Finalement vous vous r�signez � retourner au ch�teau. Combattre un drake avec uniquement de l''�quipement trouv� sur la route est une mauvaise id�e.
Vous faites le chemin inverse et apercevez que deux gardes royaux ont �t� post�s � c�t�s de la grille du ch�teau. Une fois � l''int�rieur de la grande cour, vous pourrez facilement passer vers les quartiers du Roi gr�ce � un passage secret qui y m�ne directement.
Le ponts levis est abaiss� et vous pourriez vous approcher des gardes et esp�rer qu''ils vous laissent passer. Vous �valuez la situation et vous vous souvenez du vieux mur ouest qui s�pare la cour du monde ext�rieur.
Ce mur du ch�teau est mal entretenu et de solides lianes ont investi la paroi. Vous connaissez l''endroit et vous savez que le Roi n''entretient que les murs les plus visible pour ne pas montrer que le royaume est ruin�. Vous pouvez tenter d''escalader le mur en vous aidant des lianes mais c''est plut�t risqu� car la muraille doit bien faire 5 m de haut.
Apr�s quelques minutes suppl�mentaires, aucun autre moyen d''entrer dans le ch�teau ne vous vient � l''esprit.
Vous devez choisir entre <0,passer par l''entr�e principale,8> en esp�rant que les gardes vous reconnaissent ou <0,escalader le mur,5> en esp�rant que les lianes ne l�chent pas.
Vous pouvez aussi choisir de <0,rebrousser chemin(continuer au village),11>', 'chateau.jpg'),

-- Page 5 --
('Escalader le mur du ch�teau', 'Vous fa�tes un grand d�tour pour ne pas que les gardes vous voient et vous vous approchez discr�tement de la muraille.
Vous regardez le haut du mur que vous vous �tes d�cid� � grimper. De l�, il a l''air bien plus imposant.
Vous vous �chauffez les articulations en appr�hendant la mont�e qui vous attend, vous ne percevez aucun garde patrouillant le long du mur.
Apr�s avoir choisi le parcours avec les plus grosses lianes, vous entamez l''escalade avec �nergie. Vous aviez d�j� eu affaire � des parois escarp�es auparavant et cette grimpette ne vous semble pas si difficile.
Soudain, vous sentez que vous perdez prise.
Si vous �tes assez agile pour vous rattraper *(4 points d''agilit� ou plus)*, rendez-vous <0,ici,7>. Si vous �tes un peu plus pataud, alors allez <0,ici,6>.
', 'murailleAvecLierre.jpg'),

-- Page 6 --
('Vous n''arrivez pas � escalader le mur', 'Vous vous accrochez de toute vos forces aux lianes.
Cependant vous semblez quand m�me tomber, ce ne sont pas les lianes qui vous l�chent mais la brique !
Vous chutez in�vitablement et essayez de trouver une position pour moins morfler � l''atterrissage. Vous vous ramassez par terre en tombant sur les fesses et <2,perdez 2 points de vie,-2>.
Par chance la brique qui a chut� avec vous retombe un m�tre sur votre gauche et non sur votre t�te. Par contre elle cause un bruit tr�s fort et soudain qui a � coup s�r alert� les gardes.
Vous vous relevez p�niblement et vous entendez des cris. Les gardes vous ont rep�r�s. Ils sortent leurs armes et vous ordonne de vous rendre.
Vous courez � toute allure en direction du village sans parvenir � semer les gardes.
D�cid� � leurs �chapper, vous sautez dans ce qui vous semble �tre la meilleur cachette � l''heure actuelle : le caniveau.
Vous bondissez dans la rigole et vous vous tapissez au fond en ayant presque de l''eau jusqu''� la bouche. Vous apercevez les gardes en haut depuis votre planque. Votre cachette fonctionne � merveille, vous �tes invisible pour eux.
Apr�s quelques minutes les deux gardes abandonnent la poursuite, �a tombe bien vous commenciez � avoir froid. Vous sortez du caniveau apr�s �tre s�r que les gardes soient partie et vous vous nettoyer du mieux que vous pouvez avec la v�g�tation alentoure.
Vous ne pouvez d�cemment pas retentez d''entrer dans le ch�teau en passant par la grille principale car les gardes vous reconna�tront et vous chasserons.
Vous devez donc <0,continuer votre route en direction du village,11> pour d�nicher des informations sur le drake.', 'chuteDuMur.jpg'),

-- Page 7 --
('Vous r�ussissez � grimper le mur', 'In extremis, vous l�chez la prise de votre main droite et bondissez en for�ant sur vos jambes pour atteindre le sommet de la muraille. Il s''en est fallu de peu, car ce n''est pas les lianes qui vous ont l�ch�es mais une brique de la muraille. Vous craignez que le bruit ait attir� les gardes, alors vous devez faire vite.
Vous vous hissez p�niblement pour atteindre le haut du mur et appr�ciez alors votre nouvelle vue de la splendide cour du ch�teau entour�e de sa muraille de roche de luxe. Vous savez que ce ch�teau ne sert qu''aux visites diplomatiques et qu''il est strat�giquement obsol�te.
A pr�sent, il vous faut passer par le passage secret � l''int�rieur de la cour. Vous remarquez une �norme botte de foin juste en bas de la muraille, c�t� int�rieur, cela sera parfait pour amortir votre chute.
Vous sautez gracieusement tel un assassin et atterrissez en douceur sur le lit de paille.
Vous vous dirigez rapidement vers l''arri�re de l''�curie et red�couvrez la trappe secr�te d�sormais couverte de v�g�tation.
Vous d�gagez les plantes et ouvrez la trappe avec difficult�. Vous glissez avec lenteur dans ce tunnel �troit et compl�tement sombre pendant 5 bonnes minutes avant de t�ter la sortie des doigts.
Vous ouvrez avec vitalit� la sortie pour r�cup�rer un peu d''air frais. Alors que vous vous �tirez, vous constatez que vous n''�tes pas dans la chambre du Roi mais dans celle de ses filles.
Vous reconnaissez instantan�ment toutes les princesses : Am�lia, Anastasia, Amanda, Anna, Aphrodita, Adelinda, Agatha, Adriana, Antonella, Ang�lica, Alessandra, Antoinetta et Angella. Il manque Anabella, la princesse que vous �tes charg� de sauver.
Vous semblez avoir interrompu les princesses pendant qu''elles se coiffaient mutuellement. Elles forment un cercle autour de vous.
- "Aaah, alors c''est � �a que servait cette trappe.", lan�a Amanda.
- "Nous sommes toutes ravies de vous revoir Sir !", continua Anna.
- "Vous allez sauver notre soeur pas vrai ?", s''inqui�ta Alessandra.
- "Encore merci de m''avoir sauv�e de cette ogre l''autre fois !", s''exclama Adelinda.
Apr�s d''autres acclamations, vous expliquez la situation et Am�lia vous r�ponds :
- "Notre p�re est occup� avec ses bibelots, c''est � croire qu''il se soucie plus de son armure que de nous ..."
Toutes les princesses prennent une mine triste et, apr�s un court silence, Anastasia reprends la conversation :
- "Il ne vous donnera pas d''�quipement de qualit�, cependant nous pouvons vous donner ceci :"
Antonella s''empresse de regarder sous un lit pour y sortir avec l''aide d''Aphrodita <1,une hache d''armes en acier tremp�,9;1> (<3,Passe votre attaque a 8,8>).
Apr�s de chaleureuses salutations, Agatha vous montre un autre passage secret qui m�ne directement � l''ext�rieur du ch�teau.
<0,Vous partez en direction du village,11>, bien d�cid� � sauver Anabella.
', 'courDuChateau.jpg'),

-- Page 8 --
('Passer par l''entr�e principale', 'Vous d�cidez d''aller directement vers la porte principale en esp�rant que les gardes vous laissent entrer, ils reconna�tront s�rement le meilleur chevalier du royaume.
Il y en a un tout gros et un tout maigre, le premier p�se sans doute le double du deuxi�me. 
Vous vous lancez sur le pont levis d''un pas d�cid�. Au fur et � mesure de votre avanc�e, les gardes vous d�visagent de plus en plus.
Vous vous rappelez que vous sentez encore les excr�ments et que vous �tes un peu tremp�. C''est alors que vous vous souvenez que les gardes ont pour ordre de chasser les mendiants de l''enceinte du ch�teau.
Vous appr�hender moins bien la situation et une fois � la hauteur des gardes le plus maigre vous adresse la parole d''un ton agressif :
- "Z''�tes qui et qu''est-ce que vous faite l� ?, c''est pas pour les mendiants ici"
Vous r�torquez en �tant faussement s�r de vous :
- "Je suis Sir Godfroy de Monaco, je vous ordonne de me laisser passer !"
Si vous avez *au moins 4 points de chance*, rendez-vous <0,ici,9> et si vous �tes malchanceux, <0,rendez-vous � cette page,10>.
', 'garde.jpg'),

-- Page 9 --
('Les gardes vous reconnaissent', 'Imm�diatement, les gardes se raidissent et le plus maigre vous dit :
- "Oh, navr� Sir je ne vous avais pas reconnu, je vous en pris entrez"
Soulag�, vous imitez un air de d�dain et entrez � grand pas dans la cour.
Les nobles vous d�visagent pendant que vous vous dirigez rapidement vers la salle du tr�ne. �tonnamment il n''y a aucun autres gardes � l''int�rieur et vous pouvez entrer sans probl�me dans la chambre du Roi.
Vous frappez contre la porte et vous entendez une voix famili�re :
- "Encore vous ?! Je vous ai dit que je n''�tais pas int�ress� � vendre le Royaume !"
Vous ouvrez la porte et entrez.
- "Sir Godfroyd ? ... Mais que vous est-il arriv� ? Je croyais que c''�tait encore ces foutus marchands de Capital +"
Vous surprenez le Roi en train de polir son casque en or. Sa chambre est extr�mement bien d�cor�e compar� au reste du ch�teau. Une immense vitrine ouverte contenant un �quipement complet en or tr�ne en face de son lit � baldaquin.
Il vous regarde d''un air ahuri et vous r�torquez:
- "Je me suis fait directement attaqu� par le drake � la sortie du ch�teau. Il m''a renvers� et a utilis� sa magie noire pour faire dispara�tre tout mon �quipement."
Il se remet � astiquer son casque et prend un air d�sint�ress�.
- "Ah ce maudit drake, il attaque de plus en plus pr�s... En quoi puis-je vous �tre utile ?"
- "J''aurais besoin d''�quipement pour tuer le drake et sauver votre fille Anabella. Toutes mes �conomies �taient pass� dans mon armure, mon arme et mon cheval."
- "Oui, je vois mais... Tu sais que le royaume n''est pas au top niveau finances, je vais voir ce que je peux te pr�ter."
Il saisit un vieux coffre sous son lit et en sort un plastron et une arme.
- "C''est tout ce que je peux me permettre de te pr�ter, tiens et n''oublie pas de me les rendres, hein."
Vous recevez <1,un plastron en fer rouill�,0;1> (<4,armure + 2,2>) et <1,une �p�e d''entrainement,13;1> (<3,passe votre force � 4,4>). Apr�s de br�ves salutations, vous reprenez votre route <0,vers le village,11> � la sortie du ch�teau.', 'chambreRoi.jpg'),

-- Page 10 --
('Les gardes ne vous reconnaissent pas', 'Apr�s un long moment g�nant, le plus gros des gardes reprend la conversation :
- "Ordre. Halte. Clodo."
L''autre garde continue :
- "Vous pouvez pas rester ici m''sieur, partez maintenant"
Il vous jette <1,une pi�ce d''or,14;1> au visage et les deux gardes l�vent leurs armes.
Dans une derni�re tentative vous dites :
- "Vous ne me reconnaissez pas ?, Godfroyd le meilleur chevalier du royaume, j''ai sauv� un tas de princesse !"
Vous semblez �tre la seul distraction de ces deux gardes depuis longtemps, ils vous poussent et vous menace de leurs armes :
- "Dehors l''ivrogne ! La seul chose que vous pourriez sauver c''est une bouteille de vin"
Vous commencer � courir quand vous remarquez que les deux gardes se mettent � vous suivre. Non, il vous poursuive !
Vous courrez pendant au moins 3 quart d''heure en direction du village, Finalement vous parvenez � semer les gardes, ils rebroussent chemin en vous injuriant.
Vous reprenez votre souffle. Pas question de retourner au ch�teau avec ces deux gardes aux aguets.
Vous devez donc <0,explorer le village,11> � la recherche d''indice pour savoir o� s''est envol� le drake qui vous a attaqu� r�cemment, peut-�tre que les villageois l''ont vu passer.', 'fuite.jpg'),

-- Page 11 --

('Casse-Roc', 'Vous vous dirigez donc vers le village situ� � la sortie du ch�teau.
C''est un petit hameau tranquille nomm� Casse-Roc o� les habitants sont principalement des mineurs. Il y a de grandes carri�res de pierre tout autour du village. Non en faite... le village est une carri�re de pierre !
Vous n''avez jamais mis les pieds ici car vous �tes toujours au ch�teau ou en croisade dans les pays voisins. Cependant vous avez entendu des rumeurs sur cette endroit. Un jour un petit feu s''est d�clar� et la quasi-totalit� du village s''est embras� car toutes les maisons �taient en bois � l''�poque. La plupart des habitants �taient � la rue. Depuis ce jour les habitants se sont mis � construire leur maison directement dans la roche et maintenant le village vit de l''extraction de la pierre.
Vous remarquez aussi que l''int�gralit� du village est abaiss� d''une dizaine de m�tres dans le sol. L''extraction massive de pierre doit en �tre la cause, en effet pendant que vous marchez, vous croisez des mineurs qui creusent directement sur le sol du village.
Le village est principalement un terrain vague peupl� de mineurs acharn�s. Il y a beaucoup de personnes et beaucoup d''agitation avec les �clats de pierre et les pioches qui volent dans tous les sens. Des rails, en pierre, ont �t� install�s pour faciliter les all�es et venues incessantes de wagons remplis de roche.
Ce qui vous perturbe le plus est l''omnipr�sence de la roche dans ce village. Les pioches, les wagons, les poteaux, les banderoles, les b�timents et m�me les casquettes des habitants sont en pierre ! Vous vous sentez rassur� en voyant un habitant manger des pommes de terre.
Comme vous aviez pr�vu initialement, vous devez trouver des informations concernant le drake, vous devez maintenant choisir ce que vous allez faire :
(Toutes les actions ne sont possibles qu''une seul fois � part le quartier marchand)
<0,Aller dans le quartier marchand,12>
<0,Interroger les villageois,13>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Piller l''�glise,15>
<0,Essayer de trouver du travail,20>'
, 'casseRoc.jpg'),

-- Page 12 --
('Le quartier marchand', 'Vous vous promener un peu et vous trouvez un quartier marchand. A pars quelques mineurs � la t�che, le march� est quasiment d�sert. Il fait encore t�t donc cela ne vous �tonne pas trop.
Vous remarquez que toute l''�conomie locale est bas�e sur la pierre. Des bijoux aux ustensiles de cuisine, la plupart des articles sont en pierre. 
Vous passez devant un marchand itin�rant qui semble proposer du mat�riel int�ressant :
<1,Acheter l'' �trange perle luisante en bleu,15;1> en <1,payant 1 pi�ce d''or,14;-1>
<1,Acheter de l''eau b�nite,16;1> en <1,payant 1 pi�ce d''or,14;-1>
Alors que vous pensez reconna�tre les briques du ch�teau dans une �choppe de ma�onnerie, vous trouvez enfin une boutique int�ressante, l''armurerie.
C''est le plus petit magasin du march� avec ce qui semble �tre le forgeron du village au vue de son tablier et de l''enclume en pierre derri�re lui. Vous n''�tes plus surpris que les articles propos�s sont exclusivement fait en pierre.
Les objets suivants sont pr�sent�s sur l''�tale du marchand :
<1,Acheter une massue en pierre,11;1>(<3,Votre force passe � 6,6>) en <1,payant 4 pi�ces d''or,14;-4>
<1,Acheter une casquette de mineur en pierre,1;1>(<4,Vous gagnez 1 armure,1>) en <1,payant 2 pi�ces d''or,14;-2>
<1,Acheter une dague en pierre,12;1>(<3,Votre force passe � 4,4>) en <1,payant 2 pi�ces d''or,14;-2>
Une fois vos achats effectu�s, vous pouvez :
<0,Interroger les villageois,13>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Piller l''�glise,15>
<0,Essayer de trouver du travail,20>'
, 'forgeron.jpg'),

-- Page 13 --
('La Taverne du mineur assoif�', 'Vous savez que le meilleur moyen d''obtenir des informations se trouve dans les tavernes.
Sans attendre un instant de plus vous vous dirigez vers un b�timent nomm� selon la banderole plac�e devant "La taverne du mineur assoiff�".
Vous �tes accueilli par la douce chaleur d''un feu de chemin�e ainsi que par le brouhaha si commun � un lieu de ce genre. Vous vous frayez difficilement un chemin � travers les client pour finalement vous asseoir devant le comptoire et interpeller le tavernier.
Un chauve de grande taille s''approche de vous, une chope en pierre � la main et vous dit :
- "Que puis je faire pour vous mon brave ?"
Vous lui r�pondez :
- "Un drake est pass� par ici ce matin, sauriez-vous dans quelle direction est-il parti ?"
- "Ma femme a remarqu� une b�te ail�e s''�loigner vers le nord-ouest."
- "Auriez vous une id�e d''ou elle aurait put aller ?"
- "Il n''y qu''un seul endroit en ce monde qui puisse accueillir un tel monstre : L''Antre des T�n�bres."
Vous r�primez un frissonnement, vous avez entendu tant de choses sur cet endroit, on dit que le soleil ne perce jamais ses nuages, que de la lave en fusion coule en permanence des collines et que seul les damn�s osent entrer dans les tours sombres qui hantent ce lieu.
Mais apr�s tout n''�tes-vous pas Sir Godfroy de Monaco, le champion du roi, le pourfendeur de d�mons, ce n''est pas un volcan ou un gros l�zard qui vous fera douter de votre mission.
Vous remerciez le barman et quittez la taverne. ,Vous pouvez d�sormais reprendre votre chasse au drake en <0,quittant le village,23> ou continuer de vagabonder dans Casse-Roc :
<0,Aller dans le quartier marchand,12>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Piller l''�glise,15>
<0,Essayer de trouver du travail,20>'
, 'taverne.jpg'),

-- Page 14 --
('Mendiant', 'Vous devez trouver de l''or mais vous savez que vous n''arriverez pas � trouver un travail, il ne vous reste plus qu''une solution : mendier.
C''est avec honte que vous vous v�tissez d''un haillon en pierre gisant sur le sol et que vous rejoignez un groupe de sans-abris.
Durant plusieurs jours vous vous tra�nez dans les rues suppliant la g�n�rosit� des passants.
Votre errance vous rapporte <1,3 pi�ces d''or,14;3>, une grande quantit�e de cailloux au visage et vous fait perdre <2,2 PV,-2> � cause de la fatigue.
Vous devez d�sormais continuer :
<0,Aller dans le quartier marchand,12>
<0,Interroger les villageois,13>
<0,Piller l''�glise,15>
<0,Essayer de trouver du travail,20>'
, 'mendiant.jpg'),

-- Page 15 --
('L''�glise', 'Vous savez que l''�glise de casse roc est connue pour entreposer des richesses extraites des mines. En voler une partie vous permettrai de vous racheter un �quipement.
Vous inspectez le b�timent et rep�rez le grand vitrail � l''arri�re. Il a l''air tr�s ancien au vu de l''agglom�ration de verre en bas du cadre. Vous examinez les alentours pour v�rifier qu''il n''y ait pas de t�moins �ventuels, l''endroit est isol� et vous pourrez agir en toute discr�tion. Apr�s un rapide coup d''oeil vous remarquez sous l''autel un panier en osier qui doit certainement servir pour les donations. Il est vide mais une porte surveill� par un garde � moiti� endormi se trouve au fond de l''�glise, les biens pr�cieux doivent s�rement se trouver � l''abri des regards.
Une fois la nuit tomb�e, vous prenez une pierre et brisez la fen�tre pour vous infiltrez. L''impact fait moins de bruit que pr�vu, vous entrez lentement � l''int�rieur de l''�glise quand vous entendez soudainement des bruits de pas.
Malgr� l''heure tardive, vous apercevez des pr�tres et des chevalier d�ambuler � travers les couloirs.
Si vous avez *plus de 4 d''agilit�* et *plus de 3 de chance* rendez-vous <0,ici,16>, si malheureusement vous �tes un pi�tre voleur, rendez vous <0,ici,17>.', 'eglise.jpg'),

-- Page 16 --
('Voleur d''�glises', 'C''est avec l''agilit� du serpent que vous vous glissez derri�re une statue et �vitez les occupants.
Plaqu� contre le mur, vous traversez les diff�rents couloirs de l''�glise jusqu''� atteindre la porte du coffre. Malheureusement un garde est post� devant et il serait impossible de l''affronter sans alerter les chevaliers et les pr�tres. 
Cela ne vous d�courage pas, vous prenez une coupe en pierre qui tra�nait par l� et la lancez dans un couloir � c�t�.
La garde sursaute et se pr�cipite dans le couloir en se lan�ant � lui-m�me :
- "Eh...Y''a quelqu''un ?"
Vous profitez de l''opportunit� pour sprinter dans la caverne d''ali baba.
Vous n''�tes pas d��u, la salle est remplie de diverses richesses : des croix serties de pierres pr�cieuses, des �p�es faites de diamant, des coffres d�bordant d''or, etc.
Vous �tes tellement obnubil� par ce tr�sor que vous ne remarquez pas votre pied butter contre un fil tendu.
Soudainement vous entendez le bruit d''un m�canisme se mettre en marche suivi du lourd son d''une cloche, toute l''�glise doit �tre d�sormais au courant qu''il y � un voleur.
Vous vous pr�cipitez vers la fen�tre pr�c�demment d�truite, emportant avec vous la seul bourse que vous avez eu le r�flexe de prendre dans votre fuite.
Par chance vous ne rencontrez personne durant votre escapade et vous parvenez � quitter l''�glise en un seul morceau, emportant avec vous <1,20 pi�ces d''or,14;20>, une somme rondelette.
Vous devez faire profile-bas maintenant, que choisissez vous de faire ?
(Toutes les actions ne sont possibles qu''une seul fois � part le quartier marchand)
<0,Aller dans le quartier marchand,12>
<0,Interroger les villageois,13>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Essayer de trouver du travail,20>'
, 'tasDOr.png'),

-- Page 17 --
('Pi�tre voleur', 'Vous tentez de vous glisser vers une statue mais c''est un �chec. Sans attendre un moment, les paladins se jettent sur vous et vous immobilisent.
Ils vous emm�nent sans plus tarder et vous balancent dans une cellule de la prison de Casse-Roc.
Tenter de piller une �glise est un crime grave mais heureusement un pr�tre arrive pr�s de votre cellule. Il est pr�t � vous pardonner mais ce ne sera pas gratuit. Il demande *8 pi�ces d''or*. Souhaitez-vous <1,payer les 8 pi�ces d''or,14;-8> pour <0,�tre lib�r�,19> ou <0,refuser,18> ?'
, 'prison.jpg'),

-- Page 18 --
('Prison � vie', 'Le pr�tre vous lance un regard de m�pris et quitte votre cellule. Vous �tes un chevalier du roi, vous ne tarderez pas � �tre lib�r�.
Vous attendez des heures puis des jours, puis des mois. C''est � ce moment que vous vous rendez compte que le pr�tre �tait votre seule chance de sortie, personne d''autre ne viendra.
C''est ainsi que fini votre espoir d''�tre lib�r� ainsi que votre vie <2,(vous perdez 50 pv),-50>.'
, 'mortEnPrison.jpg'),

-- Page 19 --
('Lib�r�, d�livr�', '- "Vous avez fait le bon choix Sir Godfroy."
Dit le pr�tre non sans un sourire de satisfaction sur le visage.
Les gardes vous emm�ne dans une salle avec toutes vos affaires hormis les 8 pi�ces d''or prisent par le pr�tre. Vous exprimez un soupire de soulagement en voyant la lumi�re du jour et les toits de pierre du village.
Maintenant que vous �tes libre, que faites-vous ?
<0,Aller dans le quartier marchand,12>
<0,Interroger les villageois,13>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Essayer de trouver du travail,20>'
, 'libre.jpg'),

-- Page 20 --
('A la recherche d''un emploi', 'Si vous voulez avoir de l''or, pas le choix, il faut travailler.
Vous rejoignez la grande place et consultez le panneau des annonces � la recherche d''une offre int�ressante.
Le gros du panneau est occup� par les offres des deux grande factions marchandes : Capital + et La Faucille Rouge.
Si vous avez *plus de 4 de chance*, allez <0,ici,22>, sinon allez <0,ici,21>.', 'annonces.png'),

-- Page 21 --
('Ch�mage', 'Vous parcourez le village pendant des heures en esp�rant trouver du labeur. Malgr� toutes vos recherches vous ne trouvez aucun habitant qui aurait besoin d''aide. Il semblerait que tous les travaux manuels soient occup�s, le business de la pierre est d�cid�ment florissant.
Malheureusement vous n''avez pas r�ussi � trouver une quelqu''on offre qui pourrait vous aider.
Que faites-vous maintenant ?
<0,Aller dans le quartier marchand,12>
<0,Interroger les villageois,13>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Piller l''�glise,15>'
, 'sansTravail.png'),

-- Page 22 --
('Un dur labeur', 'Au milieu de tous ces papiers vous apercevez dans le coin une affiche proposant un travail dans un atelier de tailleur de pierre.
Vous travaillez durant quelques jours au milieu des pierres et des statues , votre r�le est surtout de cr�er et transporter des briques n�cessaires � la construction c''est un travail particuli�rement �prouvant car les briques sont tr�s lourdes et les horaires sont �pouvantables.
Finalement vos efforts s''av�rent �tre payant : vous obtenez <1,10 pi�ces d''or,14;10>.
Maintenant que vous avez de l''argent que faites vous ?
<0,Aller dans le quartier marchand,12>
<0,Interroger les villageois,13>
<0,Mendier pour essayer d''obtenir de l''or,14>
<0,Piller l''�glise,15>'
, 'gagnerArgent.png'),

-- Page 23 --
('Quelle direction ?', 'Vous vous dirigez vers la sortie est du village.
La porte du village est gard�e par deux soldats de la milice local, c''est du moins ce que vous pensez au vu de leurs armures. Ils vous laissent sortir sans probl�me du hameau et vous empruntez le chemin qui m�ne vers l''est.
Alors que vous continuez votre route sur ce sentier, le chemin se s�pare en deux routes biens distincts. Un panneau plant� au milieu de l''intersection indique les deux itin�raires possibles :
- For�t jolie
- Marais de la mort
Il n''y a pas d''autre passages vers l''est du pays � part en faisant un tr�s long d�tour qui prendrait un temps fou, ce que vous ne pouvez pas vous permettre car la vie d''une princesse est en jeu !
Il faut vous h�ter, dans quelle direction vous dirigez-vous ?
<0,La For�t jolie,24>
<0,Les Marais de la mort,36>'
, 'panneauDirection.jpg'),

-- Page 24 --
('La For�t jolie',
 'Apr�s avoir parcouru un chemin de campagne, vous apercevez enfin la lisi�re de la For�t jolie.
Vous prenez de la hauteur pour scruter les environs et voyez enfin ce que vous cherchiez : le l�gendaire Arbre de la vie.
En effet, au milieu de la for�t, surplombant les autres, se tient l''arbre le plus grand que vous n''avez jamais vu, il doit mesurer facilement dans les 200 m�tres et semble bien plus �g� que le pays lui-m�me.
Vous vous souvenez des histoires de votre oncle Barnab� : un arme l�gendaire repose dans l''arbre mais seul les plus valeureux sont autoris�s � mettre la main dessus. Cela ne devrait pas �tre un probl�me, vous avez d�j� prouv� votre valeur � de multiples reprises comme lors du concours annuel du meilleur mangeur de tartes de votre village.
Sans perdre un instant de plus, vous <0,p�n�trez dans les bois,25> plein de confiance.'
, 'foretJolie.jpg'),

-- Page 25 --
('L''attaque des gobelins'
, 'Alors que vous vous dirigez tant bien que mal en direction de l''arbre de la vie vous entendez des bruits �tranges, pas ceux que l''on retrouve dans toutes les for�ts mais plut�t ce qui semble �tre des pas rapides et discrets.
Soudainement, comme si votre h�sitation �tait un signal, des cr�atures surgissent des buissons et du feuillage.
Devant et derri�re vous, se tiennent des petites cr�atures vertes au nez et oreilles pointues, des gobelins !
Malgr� le fait que leur �quipement soit en bien pi�tre �tat, vous savez que leur nombre peut �tre probl�matique.
Celui qui semble �tre le chef s''avance d''un pas vers vous et lance � ses compagnons d''une voix stridente :
- "Allez les gars, faut pas qu''il nous �chappe !"
Sans attendre une seconde de plus les gobelins se ruent sur vous, il faut vous d�fendre !
<8,Combat contre gobelins N�1,1>
<8,Combat contre gobelin N�2,1>
<8,Combat contre chef gobelin,2>
<7,Combat contre gobelin N�3,Suite � la mort de ses compagnions le dernier gobelin prend la fuite.;Gobelin N�3.>
Une fois les gobelins d�faits, vous fouiller leur corps et ne d�couvrez rien de sp�cial hormis un bon petit butin de <1,11 pi�ces d''or,14;11>.
Vous pouvez d�sormais <0,continuer votre route,26>.'
, 'foretJolieInside.jpg'),

-- Page 26 --
('L''Arbre de la vie'
, 'Apr�s quelques heures pass�es au milieu de la v�g�tation, vous atteignez enfin votre destination : l''Arbre de la vie.
Vu dans face, l''arbre est encore plus impressionnant, m�me le ch�teau fait p�le figure compar� � ce colosse de bois et de feuille.
Un calme presque surnaturel r�gnait, comme si la for�t elle-m�me respectait se lieu ancestral.
Mais le plus �trange est la porte incrust�e dans l''�corce de l''arbre. Vous vous approchez et tentez de l''ouvrir mais impossible, la porte est verrouill�e.
Vous regardez autour de vous et semblez distinguer un homme allong� contre un arbre comme s''il dormait.
Peut-�tre sait-il comment rentrer?
Vous d�cidez donc de <0,vous diriger vers lui,27>.'
, 'arbreDeLaVie.jpg'),

-- Page 27 --
('Les �nigmes de l''Ancien'
, 'En vous approchant vous parvenez � mieux appr�hender l''homme ou plut�t le vieil homme. En effet, la figure allong�e devant vous poss�de la plus grande barbe que vous n''avez jamais vue, elle atteint presque le sol et cache une bonne partie de son corps tatou� d''�tranges runes bleues.
Vous vous approchez encore un peu plus et voyez qu''il dort.
Alors que vous vous dirigez lentement vers lui, votre pied marche sur des branches.
Le bruit, bien que l�ger, semble r�veiller le vieillard.
- "Ah vous �tes l�, Sir Godfroy" dit-il calmement.
Le fait qu''il vous connaisse est surprenant car il n''y a m�me pas vu votre visage.
- "Comment connaissez vous mon nom ?"
- "Je suis bien inform�."
Le vieil homme se releva et agrippa un b�ton termin� d''une �trange pierre bleue et lan�a d''un air th��tral :
- "Je suis Allamar l''ancien, gardien des secrets et des tr�sors de l''Arbre de la vie."
- "H� bien, l''ancien, je cherche � p�n�trer dans cette arbre pour y r�cup�rer une �p�e magique."
- "La l�gendaire �p�e du Soleil Levant, elle vous sera utile dans votre humble qu�te si vous voulez d�faire le drake."
Le vieil homme est d�cid�ment au courant de tout.
- "En tout cas, le seul moyen pour vous d''entrer est de prouver votre intelligence en r�solvant mes �nigmes : 
 Quel �tre, pourvu d''une seule voix, a d''abord quatre jambes le matin, puis deux jambes le midi, et trois jambes le soir ?"
Si vous pensez que la r�ponse est : la Mer noire, allez <0,ici,28>.
Si vous pensez que la r�ponse est : un homme, allez <0,ici,29>.
Si vous pensez que la r�ponse est : le Sphinx, allez <0,ici,28>.'
,'vieuxMage.jpg'),

-- Page 28 --
('Mauvaise r�ponse',
'- "Malheureusement c''est une mauvaise r�ponse, d�sol� mais vous ne pourrez pas entrer." r�pondit Allamar.
Avant m�me que vous ne puissiez dire quoique ce soit, le magicien brandit son b�ton et une intense lumi�re bleut�e vous aveugle.
Une fois votre vue retrouv�e, vous constatez avec surprise que vous n''�tes plus en face de l''Arbre de la vie mais au milieu des arbres de la For�t jolie.
Le message est clair, il ne servirait � rien de retourner vers l''arbre de la vie, ce maudit vieillard ne vous laissera pas une deuxi�me chance.
Alors que vous tentez de retrouver votre chemin, vous voyez au loin ce qui semble �tre un homme <0,s''approcher de vous,32>.',
'echecEnigme.jpg'),

-- Page 29 --
('2�me �nigme',
'- "En effet chevalier, mais voici ma deuxi�me �nigme :
j''ai 2 pieds, 4 jambes, 1 bras, 2 t�tes et 4 yeux, qui suis-je ?"
Si vous pensez que la r�ponse est : la Mer noire, allez <0,ici,28>
Si vous pensez que la r�ponse est : une chim�re, allez <0,ici,28>
Si vous pensez que la r�ponse est : un menteur, allez <0,ici,30>',
'hommeVinci.jpg'),

-- Page 30 --
('3�me �nigme',
'- "Juste, voici ma derni�re �nigme :
Qu''est ce qui s''allonge et r�tr�cit en m�me temps ?"
Si vous pensez que la r�ponse est : une chenille, allez <0,ici,28>
Si vous pensez que la r�ponse est : la vie, allez <0,ici,31>
Si vous pensez que la r�ponse est : la Mer noire, allez <0,ici,28>',
'mensonge.png'),

-- Page 31 --
('L''�p�e du Soleil Levant',
'Allamar hocha la t�te de satisfaction et se dirigea vers la porte de bois.
Il sort une cl� de sa barbe et l''ins�re dans la serrure avant de vous inviter � rentrer dans l''Arbre de la vie.
L''int�rieur de l''arbre est aussi impressionnant que l''ext�rieur, les �tag�res de potions et les biblioth�ques sont incrust�es � m�me l''�corce, comme si elles avaient toujours �t� l�.
Au milieu de la salle se tient l''objet de votre qu�te : la l�gendaire �p�e du Soleil Levant.
L''�p�e est pos�e sur pi�destal de bois, imposante et royale, elle semble presque trop lourde et encombrante mais une fois en main, vous constatez avec surprise que son poids correspond parfaitement � vos habitudes.
C''est avec un sentiment de puissance et d''accomplissement que vous d�cidez de quitter l''Arbre de la vie en emportant avec vous cette <1,arme l�gendaire,7;1> (<3,passe votre force � 10,10>).
Vous remerciez le vieillard et vous vous enfoncez dans la for�t jolie.
Alors que vous tentez de retrouver votre chemin, vous voyez au loin ce qui semble �tre un homme <0,s''approcher de vous.,32>',
'epeeLegendaire.jpg'),

-- Page 32 --
('Le bandit de grands chemins',
'Devant vous se tient un colosse fait de muscles au visage masqu�. Cet homme ne vous inspire pas confiance.
- "La bourse ou la vie." dit-il tout simplement.
Vous avez affrontez de nombreux bandit durant votre vie, mais celui-l� est � un tout autre niveau, vous h�sitez presque � accepter son exigence.
Si vous d�cidez de garder votre bourse et de l''affronter, rendez-vous <0,ici,34>.
Si au contraire vous ne souhaitez pas prendre le risque de l''affronter et pr�f�rez c�der votre or, rendez-vous <0,ici,33>.',
'banditRencontre.jpg'),

-- Page 33 --
('Le crime ne paie pas',
'L''affrontement avec ce brigand est une mauvaise id�e, <1,vous donnez votre bourse,14;-50> au bandit non sans lui avoir jet� un regard mauvais.
M�me si vous ne voyez pas son visage, vous imaginez bien son sourire sous ce masque.
- "Merci bien, Monseigneur." dit-il d''un air moqueur avant de d�guerpir.
Vous tentez de vous consoler en vous disant qu''au moins il n''a pas voulu prendre le reste de votre �quipement.
C''est en tentant d''oublier cette perte que vous d�cidez de <0,continuer votre route,41>.',
'vol.png'),

-- Page 34 --
('Stop au vol',
'- "Mauvaise r�ponse ..." dit le malandrin en sortant une hache.
Vous observez plus attentivement votre nouvel ennemi. Il poss�de une musculature tr�s impressionnante ainsi que de multiples cicatrices de tous les �ges. Vous remarquez sur son biceps droit un tatouage en forme de coeur avec �M�re� inscrit dessus ce qui contraste avec l''apparence barbare du voleur.
Vous vous pr�parez � votre tour pour affronter votre agresseur et prot�ger votre vie ainsi que votre bourse.
<8,Combat contre le bandit,3>
Une fois le combat termin�, vous d�cidez de <0,le fouiller,35>.',
'banditHache.jpg'),

-- Page 35 --
('Fouiller le bandit',
'Il est presque �tonnant qu''une telle masse s''effondre devant vous. Le bruit de son poids au contact du sol semble �tre le seul son que vous percevez apr�s lui avoir port� le coup de gr�ce.
Vous ne trouvez rien d''important sur le bandit hormis <1,un anneau en argent,17;1> ainsi qu''<1,un manteau de fourrure,3;1>(<4,augmente votre armure de 1,1>)  qui, � d�faut d''�tre en bon �tat vous permettra de r�sister au froid.
Apr�s votre fouille, vous d�cidez de <0,continuer votre route,41>.',
'manteauFourrure.png'),

-- Page 36 --
('Les Marais de la mort',
'Vous savez que le chemin le plus court pour rejoindre l''Antre des t�n�bres consiste � passer par les Marais de mort. Sans attendre un instant de plus, vous reprenez votre route vers ce lieu maudit.
Apr�s 1 heure de marche, vous entrez dans le mar�cage. C''est avec d�sarroi que vous constatez que la route s''arr�te ici, il faudra continuer dans la boue.
C''est un lieu �trange et hostile, seuls de faibles rayons de lumi�re perce le feuillage des arbres tordus qui hantent le paysage. L''eau a un teint verd�tre et, � certains endroits, une sorte de fum�e s''en d�gage. Vous avez entendu dire que ces derni�res sont toxiques, c''est donc avec une certaine prudence que vous continuez votre route.
Apr�s ce qui vous semble �tre une �ternit� � patauger et esquiver les zones toxiques, vous apercevez au loin une lueur qui vous semble �tre d''origine humaine.
Tel un papillon attir� par la flamme d''une bougie, vous vous dirigez vers cette lumi�re.
Comme vous vous en doutiez, la lueur provient bel et bien d''une habitation. En effet, une vieille cabane est pos�e au milieu de l''eau.
Alors que vous vous approchez du minuscule cabanon, l''eau se met soudainement � bouillir et vous voyez une forme s''�lever.
Vous �tes frapp� d''horreur car devant vous se tient une abomination faite d''ossements et � la forme vous faisant penser � une araign�e. Une �trange lumi�re violette brille entre les diff�rents ossements, les maintenants reli�s entre eux.
Vous calmez votre peur et cherchez une solution, si vous avez de *l''eau b�nite*, allez <0,ici,37>, sinon rendez-vous <0,ici,38>.',
'maraisDeLaMort.jpg'),

-- Page 37 --
('Mort aux impies !',
'Vous vous souvenez que vous avez de l''eau b�nite sur vous. Vous savez que ce genre de liquide est r�put� pour son efficacit� contre les cr�atures impies mais vous ne savez pas si ce sera suffisant.
Vous fouillez dans votre sac, prenez la fiole et attendez d''�tre � port�e.
La cr�ature s''approche de vous dans un effrayant craquement d''os.
Sans perdre un instant de plus, <1,vous lancez l''eau b�nite,16;-1> sur le monstre et esp�rez que cela fonctionne.
Au contact de la substance divine, la chose se met soudainement � trembler de tout son corps squelettique en poussant un cri terrifiant avant de s''effondrer lourdement dans la vase.
Vous poussez un soupire de soulagement et d�cidez de <0,vous diriger vers la cabane,39>.',
'eauBenite.jpg'),

-- Page 38 --
('Mort aux impies !',
'Elle se d�place plus ais�ment que vous sur la vase et vous ne pourrez pas la distancer. Vous ne voyez aucun moyen d''�chapper � cette chose, il n''y a donc pas d''autre option que de l''affronter directement.
Vous tentez de vous rassurer en vous disant que ce n''est pas la premi�re fois que vous affrontez une cr�ature vraisemblablement magique.
Vous attendez donc calmement que la cr�ature soit � port�e pour finalement attaquer.
<8,Combat contre l''araign�e squelette,4>
Une fois cette cr�ature vaincue, <0,vous vous dirigez vers la cabane,39>.',
'araigneeSqueletteRencontre.png'),

-- Page 39 --
('La cabane perdue au fond des bois',
'Situ�e au milieu de racines tortueuses, la cabane est dans un piteux �tat. De la mousse verte s''est empar� des lieux, cependant la fum�e d''une chemin�e trahit la pr�sence d''un occupant.
En tendant bien l''oreille, vous remarquez des bruits de m�tals qui s''entrechoquent et des liquides qui sont vers�s.
Vous d�cidez de frapper � la porte de la myst�rieuse habitation, curieux de savoir qui peut bien vivre dans un endroit pareil. Vous toquez 2 fois fermement.
Le petit vacarme s''arr�te brusquement et vous entendez des bruits de pas se rapprocher de la porte. L''individu entrouvre la porte de fa�on � ce que vous ne l''identifier pas et vous r�pond :
- "Que fa�tes vous-ici ?" dit-il s�chement
- "J''ai besoin d''information, cela fait des heures que je cherche � rejoindre la toundra au nord-ouest, j''aimerais savoir si il y a une route pr�s d''ici."
Le demeurant ferme la porte. Pendant un instant vous pensez qu''il vous signifie un refus, mais la porte se rouvre enfin. A votre grande surprise l''occupant de l''habitation n''est pas un homme.
C''est une vieille dame, trapue et plut�t grosse. Sa peau est couverte de ride et son visage est parsem� de grosses verrues noires. Si vous deviez d�crire une sorci�re, elle ferait le mod�le parfait.
- "Entrez donc, je vais vous pr�parer un th�." dit-elle avec un sourire perturbant.
<0,Rester un moment,40> hors de la boue � �viter les gaz toxiques vous serait tr�s agr�able. Cependant si vous ne voulez pas prendre le risque d''entrer chez une sorci�re vous pouvez tout aussi bien poliment d�cliner et <0,reprendre votre route,41>.',
'maisonDeSorciere.jpg'),

-- Page 40 --
('La sorci�re',
'Vous d�cidez d''entrer dans la cabane. Si cette femme habite r�ellement ici, elle doit surement savoir si il y a un sentier qui passe par ici, cela vous �viterait de marcher dans la boue.
L''int�rieur est bien plus propre que l''aspect ext�rieur et bizarrement il y a beaucoup plus de place que vous ne le pensiez. Des potions soigneusement �tiquet�es aux couleurs vari�es sont rang�es dans des �tag�res qui couvrent la quasi-int�gralit� des murs. On y trouve aussi des livres, des ustensiles de cuisine et beaucoup de bibelots que vous pensez magiques. Un four artisanal est contre le mur, vous remarquez qu''il br�le d''un intense et myst�rieux feu violet. Il y a aussi des marmites et des casseroles pos�es aux pied des murs.
Vous discutez bri�vement avec la vieille dame. Elle raconte �tre une magicienne avant-gardiste qui a �t� rejet� par tout le monde. Vous vous doutez bien que cette vieille dame � "l''apparence innocente" pratique une magie d�fendue.
Votre h�te propose de vous vendre ces diff�rents objets � "moiti� prix" vous dit-elle :
- <2,Acheter une potion de vitalit�(+6 points de vie),6> en <1,payant 3 pi�ces d''or,14;-3>
- <5,Acheter une potion du serpent(+1 d''agilit�),1> en <1,payant 2 pi�ces d''or,14;-2>
- <6,Acheter une potion de tr�fle � quatre feuille(+1 chance),1> en <1,payant 2 pi�ces d''or,14;-2>
Elle vous propose �galement <9,d''enchanter votre arme (+2 de force),2> en <1,payant la modique somme de 5 pi�ces d''or,14;-5>. "Une de ces stupides bricoles d''enchanteur de magie bleue" vous a t-elle expliqu�.
La vieille femme vous informe qu''il n''y a pas de sentier dans ces marais, il faudra donc continuer dans la boue. La boisson qu''elle vous a offerte est revigorante et vous sentez <2,vos forces revenir(+1 PV),1>
Une fois votre marchandage termin�e et votre th� bu, <0,vous reprenez votre route,41>, bien d�cid� � terrasser le drake.',
'sorciere.jpg'),

-- Page 41 --
('L''�toile du Nord',
'Vous avancez pendant quelques heures toujours dans la direction qui vous semble �tre l''ouest.
Vous exprimez un cris de joie en voyant peu � peu les arbres disparaitres.
Mais votre satisfaction est de courte dur�e, la v�g�tation laissent place � une toundra.
Vous regardez avec inqui�tude le soleil se coucher et le vent commencer � se lever. Il vous faut un abris.
Apr�s avoir travers� un �tendue gel�e, vous apercevez un loin un b�timent et vous pr�cipitez vers ce dernier.
C''est avec soulagement que vous remarquez qu''il s''agit d''une auberge : "L''Etoile du Nord", sans perdre un instant de plus, vous entrez.
Vous �tes frapp� par l''agr�able chaleur d''un large feu au centre de la pi�ce. Comme vous vous en doutiez, il n''y avait pas �norm�ment de client, essentiellement des marchands venus de lieux tous diff�rents. Ce b�timent n''est pas un march�, il sert plut�t de point de transition pour rejoindre les ports alentours et le coeur du royaume.
L''endroit est calme mais chaleureux, des hommes �taient r�unis devant des cartes, un marchand �tendait devant lui ses produits tandis que dans un coin, un homme � la mine grave d�gustait une bi�re.
Que souhaitez-vous faire :
<0,Chercher un endroit pour se reposer,42>
<0,Aller vers l''homme dans le coin,44>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'etoileDuNord.jpg'),

-- Page 42 --
('Trouver une chambre',
'Vous vous dirigez vers le comptoir o� se tient l''aubergiste, un homme �g� couvert de rides. Il est pr�t � vous donner une chambre pour *2 pi�ces d''or*.
<0,Acceptez-vous cette offre,43> ou au contraire vous �loignez du comptoir et faire quelque chose d''autre :
<0,Aller vers l''homme dans le coins de la salle,44>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'tavernier.jpg'),

-- Page 43 --
('Un repos bien m�rit�',
'Apr�s avoir <1,pay� le prix (2 pi�ces d''or),14;-2>, vous vous dirigez sans plus attendre vers votre chambre.
Elle est petite mais confortable et chaleureuse. Vous vous glissez confortablement dans le lit couvert de fourrures et sombrez dans un profond sommeil.
Vous ne savez pas combien de temps vous avez dormi, mais <2,vous �tes en pleine forme (vous r�cup�rez 10 pv),10>. Vous examinez une carte sur le mur et constatez avec joie que vous approchez de l''Antre des t�n�bres, il ne vous reste plus qu''� traverser cette r�gion gel�e pour arriver � votre destination et d�fier le Drake pour sauver Annabella des griffes de la b�te.
Que souhaitez-vous faire maintenant ? :
<0,Aller vers l''homme dans le coin de l''auberge,44>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'chambre.png'),

-- Page 44 --
('L''homme myst�rieux',
'Vous observez attentivement l''homme situ� � l''�cart de tous.
A en juger par son turban et ses longues robes, cette homme vient des d�serts du Sud, au-del� de la mer du sable.
Vous savez que ces homme sont g�n�ralement des marchands et des mystiques, mais � la vue de ses divers talismans et amulettes, vous optez pour la deuxi�me hypoth�se.
Il poss�de peut-�tre de quoi vous aider dans votre qu�te, vous d�cidez donc de vous dirigez vers lui.
- "Qu''est ce que vous voulez ?" dit-il avec un fort accent, visiblement d�rang� par votre pr�sence.
Vous r�torquez :
- "J''ai vu que vous aviez l''air d''�tre un mystique, vous pourriez peut-�tre m''aider."
- "�a d�pend, vous avez quelque chose d''int�ressant ?"
Si vous poss�dez une *perle luisante*, rendez-vous <0,ici,45>, sinon rendez-vous <0,ici,46>.',
'mystique.jpg'),

-- Page 45 --
('la myst�rieuse pierre de Banzi',
'Vous sortez de votre sac l''�trange perle bleut� et la donnez � l''homme.
Ses yeux s''�carquillent � la vue de cet objet, prend la perle et sort un �trange instrument � pinces de sa robe.
L''homme place la perle entre les pinces et enclenche le m�canisme.
Un subtil bruit de rouages se fait entendre tandis que la perle se met � briller intens�ment d''une forte lumi�re bleue.
Ses �tranges observations termin�es, l''homme reprend sa mine s�rieuse et vous dit :
- "Mon cher, vous avez en votre possession une pierre de Banzi, c''est un minerai tr�s rare capable de canaliser la magie bleue, peu de personnes soup�onnent l''existence d''une telle pierre."
Vous �tes surpris de cette nouvelle, qui aurait pu croire qu''une babiole achet�e � Casse-Roc ait autant de valeur.
Le mystique reprend :
- "�coutez, j''ai une offre : je divise cette pierre en deux et je prend le fragments. En �change, je vous fabrique une amulette avec l''autre moiti�. La puissance de la pierre reste importante, vous ne verrez quasiment pas la diff�rence."
Si vous acceptez son offre, rendez-vous <0,ici,47>, sinon vous refusez poliment et regardez ce que vous pourriez faire.
<0,Chercher un endroit pour se reposer,42>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'pierreBanzi.png'),

-- Page 46 --
('Sans int�r�t',
'Vous sortez les divers objets de votre sac � la recherche d''un objet digne d''int�r�t.
Malheureusement rien ne semble attirer l''attention de l''homme, il pousse un soupire et vous lance :
- "�coutez, de toute �vidence vous n''avez rien d''int�ressant, alors je vais vous demander partir et d''arr�ter de me faire perdre mon temps."
Vous remettez vos objets dans votre sac et quittez le mystique.
Que faites-vous maintenant ? :
<0,Chercher un endroit pour se reposer,42>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'sacVide.jpg'),

-- Page 47 --
('Amulette magique',
'Vous acceptez son offre en <1,lui donnant la perle,15;-1> et vous le regardez se mettre � l''ouvrage avec une habilet� d�concertante.
Apr�s une dizaine de minutes, il vous tends <1,un talisman grav�,6;1>.
Vous remerciez l''homme et retournez au centre de la pi�ce.
Que faites-vous ? :
<0,Chercher un endroit pour se reposer,42>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'amuletteMagique.jpg'),

-- Page 48 --
('Le marchand de l''Orient',
'Vous vous approchez de l''homme �talant ses marchandises � la vue de tous.
Gr�ce aux yeux brid�s du marchand, vous devinez qu''il est originaire des pays de l''Orient. Vous ne connaissez que tr�s peu de choses sur ces peuples, en v�rit�, il n''y a quasiment que des marchands qui quittent leur pays, le reste pr�f�re rester chez soi.
Vous admirez ses articles, on y trouve des �pices, des pierres pr�cieuses ainsi que certains �quipements dignes d''int�r�ts.
Parmis ces objets certains ont attir�s votre attention :
- <1,Acheter des jambi�res encombrantes,2;1> (<4,+2 armure,2> , <5,-1 agilit�,-1>) en <1,payant 4 pi�ces d''or,14;-4>
- <1,Acheter des bottes de P�gase,4;1> (<5,+2 agilit�,2>) en <1,payant 2 pi�ces d''or,14;-2>
- <1,Acheter un vieux foulard,5;1> (<6,+1 chance,1> et permet de r�sister au froid) pour <1,payant 1 pi�ces d''or,14;-1>
- <1,Acheter la lance du Champion en argent,8;1> (<3,force = 9,9>) en <1,payant 6 pi�ces d''or,14;-6>
- <1,Acheter l''�p�e en acier,10;1> (<3,force = 7,7>) en <1,payant 5 pi�ces d''or,14;-5>
Une fois vos achats termin�s, vous remerciez le marchand et retournez au centre de l''auberge. Que faites-vous ?
<0,Chercher un endroit pour se reposer,42>
<0,Aller vers l''homme dans le coin,44>
<0,Se diriger vers le groupe de voyageurs jouant aux cartes,49>
<0,Quitter l''auberge,53>',
'balance.png'),

-- Page 49 --
('Le zrick',
'Vous vous dirigez vers le groupe de voyageurs, ils jouent � un jeu de carte hasardeux appel� le Zrick et bien s�r, de l''argent est en jeu.
- "Souhaitez-vous vous joindre � nous voyageur ?" vous lance un des protagonistes.
Si vous acceptez, rendez-vous <0,ici,50>, sinon vous refusez poliment et quittez le groupe pour voir ce que vous pourriez faire d''autre.
<0,Chercher un endroit pour se reposer,42>
<0,Aller vers l''homme dans le coin,44>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'zrick.jpg'),

-- Page 50 --
('Une partie de zrick',
'Vous vous asseyez sur la chaise libre et rejoignez le groupe d''hommes, vous apprenez avec surprise qu''ils ne sont pas tous des marchands, l''un d''eux est un chasseur tandis qu''un autre est un soldat du roi.
Une fois les pr�sentations termin�es, vous distribuez les cartes et commencez � jouer.
Si vous avez *au moins 3 de chance*, <0,la fortune vous sourit,51> sinon vous �tes au contraire <0,frapp� par le malheur,52>.',
'partieZrick.jpg'),

-- Page 51 --
('La chance vous souris',
'Vous �tes chanceux car tours apr�s tours, vous obtenez de bonnes mains vous faisant remporter la mise.
Vous saluez vos nouveaux amis tout en emportant avec vous <1,5 pi�ces d''or,14;5>.
Que faites-vous maintenant ?
<0,Chercher un endroit pour se reposer,42>
<0,Aller vers l''homme dans le coin,44>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'chance.png'),

-- Page 52 --
('Maudit',
'Malgr� toute votre bonne volont�, vous ne parvenez pas � obtenir une seule bonne main. Vous tentez tant bien que mal de remonter mais pas moyen, vous pensez presque que vos adversaires trichent. Vous perdez <1,5 pi�ces d''or,14;-5> et d�cidez de quitter cette partie maudite avant de perdre beaucoup plus.
Que souhaitez-vous faire maintenant ?
<0,Chercher un endroit pour se reposer,42>
<0,Aller vers l''homme dans le coin,44>
<0,Voir le marchand,48>
<0,Quitter l''auberge,53>',
'malchance.png'),

-- Page 53 --
('La toundra',
'Vous quittez l''auberge et continuez votre route, heureusement le vent est tomb� et vous avez �vit� la temp�te, du moins c''est ce que vous pensiez.
A peine 1 heure apr�s avoir repris votre route, le vent se l�ve d''abord calmement avant de se transformer en une temp�te de neige.
A moins d''avoir *un manteau de fourrure* ou un *vieux foulard*, le froid vous <5,ronge les os et paralyse vos muscles (-1 agilit�),-1>.
Vous apercevez au loin une for�t, elle pourrait peut-�tre vous offrir une protection contre le blizzard. Mais d''un autre c�t�, continuer de passer par la plaine est plus rapide.
Souhaitez-vous <0,passer par la for�t,57> ou <0,continuer dans la plaine,54> ?',
'toundra.jpg'),

-- Page 54 --
('Les plaines de glace',
'Vous avancer dans la neige au prix de grands efforts mais rien n''arr�te votre volont� sauf peut-�tre la crevasse qui se tient devant vous.
Vous observez attentivement la faille � la recherche d''un moyen de l''�viter mais qu''importe la direction o� vous regardez, il n''y a aucun autre acc�s.
Vous savez maintenant que le seul moyen de passer est tout simplement de sauter par dessus ce gouffre sans fond mais c''est plus facile � dire qu''� faire.
Soudainement le sol sous vos pieds s''affaisse, il est trop tard pour reculer, vous �tes oblig� de sauter.
Si vous avez au moins *3 d''agilit�* rendez-vous <0,ici,55>, sinon rendez-vous <0,ici,56>.',
'plaineDeGlace.jpg'),

-- Page 55 --
('Saut de l''ange',
'Vous sautez et retombez in extremis de l''autre c�t� de la crevasse. Mais vous d�cidez de ne pas profiter de cette victoire, la temp�te est toujours l� et vous continuez � �tre gel�.
Sans perdre une seconde suppl�mentaire, <0,vous continuez votre route en direction de l''Antre des t�n�bres,61>.',
'sautCrevasse.png'),

-- Page 56 --
('Ch�te de l''ange',
'Vous prenez votre �lan et faites un saut digne des elfes les plus agiles, du moins c''est que vous croyez. En effet, m�me si votre saut est magnifique, votre atterrissage l''est beaucoup moins. Vous ne parvenez pas � atterrir au bon endroit, c''est m�me pire, vous ch�tez dans le gouffre. Heureusement, vous parvenez � attraper au dernier moment une prise sur le rebord du ravin.
Vous vous hissez avec difficult� de l''autre c�t� de la faille et vous vous allongez sur le sol gel� pour reprendre votre souffle et inspecter votre �tat.
Heureusement, vous n''avez perdu aucun �quipement mais vos c�tes ont en pris un coup, vous pensez m�me que l''une d''elle est bris�e, <2,vous perdez 2 PV,-2>.
Vous vous relevez en poussant un soupir de douleur et <0,continuez votre route en direction de l''Antre des t�n�bres,61>.',
'chuteDuMur.jpg'),

-- Page 57 --
('Le wendigo',
'Vous vous enfoncez dans la for�t de sapin.
Comme vous l''esp�riez, les arbres vous prot�ge d''un partie du vent, mais pile au moment o� la temp�rature et le vent commen�aient � �tre supportables, vous sentez un froid intense se lever, un froid tout sauf naturel, presque mal�fique.
Vous voyez une forme se d�couper lentement � travers les arbres.
Votre coeur se g�le � la vue de cette cr�ature de cauchemar. Vous remarquez qu''une �trange aura semble se d�gager du corp d�charn� de la chose.
Vous vous souvenez avoir lu des ouvrages parlant de cr�atures maudites appel�es "wendigo". Il est d�crit que ces cr�atures errent dans les contr�es gel�es, pi�geant les malchanceux dans une temp�te de neige pour finalement les d�vorer. Vous avez �galement lu que ces b�tes redoutes les armes en argent.
Poss�dez-vous de telles *armes en argent* ? Si c''est le cas rendez-vous <0,ici,58> sinon rendez-vous <0,ici,60>.
Ou encore si vous poss�dez un *anneau en argent*, rendez-vous <0,ici,59>.',
'wendigoRencontre.jpg'),

-- Page 58 --
('Une opportunit�',
'Vous vous f�licitez d''avoir pens� � acheter une arme de ce genre, car � peine avez-vous sorti votre �quipement que le wendigo vous saute dessus avec agilit� d�concertante. Heureusement, vous avez le r�flexe d''enfoncer une partie de votre lance dans la chair gel�e de votre ennemi, le faisant pousser un cri d�chirant.
Un sourire de satisfaction se dessine sur votre visage � la vue de l''h�sitation de la cr�ature, le froid semble m�me avoir perdu en intensit�.
C''est plein de confiance que vous vous ruez vers le wendigo pour en finir.
<8,Combat contre le wendigo affaibli,6>
Une fois le wendigo bannit, le froid surnaturel se dissipe et <0,vous continuez votre route avec aplomb,61>.',
'wendigoAffaibli.jpg'),

-- Page 59 --
('Une opportunit�',
'Vous mettez l''anneau autour de votre doigt et sortez votre arme en esp�rant que cela puisse faire la diff�rence.
Soudainement, le wendigo vous bondit dessus avec une agilit� d�concertante.
Mais il n''arrive pas � vous atteindre car au m�me moment, votre anneau se met � briller d''une puissante lumi�re blanche.
Une puissante explosion se produit, propulsant le monstre contre les arbres.
Un sourire de satisfaction se dessine sur votre visage � la vue de l''h�sitation de la cr�ature, le froid semble m�me avoir perdu en intensit�.
C''est plein de confiance que vous vous ruez vers le wendigo pour en finir.
<8,Combat contre le wendigo affaibli,6>
Une fois le wendigo bannit, le froid surnaturel se dissipe et <0,vous continuez votre route avec aplomb,61>.',
'lumiereBenie.jpg'),

-- Page 60 --
('Une b�te de cauchemars',
'Vous sortez votre arme et vous vous pr�parez � affronter le wendigo. C''est avec une agilit� d�concertante pour sa masse, que ce dernier vous bondit dessus. Au dernier moment, vous esquivez avec souplesse mais d�j� la cr�ature se retourne vers vous.
Son apparence est peut-�tre fr�le, mais son agilit� et sa puissance compensent son physique.
Vous vous replacez en face de votre ennemi et vous vous pr�parez � contre-attaquer.
<8,Combat contre le wendigo,5>
Une fois le wendigo bannit, le froid surnaturel se dissipe et <0,vous continuez votre route avec aplomb,61>.',
'wendigo.jpg'),

-- Page 61 --
('Dernier repos',
'Vous ne savez pas combien de temps vous avez march� dans cet enfer gel� mais vous remarquez avec plaisir que le paysage change.
Les plaines glac�es laissent place � des montagnes de plus en plus abruptes. Si vous n''aviez pas de *manteau de fourrure* ou de *vieux foulard* <5,une douce chaleur remplace le froid (+1 agilit�),1>.
Au fur et � mesure que vous progressez, vous notez que la nuit commence � tomber, il vous faut abri. Heureusement � la diff�rence de la toundra, vous trouvez facilement de quoi manger et faire un feu.
Vous vous endormez � la chaleur des braises <2,(vous regagnez +6 PV),6>.
La douce lumi�re du soleil vous r�veille et c''est avec assurance que <0,vous continuez votre voyage,62>.',
'feuDeCamp.png'),

-- Page 62 --
('L''Antre des t�n�bres',
'C''est apr�s quelques heures de marches intensives, vous regardez avec inqui�tude les nuages devenir de plus en plus sombres et oppressants tandis que les montagnes semblent se recouvrir de cendres.
C''est la mine grave que vous constatez que vous �tes arriv� � destination, vous avez enfin atteint l''Antre des t�n�bres.
Vous pr�f�rez presque la toundra. � la place des �tendues. glac�es se tiennent des cascades de laves en fusion, ces derni�re coulent des montagnes d�chir�es et des tours de basalte pour former des lacs de magma. Au loin, un ch�teau se distingue des autres b�timents en ruine, cela doit �tre le repaire du Drake.
Vous vous dirigez vers la citadelle sous le regard d''�tranges cr�atures cach�es dans les diverses crevasses et d�combres. Vous ne parvenez pas � distinguer leur forme mais vous vous dites que c''est presque pr�f�rable, qui sait quelles horreures hantent ces lieux.
Apr�s une longue marche au milieu d''une chaleur �touffante, vous atteignez enfin l''entr�e du ch�teau du Drake. Soudainement, vous ressentez une certaine h�sitation, derri�re cette porte se tient l''ennemi le plus dangereux que vous n''ayez jamais affront�. Mais apr�s tout, vous n''avez pas fait tout ce voyage pour rien, vous n''avez pas brav� tous ces dangers pour vous d�gonfler comme un l�che.
La t�te pleine de pens�es r�confortantes, vous poussez la lourde porte de fer et entrez.
L''int�rieur est aussi grand qu''une cath�drale, vous ne voyez m�me pas le plafond. Vous suivez le long couloir jusqu''� arriver dans une large zone circulaire, un �norme tas d''or et de richesses diverses se tient au centre.
Soudainement, vous voyez les flammes des torches et des braseros prendre une teinte violette.
Une forme sort de l''ombre. Etes-vous pass� par les *Marais de la mort* ? Si c''est le cas, rendez-vous <0,ici,63>, dans le cas contraire, allez <0,ici,64>.',
'chateauDragon.jpg'),

-- Page 63 --
('La r�v�lation',
'Vous reconnaissez la figure sortie de l''ombre : c''est la sorci�re que vous avez rencontr�e dans les Marais de la mort !
- "Ho, c''est vous." dit-elle dans un ricanement.
Vous r�pliquez d''un ton presque confu :
- "O� est le Drake ?!"
La vieille dame vous r�pond avec un sourire amus� :
- "Vous n''avez pas encore compris, preux chevalier ? Je suis le Drake, je suis Nazasiar le Drake des cendres !"
Au moment m�me o� elle finit sa phrase, une violente lumi�re violette se d�gage de son corps.
Une fois votre vue retrouv�e, vous constatez avec horreur qu''� la place de la sorci�re se tient le Drake qui vous a attaqu� � la sortie du ch�teau.
Vous sortez votre arme pr�t � combattre la b�te mais vous remarquez avec inqui�tude votre adversaire prendre sa respiration. Il va tenter de vous occire avec ses flammes infernales !
Poss�dez-vous l''*�p�e du Soleil levant*, une *arme enchant�e*, ou le *Talisman grav�* ? Si vous avez au moins 1 des ces objets, rendez-vous <0,ici,66> sinon rendez-vous <0,ici,65>.',
'drakeRencontre.jpg'),

-- Page 64 --
('Le drake',
'A votre plus grand �tonnement, la figure sortant de l''ombre est une vieille femme particuli�rement hideuse, elle vous fait presque penser � une sorci�re.
Vous questionnez la femme sur sa pr�sence en de tels lieux. Elle vous r�pond avec un sourire mauvais :
- "Je ne fait que passer."
Vous n''�tes pas dupe, une vieillarde n''est pas l� pas par hasard, c''est peut-�tre une servante du Drake ? D�cid� � en savoir plus, vous lui lancez d''un ton autoritaire :
- "Je ne vous crois pas, dites moi imm�diatement o� est le Drake et sa prisonni�re Annabella !"
- "Alors comme �a vous �tes l� pour la fille, d�sol�e, mais elle reste l�. Partez !"
- "Hors de question ! Je ne quitterai pas cette endroit sans la fille du Roi !"
- "Dans ce cas, finissons-en."
Au moment m�me o� elle finit sa phrase, une violente lumi�re violette se d�gage de son corps.
Une fois votre vue retrouv�e, vous constatez avec horreur qu''� la place de la vieille femme se tient le Drake qui vous a attaqu� � la sortie du ch�teau.
Vous sortez votre arme pr�t � combattre la b�te mais vous remarquez avec inqui�tude votre adversaire prendre sa respiration. Il va tenter de vous occire avec ses flammes infernales !
Poss�dez-vous l''*�p�e du Soleil levant*, une *arme enchant�e*, ou le *Talisman grav�* ? Si vous avez au moins 1 des ces objets, rendez-vous <0,ici,66> sinon rendez-vous <0,ici,65>.',
'drakeRencontre.jpg'),

-- Page 65 --
('Si pr�t du but',
'Une vague de flammes violette surgissent de la gueule de Nazasiar , engloutissant toute la salle. Vous vous rendez compte qu''il n''y aucun moyen d''�viter cette attaque. Vous vous pr�cipitez vers une colonne pour tenter de vous mettre � l''abri. Malheureusement cela ne suffit pas, les flammes vous d�vore et vous r�tisse comme un poulet.
C''est dans le ventre du Drake que se <2,termine tragiquement votre aventure (vous perdez 50 PV),-50>.',
'flammeViolette.jpg'),

-- Page 66 --
('Le combat final',
'Une vague de flammes violette surgissent de la gueule de Nazasiar, engloutissant toute la salle. Mais au moment o� vous pensez que tout est fini, vous voyez une lumi�re bleue se d�gager de votre �quipement. Un d�me translucide vous entoure et vous constatez avec soulagement que les flammes ne vous atteignent pas.
Vous pouvez voir � la mine �tonn�e du Drake que vous avez contr� son arme principale. N�anmoins, il reste un adversaire dangereux : ces griffes sont puissantes, ses �cailles r�sistantes et vous ne voulez pas vraiment tester l''effet de sa gueule garnie de croc sur votre corps.
C''est en faisant le vide dans votre t�te que vous vous ruez le monstre pour profiter de votre avantage.
<8,Combat contre le Drake,7>
Une fois votre ennemi jur� vaincu, vous vous ruez vers une <0,porte situ�e tout au bout de la salle,67>.',
'drake.jpg'),

-- Page 67 --
('VICTOIRE !',
'Vous entrez dans un cachot crasseux, vous regardez attentivement dans chaque cellule dans l''espoir de retrouver la fille du roi.
Soudainement, vous rep�rez avec joie celle que vous devez sauver. Annabella est surprise de vous voir mais vous dit avec soulagement :
- "Sir Godfroy, j''�tais s�r que vous viendrez, je vous en prie faites moi sortir de ce lieu horrible."
Sans perdre un instant de plus, vous trouvez les cl�s de la cellule et lib�rez la princesse.
Heureusement, la route jusqu''au ch�teau du Roi se fait sans encombre, comme si d�sormais, les cr�atures des t�n�bres vous craignaient.
Vous �tes accueilli par tout Casse-Roc ainsi que par le Roi. Pour l''occasion, ce dernier porte son armure dor�e.
Une f�te est organis�e pour c�l�brer votre victoire !
C''est ainsi que se termine l''�pop�e de Sir Godfroy, Votre �pop�e !
<7,FIN,Merci beaucoup d''avoir jou� � ce jeux! Nous esp�rons que vous avez appr�ci�. Johan et Leandro;fin>',
'victoire.png');

INSERT INTO Player (hp, force, armor, agility, luck, name, idActualPage, inactiveLinks) VALUES (22, 1, 0, 5, 2, 'Godfroyd', 3, 0);

INSERT INTO Item (name, hp, force, armor, agility, luck) VALUES
('Plastron rouill�', 0, 0, 2, 0, 0),
('Casquette de mineur', 0, 0, 1, 0, 0),
('Jambi�res encombrantes', 0, 0, 2, -1, 0),
('Manteau de fourrure', 0, 0, 1, 0, 0),
('Bottes de P�gase', 0, 0, 0, 2, 0),
('Vieux foulard', 0, 0, 0, 0, 1),
('Talisman grav�', 0, 0, 0, 0, 1),
('Ep�e du Soleil Levant', 0, 10, 0, 0, 0),
('Lance du champion en argent', 0, 9, 0, 0, 0),
('Hache d''arme en acier', 0, 8, 0, 0, 0),
('Ep�e en acier', 0, 7, 0, 0, 0),
('Massue en pierre', 0, 6, 0, 0, 0),
('Dague en pierre', 0, 4, 0, 0, 0),
('Ep�e d''entra�nement', 0, 4, 0, 0, 0),
('Pi�ce(s) d''or', 0, 0, 0, 0, 0),
('Perle luisante', 0, 0, 0, 0, 0),
('Eau b�nite', 0, 0, 0, 0 ,0),
('Anneau en argent', 0, 0, 0, 0, 0),
('Potion de vitalit�', 6, 0, 0, 0, 0),
('Potion du serpent', 0, 0, 0, 1, 0),
('Potion de tr�fle � quatre feuille', 0, 0, 0, 0, 1);

INSERT INTO Enemy (hp, force, armor, agility, luck, name, image) VALUES 
(10, 3, 1, 4, 3, 'Gobelin', 'gobelin.jpg'),
(16, 5, 2, 5, 4, 'Chef gobelin', 'chefGobelin.jpg'),
(35, 5, 1, 2, 3, 'Bandit', 'bandit.jpg'),
(25, 4, 2, 3, 0, 'Araign�e squelette', 'araigneeSquelette.png'),
(30, 4, 1, 6, 2, 'Wendigo', 'wendigo.jpg'),
(20, 3, 0, 3, 1, 'Wendigo affaibli', 'wendigoAffaibli.jpg'),
(50, 7, 3, 4, 0, 'Drake', 'drake.jpg');