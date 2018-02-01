package SevenWon::Cards;
$| = 1;
use strict;
use Data::Dumper;

#Brown Cards
our @rawMaterials	=	qw{	
					 LumberYard	StonePit			ClayPool		OreVein	TreeFarm	Excavation	ClayPit
					 TimberYard	ForestCave		Mine				Sawmill	Quarry			Brickyard		Foundry
				};
			
#Gray Cards				
our @manufacturedGoods	=	qw{	
					 Loom	Glassworks	Press
			  };

#Blue Cards
our @civilianStructures = qw{	
					 Pawnshop	Baths			Altar			Theater			Aqueduct	Temple
					 Statue			Pantheon		Gardens	TownHall		Palace		Courthouse
					 Senate
			 };
	
#Green Cards
our @scientificStructures	=	qw{	
					 Apothecary		Dispensary		Lodge			Workshop		Laboratory	Observatory
					 Scriptorium		Library				University	Academy			School			Study
		    };

#Yellow Cards			    
our @commercialStructures		=	qw{	
					 Tavern		EastTradingPost		WestTradingPost		Marketplace						Forum	Caravansery	Vineyard
					 Bazar		Haven							Lighthouse					ChamberOfCommerce	Arena
	       };	
	       
#Red Cards
our @militaryStructures		=	qw{	
					 Stockade	Barracks	GuardTower		Walls							TrainingGround		Stables		Fortifications
					 Circus			Arsenal		ArcheryRange	SiegeWorkshop
	       };

#Purple Cards
our @guilds	=	qw{	
					 WorkersGuild			CraftsmensGuild	TradersGuild			PhilosophersGuild		SpiesGuild	StrategistsGuild
					 ShipownersGuild		ScientistsGuild		MagistratesGuild	BuildersGuild
	      };


#Deck Setup Information
our %threePlayerCards	=	(
								AgeOne	=>	[
										  "LumberYard",		"StonePit"	,			"ClayPool"		,			"OreVein"		,					"ClayPit"		,				"TimberYard"			,		"Loom"	,
										  "Glassworks",			"Press"		,			"Baths"			,				"Altar"				,					"Theater"		,			"EastTradingPost"	,	"WestTradingPost",
										  "Marketplace",		"Stockade"	,		"Barracks"			,		"GuardTower"		,		"Apothecary"		,	"Workshop"				,		"Scriptorium"
								],
								
								AgeTwo	=> [
										  "Sawmill"		,			"Quarry"	,				"Brickyard"		,			"Foundry"					,		"Loom"				,		"Glassworks"			,		"Press",
										  "Aqueduct"	,			"Temple"		,		"Statue"				,			"Forum"				,				"Caravansery"	,	"Vineyard"			,			"Walls",
										  "Stables"		,			"Dispensary"	,	"ArcheryRange",		"Laboratory"		,			"Courthouse"		,	"Library"						,			"School"
								],
								
								AgeThree => [
										  "Pantheon"	,		"Gardens"	,		"TownHall"		,			"Palace"	,					"Haven"			,			"Lighthouse"		,				"Fortifications",
										  "Arsenal"		,			"Arena"				,	"Lodge"				,			"SiegeWorkshop"	,"Observatory"	,	"Senate"			,					"University",
										  "Academy"	,			"Study"
								]								
					);

our %fourPlayerCards	=	(
								AgeOne	=>	[ "LumberYard",	"OreVein"		,			"Excavation"		,	"Pawnshop"			,		"Tavern"		,		"GuardTower"		,		"Scriptorium"	],
								
								AgeTwo	=> [ "Sawmill"		,		"Quarry"		,			"Brickyard"		,			"Foundry"				,			"Bazar"				,		"TrainingGround"	,	"Dispensary" ],
								
								AgeThree => [ "Gardens"		,		"Haven"	,				"ChamberOfCommerce"	,"Circus"		,	"Arsenal"		,			 "University"	]							
					);

our %fivePlayerCards	=	(
								AgeOne	=>	[  "StonePit"	,		"ClayPool"		,		"ForestCave"		,	"Altar"				,					"Tavern"			,		"Barracks"			,			"Apothecary"	],
								
								AgeTwo	=> [  "Loom"			,		"Glassworks"		,	"Press"				,			"Caravansery"		,		"Stables"		,			"Laboratory"		,			"Courthouse" ],
								
								AgeThree => [  "TownHall"	,	"Circus"			,				"Arena"			,				"SiegeWorkshop",	"Senate"		,			"Study" ]								
					);

our %sixPlayerCards	=	(
								AgeOne	=>	[				
										  "TreeFarm"	,	"Mine"			,					"Loom"			,				"Glassworks"		,		"Press"				,		"Theater"				,			"Marketplace"
								],
								
								AgeTwo	=> [
										  "Temple"		,	"Forum"			,				"Caravansery"		,	"Vineyard"				,		"TrainingGround",	"ArcheryRange"	,	"Library"
								],
								
								AgeThree => [
										  "Pantheon"	,	"TownHall"		,			"Lighthouse"	,			"ChamberOfCommerce",	"Circus"	,	"Lodge"								
								]								
					);

our %sevenPlayerCards	=	(
								AgeOne	=>	[				
										  "Pawnshop"	,	"Baths"		,					"Tavern"		,				"EastTradingPost"	,	"WestTradingPost"		,"Stockade"	,	"Workshop"
								],
								
								AgeTwo	=> [
										  "Aqueduct"	,	"Statue"			,				"Forum"			,				"Bazar"			,						"Walls"		,			"TrainingGround"	,	"School"
								],
								
								AgeThree => [			
										  "Palace" 	,		"Fortifications" 		,	"Arsenal"		,				"Arena"					,				"Observatory",	"Academy"
								]								
					);
					 																								
# print Dumper(\%threePlayerCards);
# print Dumper(\%fourPlayerCards);
# print Dumper(\%fivePlayerCards);
# print Dumper(\%sixPlayerCards);
# print Dumper(\%sevenPlayerCards);

#print @{@threePlayerCards{AgeOne}};
					  						 							 		
sub getSetupDecks {
		  #Based on the number of players, build three Age Decks
		  my $numPlayers = @_[0];
		  my @ageOneDeck;
		  my @ageTwoDeck;
		  my @ageThreeDeck;
		  if ($numPlayers >= 3) {
					 push @ageOneDeck, 		@{@threePlayerCards{'AgeOne'}}; 
					 push @ageTwoDeck, 		@{@threePlayerCards{'AgeTwo'}};  
					 push @ageThreeDeck, 	@{@threePlayerCards{'AgeThree'}};
		 }
		  if ($numPlayers >= 4) {
					 push @ageOneDeck, 		@{@fourPlayerCards{'AgeOne'}}; 
					 push @ageTwoDeck, 		@{@fourPlayerCards{'AgeTwo'}};  
					 push @ageThreeDeck, 	@{@fourPlayerCards{'AgeThree'}};
		 }
		  if ($numPlayers >= 5) {
					 push @ageOneDeck, 		@{@fivePlayerCards{'AgeOne'}}; 
					 push @ageTwoDeck, 		@{@fivePlayerCards{'AgeTwo'}};  
					 push @ageThreeDeck, 	@{@fivePlayerCards{'AgeThree'}};
		 }
		  if ($numPlayers >= 6) {
					 push @ageOneDeck, 		@{@sixPlayerCards{'AgeOne'}}; 
					 push @ageTwoDeck, 		@{@sixPlayerCards{'AgeTwo'}};  
					 push @ageThreeDeck, 	@{@sixPlayerCards{'AgeThree'}};
		 }
		  if ($numPlayers >= 7) {
					 push @ageOneDeck, 		@{@sevenPlayerCards{'AgeOne'}}; 
					 push @ageTwoDeck, 		@{@sevenPlayerCards{'AgeTwo'}};  
					 push @ageThreeDeck, 	@{@sevenPlayerCards{'AgeThree'}};
		 }
	#Add guild cards
	my $numGuilds = $numPlayers + 2;	
	setupGuildCards(\@ageThreeDeck, $numGuilds);
	#Shuffle the decks	
	fy_shuffle( \@ageOneDeck );
	fy_shuffle( \@ageTwoDeck );
	fy_shuffle( \@ageThreeDeck );
	return (\@ageOneDeck, \@ageTwoDeck, \@ageThreeDeck);
}					  				

sub setupGuildCards {
	 my $deck = $_[0];
	 my $numGuilds	=	$_[1] + 1;
	 my @guildCards	=	@guilds;
	 fy_shuffle(\@guildCards);
	 while ( --$numGuilds ) {
		 push @$deck, $guildCards[0];
		 shift @guildCards;
	}	
}

sub fy_shuffle
{
    my $array = shift;
    my $i = @$array;
    while ( --$i )
    {
        my $j = int rand( $i+1 );
        @$array[$i,$j] = @$array[$j,$i];
    }
}							


####### Card Functions #######
sub getAllCards	{
	my @allCards = (@rawMaterials, @manufacturedGoods, @civilianStructures, @scientificStructures,
										@commercialStructures, @militaryStructures, @guilds);
		  
	return @allCards;
}




#Resource Types:
#		Wood, Stones, Ore, Clay, Papyrus, Textile, Glass
sub getCosts	{
  #Single argument for the card
  my $card	=	shift;
  #Hash Table for Costs
  my %costs = (
		  #Cards without costs
					 LumberYard				=> 	{ },
					 StonePit						=>	{ },
					 ClayPool						=>  { },
					 OreVein						=>  { },
					 Loom							=>  { },
					 Glassworks				=>  { },
					 Press							=>  { },
					 Pawnshop   				=>  { },
					 Altar								=>  { },
					 Theater						=>  { },
					 Tavern							=>  { },
					 EastTradingPost		=>  { },
					 WestTradingPost	=>  { },
					 Marketplace				=>  { },
					 Vineyard						=>  { },
					 Bazar							=>  { },
					 
		  #Cards with costs
					 TreeFarm			=>	{ 
								Coins		=>	1,
																},
					 Excavation		=>	{ 
								Coins		=>	1,
																},
					 ClayPit			=>	{ 
								Coins		=>	1,
																},
					 TimberYard		=>	{ 
								Coins		=>	1,
																},
					 ForestCave		=>	{ 
								Coins		=>	1,
																},
					 Mine					=>	{ 
								Coins		=>	1,
																},
					 Sawmill			=>	{ 
								Coins		=>	1,
																},
					 Quarry				=>	{ 
								Coins		=>	1,
																},
					 Brickyard		=>	{ 
								Coins		=>	1,
																},
					 Foundry		=>	{ 
								Coins		=>	1,
																},	
					 WorkersGuild		=>	{ 
								Ore		=>	2,
								Clay		=>	1,
								Stones	=>	1,
								Wood	=>	1,
																},	
					 CraftsmensGuild		=>	{ 
								Ore		=>	2,
								Stones	=>	2,
																},
					 TradersGuild				=>	{ 
								Textile		=>	1,
								Papyrus	=>	1,
								Glass		=>	1,
																},		
					 PhilosophersGuild	=>	{ 
								Clay			=>	3,
								Textile		=>	1,
								Papyrus	=>	1,
																},		
					 SpiesGuild					=>	{ 
								Clay			=>	3,
								Glass		=>	1,
																},		
					 StrategistsGuild		=>	{ 
								Ore			=>	2,
								Stones		=>	1,
								Textile		=>	1,						
																},			
					 ShipownersGuild		=>	{ 
								Wood		=>	3,
								Papyrus	=>	1,
								Glass		=>	1,								
																},			
					 ScientistsGuild		=>	{ 
								Wood		=>	2,
								Ore			=>	2,
								Papyrus	=>	1,								
																},			
					 MagistratesGuild		=>	{ 
								Wood		=>	3,
								Stones		=>	1,
								Textile		=>	1,								
																},			
					 BuildersGuild		=>	{ 
								Stones		=>	2,
								Clay			=>	2,
								Glass		=>	1,							
																},				
					 Baths		=>	{ 
								Stones		=>	1,							
																},				
					 Aqueduct		=>	{ 
								Stones		=>	3,						
																},		
					 Temple		=>	{ 
								Wood		=>	1,
								Clay			=>	1,
								Glass		=>	1,								
																},		
					 Statue		=>	{ 
								Wood		=>	1,
								Ore			=>	2,							
																},		
					 Pantheon		=>	{ 
								Clay				=>	2,
								Ore				=>	1,							
								Papyrus		=>	1,							
								Textile			=>	1,							
								Glass			=>	1							
																},		
					 Gardens		=>	{ 
								Wood		=>	1,
								Clay			=>	2,								
																},	
					 TownHall		=>	{ 
								Glass		=>	1,
								Ore			=>	1,								
								Stones		=>	2,								
																},	
					 Palace		=>	{ 
								Glass		=>	1,
								Papyrus	=>	1,								
								Textile		=>	1,								
								Clay			=>	1,								
								Wood		=>	1,								
								Ore			=>	1,								
								Stones		=>	1,								
																},	
					 Forum		=>	{ 							
								Clay		=>	2,								
																},			
					 Caravansery		=>	{ 							
								Wood		=>	2,								
																},				
					 Haven		=>	{ 							
								Textile		=>	1,						
								Ore			=>	1,						
								Wood		=>	1,						
																},				
					 Lighthouse		=>	{ 							
								Glass		=>	1,						
								Stones		=>	1,						
																},						
					 ChamberOfCommerce		=>	{ 							
								Clay			=>	2,						
								Papyrus	=>	1,						
																},		
					 Stockade		=>	{ 							
								Wood		=>	1,								
																},			
					 Barracks		=>	{ 							
								Ore		=>	1,								
																},			
					 GuardTower		=>	{ 							
								Clay		=>	1,								
																},				
					 Walls		=>	{ 							
								Stones		=>	3,								
																},					
					 TrainingGround		=>	{ 							
								Wood		=>	1,							
								Ore			=>	2,							
																},						
					 Fortifications		=>	{ 							
								Stones		=>	1,							
								Ore			=>	3,							
																},								
					 Circus		=>	{ 							
								Stones		=>	3,							
								Ore			=>	1,							
																},									
					 Arsenal		=>	{ 							
								Ore		=>	1,							
								Wood	=>	2,							
								Textile		=>	1,							
																},		
					 Apothecary		=>	{ 							
								Textile		=>	1								
																},				
					 Workshop		=>	{ 							
								Glass		=>	1,								
																},				
					 Scriptorium		=>	{ 							
								Papyrus		=>	1,							
																},		
					 Stables		=>	{ 							
								Ore		=>	1,								
								Clay		=>	1,								
								Wood	=>	1,								
																},		
					 Dispensary		=>	{ 							
								Ore		=>	2,								
								Glass	=>	1,								
																},	
					 Arena		=>	{ 							
								Ore		=>	1,							
								Stones	=>	2,								
																},		
					 Lodge		=>	{ 							
								Clay			=>	2,								
								Textile		=>	1,								
								Papyrus	=>	1,								
																},		
					 ArcheryRange		=>	{ 							
								Wood		=>	2,								
								Ore			=>	1,								
																},		
					 Laboratory		=>	{ 							
								Clay			=>	2,								
								Papyrus   =>	1,								
																},				
					 SiegeWorkshop		=>	{ 							
								Wood	=>	1,								
								Clay   	=>	3,								
																},			
					 Observatory		=>	{ 							
								Ore			=>	2,								
								Glass		=>	1,								
								Textile	   =>	1,								
																},				
					 Courthouse		=>	{ 							
								Clay			=>	2,								
								Textile  	=>	1,								
																},				
					 Library				=>	{ 							
								Stones  	=>	2,								
								Textile  	=>	1,								
																},					
					 Senate			=>	{ 							
								Ore			=>	1,								
								Stones		=>	1,								
								Wood  		=>	2,								
																},					
					 University				=>	{ 							
								Wood		=>	2,								
								Papyrus	=>	1,								
								Glass  		=>	1,								
																},						
					 School				=>	{ 							
								Wood		=>	1,								
								Papyrus	=>	1,								
																},						
					 Academy				=>	{ 							
								Stones		=>	3,								
								Glass		=>	1,								
																},							
					 Study				=>	{ 							
								Wood		=>	1,								
								Papyrus	=>	1,								
								Textile		=>	1,								
																}	
			);								
	
	my %cardCosts =%{$costs{$card}};
	return %cardCosts;
}
