// Organizador Lupas 3 tamaños
// PPF - 2016 09 Madrid
// version 01
// Unidades en mm

// Parametrización
// Dimensiones lupas (diámetro y grosor):
LupaG_Diametro= 100;
LupaM_Diametro = 86;
LupaP_Diametro = 50;

LupaG_Grosor = 16.6; //16.6
LupaM_Grosor = 20.4; //20.4
LupaP_Grosor = 20.4; //20.4

// Dimensiones caja:
Delta = 10; // reborde
Fondo = 3; // fondo de la caja
Esquina = 5; // diámetro esquinas
Alto_Superior = 50; // altura mayor
Alto_Inferior = 20; // altura menor

// RENDERIZAR BLOQUE BASE
// Cálculos para el polígono
Lado_X = Delta+LupaG_Grosor+Delta/2+LupaM_Grosor+Delta/2+LupaP_Grosor+Delta; // escribo desglosado para que se entienda mejor
Lado_Y = Delta+LupaG_Diametro+Delta; // segun el diametro mayor
Lado_Z1 = Fondo + Alto_Superior; 
Lado_Z2 = Fondo + Alto_Inferior;

P1 = [0,0];
P2 = [Lado_X,0,];
P3 = [Lado_X,Lado_Z2];
P4 = [0, Lado_Z1];
puntos = [P1,P2,P3,P4]; // array de puntos 2D


difference(){
// RENDERIZAR BLOQUE    
translate ([0,Lado_Y,0])
rotate ([90,0,0]) //rotar prisma para apoyarlo en xy
linear_extrude (Lado_Y) //dotar de volumen
polygon (puntos); //renderizar prisma

//RENDERIZAR LUPAS
// LUPA GRANDE
translate ([Delta, Lado_Y/2, Fondo+LupaG_Diametro/2])
rotate ([90,0,90]) 
cylinder (h=LupaG_Grosor, d = LupaG_Diametro);


// LUPA MEDIA
color("red")
translate ([Delta+LupaG_Grosor+Delta/2, Lado_Y/2, Fondo+LupaM_Diametro/2])
rotate ([90,0,90]) 
cylinder (h=LupaM_Grosor, d = LupaM_Diametro);

// LUPA PEQUEÑA
color ("green")
translate ([Delta+LupaG_Grosor+Delta/2+LupaM_Grosor+Delta/2, Lado_Y/2, Fondo+LupaP_Diametro/2])
rotate ([90,0,90]) 
cylinder (h=LupaP_Grosor, d = LupaP_Diametro);


}






