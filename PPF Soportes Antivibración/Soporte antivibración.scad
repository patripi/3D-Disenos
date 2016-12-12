// Soportes antivibración impresora 3D
// PPF 2016 - Oct
// en mm

// PARAMETRIZACION
dimGripX =30; // Por defecto: 30
dimGripY =8; // Por defecto: 8
dimGripZ =10; // Por defecto: 10

delta=2; // Por defecto: 2

dimBaseX = dimGripX; // Por defecto: 30
dimBaseY = dimGripY * 5; // Por defecto: 8*5=40
dimBaseZ = dimGripZ; // Por defecto: 10

h=dimGripX; 
r=dimGripY/2;

// RENDERIZACION DE LA PIEZA
difference(){

union(){  // Bloque principal (pestañas+base+refuerzos)
// Pestañas de agarre
color("red")
translate ([0,-dimGripY,0])
union(){
cube ([dimGripX, dimGripY, dimGripZ],true); // pestaña 1
translate ([0,2*dimGripY,0])
cube ([dimGripX, dimGripY, dimGripZ],true); // pestaña 2
}

// Base de soporte
color("yellow")
translate ([0,0,-dimGripZ])
cube ([dimBaseX, dimBaseY, dimBaseZ],true);

// Refuerzos
color("yellow")
translate ([0,3*r,-5])
rotate ([0,90,0])
cylinder (h,r=r,$fn=30, center=true); // refuerzo 1

translate ([0,-3*r,-dimGripZ/2])
rotate ([0,90,0])
cylinder (h,r=r,$fn=30, center=true); // refuezo 2
}

// Bordes exteriores que se sustraen del bloque principal
color("blue")
translate ([0,-7*r+delta,-dimGripZ/2])
rotate ([0,90,0])
cylinder (h+delta,r=dimBaseY/4,$fn=30, center=true); // borde 1

color("blue")
translate ([0,7*r-delta,-dimGripZ/2])
rotate ([0,90,0])
cylinder (h+delta,r=dimBaseY/4,$fn=30, center=true); // borde 2
}
