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

    echo -ne "${morse[${1}]:-/} "  #ektiponetai o morse code apo tin akolouthia haraktiron pou ipirxe sto txt
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

    echo -ne "${letter[${1}]}" #ektiponetai i akolouthia haraktiron apo to morse code tou txt
}


if [[ $1 = "-e" ]]; then #epilogi encoding
    for line in $(< "$2"); do
        #epanalipsi gia kathe grammi tou arxeiou txt
        for ch in $(echo "${line^^}" | grep -o . | sed 's/ /space/g'); do #epanalipsi se kathe haraktira tis grammis, metatropi ton lowercase grammaton se uppercase,
            encode "$ch" #kaleite i sinartisi encode                        kai metatropi aftou se morse code (opou iparxei keno, antikathistatai me to string 'space')
        done
    done
    echo
elif [[ $1 = "-d" ]]; then #epilogi decoding
    for line1 in $(< "$2"); do
        #epanalipsi gia kathe grammi tou arxeiou txt
        for ch in $(echo "${line1}" | sed 's./.\nspace\n.g'); do #epanalipsi se kathe "morse" haraktira tis grammis kai metatropi aftou se haraktira
            decode "$ch"  #kaleite i snartisi decode               opou yparxei o haraktiras '/' symbolizetai to keno
        done
    done
    echo
else
    echo "Invalid input." #an o user den epelekse -e/-d
fi
