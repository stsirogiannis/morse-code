#!/bin/bash

encode(){
    declare -A morse
    morse[A]=".-";
    morse[B]="-...";
    morse[C]="-.-.";
    morse[D]="-..";
    morse[E]=".";
    morse[F]="..-.";
    morse[G]="--.";
    morse[H]="....";
    morse[I]="..";
    morse[J]=".---";
    morse[K]="-.-";
    morse[L]=".-..";
    morse[M]="--";
    morse[N]="-.";
    morse[O]="---";
    morse[P]=".--.";
    morse[Q]="--.-";
    morse[R]=".-.";
    morse[S]="...";
    morse[T]="-";
    morse[U]="..-";
    morse[V]="...-";
    morse[W]=".--";
    morse[X]="-..-";
    morse[Y]="-.--";
    morse[Z]="--..";
    morse[1]=".----";
    morse[2]="..---";
    morse[3]="...--";
    morse[4]="....-";
    morse[5]=".....";
    morse[6]="-....";
    morse[7]="--...";
    morse[8]="---..";
    morse[9]="----.";
    morse[0]="-----";
    morse[ ]="/"

    morse[space]="/"
    morse[return]="\n"

    echo -ne "${morse[${1}]:-/} "  # Print the Morse code equivalent of the character passed in
}


decode(){
    declare -A letter
    letter[.-]="A";
    letter[-...]="B";
    letter[-.-.]="C";
    letter[-..]="D";
    letter[.]="E";
    letter[..-.]="F";
    letter[--.]="G";
    letter[....]="H";
    letter[..]="I";
    letter[.---]="J";
    letter[-.-]="K";
    letter[.-..]="L";
    letter[--]="M";
    letter[-.]="N";
    letter[---]="O";
    letter[.--.]="P";
    letter[--.-]="Q";
    letter[.-.]="R";
    letter[...]="S";
    letter[-]="T";
    letter[..-]="U";
    letter[...-]="V";
    letter[.--]="W";
    letter[-..-]="X";
    letter[-.--]="Y";
    letter[--..]="Z";
    letter[-----]="0";
    letter[.----]="1";
    letter[..---]="2";
    letter[...--]="3";
    letter[....-]="4";
    letter[.....]="5";
    letter[-....]="6";
    letter[--...]="7";
    letter[---..]="8";
    letter[----.]="9";
    letter[/]=" ";

    letter[space]=" "; 

    echo -ne "${letter[${1}]}" # Print the character equivalent of the Morse token passed in
}


if [[ $1 = "-e" ]]; then # Encode mode selected
    for line in $(< "$2"); do
        # Iterate over each line of the input file
        for ch in $(echo "${line^^}" | grep -o . | sed 's/ /space/g'); do
            # Iterate over each character in the line: convert lowercase letters
            # to uppercase, then encode it as Morse code (spaces are first
            # replaced with the literal string "space" so encode() can map them)
            encode "$ch" # Call the encode function
        done
    done
    echo
elif [[ $1 = "-d" ]]; then # Decode mode selected
    for line1 in $(< "$2"); do
        # Iterate over each line of the input file
        for ch in $(echo "${line1}" | sed 's./.\nspace\n.g'); do
            # Iterate over each Morse token in the line and convert it back
            # to its corresponding character
            decode "$ch" # Call the decode function ('/' represents a word space)
        done
    done
    echo
else
    echo "Invalid input." # Neither -e nor -d was selected
fi