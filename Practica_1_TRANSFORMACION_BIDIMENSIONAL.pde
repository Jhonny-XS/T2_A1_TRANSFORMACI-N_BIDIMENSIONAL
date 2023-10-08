float posX = 0; // Posición en el eje X
float posY = 0; // Posición en el eje Y
float angulo = 0; // Ángulo de rotación inicial
float tamañoX = 1; // Tamaño inicial del cuadrado
float tamañoY = 1; // Tamaño inicial del cuadrado
float sesgoX = 0; // Sesgo horizontal
float sesgoY = 0; // Sesgo vertical
float intensidad = 0;
boolean aumentar = true;
float cLine = 0;
boolean grosor = true;
void setup() {
  size(400, 400); // Tamaño de la ventana
  rectMode(CENTER); // Configurar el modo de dibujo a centro
}

void draw() {
  //Asignar los colores de manera aleatoria
  float rojo = random(0, 255);
  float verde = random(0, 255);
  float azul = random(0, 255);
  
  background(intensidad, intensidad, 255); //Color de fondo, varía entre azul más fuerte y blanco
  stroke(0); //Linea neggra del cuadrado
  fill(rojo, verde, azul); //Pintar el cuadrado 
  
  translate(width/2 + posX, height/2 + posY); // Mover el origen al centro de la pantalla y aplicar traslación

  rotate(angulo); // Rotar el cuadrado
  
  // Aplicar sesgo antes de dibujar el cuadrado
  shearX(radians(sesgoX));   //Aplicar sesgo horizontal 
  shearY(radians(sesgoY));   //Aplicar sesgo vertical
  scale(tamañoX, tamañoY);   //Aplicar escalamiento
  rect(0, 0, 100, 100);      //Dibujo de la figura 
  
  //Para aplicar color al fondo y al cuadrado
  if (intensidad == 255) {
    aumentar = false;
  } else if (intensidad == 0 ) {
    aumentar = true;
  }

  if (aumentar) {
    intensidad += 1;
  } else {
    intensidad -= 1;
  }
}

void keyPressed() {
  if (key == '1') {
    // Rotar hacia la derecha cuando se presiona "1"
    angulo += 0.01; // Incrementar el ángulo
  } else if (key == '2') {
    // Rotar hacia la izquierda cuando se presiona "2"
    angulo -= 0.01; // Decrementar el ángulo
  }else if (key == 't') {
    // Trasladar en el eje X hacia la derecha cuando se presiona "t"
    posX += 1; // Incrementar la posición en X
  } else if (key == 'r') {
    // Trasladar en el eje Y hacia arriba cuando se presiona "r"
    posY -= 1; // Decrementar la posición en Y (hacia arriba en la pantalla)
  } else if (key == 'y') {
    // Trasladar en el eje X hacia la izquierda cuando se presiona "y"
    posX -= 1; // Decrementar la posición en X
  } else if (key == 'e') {
    // Trasladar en el eje Y hacia abajo cuando se presiona "e"
    posY += 1; // Incrementar la posición en Y (hacia abajo en la pantalla)
  } else if (key == 'a') {
    // Hacer el cuadrado más grande en X cuando se presiona "a"
    tamañoX += 0.01; // Incrementar el tamaño
  } else if (key == 's') {
    // Hacer el cuadrado más pequeño en X cuando se presiona "s"
    tamañoX -= 0.01; // Decrementar el tamaño
  } else if (key == 'd') {
    // Hacer el cuadrado más grande en Y cuando se presiona "d"
    tamañoY += 0.01; // Incrementar el tamaño
  } else if (key == 'f') {
    // Hacer el cuadrado más pequeño en Y cuando se presiona "f"
    tamañoY -= 0.01; // Decrementar el tamaño
  } else if (key == 'x') {
    // Aumentar el sesgo horizontal de un solo lado cuando se presiona "x"
    sesgoX += 10; // Incrementar el sesgo horizontal
  } else if (key == 'c') {
    // Aumentar el sesgo vertical de un solo lado cuando se presiona "c"
    sesgoY += 10; // Incrementar el sesgo vertical
  } else if (key == 'z') {
    // Decrementar el sesgo horizontal de un solo lado cuando se presiona "z"
    sesgoX -= 10; // Decrementar el sesgo horizontal
  } else if (key == 'v') {
    // Decrementar el sesgo vertical de un solo lado cuando se presiona "v"
    sesgoY -= 10; // Decrementar el sesgo vertical
  }
}
