


t="Luis";
t2="Feliz Cumple";

rotate([0,180,0])
mirror([0,-90,0]){
translate ([20,9,0])
linear_extrude (3)
text (t, size=12);

difference(){
cube ([50,10,3]);

translate ([3,2,0])
linear_extrude (3)
text(t2, size=6);
}
}