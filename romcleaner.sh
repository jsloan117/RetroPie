#!/bin/bash
# script used to cleanse rom/image folders. removes basically everything minus USA
# codes from: https://64bitorless.wordpress.com/rom-suffix-explanations/
# https://www.gameex.info/forums/topic/5194-cleaning-up-roms/
# default folders: Roms:/home/pi/RetroPie/roms Images:/home/pi/.emulationstation/downloaded_images (used Steven Selph's Scraper)

choice="$1"
cleanup_dir="$2"

[[ -z $choice ]] && echo -e "\nProvide count, list, or clean as first argument. \n" && exit 1
[[ -z $cleanup_dir ]] && echo -e "\nProvide directory as second argument. \n" && exit 1

count_roms () {
cd $cleanup_dir

rom_count=$(find $PWD -type f \( -iname "*\[o1\]*" -o -iname "*\[o2\]*" -o -iname "*\[o3\]*" -o -iname "*\[o4\]*" -o -iname "*\[o5\]*" \
-o -iname "*\[o6\]*" -o -iname "*\[o7\]*" -o -iname "*\[o8\]*" -o -iname "*\[o9\]*" -o -iname "*\[b1\]*" -o -iname "*\[b2\]*" \
-o -iname "*\[b3\]*" -o -iname "*\[b4\]*" -o -iname "*\[b5\]*" -o -iname "*\[b6\]*" -o -iname "*\[b7\]*" -o -iname "*\[b8\]*" \
-o -iname "*\[b9\]*" -o -iname "*\[h1\]*" -o -iname "*\[h2\]*" -o -iname "*\[h3\]*" -o -iname "*\[h4\]*" -o -iname "*\[h5\]*" \
-o -iname "*\[h6\]*" -o -iname "*\[h7\]*" -o -iname "*\[h8\]*" -o -iname "*\[h9\]*" -o -iname "*\[t1\]*" -o -iname "*\[t2\]*" \
-o -iname "*\[t3\]*" -o -iname "*\[t4\]*" -o -iname "*\[t5\]*" -o -iname "*\[t6\]*" -o -iname "*\[t7\]*" -o -iname "*\[t8\]*" \
-o -iname "*\[t9\]*"  -o -iname "*\[p1\]*" -o -iname "*\[p2\]*" -o -iname "*\[p3\]*" -o -iname "*\[p4\]*" -o -iname "*\[p5\]*" \
-o -iname "*\[p6\]*" -o -iname "*\[p7\]*" -o -iname "*\[p8\]*" -o -iname "*\[p9\]*"  -o -iname "*\[a1\]*" -o -iname "*\[a2\]*" \
-o -iname "*\[a3\]*" -o -iname "*\[a4\]*" -o -iname "*\[a5\]*" -o -iname "*\[a6\]*" -o -iname "*\[a7\]*" -o -iname "*\[a8\]*" \
-o -iname "*\[a9\]*"  -o -iname "*\[f1\]*" -o -iname "*\[f2\]*" -o -iname "*\[f3\]*" -o -iname "*\[f4\]*" -o -iname "*\[f5\]*" \
-o -iname "*\[f6\]*" -o -iname "*\[f7\]*" -o -iname "*\[f8\]*" -o -iname "*\[f9\]*" -o -iname "*hack\)*" -o -iname "*beta\)*" \
-o -iname "*\(Prototype\)*" -o -iname "*\(ST\)*" -o -iname "*\(NP\)*" -o -iname "*\(BS\)*" -o -iname "*\(MP\)*" -o -iname "*\(PC10\)*" \
-o -iname "*\(VS\)*" -o -iname "*\(BF\)*" -o -iname "*\(R-\)*" -o -iname "*\(Ch\)*" -o -iname "*\(R-\)*" -o -iname "*JAP*" -o -iname "*.unf" \
-o -iname "*\[ba\]*" -o -iname "*\[bb\]*" -o -iname "*\[bc\]*" -o -iname "*\(Unk\)*" -o -iname "*\(Unl\)*" -o -iname "*\(I\)*" \
-o -iname "*\(I\)*" -o -iname "*\(J\)*" -o -iname "*\(K\)*" -o -iname "*\(H\)*" -o -iname "*\(NL\)*" -o -iname "*\(HK\)*" \
-o -iname "*\(SW\)*" -o -iname "*\(UK\)*" -o -iname "*\(GR\)*" -o -iname "*\(A\)*" -o -iname "*\(B\)*" -o -iname "*\(C\)*" \
-o -iname "*\(PD\)*" -o -iname "*\(F\)*" -o -iname "*\(FC\)*" -o -iname "*\(S\)*" -o -iname "*\(FN\)*" -o -iname "*\(G\)*" \
-o -iname "*\(PAL\)*" -o -iname "*\(B\)*" -o -iname "*\[T-*" -o -iname "*\[T+*" -o -iname "*\[hI*" -o -iname "*.txt" -o -iname "*.log" \
-o -iname "*kiosk demo*" -o -iname "*\(korea\)*" -o -iname "*\(europe\)*" -o -iname "*\(taiwan\)*" -o -iname "*\[BF\]*" \
-o -iname "*\(japan\)*" -o -iname "*\(E\)*" \) -exec ls -lh {} \; | wc -l)

echo -e "\nTotal Garbage Roms: $rom_count \n"
export rom_count
}

list_roms () {
cd $cleanup_dir

find $PWD -type f \( -iname "*\[o1\]*" -o -iname "*\[o2\]*" -o -iname "*\[o3\]*" -o -iname "*\[o4\]*" -o -iname "*\[o5\]*" \
-o -iname "*\[o6\]*" -o -iname "*\[o7\]*" -o -iname "*\[o8\]*" -o -iname "*\[o9\]*" -o -iname "*\[b1\]*" -o -iname "*\[b2\]*" \
-o -iname "*\[b3\]*" -o -iname "*\[b4\]*" -o -iname "*\[b5\]*" -o -iname "*\[b6\]*" -o -iname "*\[b7\]*" -o -iname "*\[b8\]*" \
-o -iname "*\[b9\]*" -o -iname "*\[h1\]*" -o -iname "*\[h2\]*" -o -iname "*\[h3\]*" -o -iname "*\[h4\]*" -o -iname "*\[h5\]*" \
-o -iname "*\[h6\]*" -o -iname "*\[h7\]*" -o -iname "*\[h8\]*" -o -iname "*\[h9\]*" -o -iname "*\[t1\]*" -o -iname "*\[t2\]*" \
-o -iname "*\[t3\]*" -o -iname "*\[t4\]*" -o -iname "*\[t5\]*" -o -iname "*\[t6\]*" -o -iname "*\[t7\]*" -o -iname "*\[t8\]*" \
-o -iname "*\[t9\]*"  -o -iname "*\[p1\]*" -o -iname "*\[p2\]*" -o -iname "*\[p3\]*" -o -iname "*\[p4\]*" -o -iname "*\[p5\]*" \
-o -iname "*\[p6\]*" -o -iname "*\[p7\]*" -o -iname "*\[p8\]*" -o -iname "*\[p9\]*"  -o -iname "*\[a1\]*" -o -iname "*\[a2\]*" \
-o -iname "*\[a3\]*" -o -iname "*\[a4\]*" -o -iname "*\[a5\]*" -o -iname "*\[a6\]*" -o -iname "*\[a7\]*" -o -iname "*\[a8\]*" \
-o -iname "*\[a9\]*"  -o -iname "*\[f1\]*" -o -iname "*\[f2\]*" -o -iname "*\[f3\]*" -o -iname "*\[f4\]*" -o -iname "*\[f5\]*" \
-o -iname "*\[f6\]*" -o -iname "*\[f7\]*" -o -iname "*\[f8\]*" -o -iname "*\[f9\]*" -o -iname "*hack\)*" -o -iname "*beta\)*" \
-o -iname "*\(Prototype\)*" -o -iname "*\(ST\)*" -o -iname "*\(NP\)*" -o -iname "*\(BS\)*" -o -iname "*\(MP\)*" -o -iname "*\(PC10\)*" \
-o -iname "*\(VS\)*" -o -iname "*\(BF\)*" -o -iname "*\(R-\)*" -o -iname "*\(Ch\)*" -o -iname "*\(R-\)*" -o -iname "*JAP*" -o -iname "*.unf" \
-o -iname "*\[ba\]*" -o -iname "*\[bb\]*" -o -iname "*\[bc\]*" -o -iname "*\(Unk\)*" -o -iname "*\(Unl\)*" -o -iname "*\(I\)*" \
-o -iname "*\(I\)*" -o -iname "*\(J\)*" -o -iname "*\(K\)*" -o -iname "*\(H\)*" -o -iname "*\(NL\)*" -o -iname "*\(HK\)*" \
-o -iname "*\(SW\)*" -o -iname "*\(UK\)*" -o -iname "*\(GR\)*" -o -iname "*\(A\)*" -o -iname "*\(B\)*" -o -iname "*\(C\)*" \
-o -iname "*\(PD\)*" -o -iname "*\(F\)*" -o -iname "*\(FC\)*" -o -iname "*\(S\)*" -o -iname "*\(FN\)*" -o -iname "*\(G\)*" \
-o -iname "*\(PAL\)*" -o -iname "*\(B\)*" -o -iname "*\[T-*" -o -iname "*\[T+*" -o -iname "*\[hI*" -o -iname "*.txt" -o -iname "*.log" \
-o -iname "*kiosk demo*" -o -iname "*\(korea\)*" -o -iname "*\(europe\)*" -o -iname "*\(taiwan\)*" -o -iname "*\[BF\]*" \
-o -iname "*\(japan\)*" -o -iname "*\(E\)*" \) -exec ls -lh {} \;
}

cleanse_roms () {
cd $cleanup_dir

find $PWD -type f \( -iname "*\[o1\]*" -o -iname "*\[o2\]*" -o -iname "*\[o3\]*" -o -iname "*\[o4\]*" -o -iname "*\[o5\]*" \
-o -iname "*\[o6\]*" -o -iname "*\[o7\]*" -o -iname "*\[o8\]*" -o -iname "*\[o9\]*" -o -iname "*\[b1\]*" -o -iname "*\[b2\]*" \
-o -iname "*\[b3\]*" -o -iname "*\[b4\]*" -o -iname "*\[b5\]*" -o -iname "*\[b6\]*" -o -iname "*\[b7\]*" -o -iname "*\[b8\]*" \
-o -iname "*\[b9\]*" -o -iname "*\[h1\]*" -o -iname "*\[h2\]*" -o -iname "*\[h3\]*" -o -iname "*\[h4\]*" -o -iname "*\[h5\]*" \
-o -iname "*\[h6\]*" -o -iname "*\[h7\]*" -o -iname "*\[h8\]*" -o -iname "*\[h9\]*" -o -iname "*\[t1\]*" -o -iname "*\[t2\]*" \
-o -iname "*\[t3\]*" -o -iname "*\[t4\]*" -o -iname "*\[t5\]*" -o -iname "*\[t6\]*" -o -iname "*\[t7\]*" -o -iname "*\[t8\]*" \
-o -iname "*\[t9\]*"  -o -iname "*\[p1\]*" -o -iname "*\[p2\]*" -o -iname "*\[p3\]*" -o -iname "*\[p4\]*" -o -iname "*\[p5\]*" \
-o -iname "*\[p6\]*" -o -iname "*\[p7\]*" -o -iname "*\[p8\]*" -o -iname "*\[p9\]*"  -o -iname "*\[a1\]*" -o -iname "*\[a2\]*" \
-o -iname "*\[a3\]*" -o -iname "*\[a4\]*" -o -iname "*\[a5\]*" -o -iname "*\[a6\]*" -o -iname "*\[a7\]*" -o -iname "*\[a8\]*" \
-o -iname "*\[a9\]*"  -o -iname "*\[f1\]*" -o -iname "*\[f2\]*" -o -iname "*\[f3\]*" -o -iname "*\[f4\]*" -o -iname "*\[f5\]*" \
-o -iname "*\[f6\]*" -o -iname "*\[f7\]*" -o -iname "*\[f8\]*" -o -iname "*\[f9\]*" -o -iname "*hack\)*" -o -iname "*beta\)*" \
-o -iname "*\(Prototype\)*" -o -iname "*\(ST\)*" -o -iname "*\(NP\)*" -o -iname "*\(BS\)*" -o -iname "*\(MP\)*" -o -iname "*\(PC10\)*" \
-o -iname "*\(VS\)*" -o -iname "*\(BF\)*" -o -iname "*\(R-\)*" -o -iname "*\(Ch\)*" -o -iname "*\(R-\)*" -o -iname "*JAP*" -o -iname "*.unf" \
-o -iname "*\[ba\]*" -o -iname "*\[bb\]*" -o -iname "*\[bc\]*" -o -iname "*\(Unk\)*" -o -iname "*\(Unl\)*" -o -iname "*\(I\)*" \
-o -iname "*\(I\)*" -o -iname "*\(J\)*" -o -iname "*\(K\)*" -o -iname "*\(H\)*" -o -iname "*\(NL\)*" -o -iname "*\(HK\)*" \
-o -iname "*\(SW\)*" -o -iname "*\(UK\)*" -o -iname "*\(GR\)*" -o -iname "*\(A\)*" -o -iname "*\(B\)*" -o -iname "*\(C\)*" \
-o -iname "*\(PD\)*" -o -iname "*\(F\)*" -o -iname "*\(FC\)*" -o -iname "*\(S\)*" -o -iname "*\(FN\)*" -o -iname "*\(G\)*" \
-o -iname "*\(PAL\)*" -o -iname "*\(B\)*" -o -iname "*\[T-*" -o -iname "*\[T+*" -o -iname "*\[hI*" -o -iname "*.txt" -o -iname "*.log" \
-o -iname "*kiosk demo*" -o -iname "*\(korea\)*" -o -iname "*\(europe\)*" -o -iname "*\(taiwan\)*" -o -iname "*\[BF\]*" \
-o -iname "*\(japan\)*" -o -iname "*\(E\)*" \) -exec rm -fv {} \;
}

case $choice in

  count) count_roms $cleanup_dir ;;

  list) list_roms $cleanup_dir ;;

  clean) cleanse_roms $cleanup_dir ;;

esac
exit 0
