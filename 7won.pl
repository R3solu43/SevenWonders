use lib '..';
use strict;
use SevenWon::Cards;
use SevenWon::Adam;
use Data::Dumper;
$|=1;
#One-shot game simulator. Play a single game making random decisions, then score.
#Game Rounds:
# 	1) Choose Card
# 		a) Build the card
#    	b) Build wonder
#    	c) Discard the card for 3 coins 
# |Game Rounds 1-5|
#  	2) Pass Remaning Cards to player on left/right (Rounds 1-5)
# |Game Round 6|
#  	2) Discard Remaining Card
#  	3) Military Scoring  

#Parameters
our $numPlayers	=	7;

#Vars
my %playerHands;
my $currentAge;
my @currentDeck;
my @gameState;

#Generate Age Decks based on number of players
my ($ageOneDeck,$ageTwoDeck,$ageThreeDeck)	=	SevenWon::Cards::getSetupDecks($numPlayers); 

$currentAge = 1;
while ($currentAge <= 1) {
	SevenWon::Adam::setStateValue("currentAge",$currentAge);
	 ##### Age Setup ######################################################################################################################################
         #Clear player hands
      for ( my $i = 1; $i <= $numPlayers; $i++ ) {
	      my $playerID = "Player_$i";
        @playerHands{$playerID} = [];
     }
	  #Get cards for current age
		if ( $currentAge == 1 ) { @currentDeck = @$ageOneDeck; } elsif ( $currentAge == 2 ) { @currentDeck = @$ageTwoDeck; } else {  @currentDeck = @$ageThreeDeck ; }
		#Deal out the cards for the current age to each player
		my $i 					= @currentDeck;
		my $playerCounter	=	1;
		while (--$i) { 
		   my $playerID = "Player_$playerCounter";
			push @playerHands{$playerID}, $currentDeck[0];
			shift @currentDeck;
			if ($playerCounter == $numPlayers) {
				 $playerCounter = 1;
			} else {
				 ++$playerCounter;
			}
		}
		#####################################################################################################################################################		
		
		
		##### Rounds 1-5 #####################################################################################################################################
		my $currentRound = 1;
		while ( $currentRound < 2 ) {
		     #Determine possible choices for each player (The only choices are to Build, Discard or Build Wonder. Choices are codified as: [BDW]:cardName)
                     #print Dumper(\%playerHands);
		     my $possibleChoicesRef = SevenWon::Adam::getPossibleChoices(\%playerHands);
		     my %possibleChoices = %$possibleChoicesRef;
		     print Dumper(\%possibleChoices);		     
		     #Make a choice at random
		     my $numChoices;
		     for (my $j = 1; $j <= $numPlayers; ++$j ) {
				    my $playerID = "Player_$j";
				    $numChoices = scalar( @{ $possibleChoices{$playerID} } );
				    print "$playerID has $numChoices possible choices\n";
				    my $choice = int(rand($numChoices));
				    $choice = @{ $possibleChoices{$playerID} } [$choice];
				    print "$playerID has chosen to $choice\n";
				    #Update the game state
				    SevenWon::Adam::performAction($playerID, $choice);
		      }
			   
		     #Pass cards to the player on left/right
		     
		     ++$currentRound;
		}
		#####################################################################################################################################################
		
		##### Round 6 ########################################################################################################################################
		# Discard remaining cards
		#
		# Score Military
		#
		#####################################################################################################################################################
		
		
		
		
		
	 ++$currentAge;			 
}









