// Proyecto trastero - bicicleta y sillas
// medidas en cm
// 2016.08.05 PPF

// PARAMETRIZACION DE DIMENSIONES
delta=10; // margen colchoncillo
//espacio continente
pared_x =153;
pared_y=283;
altura_z=286;
// puerta entrada
puerta_ancho = 80;
puerta_alto = 206;
puerta_grosor = 5; //hipótesis
// estantes
estante_ancho = 53;
estante_alto=251; // parcialmente libre
estante_alto_minimo=208; // hasta ultima balda
estante_alto_diferencia=43; // diferencia alto
estante_largo=280; //hipótesis
// armario ropero
armario_fondo=55;
armario_largo=80;
armario_alto=180;
// colchón cama de 90
colchon_alto=185;
colchon_ancho=95;
colchon_grosor=25;
// bici
bici_largo=180;
bici_ancho=70;
bici_alto=100;

// DEFINICIÓN MÓDULO BICI HIGH-FIDELITY
module bici_HF(largo=bici_largo, ancho=bici_ancho, alto=bici_alto, diametro =65){
    //dar volumen a las barras
    grosor=10;
    //posicionar en origen
    posx=50;
    posy=diametro/2;
    posz=diametro/2;
    
    //renderizar rueda atras
    translate ([-50+posx,0+posy,0+posz])
    rotate ([0,90,0])
    linear_extrude(10)
    circle (d=diametro, center=true,$fn=20);
    //renderizar rueda delante
    translate ([-50+posx,largo-diametro+posy,0+posz])
    rotate ([0,90,0])
    linear_extrude(10)
    circle (d=diametro, center=true,$fn=20);
    //renderizar bastidor horizontal
    color("red")
    translate ([-50+posx, 0+posy,0+posz])
    cube([grosor, largo-diametro, grosor]);
    //renderizar bastidor vertical
    color("red")
    translate ([-50+posx, largo-diametro+posy,0+posz])
    cube([grosor, grosor, alto-diametro/2]);
    //renderizar manillar
    color("red")
    translate ([-50+posx+ancho/2+grosor/2, largo-diametro+grosor/2+posy,alto-diametro/2+posz])
    rotate([0,0,90])
    cube([grosor, ancho, grosor]);
    //renderizar bastidor sillín
    color("red")
    translate ([-50+posx, 0+posy,0+posz])
    rotate([-15,0,0])
    cube([grosor, grosor, alto-diametro/2]);
    //renderizar sillín
    color("red")
    translate ([-50+posx+grosor, grosor+posy,alto-diametro/2-grosor/2+posz])
    rotate([0,0,90])
    cube([2*grosor, grosor, grosor]);

  //regla comprobación dimensiones
 /*  color("green") // largo
     translate ([-50-diametro/2+posx, -diametro/2+posy,0+posz])
     cube([10, largo, 10]);

     color("green") // alto
     translate ([-50-diametro/2+posx, -diametro/2+posy,-diametro/2+posz])
     cube([10, 10, alto]);
*/
}


// RENDERIZACION DE BLOQUES
// ESPACIO CONTINENTE
%cube ([pared_x,pared_y, altura_z]); 
// PUERTA CERRADA
translate ([10,0,0])
cube ([puerta_ancho, puerta_grosor,puerta_alto]);
// PUERTA ABERTA
rotate (90,0,0)
translate ([10,-10,0])
cube ([puerta_ancho, puerta_grosor,puerta_alto]);
// ESTANTE
translate ([100,0,0])
cube ([estante_ancho, estante_largo,estante_alto_minimo]);
// ESTANTE espacio superior    
color("red")
translate ([100,0,estante_alto_minimo])
cube ([estante_ancho, estante_largo,estante_alto_diferencia]);
// ARMARIO
translate ([0,pared_y-armario_largo-delta,0]) // ajustando
cube ([armario_fondo,armario_largo,armario_alto]);
// COLCHÓN
translate ([pared_x-colchon_ancho-delta,pared_y-colchon_grosor-delta,0])
cube ([colchon_ancho,colchon_grosor+delta,colchon_alto]);

//bici HIGH fidelity
// posicion de referencia = posicion de almacenado
EjeX=bici_ancho-delta*3/2;
EjeY=pared_y-bici_largo-colchon_grosor-delta;
EjeZ=altura_z-bici_alto-delta;

color("blue")
translate ([EjeX,EjeY,EjeZ]) // posicion almacenado
//translate ([EjeX,EjeY-6*delta,EjeZ]) //posicion subida y bajada
//translate ([EjeX,EjeY-6*delta,0])//posicion en suelo
//cube ([bici_ancho,bici_largo,bici_alto]); // bici LOW FIDELITY
bici_HF(); // bici HIGH FIDELITY


//REGLA COMPROBACION GIRO PUERTA
/*color("green")
   cylinder(h=puerta_alto+delta/2, r=puerta_ancho+10);
*/
//REGLA COMPROBACION PERSONA
/* color("green")
translate ([30,0,0])
cube([60, 200, 175]);
*/

// VISTA SIMULTÁNEA 3 POSICIONES
/*color("blue")
translate ([EjeX,EjeY,EjeZ]) // posicion almacenado
bici_HF(); // bici HIGH FIDELITY

color("green")
translate ([EjeX,EjeY-6*delta,EjeZ]) //posicion subida y bajada
bici_HF(); // bici HIGH FIDELITY

color("red")
translate ([EjeX,EjeY-6*delta,0])//posicion en suelo
bici_HF(); // bici HIGH FIDELITY
*/

