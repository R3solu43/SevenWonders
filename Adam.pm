package SevenWon::Adam;
$| = 1;
use strict;
use Data::Dumper;
use SevenWon::Cards;

#Game State Engine
initializeStateMap( );
{
        my %parMap;
        my @pars;
        my @gameState;

        sub registerParam {
                my $name = shift;
                push @pars, $name;
                $parMap{$name} = (scalar @pars) - 1;
                #print "Parameter $name registered at position $parMap{$name}\n";
        }

        sub setStateValue {
                my ($parameter, $value) = ($_[0], $_[1]);                
                $gameState[$parMap{$parameter}] = $value;    
                #print "Set parameter '$parameter' (position $parMap{$parameter}) to $value\n";           
        }
}

sub getPossibleChoices {   #Choices are codified as: [BDW]:cardName
        my %possibleChoices;
        my $playerHandsRef = shift;
        my %playerHands = %$playerHandsRef;
        #For each player...     
        while(my($playerID, $hand) = each %playerHands) { 
                #print "Evaluating cards for $playerID\n";
                my @playerChoices;
                foreach(@$hand) {
                       #For each card in the player's hand, they can do one of three things:
                       my $canBuild = canBuildAlone($playerID,$_);  #1) Can build if they have the resources
                       if ( $canBuild ) {  push @playerChoices, "B:$_";  } 
                }                
                @possibleChoices{$playerID} = \@playerChoices;
         }   
         return \%possibleChoices;   
}

sub canBuildAlone {
        #A player can only build a card if they have the required resources
        my $playerID = $_[0];
        my $card        = $_[1];
        #print "Checking if $playerID can build $card\n";
        my %costs = SevenWon::Cards::getCosts($card);
        #If the card has no costs, the player can play it
        if (!keys %costs) { return 1 }; 
}

sub performAction {
                #Update the game state based on the action performed
                my ($playerID, $action) = @_;
                
        
 }

#The game state can be described as an array of integer values. The game state parameter map
#should be build dynamically to allow the list of potential parameters to grow
sub initializeStateMap {        
        my $i = 7; 
        my @cards = SevenWon::Cards::getAllCards();
        my $parameter;
        while ( $i > 0 ) {
                  my $playerID = "Player_$i";
                  #Generate a parameter that signifies 'player n has built card x'
                  foreach(@cards) {     
                                $parameter = $playerID."_has_$_";
                                registerParam($parameter);
                  }     
                  #Generate a player gold parameter
                  registerParam($playerID."_Gold");
                  --$i;           
         }        
       #Some parameters are global and not per player
       my @globalParams = qw {  currentAge  };
       foreach (@globalParams) {
                registerParam($_);
       }
 }

1;