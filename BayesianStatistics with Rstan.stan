// PriorsUn archivo Stan típico tiene tres secciones principales:

//Datos (data)
//Aquí se definen las observaciones y los vectores que se van a usar:
data {
  int<lower=0> N;       // número de observaciones
  vector[N] x;          // variable predictora
  vector[N] y;          // variable respuesta
}


//Parámetros (parameters)
//Se declaran los parámetros que el modelo va a estimar:

parameters {
  real alpha;           // intercepto
  real beta;            // coeficiente de X
  real<lower=0> sigma;  // desviación estándar del error
}


//Modelo (model)
//Aquí se define la verosimilitud y las distribuciones a priori:

model {
  // Priors
  alpha ~ normal(0, 100);
  beta  ~ normal(0, 100);
  sigma ~ exponential(0.1);
  
  // Likelihood
  y ~ normal(alpha + beta * x, sigma);
}